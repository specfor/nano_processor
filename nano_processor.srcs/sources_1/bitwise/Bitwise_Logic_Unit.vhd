library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Bitwise_Logic_Unit is
    Port (
        A       : in  STD_LOGIC_VECTOR(7 downto 0);
        B       : in  STD_LOGIC_VECTOR(7 downto 0);
        Op      : in  STD_LOGIC_VECTOR(1 downto 0);  -- 00:AND, 01:OR, 10:XOR, 11:NOT
        Result  : out STD_LOGIC_VECTOR(7 downto 0);
        Zero    : out STD_LOGIC
    );
end Bitwise_Logic_Unit;

architecture Behavioral of Bitwise_Logic_Unit is
    signal temp_result : STD_LOGIC_VECTOR(7 downto 0);
begin
    process(A, B, Op)
    begin
        case Op is
            when "00"   => temp_result <= A and B;    -- Bitwise AND
            when "01"   => temp_result <= A or B;     -- Bitwise OR
            when "10"   => temp_result <= A xor B;    -- Bitwise XOR
            when "11"   => temp_result <= not A;      -- Bitwise NOT (ignores B)
            when others => temp_result <= (others => '0');
        end case;
    end process;
    
    Result <= temp_result;
    Zero <= '1' when temp_result = "00000000" else '0';
end Behavioral;