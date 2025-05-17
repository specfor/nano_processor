----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.05.2025 01:06:58
-- Design Name: 
-- Module Name: TB_mux_2way_8bit - Behavioral
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

entity TB_mux_2way_8bit is
--  Port ( );
end TB_mux_2way_8bit;

architecture Behavioral of TB_mux_2way_8bit is
COMPONENT mux_2way_8bit
    Port ( A0 : in STD_LOGIC_VECTOR (7 downto 0);
       A1 : in STD_LOGIC_VECTOR (7 downto 0);
       data_out : out STD_LOGIC_VECTOR (7 downto 0);
       Sel : in STD_LOGIC);
END COMPONENT;

SIGNAL A0, A1, data_out : STD_LOGIC_VECTOR (7 downto 0);
SIGNAL Sel : STD_LOGIC;

begin
UUT : mux_2way_8bit
PORT MAP(A0 => A0,
         A1 => A1,
         Sel => Sel,
         data_out => data_out);
         
PROCESS
BEGIN

A0 <= "00110101";
A1 <= "11010001";

Sel <= '0';

WAIT FOR 100NS;
Sel <= '1';

WAIT;
END PROCESS;



end Behavioral;
