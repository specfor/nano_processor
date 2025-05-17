library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Adder_Subtractor is
    Port ( A      : in  STD_LOGIC_VECTOR(7 downto 0);
           B      : in  STD_LOGIC_VECTOR(7 downto 0);
           M      : in  STD_LOGIC;  -- 0=add, 1=subtract
           S      : out STD_LOGIC_VECTOR(7 downto 0);
           C_out  : out STD_LOGIC;
           ZeroFlag : out STD_LOGIC;
           Overflow : out STD_LOGIC);
end Adder_Subtractor;

architecture Behavioral of Adder_Subtractor is
    signal B_operand   : STD_LOGIC_VECTOR(7 downto 0);
    signal sum         : signed(8 downto 0);
    signal A_ext, B_ext : signed(8 downto 0);
begin
    -- For subtraction, we need to negate B (two's complement: invert and add 1)
    -- This is done by: B_operand = (B xor M) + M when M=1
    -- But implemented more clearly as:
    B_operand <= B when M = '0' else std_logic_vector(-signed(B));
    
    -- Sign-extended inputs
    A_ext <= signed(A(7) & A);
    B_ext <= signed(B_operand(7) & B_operand);
    
    -- Actual addition (now works for both add and subtract)
    sum <= A_ext + B_ext;
    
    -- Output assignments
    S <= std_logic_vector(sum(7 downto 0));
    C_out <= std_logic(sum(8));
    
    -- Zero flag
    ZeroFlag <= '1' when sum(7 downto 0) = "00000000" else '0';
    
    -- Correct signed overflow detection
    Overflow <= '1' when (A(7) = B_operand(7)) and (sum(7) /= A(7)) else '0';
end Behavioral;