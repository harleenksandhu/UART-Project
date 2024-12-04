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

component onebit8to1mux
	port(i_0, i_1, i_2, i_3, i_4, i_5, i_6, i_7: in std_logic;
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

	mux: onebit8to1mux
		port map(i_0 => int_divby256(0), i_1 => int_divby256(1), i_2 => int_divby256(2),
					i_3 => int_divby256(3), i_4 => int_divby256(4), i_5 => int_divby256(5), 
					i_6 => int_divby256(6), i_7 => int_divby256(7), 
					mux_sel => sel, o => mux_out);

	--DIVIDE BY 8--
	divby8: DividebyN
		generic map(n => 8)
		port map(i_clk => mux_out, o_clk => bclk);

bclkx8 <= mux_out;

end rtl;