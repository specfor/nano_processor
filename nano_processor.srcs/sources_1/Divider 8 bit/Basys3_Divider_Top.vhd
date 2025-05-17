-- File: Basys3_Divider_Top.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Basys3_Divider_Top is
    Port (
        sw  : in  STD_LOGIC_VECTOR(15 downto 0);  -- A (sw7:0), B (sw15:8)
        led : out STD_LOGIC_VECTOR(17 downto 0)    -- Q (led7:0), R (led15:8), Error (led16), Zero (led17)
    );
end Basys3_Divider_Top;

architecture Structural of Basys3_Divider_Top is
    component Div_8bit_optimized
        Port (
            A, B  : in  STD_LOGIC_VECTOR(7 downto 0);
            Q, R  : out STD_LOGIC_VECTOR(7 downto 0);
            Error : out STD_LOGIC;
            Zero  : out STD_LOGIC
        );
    end component;
begin
    Divider: Div_8bit_optimized
        port map (
            A => sw(7 downto 0),
            B => sw(15 downto 8),
            Q => led(7 downto 0),
            R => led(15 downto 8),
            Error => led(16),
            Zero => led(17)
        );
end Structural;