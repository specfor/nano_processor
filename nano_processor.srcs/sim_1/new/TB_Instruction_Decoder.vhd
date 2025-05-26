----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/17/2025 07:47:02 AM
-- Design Name: 
-- Module Name: TB_Instruction_Decoder - Behavioral
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

entity TB_Instruction_Decoder is
--  Port ( );
end TB_Instruction_Decoder;

architecture Behavioral of TB_Instruction_Decoder is

component Instruction_Decoder
Port ( clk : in STD_LOGIC;
           ins_bus : in STD_LOGIC_VECTOR (15 downto 0);
           load_sel : out STD_LOGIC;
           reg_en : out STD_LOGIC_VECTOR (2 downto 0);
           immed_val : out STD_LOGIC_VECTOR (7 downto 0);
           au_reg1_sel : out STD_LOGIC_VECTOR (2 downto 0);
           au_reg2_sel : out STD_LOGIC_VECTOR (2 downto 0);
           au_action_sel : out STD_LOGIC_VECTOR (3 downto 0);
           flags : in STD_LOGIC_VECTOR (2 downto 0);
           jmp_en : out STD_LOGIC;
           jmp_addr : out STD_LOGIC_VECTOR (2 downto 0));
end component ;

signal clk, load_sel, jmp_en : std_logic;
signal ins_bus : STD_LOGIC_VECTOR (15 downto 0);
signal reg_en, au_reg1_sel, au_reg2_sel, flags, jmp_addr : STD_LOGIC_VECTOR (2 downto 0);
signal au_action_sel : STD_LOGIC_VECTOR (3 downto 0);
signal immed_val : STD_LOGIC_VECTOR (7 downto 0);


begin
uut: Instruction_Decoder
port map(
    clk => clk,
    ins_bus => ins_bus,
    load_sel => load_sel,
    reg_en => reg_en,
    immed_val => immed_val,
    au_reg1_sel => au_reg1_sel,
    au_reg2_sel => au_reg2_sel,
    au_action_sel => au_action_sel,
    flags => flags,
    jmp_en => jmp_en,
    jmp_addr => jmp_addr
);

Clk_process : process
begin
    Clk <= '0';
    wait for 50 ns;
    Clk <= '1';
    wait for 50 ns;
end process;


ins_dec_process : process begin
      
    flags <= "000";
    ins_bus <= "0101000100000001";  --  MOVI R1, 1   
    
    wait for 100ns;
    
    ins_bus <= "0101001000000101";   -- MOVI R2, 5
    wait for 100ns;
    
    ins_bus <= "0001001100000001";  --  ADD R3, R1 
    wait for 100ns;
        
    flags <= "000";
    ins_bus <= "1100011000000101";  --  JZR R6, 5    
    wait for 100ns;
        
    flags <= "001";
    ins_bus <= "1100011000000101";  --  JZR R6, 5;    
    wait;
    
end process;

end Behavioral;
