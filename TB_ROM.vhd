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
    Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
           data    : out STD_LOGIC_VECTOR (15 downto 0));
end component;

signal address : STD_LOGIC_VECTOR (3 downto 0);
signal data    : STD_LOGIC_VECTOR (15 downto 0);

begin

UUT : ROM_16bit
port map (address => address,
          data    => data);

process
begin
    address <= "0000";
    wait for 100 ns;
    address <= "0001";
    wait for 100 ns;
    address <= "0010";
    wait for 100 ns;
    address <= "0011";
    wait for 100 ns;
    address <= "0100";
    wait for 100 ns;
    address <= "0101";
    wait for 100 ns;
    address <= "0110";
    wait for 100 ns;
    address <= "0111";
    wait for 100 ns;
    address <= "1000";
    wait for 100 ns;
    address <= "1001";
    wait for 100 ns;
    address <= "1010";
    wait for 100 ns;
    address <= "1011";
    wait for 100 ns;
    address <= "1100";
    wait for 100 ns;
    address <= "1111";
    wait for 100 ns;
    wait;
end process;

end Behavioral;