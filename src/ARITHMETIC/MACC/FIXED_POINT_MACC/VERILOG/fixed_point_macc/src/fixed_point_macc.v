module fixed_point_macc #(parameter p_INPUT_WIDTH = 4) (
	input wire i_CLK,
	input wire i_RESET,
	input wire i_CLEAR_ACC_REG,
	input wire signed [p_INPUT_WIDTH-1:0] i_A,
	input wire signed [p_INPUT_WIDTH-1:0] i_B,
	output reg signed [2*p_INPUT_WIDTH-1:0] o_RESULT
);

reg signed [2*p_INPUT_WIDTH-1:0] r_MUL_RESULT;
reg signed [2*p_INPUT_WIDTH-1:0] r_SUM_RESULT;

always@(posedge i_CLK)
begin
	if(i_RESET == 1)
	begin
		r_MUL_RESULT <= 0;
		r_SUM_RESULT <= 0;
	end
	else 
	begin
		if(i_CLEAR_ACC_REG == 1)
			r_SUM_RESULT <= 0;
		else
			r_SUM_RESULT <= r_SUM_RESULT + r_MUL_RESULT;
		r_MUL_RESULT <= i_A * i_B;
		o_RESULT <= r_SUM_RESULT;
	end
end

`ifdef FORMAL
	reg fr_past_valid = 0;
	initial 
	begin
		r_MUL_RESULT = 0;
		r_SUM_RESULT = 0;
	end

	always@(posedge i_CLK)
	begin
		fr_past_valid <= 1;
		assume($changed(i_CLK));
		if($rose(i_CLK) && fr_past_valid == 1)
		begin
			if($past(i_RESET) == 1)
				assert(r_MUL_RESULT | r_SUM_RESULT == 0);
		end
		else
		begin
			assume($stable(i_CLEAR_ACC_REG));
			assume($stable(i_A));
			assume($stable(i_B));
		end
	end

`endif
endmodule
