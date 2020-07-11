module nibble_local_count (
	input wire [3:0] i_INPUT_NIBBLE,
	output wire o_ALL_ZEROS, //this would be a_i 
	output wire [1:0] o_ZERO_COUNT //this would be Z_i
);

wire Z_0;
wire Z_1;
assign o_ALL_ZEROS = ~(i_INPUT_NIBBLE[3] | i_INPUT_NIBBLE[2] | i_INPUT_NIBBLE[1] | i_INPUT_NIBBLE[0]);
assign o_ZERO_COUNT = {Z_1,Z_0};
assign Z_1 = ~(i_INPUT_NIBBLE[3] | i_INPUT_NIBBLE[2]);
assign Z_0 = ~((~i_INPUT_NIBBLE[2] & i_INPUT_NIBBLE[1]) | i_INPUT_NIBBLE[0]);
endmodule
