library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Adder_Subtractor is
end TB_Adder_Subtractor;

architecture Behavioral of TB_Adder_Subtractor is
    component Adder_Subtractor
        Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
               B : in STD_LOGIC_VECTOR (7 downto 0);
               M : in STD_LOGIC;
               S : out STD_LOGIC_VECTOR (7 downto 0);
               C_out : out STD_LOGIC;
               ZeroFlag : out STD_LOGIC;
               Overflow : out STD_LOGIC );
    end component;

    signal A, B : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal M, C_out, ZeroFlag, Overflow : STD_LOGIC := '0';
    signal S : STD_LOGIC_VECTOR(7 downto 0);

begin
    UUT: Adder_Subtractor port map(
        A => A, B => B, M => M,
        S => S, C_out => C_out,
        ZeroFlag => ZeroFlag, Overflow => Overflow
    );

    stim_proc: process
    begin
        -- index:230247T
        A <= "11100000";
        B <= "00000000";
        M <= '0';
        wait for 100 ns;
        assert S = "00000000" and ZeroFlag = '1' and Overflow = '0'
            report "Test 1: 0+0 failed" severity error;
        
        
        A <= "11110111";
        B <= "00000001";
        M <= '0';
        wait for 100 ns;
        assert S = "10000000" and Overflow = '1'
            report "Test 2: 127+1 overflow failed" severity error;
        
        
        A <= "11110111";
        B <= "11100000";
        M <= '0';
        wait for 100 ns;
        assert S = "00000000" and ZeroFlag = '1' and Overflow = '0'
            report "Test 3: -1+1 failed" severity error;
        
        -- index 230346V
        A <= "11100000";
        B <= "00000101";
        M <= '1';
        wait for 100 ns;
        assert S = "00000101" and ZeroFlag = '0' and Overflow = '0'
            report "Test 4: 10-5 failed" severity error;
        
        
        A <= "11111010";
        B <= "00000001";
        M <= '1';
        wait for 100 ns;
        assert S = "01111111" and Overflow = '1'
            report "Test 5: -128-1 overflow failed" severity error;
        
        
        A <= "11100000";
        B <= "11111010";  -- -3
        M <= '1';
        wait for 100 ns;
        assert S = "11111110" and ZeroFlag = '0' and Overflow = '0'
            report "Test 6: -5-(-3) failed" severity error;
        
        wait;
    end process;
end Behavioral;