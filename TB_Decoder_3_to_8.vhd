----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.05.2025 02:04:17
-- Design Name: 
-- Module Name: TB_Decoder_3_to_8 - Behavioral
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

entity TB_Decoder_3_to_8 is
--  Port ( );
end TB_Decoder_3_to_8;

architecture Behavioral of TB_Decoder_3_to_8 is
COMPONENT Decoder_3_to_8
    Port ( EN : in STD_LOGIC;
       I : in STD_LOGIC_VECTOR (2 downto 0);
       Y : out STD_LOGIC_VECTOR (7 downto 0));
END COMPONENT;

SIGNAL EN : STD_LOGIC;
SIGNAL I : STD_LOGIC_VECTOR (2 downto 0);
SIGNAL Y : STD_LOGIC_VECTOR (7 downto 0);

begin
UUT : Decoder_3_to_8
PORT MAP(EN => EN,
         I => I,
         Y => Y);

PROCESS
BEGIN

EN <= '1';
I <= "000";

WAIT FOR 100NS;
I <= "001";

WAIT FOR 100NS;
I <= "110";

WAIT FOR 100NS;
I <= "011";

WAIT FOR 100NS;
I <= "100";

WAIT;
END PROCESS;
end Behavioral;