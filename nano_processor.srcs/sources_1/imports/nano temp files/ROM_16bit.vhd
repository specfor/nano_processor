----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/15/2025 02:04:09 PM
-- Design Name: 
-- Module Name: ROM_16bit - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

entity ROM_16bit is
    Port ( 
        address : in  STD_LOGIC_VECTOR(2 downto 0);  -- 4-bit address (0-15)
        data : out STD_LOGIC_VECTOR(15 downto 0)     -- 16-bit instruction
    );
end ROM_16bit;

architecture Behavioral of ROM_16bit is
    type ROM_Array is array (0 to 7) of STD_LOGIC_VECTOR(15 downto 0);
    
    
    signal ROM_Data : ROM_Array := (
        "0101000100000001",  --  0 MOVI R1, 1   
        "0101001000000101",  --  1 MOVI R2, 5   
        "0101001100001010",  --  2 MOVI R3, 10   
        "0001001100000001",  --  3 ADD R3, R1    
        "0101011100000111",  --  6 MOVI R7, 7   
        "0001011100000010",  --  7 ADD R7, R2
        "0000000000000000",
        "0101011100011111"   -- mov R7, 31
    );
    
begin
    data <= ROM_Data(to_integer(unsigned(address)));
end Behavioral;