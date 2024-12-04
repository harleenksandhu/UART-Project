LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY fourbitcounter IS
    PORT ( clk, reset, increment: IN STD_LOGIC;
            count: OUT STD_LOGIC_VECTOR(3 downto 0) ) ;
END fourbitcounter ;

ARCHITECTURE rtl OF fourbitcounter is
SIGNAL adder_out, int_reg_out: STD_LOGIC_VECTOR(3 downto 0);
SIGNAL int_y: STD_LOGIC_VECTOR(3 downto 0);
SIGNAL int_clear: STD_LOGIC;

COMPONENT nbitaddersubtractor
    generic(n: integer:= 8);
       port(x : in STD_LOGIC_VECTOR(n-1 downto 0); -- First operand
        y : in STD_LOGIC_VECTOR(n-1 downto 0); -- Second operand
        cin : in STD_LOGIC;            -- Control signal for operation type
        sum : out STD_LOGIC_VECTOR(n-1 downto 0);  -- Result
        cout : out STD_LOGIC        -- Carry out
    );
end component;


COMPONENT nbitreg
    GENERIC( n: integer:= 4);
    PORT(reset_b: in std_logic;
          din : in std_logic_vector(n-1 downto 0);
          load, clk: in std_logic;
          dout, dout_b : out std_logic_vector(n-1 downto 0));
    end component;

BEGIN 
    adder: nbitaddersubtractor
        GENERIC MAP (n => 4)
        PORT MAP (x => int_reg_out, y => int_y, cin => '0', sum => adder_out, cout => open);

    reg: nbitreg
        GENERIC MAP (n => 4)
        PORT MAP (reset_b => int_clear, din => adder_out, load => increment, clk => clk, dout => int_reg_out, dout_b => open);


     int_y <= (3 downto 1 => '0') & '1';
     int_clear <= not reset;

    -- Output Driver
    count <= int_reg_out;

END rtl;