module int32_to_float_sp (
	input wire i_CLK,
	input wire signed [31:0] i_FIXED_WORD,
	output wire o_INVALID,
	output wire signed [31:0] o_FLOAT_WORD
);

reg signed [31:0] r_TEMP_REG_0;
reg signed [31:0] r_TEMP_REG_COMPLEMENT;
wire signed [31:0] w_TEMP_WIRE_0;
wire signed [31:0] w_TEMP_WIRE_1;
wire [4:0] w_SHIFT_AMOUNT;
wire w_ZERO;
reg [22:0] r_MANTISSA;
reg [7:0] r_EXPONENT_STAGE_0;
reg [7:0] r_EXPONENT_STAGE_1;
reg r_SIGN_STAGE_0;
reg r_SIGN_STAGE_1;
//Single precision bias + width of incoming integer minus sign bit.
localparam lp_BIAS = 127 + 31;

always@(posedge i_CLK)
begin
	r_TEMP_REG_0 <= i_FIXED_WORD;
	r_TEMP_REG_COMPLEMENT <= ~i_FIXED_WORD + 1'b1;
	r_EXPONENT_STAGE_0 <= lp_BIAS;
	r_EXPONENT_STAGE_1 <= r_EXPONENT_STAGE_0 - {3'b000,w_SHIFT_AMOUNT};
	r_SIGN_STAGE_0 <= i_FIXED_WORD[31];
	r_SIGN_STAGE_1 <= r_SIGN_STAGE_0;
	r_MANTISSA <= w_TEMP_WIRE_1[30:8];

end

assign w_TEMP_WIRE_0 = (r_SIGN_STAGE_0 == 1'b1) ? r_TEMP_REG_COMPLEMENT : r_TEMP_REG_0;
assign o_FLOAT_WORD = {r_SIGN_STAGE_1,r_EXPONENT_STAGE_1,r_MANTISSA};
assign o_INVALID = w_ZERO;

count_leading_zeros clz (
	.i_WORD(w_TEMP_WIRE_0),
	.o_ALL_ZEROS(w_ZERO),
	.o_ZERO_COUNT(w_SHIFT_AMOUNT)
);

sll #(.p_DATA_WIDTH(32)) shft (
	.i_INPUT(w_TEMP_WIRE_0),
	.i_SHIFT_AMOUNT(w_SHIFT_AMOUNT),
	.o_RESULT(w_TEMP_WIRE_1)
);

endmodule
