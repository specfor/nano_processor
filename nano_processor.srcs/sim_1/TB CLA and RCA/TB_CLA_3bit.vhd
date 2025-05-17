----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.05.2025 11:28:14
-- Design Name: 
-- Module Name: TB_CLA_4 - Behavioral
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

entity TB_CLA_3bit is
--  Port ( );
end TB_CLA_3bit;

architecture Behavioral of TB_CLA_3bit is
COMPONENT CLA_3bit
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
       B : in STD_LOGIC_VECTOR (2 downto 0);
       C_IN : in STD_LOGIC;
       S : out STD_LOGIC_VECTOR (2 downto 0);
       C_OUT : out STD_LOGIC);
END COMPONENT;

SIGNAL A, B, S : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL C_IN, C_OUT : STD_LOGIC;

begin
UUT: CLA_3bit
PORT MAP(A => A,
         B => B,
         S => S,
         C_IN => C_IN,
         C_OUT => C_OUT);


PROCESS
BEGIN
-- 1 + 2 WITH C_IN =0
A <= "001";
B <= "010";
C_IN <= '0';


-- 2 + 3 WITH C_IN = 1
WAIT FOR 100NS;
A <= "010";
B <= "011";
C_IN <= '1';

-- 0 + 1 WITH C_IN = 1
WAIT FOR 100NS;
A <= "000";
B <= "001";
C_IN <= '1';

-- 1 + 5 WITH C_IN = 0
WAIT FOR 100NS;
A <= "001";
B <= "101";
C_IN <= '0';

WAIT;

END PROCESS;

end Behavioral;