module float_to_fixed_sp (
	input wire i_CLK,
	input wire signed [31:0] i_FLOAT_WORD,
	output reg signed [31:0] o_FIXED_RESULT
);

localparam lp_BIAS = 127;

reg r_SIGN_S0;
reg r_SIGN_S1;
reg signed [7:0] r_EXPONENT_S0;
reg signed [7:0] r_EXPONENT_S1;
reg [23:0] r_MANTISSA;
reg [31:0] r_RESULT;


//TODO: Make more coherent
always@(posedge i_CLK)
begin
	r_MANTISSA <= {1'b1,i_FLOAT_WORD[22:0]};
	r_SIGN_S0 <= i_FLOAT_WORD[31];
	r_SIGN_S1 <= r_SIGN_S0;
	r_EXPONENT_S0 <= i_FLOAT_WORD[30:23];
	r_EXPONENT_S1 <= r_EXPONENT_S0 - lp_BIAS;
	if(r_EXPONENT_S0 < 127)
		r_RESULT <= 32'd0;
	else if (r_EXPONENT_S1 >= 32)
		r_RESULT <= 32'd255;
	else
	begin
		r_RESULT <= r_MANTISSA >> 23 - r_EXPONENT_S1;
	end

	//TODO: Sign extend
	if(r_SIGN_S1 == 1'b1)
		o_FIXED_RESULT <= r_RESULT;
	else
		o_FIXED_RESULT <= ~r_RESULT + 1'b1;

end
endmodule
