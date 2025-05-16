----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/16/2025 02:05:54 PM
-- Design Name: 
-- Module Name: Instruction_Decoder - Behavioral
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

entity Instruction_Decoder is
    Port ( clk : in STD_LOGIC;
           ins_bus : in STD_LOGIC_VECTOR (15 downto 0);
           load_sel : out STD_LOGIC;
           reg_en : out STD_LOGIC_VECTOR (2 downto 0);
           immed_val : out STD_LOGIC_VECTOR (7 downto 0);
           au_reg1_sel : out STD_LOGIC_VECTOR (2 downto 0);
           au_reg2_sel : out STD_LOGIC_VECTOR (2 downto 0);
           au_action_sel : out STD_LOGIC_VECTOR (2 downto 0);
           flags : in STD_LOGIC_VECTOR (2 downto 0);
           jmp_en : out STD_LOGIC;
           jmp_addr : out STD_LOGIC_VECTOR (2 downto 0));
end Instruction_Decoder;

architecture Behavioral of Instruction_Decoder is




begin


end Behavioral;
