library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TB_Shift_Unit is
end TB_Shift_Unit;

architecture Behavioral of TB_Shift_Unit is
    component Shift_Unit
        Port (
            Data_In    : in  STD_LOGIC_VECTOR(7 downto 0);
            Shift_Amt  : in  STD_LOGIC_VECTOR(2 downto 0);
            Shift_Type : in  STD_LOGIC;
            Data_Out   : out STD_LOGIC_VECTOR(7 downto 0);
            Carry_Out  : out STD_LOGIC
        );
    end component;

    signal Data_In    : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal Shift_Amt  : STD_LOGIC_VECTOR(2 downto 0) := "000";
    signal Shift_Type : STD_LOGIC := '0';
    signal Data_Out   : STD_LOGIC_VECTOR(7 downto 0);
    signal Carry_Out  : STD_LOGIC;
begin
    uut: Shift_Unit port map (
        Data_In => Data_In,
        Shift_Amt => Shift_Amt,
        Shift_Type => Shift_Type,
        Data_Out => Data_Out,
        Carry_Out => Carry_Out
    );

    stim_proc: process
    begin
        -- Test 1: Left shift 11100000 by 2 bits inedex:230247T
        Data_In <= "11100000"; Shift_Amt <= "010"; Shift_Type <= '1'; wait for 100 ns;
        assert Data_Out = "00001100" and Carry_Out = '1' report "Left shift failed" severity error;
        
        -- Test 2: Right shift 11000011 by 3 bits
        Shift_Type <= '0'; wait for 100 ns;
        assert Data_Out = "00011000" and Carry_Out = '0' report "Right shift failed" severity error;
        
        -- Test 3: Left shift 11110111 by 7 bits (boundary case)
        Data_In <= "11110111"; Shift_Amt <= "111"; Shift_Type <= '1'; wait for 100 ns;
        assert Data_Out = "10000000" and Carry_Out = '0' report "Max left shift failed" severity error;
        
        -- Test 4: Right shift 10000001 by 1 bit index 230346V
        Data_In <= "11111010"; Shift_Amt <= "001"; Shift_Type <= '0'; wait for 100 ns;
        assert Data_Out = "01000000" and Carry_Out = '1' report "Single right shift failed" severity error;
        
        -- Test 5: No shift (verify zero shift amount)
        Shift_Amt <= "000"; wait for 100 ns;
        assert Data_Out = "10000001" and Carry_Out = '0' report "Zero shift failed" severity error;
        
        wait;
    end process;
end Behavioral;