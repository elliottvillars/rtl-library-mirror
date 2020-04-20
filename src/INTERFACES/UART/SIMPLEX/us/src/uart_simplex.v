module uart_simplex (
	input wire i_CLK,
	input wire [7:0] i_DATA_IN,
	input wire i_TX_ENABLE,
	output reg o_TX
);

reg [8:0] r_TX_REG = 0;
reg [3:0] r_BIT_COUNT = 0;

reg r_CURRENT_STATE = s_IDLE;
reg r_NEXT_STATE;

localparam s_IDLE = 0;
localparam s_TX = 1;

always@(*)
begin
	case(r_CURRENT_STATE)
		s_IDLE:
		begin
			o_TX = 1;
			if(i_TX_ENABLE == 1)
				r_NEXT_STATE = s_TX;
			else
				r_NEXT_STATE = s_IDLE;
		end
		s_TX:
		begin
			o_TX = r_TX_REG[0];//move this to a comb block
			if(r_BIT_COUNT == 7)
				r_NEXT_STATE = s_IDLE;
			else
				r_NEXT_STATE = s_TX;
		end
	endcase

end

always@(posedge i_CLK)
begin
	r_CURRENT_STATE <= r_NEXT_STATE;
	case(r_CURRENT_STATE)//Maybe use next state.
		s_IDLE:
	begin
		r_BIT_COUNT <= 0;
		r_TX_REG <= {i_DATA_IN,1'b0};
	end
	s_TX:
	begin
		r_BIT_COUNT <= r_BIT_COUNT + 1;
		r_TX_REG <= r_TX_REG >> 1;
	end
endcase

end

`ifdef FORMAL
	reg r_PAST_VALID = 0;
	initial begin
		assume(i_TX_ENABLE == 0);
	end
	always@(posedge i_CLK)
	begin
		r_PAST_VALID <= 1;
		assume($changed(i_CLK));
		assume(i_DATA_IN == 8'b00101010);
		if(r_PAST_VALID == 1 && $rose(i_CLK))
		begin
			cover($past(r_CURRENT_STATE) == s_TX && r_CURRENT_STATE == s_IDLE);
			if($past(r_CURRENT_STATE) == s_IDLE)
			begin
				assert(r_BIT_COUNT == 0);
			end
			if($past(r_CURRENT_STATE) == s_TX)
			begin
			//	assert(o_TX == $past(r_TX_REG[0]));
			//	assert(r_TX_REG == $past(r_TX_REG) >> 1);
			end
		end
	end
`endif



endmodule
