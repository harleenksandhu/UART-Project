library ieee;
use ieee.std_logic_1164.all;

entity receiver_controller is 
    port(GReset, BClkx8, endReached, clkCounterEq3, RxD: in std_logic;
            RDRF, loadRDR, loadRSR, shiftRSR, counterReset, clkCounterIncr: out std_logic);
    
end receiver_controller;

architecture rtl of receiver_controller is
signal d2, d1, d0, q2, q2Bar, q1, q1Bar, q0, q0Bar, w, reset_b, state_A, state_B, state_C, state_D, state_E: std_logic;

component enardFF_2 
    port(i_resetBar    : IN    STD_LOGIC;
         i_d        : IN    STD_LOGIC;
         i_enable    : IN    STD_LOGIC;
         i_clock        : IN    STD_LOGIC;
         o_q, o_qBar    : OUT    STD_LOGIC);
end component;

begin
     DFF_2: enardFF_2
        port map(i_resetBar => reset_b, i_d => d2, i_enable => '1', 
                 i_clock => BClkx8, o_q => q2, o_qBar => q2Bar);
    DFF_1: enardFF_2
        port map(i_resetBar => reset_b, i_d => d1, i_enable => '1', 
                 i_clock => BClkx8, o_q => q1, o_qBar => q1Bar);
    DFF_0: enardFF_2
        port map(i_resetBar => reset_b, i_d => d0, i_enable => '1', 
                 i_clock => BClkx8, o_q => q0, o_qBar => q0Bar);

  w <= ((not(RxD) AND state_A) OR (clkCounterEq3 AND (state_B or state_C)) OR (endReached AND state_D));
  d2 <= (q0Bar AND q2Bar and w) OR (q1Bar AND q2 and not(w));
  d1 <= (q1Bar AND q2 AND w) OR (q1 AND q2Bar) OR (q1 AND not(w));
  d0 <= q1 AND q2 AND w;

    reset_b <= not(GReset);
    
    --STATES
    state_A <= q0Bar AND q1Bar and q2Bar;
    state_B <= q0Bar AND q1Bar and q2;
    state_C <= q0Bar AND q1 and q2Bar;
    state_D <= q0Bar AND q1 and q2;
    state_E <= q0 AND q1Bar and q2Bar;
    
    --OUTPUTS
    loadRDR <= q0 AND q1Bar;
    RDRF <= q0 AND q1Bar;
    clkCounterIncr <= q1 OR (q1Bar AND q2);
    shiftRSR <= q1 AND q2;
    counterReset <= q2Bar AND q1Bar and q0Bar;

end rtl;