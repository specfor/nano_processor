----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/17/2025 02:23:14 PM
-- Design Name: 
-- Module Name: TB_AU - Behavioral
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

entity TB_AU is
--  Port ( );
end TB_AU;

architecture Behavioral of TB_AU is

component AU
Port ( data_a : in STD_LOGIC_VECTOR (7 downto 0);
           data_b : in STD_LOGIC_VECTOR (7 downto 0);
           action : in STD_LOGIC_VECTOR (3 downto 0);
           result : out STD_LOGIC_VECTOR (7 downto 0);
           flags : out STD_LOGIC_VECTOR (2 downto 0));
end component ;

signal data_a, data_b, result : std_logic_vector (7 downto 0);
signal action :std_logic_vector (3 downto 0);
signal flags : std_logic_vector (2 downto 0);

begin
uut : AU
port map(
    data_a => data_a,
    data_b => data_b,
    action => action,
    result => result,
    flags => flags
);

process begin
    data_a <= "00000100";
    data_b <= "00000010";
    action <= "0000";
    
    wait for 100ns;
    
    action <= "0001";
    
    wait for 100ns;
    
    action <= "0010";
    wait for 100ns;
    
    data_a <= "00000101";
    data_b <= "00000101";
    action <= "0000";
    
    wait for 100ns;
    
    action <= "0001";
    
    wait for 100ns;
    
    action <= "0010";
    
    wait;
end process;

end Behavioral;
