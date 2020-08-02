
//
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
//p_WORD_WIDTH:
//
//Ports: 
//i_CLK: System clock input. All module operation is predicated on a rising
//edge clock signal.
//
//i_INPUT: A 1-bit wide input from an the adjacent cell with a lower index i.e:
//0 -> 1 -> 2 -> ... -> N
//|-----|    |-----|    |-----|            |-----|
//|  0  | -> |  1  | -> |  2  |  -> ... -> |  N  |
//|_____|    |_____|    |_____|            |_____|
//
//i_WEIGHT: A bit from the multiplicand. The bit of the multiplicand
//corresponds with the systolic cells index. So the cell with an index of zero
//will receive the zeroth bit of the multiplicand, one will receive first
//bit,etc.
//
//i_CARRY_IN: A 1-bit wide input that receives the "o_CARRY_OUT" result from the previous
//clock cycle. The systolic cell feeds its carry out result back into itself. 
//
//i_ADJ_RESULT:  A 1-bit input that receive the 
//result from the adjacent systolic_mult_cell with a higher index. 
//The diagram above shows how cells index corresponds to the cells 
//ordering.
//
//o_OUTPUT: A 1-bit output that feeds that computations results to a lower
//indexed cell.
//
//o_INPUT_BROADCAST: A 1-bit output that broadcasts the input from a lower
//indexed cell to a higher indexed cell.
//
//o_CARRY_OUT: A 1-bit output that is fed back into the cell via the
//"i_CARRY_IN" signal.
//
//Estimated Logic Usage:  The following resource usage is determined by
//Yosys when running the "synth_ice40" command on the design. All estimations
//are liberal with resource usage. 
//
//(Lattice)
//2 SB_DFF
//1 SB_LUT4s  
//
//TODO: Finish doc
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
	.i_ADJ_RESULT(),
	.o_INPUT_BROADCAST(),
	.o_CARRY_OUT(w_CARRY_FEEDBACK[3]),
	.o_OUTPUT(w_CELL_INTERCONNECT_RESULT[2])
);
endmodule
