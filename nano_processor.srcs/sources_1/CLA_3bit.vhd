----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.05.2025 11:02:05
-- Design Name: 
-- Module Name: CLA_4_bit - Behavioral
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

entity CLA_3bit is
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           B : in STD_LOGIC_VECTOR (2 downto 0);
           C_IN : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (2 downto 0);
           C_OUT : out STD_LOGIC);
end CLA_3bit;

architecture Behavioral of CLA_3bit is

SIGNAL P0, P1, P2 : STD_LOGIC;
SIGNAL G0, G1, G2 : STD_LOGIC;
SIGNAL C1, C2, C3 : STD_LOGIC;

begin
P0 <= A(0) XOR B(0);
P1 <= A(1) XOR B(1);
P2 <= A(2) XOR B(2);


G0 <= A(0) AND B(0);
G1 <= A(1) AND B(1);
G2 <= A(2) AND B(2);


C1 <= G0 OR (P0 AND C_IN);
C2 <= G1 OR (P1 AND C1);
C3 <= G2 OR (P2 AND C2);


S(0) <= C_IN XOR P0;
S(1) <= C1 XOR P1;
S(2) <= C2 XOR P2;


C_OUT <= C3;




end Behavioral;