library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity TB_Mul_8bit is
end TB_Mul_8bit;

architecture Behavioral of TB_Mul_8bit is
    component Mul_8bit
        Port ( A, B       : in  STD_LOGIC_VECTOR(7 downto 0);
               P          : out STD_LOGIC_VECTOR(7 downto 0);
               Overflow   : out STD_LOGIC;
               Zero       : out STD_LOGIC);
    end component;

    signal A, B     : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal P        : STD_LOGIC_VECTOR(7 downto 0);
    signal Overflow : STD_LOGIC;
    signal Zero     : STD_LOGIC;

begin
    uut: Mul_8bit port map (
        A => A,
        B => B,
        P => P,
        Overflow => Overflow,
        Zero => Zero
    );

    stim_proc: process
    begin
        -- Test 1: 3 * 5 = 15 (no overflow, not zero)
        wait for 100 ns;
        A <= "00000011"; B <= "00000101"; wait for 100 ns;
        assert P = "00001111" report "3*5 failed";
        assert Overflow = '0' report "3*5 overflow incorrect";
        assert Zero = '0' report "3*5 zero flag incorrect";
        
        -- Test 2: 10 * 20 = 200 (no overflow, not zero)
        A <= "00001010"; B <= "00010100"; wait for 100 ns;
        assert P = "11001000" report "10*20 failed";
        assert Overflow = '0' report "10*20 overflow incorrect";
        assert Zero = '0' report "10*20 zero flag incorrect";
        
        -- Test 3: 255 * 1 = 255 (no overflow, not zero)
        A <= "11111111"; B <= "00000001"; wait for 100 ns;
        assert P = "11111111" report "255*1 failed";
        assert Overflow = '0' report "255*1 overflow incorrect";
        assert Zero = '0' report "255*1 zero flag incorrect";
        
        -- Test 4: 16 * 16 = 256 (overflow case, P=0, zero flag true)
        A <= "00010000"; B <= "00010000"; wait for 100 ns;
        assert P = "00000000" report "16*16 failed";
        assert Overflow = '1' report "16*16 overflow incorrect";
        assert Zero = '1' report "16*16 zero flag incorrect";
        
        -- Test 5: 0 * 100 = 0 (no overflow, zero flag true)
        A <= "00000000"; B <= "01100100"; wait for 100 ns;
        assert P = "00000000" report "0*100 failed";
        assert Overflow = '0' report "0*100 overflow incorrect";
        assert Zero = '1' report "0*100 zero flag incorrect";
        
        -- Test 6: 128 * 2 = 256 (overflow case, P=0, zero flag true)
        A <= "10000000"; B <= "00000010"; wait for 100 ns;
        assert P = "00000000" report "128*2 failed";
        assert Overflow = '1' report "128*2 overflow incorrect";
        assert Zero = '1' report "128*2 zero flag incorrect";
        
        -- Test 7: 15 * 17 = 255 (no overflow, not zero)
        A <= "00001111"; B <= "00010001"; wait for 100 ns;
        assert P = "11111111" report "15*17 failed";
        assert Overflow = '0' report "15*17 overflow incorrect";
        assert Zero = '0' report "15*17 zero flag incorrect";
        
        -- NEW EXPLICIT OVERFLOW TESTS --
        
        -- Test 8: 255 * 2 = 510 (overflow case, P=254)
        A <= "11111111"; B <= "00000010"; wait for 100 ns;
        assert P = "11111110" report "255*2 failed";
        assert Overflow = '1' report "255*2 overflow incorrect";
        assert Zero = '0' report "255*2 zero flag incorrect";
        
        -- Test 9: 200 * 2 = 400 (overflow case, P=144)
        A <= "11001000"; B <= "00000010"; wait for 100 ns;
        assert P = "10010000" report "200*2 failed";
        assert Overflow = '1' report "200*2 overflow incorrect";
        assert Zero = '0' report "200*2 zero flag incorrect";
        
        -- Test 10: 64 * 5 = 320 (overflow case, P=64)
        A <= "01000000"; B <= "00000101"; wait for 100 ns;
        assert P = "01000000" report "64*5 failed";
        assert Overflow = '1' report "64*5 overflow incorrect";
        assert Zero = '0' report "64*5 zero flag incorrect";
        
        -- Test 11: 128 * 3 = 384 (overflow case, P=128)
        A <= "10000000"; B <= "00000011"; wait for 100 ns;
        assert P = "10000000" report "128*3 failed";
        assert Overflow = '1' report "128*3 overflow incorrect";
        assert Zero = '0' report "128*3 zero flag incorrect";
        
        -- Test 12: 255 * 255 = 65025 (maximum overflow case, P=1)
        A <= "11111111"; B <= "11111111"; wait for 100 ns;
        assert P = "00000001" report "255*255 failed";
        assert Overflow = '1' report "255*255 overflow incorrect";
        assert Zero = '0' report "255*255 zero flag incorrect";
        
        wait;
    end process;
end Behavioral;