library ieee;
use ieee.std_logic_1164.all;

entity edge_detect is
	port(clk, reset, signal_in: in std_logic; --signal_in is the signal to detect edges on
		  edge_detected: out std_logic); -- output is high for once cycle on rising edge
end edge_detect;

architecture behav of edge_detect is
signal signal_prev: std_logic := '0'; 
begin
	process(clk)
	begin
		if (clk'EVENT AND clk = '1') then
			if reset = '1' then
				signal_prev <= '1'; --THIS IS SPECIFIC TO ITS IMPLEMENTATION FOR UART PROJECT
				edge_detected <= '0';
			else 
				if (signal_prev = '0' AND signal_in = '1') then
					edge_detected <= '1';
				else 
					edge_detected <= '0';
				end if;
				signal_prev <= signal_in; --update value of prev signal
			end if;
		end if;
	end process;
end behav;