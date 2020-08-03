//Author: Elliott Villars
//
//Name: Accumulator
//
//Date: 3/8/2020
//
//Format: Verilog
//
//Description: A logical right shift module. Not registered.
//
//Parameters: 
//
//p_DATA_WIDTH: Length of the input/output word length. It is recommended to
//use a power of two when defining this parameter.
//
//Local Parameters:
//
//lp_SFT_AMT_WIDTH: Log 2 of the incoming word. This dictates how much can be
//shifted. Maximum shift (assuming base two input) would be a shift of
//N - 1 where N is the length of the incoming word (i.e An input width of
//4 bits could at most be shifted by 3 bits).
//
//Ports: 
//
//i_INPUT: A variable width input that carries the incoming word to be
//shifted.
//
//i_SHIFT_AMOUNT: A variable width input that depends on the
//"lp_SFT_AMT_WIDTH" local parameter. Determines how much to shift by.
//
//o_RESULT: A variable width output that contains the shifted word.
//
//Estimated Logic Usage:  The following resource usage is determined by
//Yosys when running the "synth_ice40" command on the design. All estimations
//are liberal with resource usage. Assumes 4 bit input.
//
//(Lattice)
//7 SB_LUT4s  
//
`default_nettype none
module srl #(parameter p_DATA_WIDTH = 4) (
	input wire [p_DATA_WIDTH-1:0] i_INPUT,
	input wire [p_SFT_AMT_WIDTH:0] i_SHIFT_AMOUNT,
	output reg [p_DATA_WIDTH-1:0] o_RESULT
);

localparam p_SFT_AMT_WIDTH = $clog2(p_DATA_WIDTH);

always@(*)
begin
	o_RESULT = i_INPUT >> i_SHIFT_AMOUNT;
end

`ifdef FORMAL
	reg [p_DATA_WIDTH-1:0] fr_MOCK_RESULT;
	always@(*)
	begin
		fr_MOCK_RESULT = i_INPUT >> i_SHIFT_AMOUNT;
		assert(fr_MOCK_RESULT == o_RESULT);
	end
`endif
endmodule
