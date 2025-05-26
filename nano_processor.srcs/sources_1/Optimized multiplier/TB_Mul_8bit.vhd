-- File: TB_Mul_8bit.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity TB_Mul_8bit is
end TB_Mul_8bit;

architecture Behavioral of TB_Mul_8bit is
    signal A, B     : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal P        : STD_LOGIC_VECTOR(7 downto 0);
    signal Overflow : STD_LOGIC;
    signal Zero     : STD_LOGIC;
begin
    uut: entity work.Mul_8bit_optimized
        port map (
            A => A,
            B => B,
            P => P,
            Overflow => Overflow,
            Zero => Zero
        );

    stim_proc: process
    begin
        A <= "11100000"; B <= "11110111"; wait for 100 ns; -- 230247T
        A <= "11100000"; B <= "11111010"; wait for 100 ns; -- 230346V
        A <= "11111111"; B <= "00000001"; wait for 100 ns; -- 255*1=255
        wait;
    end process;
end Behavioral;