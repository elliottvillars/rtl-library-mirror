//From Fig 3.
//https://sci-hub.tw/10.1109/eait.2012.6408016
module four_bit_comparator (
	input wire [3:0] i_OPERAND_A,
	input wire [3:0] i_OPERAND_B,
	output wire o_GT,
	output wire o_LT,
	output wire o_EQ
);


wire [3:0] w_CMP_RESULT;
wire [3:0] w_Gi;
wire [3:0] w_Si;

look_ahead_logic_cell cmp (
	.i_OPERAND_A(i_OPERAND_A),
	.i_OPERAND_B(i_OPERAND_B),
	.o_CMP_RESULT(w_CMP_RESULT)
);

assign w_Gi[0] = ~i_OPERAND_A[0] & i_OPERAND_B[0] &w_CMP_RESULT[0];
assign w_Gi[1] = ~i_OPERAND_A[1] & i_OPERAND_B[1] &w_CMP_RESULT[1];
assign w_Gi[2] = ~i_OPERAND_A[2] & i_OPERAND_B[2] &w_CMP_RESULT[2];
assign w_Gi[3] = ~i_OPERAND_A[3] & i_OPERAND_B[3] &w_CMP_RESULT[3];

assign w_Si[0] = i_OPERAND_A[0] & ~i_OPERAND_B[0] &w_CMP_RESULT[0];
assign w_Si[1] = i_OPERAND_A[1] & ~i_OPERAND_B[1] &w_CMP_RESULT[1];
assign w_Si[2] = i_OPERAND_A[2] & ~i_OPERAND_B[2] &w_CMP_RESULT[2];
assign w_Si[3] = i_OPERAND_A[3] & ~i_OPERAND_B[3] &w_CMP_RESULT[3];

assign o_LT = w_Gi[0] | w_Gi[1] | w_Gi[2] | w_Gi[3];
assign o_GT = w_Si[0] | w_Si[1] | w_Si[2] | w_Si[3];
assign o_EQ = ~(o_LT | o_GT);

`ifdef FORMAL
	always@(*)
	begin
		cover(o_GT);
		cover(o_LT);
		cover(o_EQ);
		if(i_OPERAND_A < i_OPERAND_B)
			assert(o_LT & ~o_GT & ~o_EQ);
		else if(i_OPERAND_A > i_OPERAND_B)
			assert(o_GT & ~o_LT & ~o_EQ);
		else
			assert(o_EQ & ~o_GT & ~o_LT);
	end
`endif
endmodule
