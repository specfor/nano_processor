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

entity TB_CLA_4 is
--  Port ( );
end TB_CLA_4;

architecture Behavioral of TB_CLA_4 is
COMPONENT CLA_4_bit
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
       B : in STD_LOGIC_VECTOR (3 downto 0);
       C_IN : in STD_LOGIC;
       S : out STD_LOGIC_VECTOR (3 downto 0);
       C_OUT : out STD_LOGIC);
END COMPONENT;

SIGNAL A, B, S : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL C_IN, C_OUT : STD_LOGIC;

begin
UUT: CLA_4_bit
PORT MAP(A => A,
         B => B,
         S => S,
         C_IN => C_IN,
         C_OUT => C_OUT);


PROCESS
BEGIN
-- 1 + 2 WITH C_IN =0
A <= "0001";
B <= "0010";
C_IN <= '0';


-- 2 + 3 WITH C_IN = 1
WAIT FOR 100NS;
A <= "0010";
B <= "0011";
C_IN <= '1';

-- 0 + 1 WITH C_IN = 1
WAIT FOR 100NS;
A <= "0000";
B <= "0001";
C_IN <= '1';

-- 1 + 5 WITH C_IN = 0
WAIT FOR 100NS;
A <= "0001";
B <= "0101";
C_IN <= '0';

WAIT;

END PROCESS;

end Behavioral;
