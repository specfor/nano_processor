library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_Reg8 is
end tb_Reg8;

architecture behavior of tb_Reg8 is
    signal D     : STD_LOGIC_VECTOR(7 downto 0);
    signal En    : STD_LOGIC;
    signal Clk   : STD_LOGIC := '0';
    signal Reset : STD_LOGIC;
    signal Q     : STD_LOGIC_VECTOR(7 downto 0);

    component Reg8
        Port (
            D     : in  STD_LOGIC_VECTOR(7 downto 0);
            En    : in  STD_LOGIC;
            Clk   : in  STD_LOGIC;
            Reset : in  STD_LOGIC;
            Q     : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

begin
    uut: Reg8 port map (D => D, En => En, Clk => Clk, Reset => Reset, Q => Q);

    Clk_process : process
    begin
        Clk <= '0';
        wait for 10 ns;
        Clk <= '1';
        wait for 10 ns;
    end process;

    stim_proc: process
    begin
        Reset <= '1'; En <= '0'; D <= (others => '0');
        wait for 20 ns;

        Reset <= '0'; En <= '1'; D <= "10101010";
        wait for 20 ns;

        D <= "01010101";
        wait for 20 ns;

        En <= '0'; D <= "11110000";
        wait for 20 ns;

        Reset <= '1';
        wait for 20 ns;

        wait;
    end process;
end behavior;
