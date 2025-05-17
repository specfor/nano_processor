----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.05.2025 11:51:07
-- Design Name: 
-- Module Name: CLA_8_BIT - Behavioral
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

entity CLA_8_BIT is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           C_IN : in STD_LOGIC;
           C_OUT : out STD_LOGIC;
           S : out STD_LOGIC_VECTOR (7 downto 0));
end CLA_8_BIT;

architecture Behavioral of CLA_8_BIT is

COMPONENT CLA_4_bit
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
       B : in STD_LOGIC_VECTOR (3 downto 0);
       C_IN : in STD_LOGIC;
       S : out STD_LOGIC_VECTOR (3 downto 0);
       C_OUT : out STD_LOGIC);
END COMPONENT;

SIGNAL CARRY : STD_LOGIC;

begin
CLA_4_bit_1 : CLA_4_bit
    PORT MAP(A => A(3 DOWNTO 0),
             B => B(3 DOWNTO 0),
             C_IN => C_IN,
             S => S(3 DOWNTO 0),
             C_OUT => CARRY);

CLA_4_bit_2 : CLA_4_bit
    PORT MAP(A => A(7 DOWNTO 4),
             B => B(7 DOWNTO 4),
             C_IN => CARRY,
             S => S(7 DOWNTO 4),
             C_OUT => C_OUT);



end Behavioral;
