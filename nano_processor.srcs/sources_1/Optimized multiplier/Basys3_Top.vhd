-- File: Basys3_Top.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Basys3_Top is
    Port (
        sw  : in  STD_LOGIC_VECTOR(15 downto 0);  -- A (sw7:0), B (sw15:8)
        led : out STD_LOGIC_VECTOR(9 downto 0)    -- P (led7:0), Overflow (led8), Zero (led9)
    );
end Basys3_Top;

architecture Structural of Basys3_Top is
    component Mul_8bit_optimized
        Port (
            A, B     : in  STD_LOGIC_VECTOR(7 downto 0);
            P        : out STD_LOGIC_VECTOR(7 downto 0);
            Overflow : out STD_LOGIC;
            Zero     : out STD_LOGIC
        );
    end component;
begin
    -- Instantiate multiplier
    Multiplier: Mul_8bit_optimized
        port map (
            A => sw(7 downto 0),
            B => sw(15 downto 8),
            P => led(7 downto 0),
            Overflow => led(8),
            Zero => led(9)
        );
end Structural;