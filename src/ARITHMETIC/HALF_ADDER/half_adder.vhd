library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity half_adder is
	port(
		    i_A : in STD_ULOGIC;
		    i_B : in STD_ULOGIC;
		    o_S : out STD_ULOGIC;
		    o_C : out STD_ULOGIC
	    );
end half_adder;

architecture Behavioral of half_adder is
begin
	o_S <= i_A xor i_B;
	o_C <= i_A and i_B;
end Behavioral;
