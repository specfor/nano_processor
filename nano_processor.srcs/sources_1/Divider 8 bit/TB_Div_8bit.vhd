-- File: TB_Div_8bit.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TB_Div_8bit is
end TB_Div_8bit;

architecture Behavioral of TB_Div_8bit is
    signal A, B : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal Q, R : STD_LOGIC_VECTOR(7 downto 0);
    signal Error, Zero : STD_LOGIC;
begin
    UUT: entity work.Div_8bit_optimized
        port map (
            A => A, B => B,
            Q => Q, R => R,
            Error => Error,
            Zero => Zero
        );

    stim_proc: process
    begin
        -- Test Case 1: 10 / 2 = 5 R0
        A <= "00001010"; B <= "00000010"; wait for 100 ns;
        
        -- Test Case 2: 255 / 16 = 15 R15
        A <= "11111111"; B <= "00010000"; wait for 100 ns;
        
        -- Test Case 3: 1 / 255 = 0 R1 (Zero flag)
        A <= "00000001"; B <= "11111111"; wait for 100 ns;
        
        -- Test Case 4: 200 / 50 = 4 R0
        A <= "11001000"; B <= "00110010"; wait for 100 ns;
        
        -- Test Case 5: Division by zero (Error flag)
        A <= "00001111"; B <= "00000000"; wait for 100 ns;
        
        -- Test Case 6: 127 / 3 = 42 R1
        A <= "01111111"; B <= "00000011"; wait for 100 ns;
        
        wait;
    end process;
end Behavioral;