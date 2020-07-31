//Author: Elliott Villars
//
//Name: Full Adder
//
//Date: 31/7/2020
//
//Format: Verilog
//
//Description: A formally verified full adder logic primative.
//Not really useful by itself. Intended as a basic building block for more
//complicated adder designs. Not registered.
//
//Estimated Logic Usage:  The following resource usage is determined by
//Yosys when running the "synth_ice40" command on the design. All estimations
//are liberal with resource usage.
//
//2 SB_LUT4s (Lattice)
//
//Ports: 
//i_INPUT_A: A 1-bit wide input for the "A" operand.
//
//i_INPUT_B: A 1-bit wide input for the "B" operand.
//
//i_CIN: A 1-bit wide input for a carry in value from an adjacent FA slice.
//
//o_SUM: A 1-bit wide output for the result of "A xor B xor CIN"
//
//o_COUT: A 1-bit wide output for the possible carry generation from the above
//operation
//

`default_nettype none
module full_adder (
	input wire i_INPUT_A,
	input wire i_INPUT_B,
	input wire i_CIN,
	output reg o_SUM,
	output reg o_COUT
);

always@(*)
begin
	o_SUM = i_INPUT_A ^ i_INPUT_B ^ i_CIN;
	o_COUT = (i_INPUT_A & i_INPUT_B) | (i_INPUT_A ^ i_INPUT_B) & i_CIN;
end

`ifdef FORMAL

	wire [2:0] fw_incat;
	assign fw_incat = {i_INPUT_A,i_INPUT_B,i_CIN};
	always@(*)
	begin
		if(fw_incat == 1 || fw_incat == 2 || fw_incat == 4 || fw_incat == 7)
			assert(o_SUM);
		else
			assert(~o_SUM);
		if(fw_incat == 6 || fw_incat == 5 || fw_incat == 3 || fw_incat == 7)
			assert(o_COUT);
		else
			assert(~o_COUT);
	end
`endif
endmodule
