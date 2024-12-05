library ieee; 
use ieee.std_logic_1164.all;

entity top_level is
    port(MSC, SSC: in std_logic_vector(3 downto 0);
         GClock, GReset, SSCS, RxD, loopback_switch: in std_logic; 
         BaudRateSel: in std_logic_vector(2 downto 0);
         MSTL, SSTL: out std_logic_vector(2 downto 0);
         TxD: out std_logic);
end top_level;

architecture rtl of top_level is
signal int_debugmsg: std_logic_vector(7 downto 0);
signal int_TDRE, clk_1Hz: std_logic;
signal int_CharSel: std_logic_vector(2 downto 0);
signal MS_colour, SS_colour: std_logic_vector(7 downto 0);
    component UART
       port(i_clk, GReset, RxD, loopback_switch: in std_logic;
            DebugMsgByte: in std_logic_vector(7 downto 0);
            BaudRateSel: in std_logic_vector(2 downto 0);
            TxD: out std_logic;
			CharSel: out std_logic_vector(2 downto 0));
    end component;

    component nbit8to1mux
       generic(n: integer:=8);
       port( i_0, i_1, i_2, i_3, i_4, i_5, i_6, i_7: IN std_logic_vector(n-1 downto 0);
            mux_sel: IN std_logic_vector(2 downto 0);
            o : OUT std_logic_vector(n-1 downto 0));
    end component;
	 
	 component trafficlightcontroller
		 port(GClock, GReset, SSCS: in std_logic;
			 MSC, SSC: in std_logic_vector(3 downto 0);
			 MSTL, SSTL: out std_logic_vector(2 downto 0);
			 MS_colour, SS_colour: out std_logic_vector(7 downto 0));
	 end component;

    component clk_div
        PORT
        (
            clock_25Mhz				: IN	STD_LOGIC;
            clock_1MHz				: OUT	STD_LOGIC;
            clock_100KHz				: OUT	STD_LOGIC;
            clock_10KHz				: OUT	STD_LOGIC;
            clock_1KHz				: OUT	STD_LOGIC;
            clock_100Hz				: OUT	STD_LOGIC;
            clock_10Hz				: OUT	STD_LOGIC;
            clock_1Hz				: OUT	STD_LOGIC);
	end component;

begin
    uart_block: UART
        port map(i_clk => GClock, GReset => GReset, RxD => RxD, loopback_switch => loopback_switch,
         DebugMsgByte => int_debugmsg, BaudRateSel => BaudRateSel, TxD => TxD, CharSel => int_CharSel);
    
    mux: nbit8to1mux
        generic map(n => 8)
        --ASCII Codes: 
        --'M' = 01001101, '_' = 01011111, 'S' = 01010011, '\r' = 00001101
		  --values at i_6 and i_7 are defaults
        port map(i_0 => "01001101", i_1 => MS_colour, i_2 => "01011111",
                 i_3 => "01010011", i_4 => SS_colour, i_5 => "00001101", 
                 i_6 => "00000000", i_7 => "00000000", mux_sel => int_CharSel, o => int_debugmsg);
    clockDiv: clk_div
        port map(clock_25Mhz => GClock, clock_1MHz => open, clock_100KHz => open, clock_10KHz => open,
        clock_1KHz => open, clock_100Hz => open, clock_10Hz => open, clock_1Hz => clk_1Hz);
    lab3: trafficlightcontroller
		port map(GClock => clk_1Hz, GReset => GReset, SSCS => SSCS, MSC => "0100", SSC => "0100", 
                 MSTL => MSTL, SSTL => SSTL, MS_colour => MS_colour, SS_colour => SS_colour);
end rtl;