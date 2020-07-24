library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity sign_extend is 
	generic(g_INPUT_WITDH,g_OUTPUT_WIDTH: positive);
	port (
	i_INPUT: in STD_ULOGIC_VECTOR(g_INPUT_WITDH-1 downto 0);
	o_OUTPUT: out STD_ULOGIC_VECTOR(g_OUTPUT_WIDTH-1 downto 0)
	     );
end sign_extend;
architecture Behavioral of sign_extend is
begin
	o_OUTPUT <= STD_ULOGIC_VECTOR(resize(signed(i_INPUT), o_OUTPUT'LENGTH));
end Behavioral;
