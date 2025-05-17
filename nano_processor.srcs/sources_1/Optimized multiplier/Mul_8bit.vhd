-- File: Mul_8bit_optimized.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Mul_8bit_optimized is
    Port (
        A, B     : in  STD_LOGIC_VECTOR(7 downto 0);
        P        : out STD_LOGIC_VECTOR(7 downto 0);
        Overflow : out STD_LOGIC;
        Zero     : out STD_LOGIC
    );
end Mul_8bit_optimized;

architecture Behavioral of Mul_8bit_optimized is
    signal product : STD_LOGIC_VECTOR(15 downto 0);
begin
    -- Core multiplication (uses DSP48E1 on Basys 3)
    product <= std_logic_vector(unsigned(A) * unsigned(B));
    
    -- Outputs
    P <= product(7 downto 0);
    Overflow <= '1' when product(15 downto 8) /= "00000000" else '0';
    Zero <= '1' when product(7 downto 0) = "00000000" else '0';
end Behavioral;