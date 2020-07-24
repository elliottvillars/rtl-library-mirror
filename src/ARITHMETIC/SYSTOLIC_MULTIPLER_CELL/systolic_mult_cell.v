//A ssytolic multiplier implementation from here:
//https://sci-hub.tw/10.1109/aspdac.2003.1195065
//
module systolic_mult_cell (
	input wire i_CLK,
	input wire i_INPUT, //Input from the adjacent cell with a lower index
	input wire i_WEIGHT, //A bit from the multiplicand
	input wire i_CARRY_IN,
	input wire i_ADJ_RESULT, //Result from the adjacent systolic_mult_cell with a higher index
	output reg o_OUTPUT,
	output reg o_INPUT_BROADCAST, //Send the input to the next cell
	output reg o_CARRY_OUT
);

wire w_TEMP_WIRE;
wire w_ADD_RESULT;

assign w_TEMP_WIRE = i_INPUT & i_WEIGHT;
assign w_ADD_RESULT = i_ADJ_RESULT + i_CARRY_IN + w_TEMP_WIRE;

always@(posedge i_CLK)
begin
	o_INPUT_BROADCAST <= i_INPUT;
	o_CARRY_OUT <= w_ADD_RESULT;
	o_OUTPUT <= w_ADD_RESULT;
end
endmodule
