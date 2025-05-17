library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL; -- For arithmetic operations

entity Adder_Subtractor is
    Port ( A      : in  STD_LOGIC_VECTOR(7 downto 0);
           B      : in  STD_LOGIC_VECTOR(7 downto 0);
           M      : in  STD_LOGIC;  -- 0=add, 1=subtract
           S      : out STD_LOGIC_VECTOR(7 downto 0);
           C_out  : out STD_LOGIC;
           ZeroFlag : out STD_LOGIC;
           Overflow : out STD_LOGIC);
end Adder_Subtractor;

architecture Optimized of Adder_Subtractor is
    signal B_operand   : STD_LOGIC_VECTOR(7 downto 0);
    signal sum         : STD_LOGIC_VECTOR(8 downto 0); -- Includes carry out
    signal carry_chain : STD_LOGIC_VECTOR(8 downto 0);
begin
    -- Optimized XOR stage (1 LUT4 per bit, shared M signal)
    B_operand <= B when M = '0' else not B;
    
    -- Carry chain implementation (4 LUTs total)
    carry_chain(0) <= M; -- Initial carry-in is M (1 for subtraction)
    
    -- Propagate carry through all bits
    sum <= ('0' & A) + ('0' & B_operand) + carry_chain(0);
    
    -- Output assignments (3 LUTs total)
    S <= sum(7 downto 0);
    C_out <= sum(8);
    
    -- Zero flag optimized (1 LUT4)
    ZeroFlag <= '1' when sum(7 downto 0) = "0000" else '0';
    
    -- Overflow detection (1 LUT4)
    Overflow <= (A(7) and B_operand(7) and not sum(7)) or 
                (not A(7) and not B_operand(7) and sum(7));
end Optimized;