----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/16/2025 04:03:18 PM
-- Design Name: 
-- Module Name: mux_2way_3bit - Behavioral
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

entity mux_2way_3bit is
  Port (A0 : in STD_LOGIC_VECTOR (2 downto 0);
         A1 : in STD_LOGIC_VECTOR (2 downto 0);
         Sel : in std_logic;
         data_out : out STD_LOGIC_VECTOR (2 downto 0));
end mux_2way_3bit;

architecture Behavioral of mux_2way_3bit is

begin
data_out <= A0 WHEN Sel = '0' ELSE
            A1 WHEN sel = '1' else
                        (others => 'U');

end Behavioral;