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
           au_action_sel : out STD_LOGIC_VECTOR (1 downto 0);
           flags : in STD_LOGIC_VECTOR (2 downto 0);
           jmp_en : out STD_LOGIC;
           jmp_addr : out STD_LOGIC_VECTOR (2 downto 0));
end Instruction_Decoder;

architecture Behavioral of Instruction_Decoder is


-- Instructions
-- 0000     -   Add
-- 0001     -   sub
-- 0010     -   neg
-- 0011     -   mul
-- 0100     -   mov
-- 0101     -   Left shift
-- 0110     -   right shift
-- 0111     -   bitwise and
-- 1000     -   bitwise or
-- 1001     -   bitwise xor
-- 1010     -   bitwise not
-- 1011     -   jzr

-- 0000 0000 00000000

begin

process (ins_bus, flags)
begin
    reg_en <= "000";
    immed_val <= "00000000";
    au_reg1_sel <= "000";
    au_reg2_sel <= "000";
    au_action_sel <= "00";
    jmp_en <= '0';
    jmp_addr <= "000";
    load_sel <= '0';
    
    if (ins_bus(15 downto 12) = "0000") then
        au_action_sel <= "00";
        au_reg1_sel <= ins_bus(10 downto 8);
        au_reg2_sel <= ins_bus(2 downto 0);
        
    elsif (ins_bus(15 downto 12) = "0001") then
        au_action_sel <= "01";
        au_reg1_sel <= ins_bus(10 downto 8);
        au_reg2_sel <= ins_bus(2 downto 0);
        
     elsif (ins_bus(15 downto 12) = "0010") then  
       au_action_sel <= "10";
       au_reg1_sel <= ins_bus(10 downto 8);
       au_reg2_sel <= ins_bus(2 downto 0);
           
    elsif (ins_bus(15 downto 12) = "0011") then  
        au_action_sel <= "10";
        au_reg1_sel <= ins_bus(10 downto 8);
        au_reg2_sel <= ins_bus(2 downto 0);
        
    elsif (ins_bus(15 downto 12) = "0100") then  
        reg_en <= ins_bus(11 downto 9);
        immed_val <= ins_bus(7 downto 0);
        load_sel <= '1';
        
    elsif (ins_bus(15 downto 12) = "1011") then
        jmp_en <= '1';
        
    end if;
    
end process;

end Behavioral;
