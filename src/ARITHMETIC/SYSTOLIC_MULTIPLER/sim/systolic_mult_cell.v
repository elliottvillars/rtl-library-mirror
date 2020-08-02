//
//Author: Elliott Villars
//
//Name: Accumulator
//
//Date: 31/7/2020
//
//Format: Verilog
//
//Description: A systolic multiplier cell implementation from here:
//https://sci-hub.tw/10.1109/aspdac.2003.1195065
//Systolic architectures trade latency for higher frequency and lower area.
//Registered.
//
//Parameters: None
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

`default_nettype none
module systolic_mult_cell (
	input wire i_CLK,
	input wire i_INPUT, 
	input wire i_WEIGHT, 
	input wire i_CARRY_IN,
	input wire i_ADJ_RESULT, 
	output reg o_OUTPUT,
	output reg o_INPUT_BROADCAST, 
	output reg o_CARRY_OUT
);

reg r_TEMP_WIRE;
reg r_ADD_RESULT;


always@(*)
begin
	r_TEMP_WIRE = i_INPUT & i_WEIGHT;
	r_ADD_RESULT = i_ADJ_RESULT + i_CARRY_IN + r_TEMP_WIRE;
end

always@(posedge i_CLK)
begin
	o_INPUT_BROADCAST <= i_INPUT;
	o_CARRY_OUT <= r_ADD_RESULT;
	o_OUTPUT <= r_ADD_RESULT;
end
endmodule
