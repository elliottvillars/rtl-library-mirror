module fixed_to_float_sp (
	input wire i_CLK,
	input wire signed [31:0] i_FIXED_WORD,
	output reg signed [31:0] o_FLOAT_WORD
);

reg signed [31:0] r_TEMP_REG_0;
reg signed [31:0] r_TEMP_REG_COMPLEMENT;
reg signed [31:0] r_TEMP_REG_1;
reg signed [31:0] r_TEMP_REG_2;
wire [4:0] w_SHIFT_AMOUNT;
wire w_ZERO;
reg [22:0] r_MANTISSA;
reg [7:0] r_EXPONENT;
reg r_SIGN_S0;
reg r_SIGN_S1;
parameter p_INTEGER_BIT_COUNT = 32;
localparam lp_BIAS = 127 + p_INTEGER_BIT_COUNT;


always@(posedge i_CLK)
begin
	r_TEMP_REG_0 <= i_FIXED_WORD;
	r_TEMP_REG_COMPLEMENT <= ~i_FIXED_WORD + 1'b1;
	r_SIGN_S0 <= i_FIXED_WORD[31];
	r_SIGN_S1 <= r_SIGN_S0;
	if(r_SIGN_S0 == 1'b0)
		r_TEMP_REG_1 <= r_TEMP_REG_0;
	else
		r_TEMP_REG_1 <= r_TEMP_REG_COMPLEMENT;

	r_EXPONENT <= lp_BIAS - {3'b000,w_SHIFT_AMOUNT};

end

count_leading_zeros clz (
	.i_WORD(r_TEMP_REG_1),
	.o_ALL_ZEROS(w_ZERO),
	.o_ZERO_COUNT(w_SHIFT_AMOUNT)
);

shifter_32 shft (
	.i_CLK(i_CLK),
	.i_INPUT(r_TEMP_REG_1),
	.i_SHIFT_AMOUNT(w_SHIFT_AMOUNT),
	.o_RESULT(r_TEMP_REG_2)
);

always@(posedge i_CLK)
begin
	o_FLOAT_WORD <= {r_SIGN_S1,r_EXPONENT,r_TEMP_REG_2[30:8]};
end

endmodule
