`default_nettype none
module  sign_extend #(parameter p_INPUT_WIDTH = 8, parameter p_OUTPUT_WIDTH = 16)(
	input wire [p_INPUT_WIDTH-1:0] i_INPUT,
	output reg [p_OUTPUT_WIDTH-1:0] o_OUTPUT
);

localparam lp_EXTEND_AMOUNT = p_OUTPUT_WIDTH - p_INPUT_WIDTH;

always@(*)
begin
	o_OUTPUT = {{lp_EXTEND_AMOUNT{i_INPUT[p_INPUT_WIDTH-1]}},i_INPUT};
end

`ifdef FORMAL
	always@(*)
	begin
		assert(o_OUTPUT[p_OUTPUT_WIDTH-1] == i_INPUT[p_INPUT_WIDTH-1]); //Show that extension holds
	end
`endif
endmodule
