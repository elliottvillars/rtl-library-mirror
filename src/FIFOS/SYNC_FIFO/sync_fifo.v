module sync_fifo #(parameter p_ADDRESS_WIDTH = 2, parameter p_DATA_WIDTH = 8)(
	input wire i_CLK,
	input wire i_RESET,
	input wire i_WRITE_REQUEST,
	input wire i_READ_REQUEST,
	input wire [p_DATA_WIDTH-1:0] i_INPUT,
	output reg o_FIFO_EMPTY,
	output reg o_FIFO_FULL,
	output reg o_FIFO_ALMOST_EMPTY,
	output reg o_FIFO_ALMOST_FULL,
	output reg [p_DATA_WIDTH-1:0] o_OUTPUT
);

//TODO: Perform QA pass and reverify.
reg [p_ADDRESS_WIDTH-1:0] r_WRITE_POINTER;
reg [p_ADDRESS_WIDTH-1:0] r_READ_POINTER;
reg [p_DATA_WIDTH-1:0] r_MEMORY [0:2**p_ADDRESS_WIDTH-1];
reg [p_ADDRESS_WIDTH-1:0] r_QUANTITY;

parameter p_ALMOST_FULL_FLAG  = 1;
parameter p_ALMOST_EMPTY_FLAG = 1;

localparam lp_EMPTY = 0;

initial 
begin
	r_WRITE_POINTER = 0;
	r_READ_POINTER 	= 0;
	r_QUANTITY 	= 0;
end

