//Author: Elliott Villars
//
//Name: Accumulator
//
//Date: 1/8/2020
//
//Format: Verilog
//
//Description: A systolic multiplier implementation from here:
//https://sci-hub.tw/10.1109/aspdac.2003.1195065
//Systolic architectures trade latency for higher frequency and lower area.
//Registered.
//
//Parameters: 
//
//p_WORD_WIDTH: This parameter specifies the amount of bits that the make up
//the multiplicand / multiplier. If the multiplier is 4 bits wide then the
//multiplicand should also be 4 bits. The resulting product will require
//8 clock cycles.
//
//Ports: 
//i_CLK: System clock input. All module operation is predicated on a rising
//edge clock signal.
//
//i_MULTIPLIER: A variable width input signal were each bit corresponds to
//a cell index. This signal should be stable for at least 2 * "p_WORD_WIDTH"
//clock cycles.
//
//i_MULTIPLICAND: A 1-bit signal where the bits of the number to be multiplied
//are shifted in, one bit at a time. The LSB is the first bit shifted in.
//
//o_OUTPUT: A 1-bit output were one bit of the result of the computation is calculated per clock cycle
//The LSB of the result is the first bit shifted out.
//A complete result takes 2 * "p_WORD_WIDTH" clock cycles.
//
//Estimated Logic Usage:  The following resource usage is determined by
//Yosys when running the "synth_ice40" command on the design. All estimations
//are liberal with resource usage. 
//
//(Lattice)
//2 SB_DFF
//1 SB_LUT4s  
//
`default_nettype none
module systolic_multiplier #(parameter p_WORD_WIDTH = 4)(
	input wire i_CLK,
	input wire [p_WORD_WIDTH-1:0] i_MULTIPLIER,
	input wire i_MULTIPLICAND,
	output wire o_OUTPUT
);

wire [p_WORD_WIDTH-1:0] w_CARRY_FEEDBACK;
wire [p_WORD_WIDTH-2:0] w_CELL_INTERCONNECT_RESULT;
wire [p_WORD_WIDTH-2:0] w_CELL_INTERCONNECT_BROADCAST;

systolic_mult_cell s0 (
	.i_CLK(i_CLK),
	.i_INPUT(i_MULTIPLICAND),
	.i_CARRY_IN(w_CARRY_FEEDBACK[0]),
	.i_WEIGHT(i_MULTIPLIER[0]),
	.i_ADJ_RESULT(w_CELL_INTERCONNECT_RESULT[0]),
	.o_INPUT_BROADCAST(w_CELL_INTERCONNECT_BROADCAST[0]),
	.o_CARRY_OUT(w_CARRY_FEEDBACK[0]),
	.o_OUTPUT(o_OUTPUT)
);
systolic_mult_cell s1 (
	.i_CLK(i_CLK),
	.i_INPUT(w_CELL_INTERCONNECT_BROADCAST[0]),
	.i_CARRY_IN(w_CARRY_FEEDBACK[1]),
	.i_WEIGHT(i_MULTIPLIER[1]),
	.i_ADJ_RESULT(w_CELL_INTERCONNECT_RESULT[1]),
	.o_INPUT_BROADCAST(w_CELL_INTERCONNECT_BROADCAST[1]),
	.o_CARRY_OUT(w_CARRY_FEEDBACK[1]),
	.o_OUTPUT(w_CELL_INTERCONNECT_RESULT[0])
);
systolic_mult_cell s2 (
	.i_CLK(i_CLK),
	.i_INPUT(w_CELL_INTERCONNECT_BROADCAST[1]),
	.i_CARRY_IN(w_CARRY_FEEDBACK[2]),
	.i_WEIGHT(i_MULTIPLIER[2]),
	.i_ADJ_RESULT(w_CELL_INTERCONNECT_RESULT[2]),
	.o_INPUT_BROADCAST(w_CELL_INTERCONNECT_BROADCAST[2]),
	.o_CARRY_OUT(w_CARRY_FEEDBACK[2]),
	.o_OUTPUT(w_CELL_INTERCONNECT_RESULT[1])
);
systolic_mult_cell s3 (
	.i_CLK(i_CLK),
	.i_INPUT(w_CELL_INTERCONNECT_BROADCAST[2]),
	.i_CARRY_IN(w_CARRY_FEEDBACK[3]),
	.i_WEIGHT(i_MULTIPLIER[3]),
	.i_ADJ_RESULT(1'b0),
	.o_INPUT_BROADCAST(),
	.o_CARRY_OUT(w_CARRY_FEEDBACK[3]),
	.o_OUTPUT(w_CELL_INTERCONNECT_RESULT[2])
);
endmodule
