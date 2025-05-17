-- File: Div_8bit_optimized.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Div_8bit_optimized is
    Port (
        A, B     : in  STD_LOGIC_VECTOR(7 downto 0);
        Q        : out STD_LOGIC_VECTOR(7 downto 0);
        R        : out STD_LOGIC_VECTOR(7 downto 0);
        Error    : out STD_LOGIC;
        Zero     : out STD_LOGIC
    );
end Div_8bit_optimized;

architecture Behavioral of Div_8bit_optimized is
begin
    process(A, B)
        variable vQ, vR : UNSIGNED(7 downto 0);
    begin
        -- Default assignments
        Q <= (others => '0');
        R <= (others => '0');
        Error <= '0';
        Zero <= '0';
        
        if B = "00000000" then
            Error <= '1';
            Zero <= '1';
        else
            vQ := unsigned(A) / unsigned(B);
            vR := unsigned(A) mod unsigned(B);
            
            Q <= std_logic_vector(vQ);
            R <= std_logic_vector(vR);
            
            -- Traditional if-then-else for Zero flag
            if vQ = 0 then
                Zero <= '1';
            else
                Zero <= '0';
            end if;
        end if;
    end process;
end Behavioral;