always@(posedge i_CLK)
begin
	if(i_RESET == 1)
	begin
		r_QUANTITY <= {p_ADDRESS_WIDTH{1'b0}};
		r_READ_POINTER <= {p_ADDRESS_WIDTH{1'b0}};
		r_WRITE_POINTER <= {p_ADDRESS_WIDTH{1'b0}};
		o_OUTPUT <= o_OUTPUT;
		o_FIFO_EMPTY <= 1'b1;
		o_FIFO_FULL <= 1'b0;
	end
	else
	begin
		case({i_WRITE_REQUEST,i_READ_REQUEST})
			2'b00: //DO NOTHING
			begin
				o_OUTPUT <= o_OUTPUT;
				r_READ_POINTER <= r_READ_POINTER;
				r_WRITE_POINTER <= r_WRITE_POINTER;
				r_QUANTITY <= r_QUANTITY;
			end
			2'b01: //READ LOGIC
			begin
				o_OUTPUT <= r_MEMORY[r_READ_POINTER];
				r_READ_POINTER <= r_READ_POINTER + 1'b1;
				r_QUANTITY <= r_QUANTITY - 1'b1;
			end
			2'b10: //WRITE LOGIC
			begin
				r_MEMORY[r_WRITE_POINTER] <= i_INPUT;
				r_WRITE_POINTER <= r_WRITE_POINTER + 1'b1;
				r_QUANTITY <= r_QUANTITY + 1'b1; //This may or not be doubly driven
			end
			2'b11: //BOTH READ AND WRITE
			begin
				o_OUTPUT <= r_MEMORY[r_READ_POINTER];
				r_MEMORY[r_WRITE_POINTER] <= i_INPUT;
				r_READ_POINTER <= r_READ_POINTER + 1'b1;
				r_WRITE_POINTER <= r_WRITE_POINTER + 1'b1;
				r_QUANTITY <= r_QUANTITY;
			end
		endcase

		//STATUS FLAGS
		case(r_QUANTITY)
			lp_EMPTY: 
			begin
				o_FIFO_EMPTY <= 1'b1;
				o_FIFO_FULL <= 1'b0;
				o_FIFO_ALMOST_EMPTY <= 1'b1; //This will probably be merged(?)
				o_FIFO_ALMOST_FULL <= 1'b0;
			end
			p_ALMOST_EMPTY_FLAG:
			begin
				o_FIFO_EMPTY <= 1'b0;
				o_FIFO_FULL <= 1'b0;
				o_FIFO_ALMOST_EMPTY <= 1'b1; //This will probably be merged(?)
				o_FIFO_ALMOST_FULL <= 1'b0;
			end
			p_ALMOST_FULL_FLAG:
			begin
				o_FIFO_EMPTY <= 1'b0;
				o_FIFO_FULL <= 1'b0;
				o_FIFO_ALMOST_EMPTY <= 1'b0; //This will probably be merged(?)
				o_FIFO_ALMOST_FULL <= 1'b1;
			end
			(2**p_ADDRESS_WIDTH - 1):
			begin
				o_FIFO_EMPTY <= 1'b0;
				o_FIFO_FULL <= 1'b1;
				o_FIFO_ALMOST_EMPTY <= 1'b0; //This will probably be merged(?)
				o_FIFO_ALMOST_FULL <= 1'b1;
			end
			default:
			begin
				o_FIFO_EMPTY <= 1'b0;
				o_FIFO_FULL <= 1'b0;
				o_FIFO_ALMOST_EMPTY <= 1'b0; //This will probably be merged(?)
				o_FIFO_ALMOST_FULL <= 1'b0;
			end
		endcase
	end
end

`ifdef FORMAL
	reg r_PAST_VALID = 0;
	initial begin
		assume(!i_WRITE_REQUEST);
		assume(!i_READ_REQUEST);
	end
	always@(posedge i_CLK)
	begin
		assume($changed(i_CLK));
		assume(!i_RESET);
		assume((o_FIFO_FULL & i_WRITE_REQUEST) == 0);
		assume((o_FIFO_EMPTY & i_READ_REQUEST) == 0);
		r_PAST_VALID <= 1;
		if(r_PAST_VALID == 1 && $rose(i_CLK))
		begin

			//cover write
			cover(o_FIFO_FULL == 1);

			assert((o_FIFO_FULL & o_FIFO_EMPTY) != 1);
			if($past(r_QUANTITY) == 0)
			begin
				assert(o_FIFO_FULL == 0);
				assert(o_FIFO_EMPTY == 1);
				assert(o_FIFO_ALMOST_EMPTY == 1);
				assert(o_FIFO_ALMOST_FULL == 0);
			end
			else if($past(r_QUANTITY) == p_ALMOST_EMPTY_FLAG)
			begin
				assert(o_FIFO_FULL == 0);
				assert(o_FIFO_EMPTY == 0);
				assert(o_FIFO_ALMOST_EMPTY == 1);
				assert(o_FIFO_ALMOST_FULL == 0);
			end
			else if($past(r_QUANTITY) == p_ALMOST_FULL_FLAG)
			begin
				assert(o_FIFO_FULL == 0);
				assert(o_FIFO_EMPTY == 0);
				assert(o_FIFO_ALMOST_EMPTY == 0);
				assert(o_FIFO_ALMOST_FULL == 1);
			end
			else if($past(r_QUANTITY) == 2**p_ADDRESS_WIDTH - 1)
			begin
				assert(o_FIFO_FULL == 1);
				assert(o_FIFO_EMPTY == 0);
				assert(o_FIFO_ALMOST_EMPTY == 0);
				assert(o_FIFO_ALMOST_FULL == 1);
			end
			else 
			begin
				assert(o_FIFO_FULL == 0);
				assert(o_FIFO_EMPTY == 0);
				assert(o_FIFO_ALMOST_EMPTY == 0);
				assert(o_FIFO_ALMOST_FULL == 0);
			end
			if($past(i_READ_REQUEST) == 1 && $past(i_WRITE_REQUEST) == 0)
			begin
				assert($changed(r_QUANTITY));
				assert($changed(r_READ_POINTER));
				assert(o_OUTPUT == r_MEMORY[$past(r_READ_POINTER)]);
			end
			if($past(i_WRITE_REQUEST) == 1 && $past(i_READ_REQUEST) == 0)
			begin
				assert($changed(r_QUANTITY));
				assert($changed(r_WRITE_POINTER));
				assert(r_MEMORY[$past(r_WRITE_POINTER)] == $past(i_INPUT));
			end
			if($past(i_WRITE_REQUEST) == 1 && $past(i_READ_REQUEST) == 1)
				assert(r_QUANTITY == $past(r_QUANTITY));
		end
		if(!$rose(i_CLK))
		begin
			assume($stable(i_WRITE_REQUEST));
			assume($stable(i_READ_REQUEST));
			assume($stable(i_INPUT));
		end
	end
`endif
endmodule
