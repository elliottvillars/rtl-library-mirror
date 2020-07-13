module count_leading_zeros_64 (
	input wire [63:0] i_WORD,
	output wire o_INVALID,
	output wire [5:0] o_ZERO_COUNT
);

wire w_CLZ_L_ZERO;
wire w_CLZ_H_ZERO;
wire [4:0] w_INTERIM_ZERO_COUNT_FINAL;
wire [4:0] w_INTERIM_ZERO_COUNT_L;
wire [4:0] w_INTERIM_ZERO_COUNT_H;


assign o_INVALID = w_CLZ_L_ZERO & w_CLZ_H_ZERO;
assign o_ZERO_COUNT = {w_CLZ_H_ZERO,w_INTERIM_ZERO_COUNT_FINAL};
assign w_INTERIM_ZERO_COUNT_FINAL = (w_CLZ_H_ZERO == 1) ? w_INTERIM_ZERO_COUNT_L : w_INTERIM_ZERO_COUNT_H;

count_leading_zeros_32 clz_l (
	.i_WORD(i_WORD[31:0]),
	.o_ALL_ZEROS(w_CLZ_L_ZERO),
	.o_ZERO_COUNT(w_INTERIM_ZERO_COUNT_L)
);

count_leading_zeros_32 clz_h (
	.i_WORD(i_WORD[63:32]),
	.o_ALL_ZEROS(w_CLZ_H_ZERO),
	.o_ZERO_COUNT(w_INTERIM_ZERO_COUNT_H)
);

`ifdef FORMAL
	wire [63:0] fw_SHIFTED_WORD;
	assign fw_SHIFTED_WORD = i_WORD << o_ZERO_COUNT;
	always@(*)
	begin
		if(i_WORD == 64'd0)
			assert(o_INVALID == 1'b1);
		else
		begin
			assert(o_INVALID == 1'b0);
			assert(fw_SHIFTED_WORD[63] == 1'b1);
		end
	end
`endif
endmodule
