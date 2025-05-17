
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity Reg8 is
    Port ( D : in STD_LOGIC_VECTOR (7 downto 0);
           En : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (7 downto 0));
end Reg8;

architecture Behavioral of Reg8 is

signal data : STD_LOGIC_VECTOR (7 downto 0) := "00000000";

begin

Q <= data;

process (Clk, Reset)
    begin
        if (Reset = '1') then
            data <= (others => '0');
        elsif rising_edge(Clk) then
            if En = '1' then
                data <= D;
            end if;
        end if;
    end process;


end Behavioral;
