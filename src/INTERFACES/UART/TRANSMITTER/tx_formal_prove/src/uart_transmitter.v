module uart_transmitter (
	input wire i_CLK,
	input wire i_RESET,
	input wire i_CLK_EN,
	input wire i_TX_ENABLE,
	input wire [7:0] i_DATA_IN,
	output reg o_TX_BUSY,
	output reg o_TX
);

localparam s_IDLE 	= 2'd0;
localparam s_START_TX 	= 2'd1;
localparam s_TRANSMIT 	= 2'd2;
localparam s_STOP_TX 	= 2'd3;

//localparam lp_CLOCKS_PER_BAUD = 100_000_000 / 115200;
localparam lp_CLOCKS_PER_BAUD = 1;

reg [1:0] r_CURRENT_STATE;
reg [1:0] r_NEXT_STATE;
reg [2:0] r_BIT_COUNT;
reg [7:0] r_DATA_REG;

initial 
begin
	r_CURRENT_STATE = 2'd0;
	r_NEXT_STATE 	= 2'd0;
	r_BIT_COUNT 	= 3'd0;
	r_DATA_REG 	= 8'd0;
end

//FIXME: something in the block causes induction and cover to fail.
always@(*)
begin
	case(r_CURRENT_STATE)
		s_IDLE:
		begin
			r_NEXT_STATE = (i_TX_ENABLE) ? s_START_TX : s_IDLE;
		end
		s_START_TX:
			r_NEXT_STATE = s_TRANSMIT;
		s_TRANSMIT:
		begin
			r_NEXT_STATE = (r_BIT_COUNT == 3'd7) ? s_STOP_TX : s_TRANSMIT;
		end
		s_STOP_TX:
			r_NEXT_STATE = s_IDLE;

	endcase
end

always@(posedge i_CLK)
begin
	if(i_RESET)
		r_CURRENT_STATE <= s_IDLE;
	else
	begin
		if(i_CLK_EN)
			r_CURRENT_STATE <= r_NEXT_STATE;
		else
			r_CURRENT_STATE <= r_CURRENT_STATE;
	end
end

always@(*)
begin
	o_TX_BUSY = |r_CURRENT_STATE;
	case(r_CURRENT_STATE)
		s_IDLE:
		begin
			o_TX = 1'b1;
		end
		s_START_TX:
		begin
			o_TX = 1'b0;
		end
		s_TRANSMIT:
		begin
			o_TX = r_DATA_REG[r_BIT_COUNT];
		end
		s_STOP_TX:
		begin
			o_TX = 1'b1;
		end
	endcase
end

always@(posedge i_CLK)
begin
	if(r_CURRENT_STATE == s_IDLE)
		r_DATA_REG <= i_DATA_IN;
	else
		r_DATA_REG <= r_DATA_REG;

	if(r_CURRENT_STATE == s_TRANSMIT)
		r_BIT_COUNT <= r_BIT_COUNT + 1'b1;
	else
		r_BIT_COUNT <= 3'd0;
end

//TODO: Completely refactor
`ifdef FORMAL
	reg f_PAST_VALID = 0;
	reg [7:0] f_TX_DATA = 0;
	//reg [3:0] f_TX_COUNTER = 0;
	always@(posedge i_CLK)
	begin
		f_PAST_VALID <= 1;
		assume($changed(i_CLK));
		if(f_PAST_VALID && $rose(i_CLK))
		begin
			if($past(i_RESET) == 1)
			begin
				assert(o_TX == 1);
				assert(o_TX_BUSY == 0);
				assert(r_CURRENT_STATE == s_IDLE);
				assert(r_BIT_COUNT == 0);
				assert(r_DATA_REG == $past(i_DATA_IN));
			end
			else
			begin
				if($past(i_CLK_EN)) begin
					cover(r_CURRENT_STATE == s_IDLE && $past(r_CURRENT_STATE) == s_STOP_TX);

					if(r_CURRENT_STATE == s_IDLE)
						assert(o_TX);
					else if(r_CURRENT_STATE == s_START_TX)
						assert(!o_TX);
					else if(r_CURRENT_STATE == s_TRANSMIT)
						assert(o_TX == r_DATA_REG[r_BIT_COUNT]);
					else
						assert(o_TX);
					if(r_CURRENT_STATE != s_IDLE)
						assert(o_TX_BUSY);
					else
						assert(!o_TX_BUSY);
					//Transitions
					if($past(r_CURRENT_STATE) == s_START_TX)
						assert(r_CURRENT_STATE == s_TRANSMIT);
					if($past(r_CURRENT_STATE) == s_STOP_TX)
						assert(r_CURRENT_STATE == s_IDLE);
					if(r_CURRENT_STATE == s_STOP_TX)
						assert(r_NEXT_STATE == s_IDLE);
					if(r_CURRENT_STATE == s_START_TX)
						assert(r_NEXT_STATE == s_TRANSMIT);



					if($past(r_CURRENT_STATE) == s_TRANSMIT && r_NEXT_STATE == s_STOP_TX)
					begin
						assert($changed(r_BIT_COUNT));
						assert(r_BIT_COUNT == $past(r_BIT_COUNT) + 1);
					end
					if(r_CURRENT_STATE == s_START_TX && f_PAST_VALID)
						assert(r_DATA_REG == $past(i_DATA_IN));
				end
			end
		end
		if(f_PAST_VALID && !$rose(i_CLK))
		begin
			assume($stable(i_RESET));
			assume($stable(i_TX_ENABLE));
			assume($stable(i_DATA_IN));
		end

	end
`endif
endmodule
