//Author: Elliott Villars
//
//Name: Half Adder
//
//Date: 31/7/2020
//
//Format: Verilog
//
//Description: A formally verified half adder logic primative.
//Limited usefulness. Not registered.
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
//o_SUM: A 1-bit wide output for the result of "A xor B"
//
//o_COUT: A 1-bit wide output for the possible carry generation from the above
//operation
//
`default_nettype none
module half_adder (
	input wire i_INPUT_A,
	input wire i_INPUT_B,
	output reg o_SUM,
	output reg o_COUT
);

always@(*)
begin
	o_SUM = i_INPUT_A ^ i_INPUT_B;
	o_COUT = i_INPUT_A & i_INPUT_B;
end

`ifdef FORMAL
	always@(*)
	begin
		case({i_INPUT_A,i_INPUT_B})
			2'b00:
			begin
				assert(~o_SUM && ~o_COUT);
			end
			2'b01:
			begin
				assert(o_SUM && ~o_COUT);
			end
			2'b10:
			begin
				assert(o_SUM && ~o_COUT);
			end
			2'b11:
			begin
				assert(~o_SUM && o_COUT);
			end
		endcase
	end
`endif
endmodule
