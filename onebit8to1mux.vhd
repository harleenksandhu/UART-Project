LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY onebit8to1mux IS 
	GENERIC(n: integer:=8);
	PORT ( i_0, i_1, i_2, i_3, i_4, i_5, i_6, i_7: IN std_logic;
		   mux_sel: IN std_logic_vector(2 downto 0);
		   o : OUT std_logic);
END onebit8to1mux;

ARCHITECTURE behav of onebit8to1mux IS
	BEGIN
	o <= i_0 when mux_sel = "000" else
		 i_1 when mux_sel = "001" else
		 i_2 when mux_sel = "010" else
		 i_3 when mux_sel = "011" else 
		 i_4 when mux_sel = "100" else 
		 i_5 when mux_sel = "101" else 
		 i_6 when mux_sel = "110" else 
		 i_7;
END behav;