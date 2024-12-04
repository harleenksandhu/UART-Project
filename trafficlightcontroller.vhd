LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity trafficlightcontroller is
  port(GClock, GReset, SSCS: in std_logic;
       MSC, SSC: in std_logic_vector(3 downto 0);
       MSTL, SSTL: out std_logic_vector(2 downto 0);
       MS_colour, SS_colour: out std_logic_vector(7 downto 0));
end trafficlightcontroller;

architecture struc of trafficlightcontroller is
  signal int_SSCS, timer_out, int_setTimer, int_setCounter, int_sel1, int_sel2, comparator_out: std_logic;
  signal timer_mux_out, int_MST, int_SST, int_MSC, int_SSC, counter_mux_out, MSC_max, SSC_max, max_mux_out: std_logic_vector(3 downto 0);
  signal dclock, resetb : std_logic;
  component timer 
      port(clk, setTimer: in std_logic;
       MST, SST: out std_logic_vector(3 downto 0));
  end component;
    
  component fourbitcounter
    PORT ( clk, reset, increment: IN STD_LOGIC;
            count: OUT STD_LOGIC_VECTOR(3 downto 0) ) ;
  end component;
    
  component fourbitcomparator 
     Port (
        A       : in  STD_LOGIC_VECTOR(3 downto 0);  -- 4-bit input A
        B       : in  STD_LOGIC_VECTOR(3 downto 0);  -- 4-bit input B
        A_gt_B  : out STD_LOGIC;                    -- Output high if A > B
        A_lt_B  : out STD_LOGIC;                    -- Output high if A < B
        A_eq_B  : out STD_LOGIC                     -- Output high if A = B
    );
  end component;
    
  component debouncer
    PORT(
		i_raw			: IN	STD_LOGIC;
		i_clock			: IN	STD_LOGIC;
		o_clean			: OUT	STD_LOGIC);
  end component;

  component clkDivider
    	PORT
	(
		clock_25Mhz				: IN	STD_LOGIC;
		clock_1MHz				: OUT	STD_LOGIC;
		clock_100KHz				: OUT	STD_LOGIC;
		clock_10KHz				: OUT	STD_LOGIC;
		clock_1KHz				: OUT	STD_LOGIC;
		clock_100Hz				: OUT	STD_LOGIC;
		clock_10Hz				: OUT	STD_LOGIC;
		clock_1Hz				: OUT	STD_LOGIC);
	end component;
    
  component nbit2to1mux
    GENERIC(n: integer:=8);
	  PORT ( i_0, i_1 : IN std_logic_vector( n-1 downto 0);
			 sel1 : IN std_logic;
			 o : OUT std_logic_vector( n-1 downto 0));
	end component;
	
	component fsmController
	   port(MSC, SSC, MST, SST: in std_logic;   -- goes high when the timer is up
       SSCS, clk, resetBar : in std_logic;
       MSTL, SSTL: out std_logic_vector(2 downto 0); -- traffic light outputs
       setCounter, setTimer, sel1, sel2: out std_logic;      -- to reset the counter and timers when a state is changed
       MS_colour, SS_colour: out std_logic_vector(7 downto 0)
     );
end component;

begin
  traffic_timer: timer
  PORT MAP(clk => GClock, setTimer => int_setTimer, MST => int_MST, SST => int_SST);
  
  msc_counter: fourbitcounter
  
PORT MAP( clk => GClock, reset => int_setCounter, increment => '1', count => int_MSC); 
  ssc_counter: fourbitcounter
  
PORT MAP( clk => GClock, reset => int_setCounter, increment => '1', count => int_SSC); 
 
 
counter_mux: nbit2to1mux
 
generic map(n => 4)
 
port  map(i_0 => int_MSC, i_1 => int_SSC, sel1 => int_sel1, o => counter_mux_out);
 
  
 max_mux: nbit2to1mux
 
generic map(n => 4)
 
port  map(i_0 => MSC, i_1 => SSC, sel1 => int_sel1, o => max_mux_out);
 
 timer_mux: nbit2to1mux
 
generic map(n => 4)
 
port  map(i_0 => int_MST, i_1 => int_SST, sel1 => int_sel2, o => timer_mux_out);
  
  
 
compare: fourbitcomparator
 
port map(A => counter_mux_out, B => max_mux_out, A_gt_B => open, A_lt_B => open, A_eq_B => comparator_out);
 
 controller: fsmController
 port map( MSC => comparator_out, SSC => comparator_out, MST => timer_out, SST => timer_out, 
  SSCS => int_SSCS, clk => GClock, resetBar => resetb, MSTL => MSTL, SSTL => SSTL, setCounter => int_setCounter, 
  setTimer => int_setTimer, sel1 => int_sel1, sel2 => int_sel2, MS_colour => MS_colour, SS_colour => SS_colour);
  
  sscs_debounce: debouncer
  port map(i_raw => SSCS, i_clock => GClock, o_clean => int_SSCS);
 
 resetb <= not GReset;
 timer_out <= (timer_mux_out(3) XOR '0')AND(timer_mux_out(2) XOR '1')
              AND (timer_mux_out(1) XOR '1') AND (timer_mux_out(0) XOR '1');
 

 
 end struc;