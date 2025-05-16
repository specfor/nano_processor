----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/16/2025 12:06:18 PM
-- Design Name: 
-- Module Name: TB_Register_Bank - Behavioral
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

entity TB_Register_Bank is
--  Port ( );
end TB_Register_Bank;

architecture Behavioral of TB_Register_Bank is


component Register_Bank is
Port ( clk : in STD_LOGIC;
       reg_sel : in STD_LOGIC_VECTOR (2 downto 0);
       data_in : in STD_LOGIC_VECTOR (7 downto 0);
       reset : in std_logic;
       data_out : out STD_LOGIC_VECTOR (63 downto 0)
       );
end component ;

signal clk : std_logic;

begin


end Behavioral;
