library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Shift_Unit is
    Port (
        Data_In    : in  STD_LOGIC_VECTOR(7 downto 0);
        Shift_Amt  : in  STD_LOGIC_VECTOR(2 downto 0);  -- 0-7 bits
        Shift_Type : in  STD_LOGIC;                     -- '0'=right, '1'=left
        Data_Out   : out STD_LOGIC_VECTOR(7 downto 0);
        Carry_Out  : out STD_LOGIC
    );
end Shift_Unit;

architecture Behavioral of Shift_Unit is
    signal left_shift_data  : STD_LOGIC_VECTOR(8 downto 0);
    signal right_shift_data : STD_LOGIC_VECTOR(8 downto 0);
begin
    process(Data_In, Shift_Amt, Shift_Type)
    begin
        -- Left shift processing
        left_shift_data <= std_logic_vector(
            shift_left(unsigned('0' & Data_In), 
            to_integer(unsigned(Shift_Amt)))
        );
        
        -- Right shift processing
        right_shift_data <= std_logic_vector(
            shift_right(unsigned(Data_In & '0'), 
            to_integer(unsigned(Shift_Amt)))
        );
    end process;
    
    -- Output selection
    Data_Out <= left_shift_data(7 downto 0) when Shift_Type = '1' else 
                right_shift_data(8 downto 1);
    
    Carry_Out <= left_shift_data(8) when Shift_Type = '1' else 
                 right_shift_data(0);
end Behavioral;