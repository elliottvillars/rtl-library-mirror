module sync_fifo #(parameter p_FIFO_DEPTH = 8, parameter p_DATA_WIDTH = 8)(
	input wire i_CLK,
	input wire i_WRITE_REQUEST,
	input wire i_READ_REQUEST,
	input wire [p_DATA_WIDTH-1:0] i_INPUT,
	output reg o_FIFO_EMPTY,
	output reg o_FIFO_FULL,
	output reg [p_DATA_WIDTH-1:0] o_OUTPUT
);

reg [p_DATA_WIDTH-1:0] r_WRITE_POINTER;
reg [p_DATA_WIDTH-1:0] r_READ_POINTER;
reg [p_DATA_WIDTH-1:0] r_MEMORY [0:2**p_FIFO_DEPTH-1];
reg [p_DATA_WIDTH-1:0] r_QUANTITY;

localparam lp_ALMOST_FULL_FLAG  =  1;
localparam lp_ALMOST_EMPTY_FLAG =  1;
always@(posedge i_CLK)
begin
	if(i_WRITE_REQUEST == 1)
	begin
		r_MEMORY[r_WRITE_POINTER] <= i_INPUT;
		r_WRITE_POINTER <= r_WRITE_POINTER + 1'b1;
		r_QUANTITY <= r_QUANTITY + 1;
	end
	else
	begin
		r_MEMORY <= r_MEMORY;
		r_WRITE_POINTER <= r_WRITE_POINTER; 
		r_QUANTITY <= r_QUANTITY;
	end
	if(i_READ_REQUEST == 1)
	begin
		o_OUTPUT <= r_MEMORY[r_READ_POINTER];
		r_READ_POINTER <= r_READ_POINTER + 1'b1;
		r_QUANTITY <= r_QUANTITY - 1;
	end
	else
	begin
		o_OUTPUT <= o_OUTPUT;
		r_READ_POINTER <= r_READ_POINTER;
		r_QUANTITY <= r_QUANTITY;
	end
	if(r_QUANTITY == 0)
		o_FIFO_EMPTY <= 1'b1;
	else
		o_FIFO_EMPTY <= 1'b0;
	if(r_QUANTITY == 2**p_FIFO_DEPTH-1)
		o_FIFO_FULL <= 1'b0;
	else
		o_FIFO_FULL <= 1'b0;
end

`ifdef FORMAL
	reg r_PAST_VALID = 0;
	always@(posedge i_CLK)
	begin
		assume($changed(i_CLK));
		assume(!(r_QUANTITY == 0 && i_READ_REQUEST == 1));
		assume(!(r_QUANTITY == 2**p_FIFO_DEPTH - 1 && i_WRITE_REQUEST == 1));
		r_PAST_VALID <= 1;
		if(r_PAST_VALID == 1 && $rose(i_CLK))
		begin
			//cover read
			//cover write

			if($past(r_QUANTITY) == 0)
			begin
				assert(r_READ_POINTER == r_WRITE_POINTER);
				assert(o_FIFO_FULL == 0);
				assert(o_FIFO_EMPTY == 1);
			end
			else if($past(r_QUANTITY) == 2**p_FIFO_DEPTH - 1) //enumerate this
			begin
				assert(o_FIFO_FULL == 1);
				assert(o_FIFO_EMPTY == 0);
			end
			else
			begin
				assert(o_FIFO_FULL == 0);
				assert(o_FIFO_EMPTY == 0);
			end
			if($past(i_READ_REQUEST) == 1)
			begin
				assert(r_QUANTITY == $past(r_QUANTITY) - 1);
				assert($changed(r_READ_POINTER));//I know it can roll over
				assert(o_OUTPUT == r_MEMORY[$past(r_READ_POINTER)]);
			end
			if($past(i_WRITE_REQUEST) == 1)
			begin
				assert(r_QUANTITY == $past(r_QUANTITY) + 1);
				assert($changed(r_WRITE_POINTER));//I know it can roll over
				assert(r_MEMORY[$past(r_WRITE_POINTER)] == $past(i_INPUT));
			end
		end
	end
`endif
endmodule
