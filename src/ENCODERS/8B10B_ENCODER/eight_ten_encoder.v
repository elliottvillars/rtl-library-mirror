module eight_ten_encoder (
	input wire [7:0] i_WORD,
	input wire i_KIN,
	output wire [9:0] o_ENCODED_WORD
);

wire w_RD_FEEDBACK;
wire w_RD_FEEDFORWARD;
wire w_UAP;
wire w_UAN;
wire [5:0] w_ABCDEI;
wire [3:0] w_FGHJ;
//Needs to be finished
five_six_encoder a (
	.i_RD_IN(w_RD_FEEDBACK),
	.i_EDCBA(i_WORD[4:0]),
	.i_K_IN(i_KIN),
	.o_USE_ALT_NEG(w_UAN),
	.o_USE_ALT_POS(w_UAP),
	.o_RD_OUT(w_RD_FEEDFORWARD),
	.o_ABCDEI(w_ABCDEI)
);
three_four_encoder b (
	.i_RD_IN(w_RD_FEEDFORWARD),
	.i_HGF(i_WORD[7:5]),
	.i_KIN(i_KIN),
	.i_USE_ALT_NEG(w_UAN),
	.i_USE_ALT_POS(w_UAP),
	.o_RD_OUT(w_RD_FEEDBACK),
	.o_FGHJ(w_FGHJ)
);

assign o_ENCODED_WORD = {w_ABCDEI,w_FGHJ};
endmodule
