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
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
       B : in STD_LOGIC_VECTOR (7 downto 0);
       C_IN : in STD_LOGIC;
       S : out STD_LOGIC_VECTOR (7 downto 0);
       C_OUT : out STD_LOGIC);
END COMPONENT;

SIGNAL A, B, S : STD_LOGIC_VECTOR(7 DOWNTO 0);
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
--INDEXES IN BINARY
--230247 = 11 10000011 01100111
--230346 = 11 10000011 11001010
--230600 = 11 10000100 11001000
--230602 = 11 10000100 11001010


--let C_IN = '0' and add random 8 bit numbers from above index numbers
C_IN <= '0';

A <= "10000011";
B <= "10000100";

WAIT FOR 100NS;
A <= "10000100";
B <= "01100111";

WAIT FOR 100NS;
A <= "01100111";
B <= "11001010";

WAIT FOR 100NS;
A <= "11001010";
B <= "10000100";

--now let C_IN = '1' and add the same 8 bit numbers
WAIT FOR 100NS;
C_IN <= '1';

A <= "10000011";
B <= "10000100";

WAIT FOR 100NS;
A <= "10000100";
B <= "01100111";

WAIT FOR 100NS;
A <= "01100111";
B <= "11001010";

WAIT FOR 100NS;
A <= "11001010";
B <= "10000100";


WAIT;

END PROCESS;

end Behavioral;
