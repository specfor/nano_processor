----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.05.2025 11:28:14
-- Design Name: 
-- Module Name: TB_RCA - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Testbench for 3-bit Ripple Carry Adder
-- 
-- Dependencies: RCA.vhd
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
-- use IEEE.NUMERIC_STD.ALL;

entity TB_RCA is
-- Testbench has no ports
end TB_RCA;

architecture Behavioral of TB_RCA is

    -- Component Declaration for Unit Under Test (UUT)
    COMPONENT RCA
        Port (
            A     : in  STD_LOGIC_VECTOR(2 downto 0);
            B     : in  STD_LOGIC_VECTOR(2 downto 0);
            C_IN  : in  STD_LOGIC;
            S     : out STD_LOGIC_VECTOR(2 downto 0);
            C_OUT : out STD_LOGIC
        );
    END COMPONENT;

    -- Signals to connect to the UUT
    SIGNAL A, B, S    : STD_LOGIC_VECTOR(2 DOWNTO 0);
    SIGNAL C_IN, C_OUT : STD_LOGIC;

begin

    -- Instantiate the Unit Under Test (UUT)
    UUT: RCA
        PORT MAP (
            A     => A,
            B     => B,
            C_IN  => C_IN,
            S     => S,
            C_OUT => C_OUT
        );

    -- Test sequence
    PROCESS
    BEGIN
        -- 1 + 2 WITH C_IN = 0
        A <= "001";
        B <= "010";
        C_IN <= '0';
        WAIT FOR 100 NS;

        -- 2 + 3 WITH C_IN = 1
        A <= "010";
        B <= "011";
        C_IN <= '1';
        WAIT FOR 100 NS;

        -- 0 + 1 WITH C_IN = 1
        A <= "000";
        B <= "001";
        C_IN <= '1';
        WAIT FOR 100 NS;

        -- 1 + 5 WITH C_IN = 0
        A <= "001";
        B <= "101";
        C_IN <= '0';
        WAIT FOR 100 NS;

        -- End simulation
        WAIT;
    END PROCESS;

end Behavioral;
