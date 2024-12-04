library ieee; 
use ieee.std_logic_1164.all;

entity top_level is
    port(MSC, SSC: in std_logic_vector(3 downto 0);
         GClock, GReset, SSCS, RxD: in std_logic; 
         BaudRateSel: in std_logic_vector(2 downto 0);
         MSTL, SSTL: out std_logic_vector(2 downto 0);
         TxD: out std_logic);
end top_level;

architecture rtl of top_level is
signal int_debugmsg: std_logic_vector(7 downto 0);
signal int_TDRE: std_logic;
signal int_CharSel: std_logic_vector(2 downto 0);
signal MS_colour, SS_colour: std_logic_vector(7 downto 0);
    component UART
       port(i_clk, GReset, RxD: in std_logic;
            DebugMsgByte: in std_logic_vector(7 downto 0);
            BaudRateSel: in std_logic_vector(2 downto 0);
            TxD, TDRE: out std_logic;
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

begin
    uart_block: UART
        port map(i_clk => GClock, GReset => GReset, RxD => RxD, DebugMsgByte => int_debugmsg, 
                BaudRateSel => BaudRateSel, TxD => TxD, TDRE => int_TDRE, CharSel => int_CharSel);
    
    mux: nbit8to1mux
        generic map(n => 8)
        --ASCII Codes: 
        --'M' = 01001101, '_' = 01011111, 'S' = 01010011, '\r' = 00001101
		  --values at i_6 and i_7 are defaults
        port map(i_0 => "01001101", i_1 => MS_colour, i_2 => "01011111",
                 i_3 => "01010011", i_4 => SS_colour, i_5 => "00001101", 
                 i_6 => "00000000", i_7 => "00000000", mux_sel => int_CharSel, o => int_debugmsg);
    
    lab3: trafficlightcontroller
		port map(GClock => GClock, GReset => GReset, SSCS => SSCS, MSC => MSC, SSC => SSC, 
                 MSTL => MSTL, SSTL => SSTL, MS_colour => MS_colour, SS_colour => SS_colour);
end rtl;