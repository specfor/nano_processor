----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.05.2025 01:05:10
-- Design Name: 
-- Module Name: mux_2way_8bit - Behavioral
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

entity mux_2way_8bit is
    Port ( A0 : in STD_LOGIC_VECTOR (7 downto 0);
           A1 : in STD_LOGIC_VECTOR (7 downto 0);
           data_out : out STD_LOGIC_VECTOR (7 downto 0);
           Sel : in STD_LOGIC);
end mux_2way_8bit;

architecture Behavioral of mux_2way_8bit is

begin

process(A0, A1, Sel)
begin
    if (Sel = '0') then
        data_out <= A0;
    else
        data_out <= A1;
    end if;
end process;


end Behavioral;
