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
