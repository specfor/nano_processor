----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.05.2025 01:22:35
-- Design Name: 
-- Module Name: TB_Decoder_2_to_4 - Behavioral
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

entity TB_Decoder_2_to_4 is
--  Port ( );
end TB_Decoder_2_to_4;

architecture Behavioral of TB_Decoder_2_to_4 is
COMPONENT Decoder_2_to_4
    Port ( EN : in STD_LOGIC;
       I : in STD_LOGIC_VECTOR (1 downto 0);
       Y : out STD_LOGIC_VECTOR (3 downto 0));
END COMPONENT;

SIGNAL EN : STD_LOGIC;
SIGNAL I : STD_LOGIC_VECTOR (1 downto 0);
SIGNAL Y : STD_LOGIC_VECTOR (3 downto 0);


begin
UUT : Decoder_2_to_4
PORT MAP(EN => EN,
         I => I,
         Y => Y);
         
PROCESS
BEGIN

EN <= '0';
I <= "00";

WAIT FOR 100NS;
I <= "01";

WAIT FOR 100NS;
I <= "10";

WAIT FOR 100NS;
I <= "11";

WAIT FOR 100NS;
EN <= '1';
I <= "00";

WAIT FOR 100NS;
I <= "01";

WAIT FOR 100NS;
I <= "10";

WAIT FOR 100NS;
I <= "11";

WAIT;
END PROCESS;
end Behavioral;
