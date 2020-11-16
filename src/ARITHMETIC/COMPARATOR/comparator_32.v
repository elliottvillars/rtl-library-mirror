module comparator_32 (
	input wire [31:0] i_A,
	input wire [31:0] i_B,
	output reg o_GT,
	output reg o_LT_EQ
);
wire [7:0] w_GT;
wire [7:0] w_LT;

wire [1:0] w_GT_2;
wire [1:0] w_LT_2;
//TODO: Formally verify
genvar i;
generate
	for(i = 0; i < 8; i = i + 1)
	begin
		four_bit_comparator cmp_lvl1 (
			.i_OPERAND_A(i_A[4*i+3:4*i]),
			.i_OPERAND_B(i_B[4*i+3:4*i]),
			.o_GT(w_GT[i]),
			.o_LT(w_LT[i]),
			.o_EQ()
		);
	end
endgenerate
four_bit_comparator cmp_lvl2_left (
	.i_OPERAND_A(w_GT[3:0]),
	.i_OPERAND_B(w_LT[3:0]),
	.o_GT(w_GT_2[0]),
	.o_LT(w_LT_2[0]),
	.o_EQ()
);
four_bit_comparator cmp_lvl2_right (
	.i_OPERAND_A(w_GT[7:4]),
	.i_OPERAND_B(w_LT[7:4]),
	.o_GT(w_GT_2[1]),
	.o_LT(w_LT_2[1]),
	.o_EQ()
);

always@(*)
begin
	o_GT = w_LT_2[0] | ~w_LT_2[0] & w_LT_2[1] & ~w_GT_2[0] & ~w_GT_2[1];
	o_LT_EQ = ~o_GT;
end
endmodule
