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
    ------------------------------------------------------------------
    -- PACK 1: CORE ARITHMETIC (Results in R7)
--    "0101000100001001",  -- MOV R1, 9       ; Init R1=9
--    "0101001000000101",  -- MOV R2, 5       ; Init R2=5
--    "0001011100000001",  -- ADD R7, R1      ; R7=0+9=9
--    "0010011100000010",  -- SUB R7, R2      ; R7=9-5=4
--    "0100011100000001",  -- MUL R7, R1      ; R7=4*9=36
--    "0011011100000000",  -- NEG R7          ; R7=-36
--    "0001011100000010",  -- ADD R7, R2      ; R7=-36+5=3-31
--    "0101011100000000"  -- MOV R7, 0       ; Reset R7=0

    ------------------------------------------------------------------
    -- PACK 2: BITWISE OPERATIONS (Results in R7)
--    "0101000100001100",  -- MOV R1, 12      ; R1=12 (1100)
--    "0101001000001010",  -- MOV R2, 10      ; R2=10 (1010)
--    "1000011100000001",  -- AND R7, R1      ; R7=0&12=0
--    "1001011100000010",  -- OR R7, R2       ; R7=0|10=10
--    "1010011100000001",  -- XOR R7, R1      ; R7=10^12=6
--    "1011011100000000",  -- NOT R7          ; R7=~6=-7
--    "1000011100000010",  -- AND R7, R2      ; R7=-7&10=2
--    "0101011100000000"  -- MOV R7, 0       ; Reset R7=0

    ------------------------------------------------------------------
    -- PACK 3: SHIFT OPERATIONS (Results in R7)
    --"0101011100000001",  -- MOV R7, 1       ; R7=1 (0001)
    --"0110111100000011",  -- LSHI R7, 3      ; R7=1<<3=8
    --"0111111100000001",  -- RSHI R7, 1      ; R7=8>>1=4
    --"0101000100000010",  -- MOV R1, 2       ; Shift amount
    --"0110011100000001",  -- LSH R7, R1      ; R7=4<<2=16
    --"0111011100000001",  -- RSH R7, R1      ; R7=16>>2=4
    --"0110111100000010",  -- LSHI R7, 2      ; R7=4<<2=16
    --"0101011100000000",  -- MOV R7, 0       ; Reset R7=0

    ------------------------------------------------------------------
    -- PACK 4: CONTROL FLOW + MIXED OPS (Results in R7)
    "0101011000000001",  -- MOV R6, 1       ; Init R7=1
    "1100011000000101",  -- JZR R6, 5       ; Not taken (R7?0)
    "0101011100000001",  -- MOV R7, 1       ; Init R7=1
    "0001011100000111",  -- ADD R7, R7      ; R7=1+1=2
    "0100001100000111",  -- MUL R3, R7      ; R3=0*2=0 (Z=1)
    "1100010000000010",  -- JZR R4, 2       ; Taken (jumps to 1)
    "0101011100001111",  -- MOV R7, 15      ; Final R7=15
    "0000000000000000"  -- NOP             ; Padding

    ------------------------------------------------------------------
    -- PACK 5: ADVANCED MIXED OPERATIONS (Results in R7)
--    "0101011100000011",  -- MOV R7, 3       ; Init R7=3
--    "1001011100000101",  -- OR R7, R5       ; R7=3|0=3
--    "0011011100000001",  -- SUB R7, R1      ; R7=3-2=1
--    "0110111100000011",  -- LSHI R7, 3      ; R7=1<<3=8
--    "1010011100000010",  -- XOR R7, R2      ; R7=8^10=2
--    "0001011100000111",  -- ADD R7, R7      ; R7=2+2=4
--    "1011011100000000",  -- NOT R7          ; R7=~4=-5
--    "0101011100000000"   -- MOV R7, 0       ; Final reset
);
    
begin
    data <= ROM_Data(to_integer(unsigned(address)));
end Behavioral;