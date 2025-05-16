----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.05.2025 09:31:57
-- Design Name: 
-- Module Name: TB_mux_8way_8bit - Behavioral
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

entity TB_mux_8way_8bit is
--  Port ( );
end TB_mux_8way_8bit;

architecture Behavioral of TB_mux_8way_8bit is
COMPONENT mux_8way_8bit
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
END COMPONENT;

SIGNAL A0, A1, A2, A3, A4, A5, A6, A7, mux_8_way_8_bit_out : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL Sel : STD_LOGIC_VECTOR (2 downto 0);

begin
UUT: mux_8way_8bit
port map(A0 => A0,
         A1 => A1,
         A2 => A2,
         A3 => A3,
         A4 => A4,
         A5 => A5,
         A6 => A6,
         A7 => A7,
         Sel => Sel,
         mux_8_way_8_bit_out => mux_8_way_8_bit_out);


PROCESS
BEGIN

A0 <= "10010011";
A1 <= "10000110";
A2 <= "10011000";
A3 <= "10000101";
A4 <= "10010010";
A5 <= "11100110";
A6 <= "11001100";
A7 <= "10001110";

Sel <= "000";

WAIT FOR 100NS;
SeL <= "001";

WAIT FOR 100NS;
SeL <= "010";

WAIT FOR 100NS;
SeL <= "011";

WAIT FOR 100NS;
SeL <= "100";

WAIT FOR 100NS;
SeL <= "101";

WAIT FOR 100NS;
SeL <= "110";

WAIT FOR 100NS;
SeL <= "111";
WAIT;

END PROCESS;
end Behavioral;
