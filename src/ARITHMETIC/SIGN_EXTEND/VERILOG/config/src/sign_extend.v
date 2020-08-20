//Author: Elliott Villars
//
//Name: Sign Extend
//
//Date: 4/8/2020
//
//Format: Verilog
//
//Description: A formally verified sign extension module. Takes a signed input
//of "p_INPUT_WIDTH" and duplicates the MSB until it reaches "p_OUTPUT_WIDTH".
//Not registered.
//
//Parameters: 
//
//p_INPUT_WIDTH: Dictates the width of the input word.
//
//p_OUTPUT_WIDTH: Dictates the width of the output word.
//
//Local Parameters: 
//
//lp_EXTEND_AMOUNT: How many bits to extend the input word by.
//
//Ports: 
//
//i_INPUT: A variable width signed input that contains the signal to be
//extend. Width is determined by "p_INPUT_WIDTH"
//
//o_OUTPUT: A variable width signed output that contains the extended signal.
//Width is determined by "p_OUTPUT_WIDTH"
//
//Estimated Logic Usage:  The following resource usage is determined by
//Yosys when running the "synth_ice40" command on the design. All estimations
//are liberal with resource usage. Assumes input width of 4 and output width
//of 8
//
//(Lattice) 
//

`default_nettype none
module  sign_extend #(parameter p_INPUT_WIDTH = 4, parameter p_OUTPUT_WIDTH = 8)(
	input wire signed [p_INPUT_WIDTH-1:0] i_INPUT,
	output reg signed [p_OUTPUT_WIDTH-1:0] o_OUTPUT
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
