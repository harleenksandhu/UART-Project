library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity fourbitcomparator is
    Port (
        A       : in  STD_LOGIC_VECTOR(3 downto 0);  -- 4-bit input A
        B       : in  STD_LOGIC_VECTOR(3 downto 0);  -- 4-bit input B
        A_gt_B  : out STD_LOGIC;                    -- Output high if A > B
        A_lt_B  : out STD_LOGIC;                    -- Output high if A < B
        A_eq_B  : out STD_LOGIC                     -- Output high if A = B
    );
end fourbitcomparator;

architecture RTL of fourbitcomparator is
    signal gt_bit : STD_LOGIC_VECTOR(3 downto 0); -- Signals for each bit comparison of A > B
    signal lt_bit : STD_LOGIC_VECTOR(3 downto 0); -- Signals for each bit comparison of A < B
begin
    gt_bit(3) <= '1' when (A(3) = '1' and B(3) = '0') else '0';
    gt_bit(2) <= '1' when (A(3) = B(3) and A(2) = '1' and B(2) = '0') else '0';
    gt_bit(1) <= '1' when (A(3 downto 2) = B(3 downto 2) and A(1) = '1' and B(1) = '0') else '0';
    gt_bit(0) <= '1' when (A(3 downto 1) = B(3 downto 1) and A(0) = '1' and B(0) = '0') else '0';

    lt_bit(3) <= '1' when (A(3) = '0' and B(3) = '1') else '0';
    lt_bit(2) <= '1' when (A(3) = B(3) and A(2) = '0' and B(2) = '1') else '0';
    lt_bit(1) <= '1' when (A(3 downto 2) = B(3 downto 2) and A(1) = '0' and B(1) = '1') else '0';
    lt_bit(0) <= '1' when (A(3 downto 1) = B(3 downto 1) and A(0) = '0' and B(0) = '1') else '0';

    A_gt_B <= '1' when (gt_bit /= "0000") else '0';
    A_lt_B <= '1' when (lt_bit /= "0000") else '0';
    A_eq_B <= '1' when (gt_bit = "0000" and lt_bit = "0000") else '0';

end RTL;

