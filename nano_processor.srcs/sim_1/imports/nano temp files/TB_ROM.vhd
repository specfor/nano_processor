----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/15/2025 02:14:07 PM
-- Design Name: 
-- Module Name: TB_ROM - Behavioral
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

entity TB_ROM is
--  Port ( );
end TB_ROM;

architecture Behavioral of TB_ROM is
COMPONENT ROM_16bit
    Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
           data    : out STD_LOGIC_VECTOR (15 downto 0));
end component;

signal address : STD_LOGIC_VECTOR (2 downto 0);
signal data    : STD_LOGIC_VECTOR (15 downto 0);

begin

UUT : ROM_16bit
port map (address => address,
          data    => data);

process
begin
    address <= "000";
    wait for 100 ns;
    address <= "001";
    wait for 100 ns;
    address <= "010";
    wait for 100 ns;
    address <= "011";
    wait for 100 ns;
    address <= "100";
    wait for 100 ns;
    address <= "101";
    wait for 100 ns;
    address <= "110";
    wait for 100 ns;
    address <= "111";
    wait;
end process;

end Behavioral;