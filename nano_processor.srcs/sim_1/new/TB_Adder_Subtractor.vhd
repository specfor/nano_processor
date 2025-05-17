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
        -- Test Case 1: 0 + 0 = 0 (zero flag)
        A <= "00000000";
        B <= "00000000";
        M <= '0';
        wait for 100 ns;
        
        -- Test Case 2: 200 + 100 = 300 mod 256 = 44 (overflow)
        A <= "11001000";
        B <= "01100100";
        M <= '0';
        wait for 100 ns;
        
        -- Test Case 3: -1 + 1 = 0 (zero flag, signed)
        A <= "11111111";
        B <= "00000001";
        M <= '0';
        wait for 100 ns;
        
        -- Test Case 4: 10 - 5 = 5 (basic subtraction)
        A <= "00001010";
        B <= "00000101";
        M <= '1';
        wait for 100 ns;
        
        -- Test Case 5: -128 - 1 = 127 (signed overflow)
        A <= "10000000";
        B <= "00000001";
        M <= '1';
        wait for 100 ns;
        
        -- Test Case 6: 255 - 255 = 0 (zero flag)
        A <= "11111111";
        B <= "11111111";
        M <= '1';
        wait for 100 ns;
        
        wait;
    end process;
end Behavioral;