LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY nbit8to1mux IS 
	GENERIC(n: integer:=8);
	PORT ( i: IN std_logic_vector(7 downto 0);
		   mux_sel: IN std_logic_vector(2 downto 0);
		   o : OUT std_logic);
END nbit8to1mux;

ARCHITECTURE behav of nbit8to1mux IS
	BEGIN
	o <= i(0) when mux_sel = "000" else
		 i(1) when mux_sel = "001" else
		 i(2) when mux_sel = "010" else
		 i(3) when mux_sel = "011" else 
		 i(4) when mux_sel = "100" else 
		 i(5) when mux_sel = "101" else 
		 i(6) when mux_sel = "110" else 
		 i(7);
END behav;