library ieee;
use ieee.std_logic_1164.all;

entity timer is
  port(clk, setTimer: in std_logic;
       MST, SST: out std_logic_vector(3 downto 0));
end timer;

architecture struc of timer is

component fourbitcounter
    port(clk: in std_logic;
        reset: in std_logic;
        increment: in std_logic;
        count: out std_logic_vector(3 downto 0));
  end component;
  
  begin    
    counterMST: fourbitcounter
        port map(clk => clk,
                reset => setTimer,
                increment => '1',
                count => MST
              );
              
     counterSST: fourbitcounter
        port map(clk => clk,
                reset => setTimer,
                increment => '1',
                count => SST
              );
end struc;


