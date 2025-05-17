----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/17/2025 08:05:47 PM
-- Design Name: 
-- Module Name: Program_Counter - Behavioral
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

entity Program_Counter is
    Port ( clk : in STD_LOGIC;
           next_addr : in STD_LOGIC_VECTOR (2 downto 0);
           reset : in STD_LOGIC;
           mem_select : out STD_LOGIC_VECTOR (2 downto 0));
end Program_Counter;

architecture Behavioral of Program_Counter is

signal prog_counter : std_logic_vector (2 downto 0) := "000";

begin

mem_select <= prog_counter;

process(clk, reset)
begin
    if reset = '1' then
        prog_counter <= "000";
    elsif rising_edge(clk) then
        prog_counter <= next_addr;
    end if;
end process;

end Behavioral;
