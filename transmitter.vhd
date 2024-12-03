library ieee;
use ieee.std_logic_1164.all;

entity transmitter is
	port(BClk, GReset: in std_logic;
		 Data: in std_logic_vector(7 downto 0);
		 TxD: out std_logic);
end transmitter;

architecture rtl of transmitter is 
signal int_loadTDR, int_loadTSR, int_shiftTSR: std_logic;
signal TDR_out: std_logic_vector(7 downto 0);

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
         d_out, dout_b: out std_logic_vector(n-1 downto 0));		  
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
	port(endReached: in std_logic;
			TDRE, loadTDR, loadTSR, shiftTSR, selBounds, count_reset: out std_logic);
end component;

begin
TDR: nbitreg
	generic map(n => 8)
	port map(reset_b => not(GReset), din => Data, load => int_loadTDR, 
			 clk => BClk, dout => TDR_out, dout_b => open);

-- TSR: nbitshiftreg
-- 	generic map(n => 8)
-- 	port map(d_in => TDR_out, shift_in => '1', clk => BClk, load => int_loadTSR, 
-- 			 shiftl => '0', shiftr => int_shiftTSR, reset_b => not(GReset), s)

end rtl;