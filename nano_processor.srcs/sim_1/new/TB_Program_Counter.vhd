----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/17/2025 09:21:41 PM
-- Design Name: 
-- Module Name: TB_Program_Counter - Behavioral
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

entity TB_Program_Counter is
--  Port ( );
end TB_Program_Counter;

architecture Behavioral of TB_Program_Counter is

component Program_Counter
    Port ( clk : in STD_LOGIC;
           next_addr : in STD_LOGIC_VECTOR (2 downto 0);
           reset : in STD_LOGIC;
           mem_select : out STD_LOGIC_VECTOR (2 downto 0));
end component ;

signal clk, reset : std_logic ;
signal pc, next_addr  : STD_LOGIC_VECTOR (2 downto 0);


begin
uut : Program_Counter
port map(
    clk => clk,
    next_addr => next_addr,
    reset => reset,
    mem_select => pc
);  

Clk_process : process
begin
    Clk <= '0';
    wait for 100 ns;
    Clk <= '1';
    wait for 100 ns;
end process;

process begin

reset <= '0';

next_addr <= "001";
wait for 50ns;

next_addr <= "010";
wait for 50ns;

next_addr <= "011";
wait for 50ns;

next_addr <= "100";
wait for 50ns;

reset <= '1';
wait;

end process;

end Behavioral;
