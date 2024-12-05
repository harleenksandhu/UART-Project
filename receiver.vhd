library ieee;
use ieee.std_logic_1164.all;

entity receiver is
port(BClkx8, GReset, RxD: in std_logic;
 Data: out std_logic_vector(7 downto 0);
 RDRF: out std_logic);
end receiver;

architecture rtl of receiver is 
signal int_loadRDR, int_shiftRSR, int_clkCounterIncr,
 int_endReached, int_RDRF, int_counterReset, int_clkCounterEq3, resetBar: std_logic;
signal RSR_out, RDR_out: std_logic_vector(7 downto 0);
signal int_clkCount, int_shiftCount: std_logic_vector(2 downto 0);
 
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
         s_out: out std_logic;
         d_out: out std_logic_vector(n-1 downto 0)); 
end component;

component threebitcounter
   port(inc_i, greset, clk: in std_logic;
         count : out std_logic_vector(2 downto 0));
end component;

component nbitcomparator
   generic(n : INTEGER := 4);
   port(A, B: IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
          AeqB, AgtB, AltB : OUT STD_LOGIC);
end component;

component receiver_controller
port(GReset, BClkx8, endReached, clkCounterEq3, RxD: in std_logic;
RDRF, loadRDR, shiftRSR, counterReset, clkCounterIncr: out std_logic);
end component;

begin
RDR: nbitreg
generic map(n => 8)
port map(reset_b => resetBar, din => RSR_out, load => int_loadRDR, 
 clk => BClkx8, dout => RDR_out, dout_b => open);

RSR: nbitshiftreg
generic map(n => 8)
port map(d_in => "00000000", shift_in => RxD, clk => BClkx8, load => int_shiftRSR, 
 shiftl => '0', shiftr => int_shiftRSR, reset_b => resetBar, s_out => open, d_out => RSR_out);

clkCounter: threebitcounter
port map(inc_i => int_clkCounterIncr, greset => int_counterReset, clk => BClkx8, count => int_clkCount);

shiftCounter: threebitcounter
port map(inc_i => int_shiftRSR, greset => int_counterReset, clk => BClkx8, count => int_shiftCount);

clkComparator: nbitcomparator
generic map(n => 3)
port map(A => int_clkCount, B => "011", AeqB => int_clkCounterEq3, AgtB => open, AltB => open);

shiftComparator: nbitcomparator
generic map(n => 3)
port map(A => int_shiftCount, B => "111", AeqB => int_endReached, AgtB => open, AltB => open);

controller: receiver_controller
port map(GReset => GReset, BClkx8 => BClkx8, endReached => int_endReached, RxD => RxD, 
         clkCounterEq3 => int_clkCounterEq3, RDRF => int_RDRF, loadRDR => int_loadRDR, 
     shiftRSR => int_shiftRSR, counterReset => int_counterReset, clkCounterIncr => int_clkCounterIncr);
 
resetBar <= not(GReset);

--outputs
Data <= RDR_out;
RDRF <= int_RDRF;

end rtl;