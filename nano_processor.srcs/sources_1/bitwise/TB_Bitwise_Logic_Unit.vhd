library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Bitwise_Logic_Unit is
end TB_Bitwise_Logic_Unit;

architecture Behavioral of TB_Bitwise_Logic_Unit is
    component Bitwise_Logic_Unit
        Port (
            A       : in  STD_LOGIC_VECTOR(7 downto 0);
            B       : in  STD_LOGIC_VECTOR(7 downto 0);
            Op      : in  STD_LOGIC_VECTOR(1 downto 0);
            Result  : out STD_LOGIC_VECTOR(7 downto 0);
            Zero    : out STD_LOGIC
        );
    end component;

    signal A, B : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal Op : STD_LOGIC_VECTOR(1 downto 0) := "00";
    signal Result : STD_LOGIC_VECTOR(7 downto 0);
    signal Zero : STD_LOGIC;
begin
    uut: Bitwise_Logic_Unit port map (
        A => A, B => B, Op => Op,
        Result => Result, Zero => Zero
    );

    stim_proc: process
    begin
        -- Test AND (00)
        A <= "11001100"; B <= "10101010"; Op <= "00"; wait for 100 ns;
        assert Result = "10001000" report "AND failed" severity error;
        
        -- Test OR (01)
        Op <= "01"; wait for 100 ns;
        assert Result = "11101110" report "OR failed" severity error;
        
        -- Test XOR (10)
        Op <= "10"; wait for 100 ns;
        assert Result = "01100110" report "XOR failed" severity error;
        
        -- Test NOT (11) - ignores B
        Op <= "11"; wait for 100 ns;
        assert Result = "00110011" report "NOT failed" severity error;
        
        -- Test zero flag
        A <= "00000000"; B <= "11111111"; Op <= "00"; wait for 100 ns;
        assert Zero = '1' report "Zero flag failed" severity error;
        
        wait;
    end process;
end Behavioral;