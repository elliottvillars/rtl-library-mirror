module shifter_32 (
	input wire [31:0] i_INPUT,
	input wire [4:0] i_SHIFT_AMOUNT,
	output wire [31:0] o_RESULT
);

assign o_RESULT = i_INPUT << i_SHIFT_AMOUNT;
endmodule
