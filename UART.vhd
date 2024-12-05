library ieee;
use ieee.std_logic_1164.all;

entity UART is
	port(i_clk, GReset, RxD, loopback_switch: in std_logic;
		  DebugMsgByte: in std_logic_vector(7 downto 0);
		  BaudRateSel: in std_logic_vector(2 downto 0);
		  TxD: out std_logic;
		  CharSel: out std_logic_vector(2 downto 0));
end UART;

architecture rtl of UART is
	signal int_BClk, int_BClkx8, GResetBar, int_TDRE, int_Tx_start, int_TxD, counter_reset, increment: std_logic;
	signal int_CharSel: std_logic_vector(2 downto 0);
	signal int_Rx_out, transmit_mux_out: std_logic_vector(7 downto 0);
	
	component transmitter
		port(BClk, GReset, Tx_start: in std_logic;
			 Data: in std_logic_vector(7 downto 0);
			 TxD, TDRE: out std_logic);
	end component;

	component baudrategenerator
		port(sel : in std_logic_vector(2 downto 0);
			 clk : in std_logic;
			 bclkx8, bclk: out std_logic);
	end component;

	component enardFF_resetToOne
		port(
			i_resetBar	: IN	STD_LOGIC;
			i_d		: IN	STD_LOGIC;
			i_enable	: IN	STD_LOGIC;
			i_clock		: IN	STD_LOGIC;
			o_q, o_qBar	: OUT	STD_LOGIC);
	end component;

	component threebitcounter
	port(inc_i, greset, clk: in std_logic;
		count : out std_logic_vector(2 downto 0));
	end component;

	component edge_detect 
		port(clk, reset, signal_in: in std_logic; --signal_in is the signal to detect edges on
			edge_detected: out std_logic);
	end component;

	component nbit2to1mux
	GENERIC(n: integer:=8);
	PORT ( i_0, i_1 : IN std_logic_vector( n-1 downto 0);
			 sel1 : IN std_logic;
			 o : OUT std_logic_vector( n-1 downto 0));
	end component;

	component receiver
		port(BClkx8, GReset, RxD: in std_logic;
			Data: out std_logic_vector(7 downto 0);
			RDRF: out std_logic);
	end component;

begin

	baudrate: baudrategenerator
		port map(sel => BaudRateSel, clk => i_clk, bclkx8 => int_BClkx8, 
					bclk => int_BClk);

	detect_inc: edge_detect
		port map(clk => int_BClk, reset => GReset, signal_in => int_TDRE, edge_detected => increment);
	
					
	--if TDRE = 1,, write to TDR (tx_start = 1). has to be delayed by two clock cycles bc increment is delayed by one. 
	enable_tx: enardFF_resetToOne
		port map(i_resetBar => GResetBar, i_d => increment, i_enable => '1', 
					i_clock => int_BClk, o_q => int_Tx_start, o_qBar => open);

	R: receiver
		port map(BClkx8 => int_BClkx8, GReset => GReset, RxD => RxD, 
				 Data => int_Rx_out, RDRF => open); 
	
	transmit_data_mux: nbit2to1mux
		generic map(n => 8)
		port map(i_0 => DebugMsgByte, i_1 => int_Rx_out, sel1 => loopback_switch, o => transmit_mux_out);
	
	T: transmitter
		port map(BClk => int_BClk, GReset => GReset, Tx_start => int_Tx_start, 
					Data => transmit_mux_out, TxD => int_TxD, TDRE => int_TDRE);
	
	
	--counter to determine select line for the 8 to 1 mux in top_level
	counter: threebitcounter
    	port map(inc_i => increment, greset => counter_reset, clk => int_BClk, count => int_CharSel);
	
	counter_reset <= '1' when (int_CharSel = "110" OR GReset = '1') else '0';

	GResetBar <= not(GReset);

	--Outputs
	TxD <= int_TxD;
	CharSel <= int_CharSel;

end rtl;