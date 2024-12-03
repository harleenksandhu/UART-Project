library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity baudrategenerator is 
	PORT(sel : in std_logic_vector(2 downto 0);
		 clk : in std_logic;
		 bclkx8, bclk: out std_logic);
end baudrategenerator;


architecture rtl of baudrategenerator is 
signal int_divby41, mux_out: std_logic;
signal int_divby256: std_logic_vector(7 downto 0);

component DividebyN
	generic(n : integer := 2);
	port(i_clk : in std_logic; o_clk: out std_logic);
end component;

component nbit8to1mux
	generic(n : integer := 8);
	port(i: in std_logic_vector(n-1 downto 0);
		 mux_sel: in std_logic_vector(2 downto 0); 
		 o : out std_logic);
end component;

begin 
	--DIVIDE BY 41--
	divby41: DividebyN
		generic map(n => 41)
		port map(i_clk => clk, o_clk => int_divby41);

	--DIVIDE BY 256--
	--divides the divby41 clock by 2, 4, 8, ... or 256
	divby256_0: DividebyN
			generic map(n => 2) 
			port map(i_clk => int_divby41, o_clk => int_divby256(0));
	ripple_divby2: for k in 1 to 7 generate
		divby256_k: DividebyN
			generic map(n => 2) 
			port map(i_clk => int_divby256(k-1), o_clk => int_divby256(k)); 
	end generate;

	mux: nbit8to1mux
		generic map(n => 8)
		port map(i => int_divby256, mux_sel => sel, o => mux_out);

	--DIVIDE BY 8--
	divby8: DividebyN
		generic map(n => 8)
		port map(i_clk => mux_out, o_clk => bclk);

bclkx8 <= mux_out;

end rtl;