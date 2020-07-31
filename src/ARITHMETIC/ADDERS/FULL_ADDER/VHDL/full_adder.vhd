--Author: Elliott Villars
--
--Name: Full Adder
--
--Date: 31/7/2020
--
--Format: VHDL
--
--Description: A full adder logic primative.
--Not really useful by itself. Intended as a basic building block for more
--complicated adder designs. Not registered.
--
--Estimated Logic Usage:  The following resource usage is determined by
--Yosys when running the "synth_ice40" command on the design. All estimations
--are liberal with resource usage.
--
--TBD
--
--Ports: 
--i_INPUT_A: A 1-bit wide input for the "A" operand.
--
--i_INPUT_B: A 1-bit wide input for the "B" operand.
--
--i_CIN: A 1-bit wide input for a carry in value from an adjacent FA slice.
--
--o_SUM: A 1-bit wide output for the result of "A xor B xor CIN"
--
--o_COUT: A 1-bit wide output for the possible carry generation from the above
--operation
--

--TODO: Formally verify this module.
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity full_adder is 
	port (
	i_A : in STD_ULOGIC;
	i_B : in STD_ULOGIC;
	i_Cin : in STD_ULOGIC;
	o_S : out STD_ULOGIC;
	o_Cout : out STD_ULOGIC
	     );
end full_adder;

architecture Behavioral of full_adder is 
begin
	o_S <= i_A xor i_B xor i_Cin;
	o_Cout <= (i_A and i_B) or ((i_A xor i_B) and i_Cin);
end Behavioral;
