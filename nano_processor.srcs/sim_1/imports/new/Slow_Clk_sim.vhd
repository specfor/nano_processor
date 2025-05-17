----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/10/2025 06:54:20 PM
-- Design Name: 
-- Module Name: Slow_Clk_sim - Behavioral
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

entity Slow_Clk_sim is
--  Port ( );
end Slow_Clk_sim;

architecture Behavioral of Slow_Clk_sim is

COMPONENT Slow_Clk
Port ( 
    Clk_in : in STD_LOGIC;
    Clk_out : out STD_LOGIC);
END COMPONENT;

SIGNAL clk_out : std_logic;
SIGNAL clk_in : std_logic := '0';

begin
UUT : Slow_Clk PORT MAP(
    Clk_in => clk_in,
    Clk_out => clk_out
);
 
process begin
    for i in 0 to 100000000 loop
        clk_in <= not clk_in;
        wait for 10ns;
    end loop;
    wait;
end process;

end Behavioral;