library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Mul_8bit is
end TB_Mul_8bit;

architecture Behavioral of TB_Mul_8bit is
    component Mul_8bit
        Port ( A, B : in  STD_LOGIC_VECTOR(7 downto 0);
               P    : out STD_LOGIC_VECTOR(15 downto 0));
    end component;

    signal A, B : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal P    : STD_LOGIC_VECTOR(15 downto 0);

begin
    uut: Mul_8bit port map (A => A, B => B, P => P);

    stim_proc: process
    begin
        -- Test 1: 3 * 5 = 15
        wait for 100ns;
        A <= "00000011"; B <= "00000101"; wait for 100 ns;
        assert P = "0000000000001111" report "3*5 failed";
        
        -- Test 2: 10 * 20 = 200
        A <= "00001010"; B <= "00010100"; wait for 100 ns;
        assert P = "0000000011001000" report "10*20 failed";
        
        -- Test 3: 255 * 1 = 255
        A <= "11111111"; B <= "00000001"; wait for 100 ns;
        assert P = "0000000011111111" report "255*1 failed";
        
        wait;
    end process;
end Behavioral;