library ieee;
use ieee.std_logic_1164.all;

entity transmitter_control is 
	port(GReset, BClk, endReached, Tx_start: in std_logic;
			TDRE, loadTDR, loadTSR, shiftTSR, selBounds: out std_logic);
	
end transmitter_control;

architecture rtl of transmitter_control is
signal d1, d0, q1, q1Bar, q0, q0Bar, w, reset_b, state_A, state_D: std_logic;

component enardFF_2 
	port(i_resetBar	: IN	STD_LOGIC;
		 i_d		: IN	STD_LOGIC;
		 i_enable	: IN	STD_LOGIC;
		 i_clock		: IN	STD_LOGIC;
		 o_q, o_qBar	: OUT	STD_LOGIC);
end component;

begin
	DFF_1: enardFF_2
		port map(i_resetBar => reset_b, i_d => d1, i_enable => '1', 
				 i_clock => BClk, o_q => q1, o_qBar => q1Bar);
	DFF_0: enardFF_2
		port map(i_resetBar => reset_b, i_d => d0, i_enable => '1', 
				 i_clock => BClk, o_q => q0, o_qBar => q0Bar);

	w <= (Tx_start AND state_A) OR (endReached AND state_D);
	d1 <= (not(w) AND q0) OR (q1Bar AND q0) OR (q1 AND q0Bar);
	d0 <= (not(w) AND q1) OR (w AND q0Bar);
	reset_b <= not(GReset);
	state_A <= q1Bar AND q0Bar;
	state_D <= q1 AND q0;
	
	--OUTPUTS
	TDRE <= q1Bar AND q0Bar;
	loadTDR <= q1Bar AND q0;
	loadTSR <= q1 AND q0Bar;
	shiftTSR <= q1 AND q0;
	selBounds <= q1Bar;

end rtl;