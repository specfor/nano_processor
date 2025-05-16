----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.05.2025 02:46:53
-- Design Name: 
-- Module Name: 8_way_8_bit_MUX - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux_8way_8bit is
    Port ( A0 : in STD_LOGIC_VECTOR (7 downto 0);
           A1 : in STD_LOGIC_VECTOR (7 downto 0);
           A2 : in STD_LOGIC_VECTOR (7 downto 0);
           A3 : in STD_LOGIC_VECTOR (7 downto 0);
           A4 : in STD_LOGIC_VECTOR (7 downto 0);
           A5 : in STD_LOGIC_VECTOR (7 downto 0);
           A6 : in STD_LOGIC_VECTOR (7 downto 0);
           A7 : in STD_LOGIC_VECTOR (7 downto 0);
           Sel : in STD_LOGIC_VECTOR (2 downto 0);
           mux_8_way_8_bit_out : out STD_LOGIC_VECTOR (7 downto 0));
end mux_8way_8bit;

architecture Behavioral of mux_8way_8bit is

begin
mux_8_way_8_bit_out <= A0 WHEN Sel = "000" ELSE
                        A1 WHEN Sel = "001" ELSE
                        A2 WHEN Sel = "010" ELSE
                        A3 WHEN Sel = "011" ELSE
                        A4 WHEN Sel = "100" ELSE
                        A5 WHEN Sel = "101" ELSE
                        A6 WHEN Sel = "110" ELSE
                        A7 WHEN Sel = "111" ELSE
                        (others => 'U');
end Behavioral;
