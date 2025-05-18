----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/10/2025 06:52:42 PM
-- Design Name: 
-- Module Name: Slow_Clk - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Slow_Clk is
    Port ( Clk_in  : in  STD_LOGIC;
           Clk_out : out STD_LOGIC);
end Slow_Clk;

architecture Behavioral of Slow_Clk is

    signal div : unsigned(26 downto 0) := (others => '0'); -- Use unsigned and initialize
--    signal div : unsigned(2 downto 0) := (others => '0'); -- Use unsigned and initialize

begin

    process(Clk_in)
    begin
        if rising_edge(Clk_in) then
            div <= div + 1;
        end if;
    end process;

    Clk_out <= div(26);  -- Output the MSB for divided clock
--    Clk_out <= div(2);  -- Output the MSB for divided clock

end Behavioral;