----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.05.2025 12:26:39
-- Design Name: 
-- Module Name: TB_CLA_8 - Behavioral
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

entity TB_CLA_8 is
--  Port ( );
end TB_CLA_8;

architecture Behavioral of TB_CLA_8 is

COMPONENT CLA_8_BIT
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
       B : in STD_LOGIC_VECTOR (3 downto 0);
       C_IN : in STD_LOGIC;
       S : out STD_LOGIC_VECTOR (3 downto 0);
       C_OUT : out STD_LOGIC);
END COMPONENT;

SIGNAL A, B, S : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL C_IN, C_OUT : STD_LOGIC;

begin
UUT: CLA_8_BIT
PORT MAP(A => A,
         B => B,
         S => S,
         C_IN => C_IN,
         C_OUT => C_OUT);


PROCESS
BEGIN
-- 1 + 2 WITH C_IN =0
A <= "00000001";
B <= "00000010";
C_IN <= '0';


-- 2 + 3 WITH C_IN = 1
WAIT FOR 100NS;
A <= "00000010";
B <= "00000011";
C_IN <= '1';

-- 0 + 1 WITH C_IN = 1
WAIT FOR 100NS;
A <= "00000000";
B <= "00000001";
C_IN <= '1';

-- 1 + 5 WITH C_IN = 0
WAIT FOR 100NS;
A <= "00000001";
B <= "00000101";
C_IN <= '0';

WAIT;

END PROCESS;

end Behavioral;
