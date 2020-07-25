library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity FIXED_POINT_MACC is
	generic(g_INPUT_WIDTH: positive);
	port (
		     i_CLK: in STD_ULOGIC;
		     i_RESET: in STD_ULOGIC;
		     i_CLEAR_ACC_REG: in STD_ULOGIC;
		     i_OPERAND_A: in STD_ULOGIC_VECTOR(g_INPUT_WIDTH-1 downto 0);
		     i_OPERAND_B: in STD_ULOGIC_VECTOR(g_INPUT_WIDTH-1 downto 0);
		     o_RESULT: out STD_ULOGIC_VECTOR(2*g_INPUT_WIDTH-1 downto 0)
	     );
end FIXED_POINT_MACC;
architecture Behavioral of FIXED_POINT_MACC is
	signal r_MUL_RESULT: STD_ULOGIC_VECTOR(2*g_INPUT_WIDTH-1 downto 0);
	signal r_ADD_RESULT: STD_ULOGIC_VECTOR(2*g_INPUT_WIDTH-1 downto 0);
begin
	process(i_CLK)
	begin
		if rising_edge(i_CLK) then
			r_MUL_RESULT <= (others => '0');
			r_ADD_RESULT <= (others => '0');
		else
			r_MUL_RESULT <= STD_ULOGIC_VECTOR(signed(i_OPERAND_A) * signed(i_OPERAND_B));
			o_RESULT <= r_ADD_RESULT;
			if i_CLEAR_ACC_REG = '1' then
				r_ADD_RESULT <= (others => '0');
			else
				r_ADD_RESULT <= STD_ULOGIC_VECTOR(signed(r_ADD_RESULT) + signed(r_MUL_RESULT));
			end if;
		end if;
	end process;
end Behavioral;
