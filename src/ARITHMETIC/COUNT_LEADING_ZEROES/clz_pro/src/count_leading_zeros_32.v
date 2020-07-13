//This is a zero counting module described here:
//https://sci-hub.tw/10.2478/jee-2015-0054
module count_leading_zeros_32(
	input wire [31:0] i_WORD,
	output wire o_ALL_ZEROS,
	output wire [4:0] o_ZERO_COUNT
);

//TODO:TEST THIS MODULE
wire [15:0] w_NIBBLE_LEAD_ZEROES;
wire [7:0] w_ZEROED_NIBBLE;
wire [2:0] w_UPPER_COUNT_BITS;
reg [1:0] r_LOWER_COUNT_BITS;
genvar idx;
generate
	for(idx = 0; idx < 8; idx = idx + 1) begin
nibble_local_count nlc_xx(
	.i_INPUT_NIBBLE(i_WORD[31-4*idx:31-4*idx-3]),
	.o_ALL_ZEROS(w_ZEROED_NIBBLE[idx]),
	.o_ZERO_COUNT(w_NIBBLE_LEAD_ZEROES[2*idx+1:2*idx])
);
end
endgenerate

boundary_nibble_encoder bne (
	.i_ZEROED_NIBBLES(w_ZEROED_NIBBLE),
	.o_INVALID(o_ALL_ZEROS),
	.o_Y(w_UPPER_COUNT_BITS)
);

always@(*)
begin
	case(w_UPPER_COUNT_BITS)
		3'd0:
		begin
			r_LOWER_COUNT_BITS = w_NIBBLE_LEAD_ZEROES[1:0];
		end
		3'd1:
		begin
			r_LOWER_COUNT_BITS = w_NIBBLE_LEAD_ZEROES[3:2];
		end
		3'd2:
		begin
			r_LOWER_COUNT_BITS = w_NIBBLE_LEAD_ZEROES[5:4];
		end
		3'd3:
		begin
			r_LOWER_COUNT_BITS = w_NIBBLE_LEAD_ZEROES[7:6];
		end
		3'd4:
		begin
			r_LOWER_COUNT_BITS = w_NIBBLE_LEAD_ZEROES[9:8];
		end
		3'd5:
		begin
			r_LOWER_COUNT_BITS = w_NIBBLE_LEAD_ZEROES[11:10];
		end
		3'd6:
		begin
			r_LOWER_COUNT_BITS = w_NIBBLE_LEAD_ZEROES[13:12];
		end
		3'd7:
		begin
			r_LOWER_COUNT_BITS = w_NIBBLE_LEAD_ZEROES[15:14];
		end
	endcase
end
assign o_ZERO_COUNT = {w_UPPER_COUNT_BITS,r_LOWER_COUNT_BITS};
`ifdef FORMAL
	wire [31:0] fw_SHIFTED_WORD;
	assign fw_SHIFTED_WORD = i_WORD << o_ZERO_COUNT;
	always@(*)
	begin
		cover(o_ZERO_COUNT == 31 && o_ALL_ZEROS == 0);
		cover(o_ZERO_COUNT == 0  && o_ALL_ZEROS == 0);
		cover(o_ZERO_COUNT == 16 && o_ALL_ZEROS == 0);
		if(i_WORD == 32'd0)
			assert(o_ALL_ZEROS == 1'b1);
		else
		begin
			assert(o_ALL_ZEROS == 1'b0);
			assert(fw_SHIFTED_WORD[31] == 1'b1);
		end
	end
`endif
endmodule
