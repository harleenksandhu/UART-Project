library ieee;
use ieee.std_logic_1164.all;

entity threebitcounter is   
    port(inc_i, greset, clk: in std_logic;
         count : out std_logic_vector(2 downto 0));
end threebitcounter;

architecture struc of threebitcounter is   
--intermediate signals
signal adder_out : std_logic_vector(2 downto 0);
signal int_count: std_logic_Vector(2 downto 0);
signal greset_b : std_logic;

component nbitreg
	generic(n: integer);
    port(reset_b: in std_logic;
        din : in std_logic_vector(n-1 downto 0);
        load, clk: in std_logic;
        dout, dout_b : out std_logic_vector(n-1 downto 0));
end component;

component threebitadder
   port(i_Ai, i_Bi		: IN	STD_LOGIC_VECTOR(2 downto 0);
        o_CarryOut		: OUT	STD_LOGIC;
        o_Sum			: OUT	STD_LOGIC_VECTOR(2 downto 0));
end component;
begin
    adder: threebitadder
    port map(
        i_Ai => "001",
        i_Bi => int_count,
        o_CarryOut => open,
        o_Sum => adder_out);
    
	reg: nbitreg
    generic map(n => 3)
    port map(reset_b => greset_b, 
         din => adder_out,
         load => inc_i, 
         clk => clk,
         dout => int_count);

greset_b <= not(greset);
count <= int_count;

end struc;