//Author: Elliott Villars
//
//Name: Accumulator
//
//Date: 31/7/2020
//
//Format: Verilog
//
//Description: A formally verified accumulator. Every clock cycle adds the
//summand to the total accumulation. Registered.
//
//Parameters:
//p_DATA_WIDTH: Adjusts the bit width of the "i_SUMMAND" and "o_ACCUMULATION"
//ports
//
//Ports: 
//i_CLK: System clock input. All module operation is predicated on a rising
//edge clock signal.
//
//i_CLK_ENABLE: A 1-bit wide input for a clock enable signal to enable operation at a slower
//frequency. Active high assertion.
//
//i_RESET: A 1-bit wide input for a reset signal. When asserted,
//the total accumulation will be set to zero. Active high assertion.
//
//i_SUMMAND: A variable width signed input for an incoming signed value. 
//When "i_CLK_ENABLE" is asserted on the rising edge of the clock input, the summand
//input gets added to the accumulation output.
//
//o_ACCUMULATION: A variable width output holding the signed accumulation. 
//This port is registered.
//
//Estimated Logic Usage:  The following resource usage is determined by
//Yosys when running the "synth_ice40" command on the design. All estimations
//are liberal with resource usage. Assuming parameter "p_DATA_WIDTH" is set to
//8.
//
//(Lattice)
//7 SB_CARRY  (Every N-bit addition requires N-1 carry lines)
//8 SB_DFFESR (8-bit output is registered)
//9 SB_LUT4s  (9 LUTs in total, 8 for the register, 1 for the control logic)
//

`default_nettype none
module accumulator #(parameter p_DATA_WIDTH = 8)(
	input wire i_CLK,
	input wire i_CLK_ENABLE,
	input wire i_RESET,
	input wire signed [p_DATA_WIDTH-1:0] i_SUMMAND,
	output reg signed [p_DATA_WIDTH-1:0] o_ACCUMULATION
);

always@(posedge i_CLK)
begin
	if(i_RESET == 1'b1)
		o_ACCUMULATION <= {p_DATA_WIDTH{1'b0}};
	else
	begin
		if(i_CLK_ENABLE == 1'b1)
			o_ACCUMULATION <= o_ACCUMULATION + i_SUMMAND;
		else
			o_ACCUMULATION <= o_ACCUMULATION;
	end
end
`ifdef FORMAL
	reg r_PAST_VALID = 0;
	always@(posedge i_CLK)
	begin
		assume($changed(i_CLK));
		r_PAST_VALID <= 1;
		if(r_PAST_VALID == 1 && $rose(i_CLK))
		begin
			cover(o_ACCUMULATION == -1);
			cover(o_ACCUMULATION == 100);
			if($past(i_RESET) == 1)
				assert(o_ACCUMULATION == 0);
			else if($past(i_CLK_ENABLE) == 1)
				assert(o_ACCUMULATION == $past(o_ACCUMULATION) + $past(i_SUMMAND));
			else 
				assert($stable(o_ACCUMULATION));
		end
		if(!$rose(i_CLK))
		begin
			assume($stable(i_CLK_EN));
			assume($stable(i_RESET));
			assume($stable(i_SUMMAND));
		end
	end
`endif
endmodule
