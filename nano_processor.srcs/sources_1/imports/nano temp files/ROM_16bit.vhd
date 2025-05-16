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
    
    -- 16-bit instruction format:
    -- [15:12] - Opcode (4 bits for 16 possible operations)
    -- [11:8]  - Register A (destination)
    -- [7:4]   - Register B (source)
    -- [3:0]   - Immediate/Control bits
    
    -- Extended opcodes:
    -- 0000 - ADD
    -- 0001 - SUB
    -- 0010 - MUL
    -- 0011 - DIV
    -- 0100 - MOVI (move immediate)
    -- 0101 - MOV (register to register)
    -- 0110 - JZR (jump if zero)
    -- 0111 - JNZ (jump if not zero)
    -- 1000 - SHL (shift left)
    -- 1001 - SHR (shift right)
    -- 1010 - AND
    -- 1011 - OR
    -- 1100 - XOR
    -- 1101 - NOT
    -- 1110 - ROL (rotate left)
    -- 1111 - ROR (rotate right)
    
    signal ROM_Data : ROM_Array := (
        -- Sample program: Calculate sum of numbers from 1 to 5 (1+2+3+4+5 = 15)
        "0100000100000001",  --  0 MOVI R1, 1   
        "0100001000000101",  --  1 MOVI R2, 5   
        "0100001100000000",  --  2 MOVI R3, 0   
        "0000001100000001",  --  3 ADD R3, R1   
        "0001000100000001",  --  4 ADD R1, 1   
        "0111000100000010",  --  5 JNZ R1<=R2, 3 
        "0100010000000000",  --  6 MOVI R4, 0   
        "0001010000000011"  --  7 ADD R4, R3
    );
    
begin
    data <= ROM_Data(to_integer(unsigned(address)));
end Behavioral;