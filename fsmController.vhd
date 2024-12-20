library ieee;
use ieee.std_logic_1164.all;

entity fsmController is
  port(MSC, SSC, MST, SST: in std_logic;   -- goes high when the timer is up
       SSCS, clk, resetBar: in std_logic;
       MSTL, SSTL: out std_logic_vector(2 downto 0); -- traffic light outputs
       setCounter, setTimer, sel1, sel2: out std_logic;      -- to reset the counter and timers when a state is changed
       MS_colour, SS_colour: out std_logic_vector(7 downto 0)
       );
end fsmController;

architecture rtl of fsmController is
  --signal curr_state, next_state: std_logic_vector(1 downto 0);
  signal w, w_prime, i_y1, i_y0, o_y1_prime, o_y0_prime, o_y1, o_y0: std_logic;
  signal green, yellow, red: std_logic_vector(7 downto 0);
  signal A, B, C, D: std_logic;

  component enARdFF_2 is
    port(i_resetBar, i_d, i_enable, i_clock: in std_logic;
         o_q, o_qBar: out std_logic
         );
  end component;
  
  component nbitaddersubtractor
	 generic(n: integer);
	 port(x : in STD_LOGIC_VECTOR(n-1 downto 0); 
        y : in STD_LOGIC_VECTOR(n-1 downto 0); 
        cin : in STD_LOGIC;		
        sum : out STD_LOGIC_VECTOR(n-1 downto 0);  
        cout : out STD_LOGIC);		
  end component;
  
  begin
    dFFy1: enARdFF_2
      port map(i_d => i_y1,
               i_enable => '1',
               i_clock => clk,
               o_q => o_y1,
               o_qBar => o_y1_prime,
               i_resetBar => resetBar);
               
               
      dFFy0: enARdFF_2
      port map(i_d => i_y0,
               i_enable => '1',
               i_clock => clk,
               o_q => o_y0,
               o_qBar => o_y0_prime,
               i_resetBar => resetBar);
               
       reset_timer: enardFF_2
          PORT MAP(
              i_resetBar => resetBar,
              i_d => w,
              i_enable => '1',
              i_clock => clk,
              o_q => setTimer,
              o_qBar => open);
              
        reset_counter: enardFF_2
          PORT MAP(
              i_resetBar => resetBar,
              i_d => w,
              i_enable => '1',
              i_clock => clk,
              o_q => setCounter,
              o_qBar => open);

A <= o_y1_prime AND o_y0_prime;
B <= o_y1_prime AND o_y0;
C <= o_y1 AND o_y0_prime;
D <= o_y1 AND o_y0;

w <= ((SSCS and MSC and A) or   -- state = 00
     (MST and B) or     -- state = 01
     (SSC and C) or      -- state = 10
     (SST and D));   -- state = 11
     
w_prime <= not(w); 

--Traffic light colour ASCII codes
green <= "01100111"; --ASCII code for 'g'
yellow <= "01111001"; --ASCII code for 'y'
red <= "01110010"; --ASCII code for 'r'

-- Next state logic         
i_y1 <= (o_y1 and o_y0_prime) or (o_y1 and w_prime) or (o_y1_prime and o_y0 and w);
i_y0 <= (o_y0 and w_prime) or (o_y0_prime and w);

-- Traffic light outputs
MSTL(2) <= o_y1_prime and o_y0_prime;
MSTL(1) <= o_y1_prime and o_y0;
MSTL(0) <= o_y1;

SSTL(2) <= o_y1 and o_y0_prime;
SSTL(1) <= o_y1 and o_y0;
SSTL(0) <= o_y1_prime;

sel2 <= '1' when D='1';
sel1 <= '1' when B='1';

MS_colour <= green when A = '1' else
             yellow when B = '1' else
             red when (C = '1' OR D = '1');

SS_colour <= green when C = '1' else
             yellow when D = '1' else
             red when (A = '1' OR B = '1'); 

end rtl;      
