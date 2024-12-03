library ieee;
use ieee.std_logic_1164.all;

entity transmitter_control is 
	port(endReached: in std_logic;
			TDRE, loadTDR, loadTSR, shiftTSR, selBounds, count_reset: out std_logic);
	
end transmitter_control;

architecture rtl of transmitter_control is

begin

end rtl;