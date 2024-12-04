library ieee;
use ieee.std_logic_1164.all;

entity transmitter is
	port(BClk, GReset, Tx_start: in std_logic;
		 Data: in std_logic_vector(7 downto 0);
		 TxD, TDRE: out std_logic);
end transmitter;

architecture rtl of transmitter is 
signal int_loadTDR, int_loadTSR, int_shiftTSR, int_selBounds,
		 int_endReached, int_TDRE, resetBar: std_logic;
signal vector_bit0, vector_bit1, boundmux_out, TSR_out, vector_TxD: std_logic_vector(0 downto 0);
signal TDR_out: std_logic_vector(7 downto 0);
signal int_count: std_logic_vector(2 downto 0);

component nbitreg 
	generic( n: integer:= 4);
	port(reset_b: in std_logic;
		  din : in std_logic_vector(n-1 downto 0);
		  load, clk: in std_logic;
		  dout, dout_b : out std_logic_vector(n-1 downto 0));
end component;

component nbitshiftreg
	generic(n: integer:= 8);
   port(d_in : in std_logic_vector(n-1 downto 0); --parallel in
         shift_in: in std_logic; --serial in
         clk, load, shiftl, shiftr, reset_b: in std_logic;
         s_out: out std_logic);		  
end component;

component threebitcounter
   port(inc_i, greset, clk: in std_logic;
         count : out std_logic_vector(2 downto 0));
end component;

component nbitcomparator
   generic(n : INTEGER := 4);
   port(A, B	: IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
          AeqB, AgtB, AltB : OUT STD_LOGIC);
end component;

component nbit2to1mux
	generic(n: integer:=8);
	port ( i_0, i_1 : IN std_logic_vector( n-1 downto 0);
			 sel1 : IN std_logic;
			 o : OUT std_logic_vector( n-1 downto 0));
end component;

component transmitter_control
	port(GReset, BClk, endReached, Tx_start: in std_logic;
			TDRE, loadTDR, loadTSR, shiftTSR, selBounds: out std_logic);
end component;

begin
TDR: nbitreg
	generic map(n => 8)
	port map(reset_b => resetBar, din => Data, load => int_loadTDR, 
			 clk => BClk, dout => TDR_out, dout_b => open);

TSR: nbitshiftreg
	generic map(n => 8)
		port map(d_in => TDR_out, shift_in => '0', clk => BClk, load => int_loadTSR, 
				 shiftl => '0', shiftr => int_shiftTSR, reset_b => resetBar, s_out => TSR_out(0));

boundmux: nbit2to1mux
	generic map(n => 1)
	port map(i_0 => vector_bit0, i_1 => vector_bit1, sel1 => int_selBounds, o => boundmux_out);

output_mux: nbit2to1mux
	generic map(n => 1)
	port map(i_0 => boundmux_out, i_1 => TSR_out, sel1 => int_shiftTSR, o => vector_TxD);

counter: threebitcounter
	port map(inc_i => int_shiftTSR, greset => int_TDRE, clk => BClk, count => int_count);

comparator: nbitcomparator
	generic map(n => 3)
	port map(A => int_count, B => "111", AeqB => int_endReached, AgtB => open, AltB => open);

controller: transmitter_control
	port map(GReset => GReset, BClk => BClk, endReached => int_endReached, Tx_start => Tx_start, TDRE => int_TDRE, loadTDR => int_loadTDR, 
			 loadTSR => int_loadTSR, shiftTSR => int_shiftTSR, selBounds => int_selBounds);
			 
vector_bit0(0) <= '0';
vector_bit1(0) <= '1';
resetBar <= not(GReset);

--outputs
TxD <= vector_TxD(0);
TDRE <= int_TDRE;


end rtl;