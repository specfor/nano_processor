

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity InstrReg16 is
    Port ( D : in STD_LOGIC_VECTOR (15 downto 0);
           En : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (15 downto 0));
end InstrReg16;

architecture Behavioral of InstrReg16 is

begin

 process (Clk, Reset)
    begin
        if (Reset = '1') then
            Q <= (others => '0');
        elsif rising_edge(Clk) then
            if En = '1' then
                Q <= D;
            end if;
        end if;
    end process;


end Behavioral;
