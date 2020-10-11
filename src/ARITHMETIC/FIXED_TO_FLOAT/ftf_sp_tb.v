module ftf_sp_tb (
);

reg r_CLK = 0;
always
	#5 r_CLK = !r_CLK;

reg signed [31:0] r_FIXED_WORD;
wire signed [31:0] w_FLOAT_WORD;
wire w_INVALID;

int32_to_float_sp ftf (
	.i_CLK(r_CLK),
	.i_FIXED_WORD(r_FIXED_WORD),
	.o_INVALID(w_INVALID),
	.o_FLOAT_WORD(w_FLOAT_WORD)
);

initial begin
	#5 r_FIXED_WORD = -1;
	#20;
	$monitor("o_FLOAT_WORD output: %32b, i_FIXED_WORD input: %32b (%d)",w_FLOAT_WORD,r_FIXED_WORD,r_FIXED_WORD);
	#5 r_FIXED_WORD = 1;
	#20;
	$monitor("o_FLOAT_WORD output: %32b, i_FIXED_WORD input: %32b (%d)",w_FLOAT_WORD,r_FIXED_WORD,r_FIXED_WORD);
	#5 r_FIXED_WORD = -32;
	#20;
	$monitor("o_FLOAT_WORD output: %32b, i_FIXED_WORD input: %32b (%d)",w_FLOAT_WORD,r_FIXED_WORD,r_FIXED_WORD);
	#5 r_FIXED_WORD = 32;
	#20;
	$monitor("o_FLOAT_WORD output: %32b, i_FIXED_WORD input: %32b (%d)",w_FLOAT_WORD,r_FIXED_WORD,r_FIXED_WORD);
	#5 r_FIXED_WORD = 2;
	#20;
	$monitor("o_FLOAT_WORD output: %32b, i_FIXED_WORD input: %32b (%d)",w_FLOAT_WORD,r_FIXED_WORD,r_FIXED_WORD);
	#5 r_FIXED_WORD = -2;
	#20;
	$monitor("o_FLOAT_WORD output: %32b, i_FIXED_WORD input: %32b (%d)",w_FLOAT_WORD,r_FIXED_WORD,r_FIXED_WORD);
	#5 $finish();
end
endmodule
