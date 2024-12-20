library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity DividebyN is
    generic(n : integer := 2);
    port(i_clk : in std_logic; --assumed to be 25MHz
         o_clk: out std_logic);
end DividebyN;

architecture behav of DividebyN is
signal int_count : integer range 0 to n-1 := 0; --int_count is initialized to 0
signal int_clk: std_logic := '0';
begin
    process(i_clk)
    begin
        if i_clk'EVENT and i_clk = '1' then 
            if int_count = n-1 then
                int_count <= 0;
                int_clk <= not(int_clk); --toggle the output
            else 
                int_count <= int_count + 1;
            end if;
        end if;
    end process;
	 
	 --output
	 o_clk <= int_clk;
end behav;