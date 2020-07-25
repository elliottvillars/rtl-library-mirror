module eight_bit_comparator (
	input wire [7:0] i_OPERAND_A,
	input wire [7:0] i_OPERAND_B,
	output wire o_LT,
	output wire o_GT,
	output wire o_EQ
);

four_bit_comparator low (
	.i_OPERAND_A(i_OPERAND_A[3:0]),
	.i_OPERAND_B(i_OPERAND_B[3:0]),
	.o_LT(),
	.o_GT(),
	.o_EQ()
);
four_bit_comparator high (
	.i_OPERAND_A(i_OPERAND_A[7:4]),
	.i_OPERAND_B(i_OPERAND_B[7:4]),
	.o_LT(),
	.o_GT(),
	.o_EQ()
);
endmodule
