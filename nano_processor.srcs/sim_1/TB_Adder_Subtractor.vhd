library IEEE; use IEEE.STD_LOGIC_1164.ALL;

entity TB_Adder_Subtractor is end TB_Adder_Subtractor;

architecture Behavioral of TB_Adder_Subtractor is
    component Adder_Subtractor
        Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
               B : in STD_LOGIC_VECTOR (3 downto 0);
               M : in STD_LOGIC;
               S : out STD_LOGIC_VECTOR (3 downto 0);
               C_out : out STD_LOGIC;
               ZeroFlag : out STD_LOGIC;
               Overflow : out STD_LOGIC );
    end component;

    signal A, B: STD_LOGIC_VECTOR(3 downto 0);
    signal M: STD_LOGIC;
    signal S: STD_LOGIC_VECTOR(3 downto 0);
    signal C_out, ZeroFlag, Overflow: STD_LOGIC;

begin
    UUT: Adder_Subtractor port map(
        A => A,
        B => B,
        M => M,
        S => S,
        C_out => C_out,
        ZeroFlag => ZeroFlag,
        Overflow => Overflow 
    );
    process
    begin
        -- Test Additions
        A <= "0000"; -- 0 + 0 = 0(zero flag)
        B <= "0000";
        M <= '0';
        wait for 100 ns;
        
        A <= "0100"; -- 4 + 7 = 11(overflow)
        B <= "0111";
        M <= '0';
        wait for 100 ns;
        
        A <= "0100"; -- 4 + 1 = 5
        B <= "0001";
        M <= '0';
        wait for 100 ns;
        A <= "1010"; -- -6 + 5 = -1
        B <= "0101";
        M <= '0';
        wait for 100 ns;

        A <= "1100"; -- -4 + 3 = -1
        B <= "0011";
        M <= '0';
        wait for 100 ns;

        A <= "1111"; -- -1 + 1 = 0(zero flag)
        B <= "0001";
        M <= '0';
        wait for 100 ns;

        -- Test Subtractions
        A <= "1010"; -- -6 - 5 = -11 (overflow)
        B <= "0101";
        M <= '1'; -- Subtraction operation
        wait for 100 ns;

        A <= "1100"; -- -4 - 3 = -7
        B <= "0011";
        M <= '1';
        wait for 100 ns;

        A <= "1111"; -- -1 - 1 = -2
        B <= "0001";
        M <= '1';
        wait for 100 ns;

        A <= "0001"; -- 1 - (-6) = 7
        B <= "1010";
        M <= '1';
        wait for 100 ns;

        A <= "0110"; -- 6 - (-4) = 10(overflow)
        B <= "1100";
        M <= '1';
        wait for 100 ns;

        A <= "1101"; -- -3 - (-2) = -1
        B <= "1110";
        M <= '1';
        wait for 100 ns;

        wait;
    end process;

end Behavioral;