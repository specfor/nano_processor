----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/16/2025 01:27:50 PM
-- Design Name: 
-- Module Name: AU - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity AU is
    Port ( data_a : in STD_LOGIC_VECTOR (7 downto 0);
           data_b : in STD_LOGIC_VECTOR (7 downto 0);
           action : in STD_LOGIC_VECTOR (1 downto 0);
           result : out STD_LOGIC_VECTOR (7 downto 0);
           flags : out STD_LOGIC_VECTOR (2 downto 0));
end AU;

architecture Behavioral of AU is

component CLA_8_BIT is
Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
       B : in STD_LOGIC_VECTOR (7 downto 0);
       C_IN : in STD_LOGIC;
       C_OUT : out STD_LOGIC;
       S : out STD_LOGIC_VECTOR (7 downto 0));
end component ;

component Mul_8bit
    Port (
        A, B : in  STD_LOGIC_VECTOR(7 downto 0);
        P    : out STD_LOGIC_VECTOR(7 downto 0);  -- Now only 8 bits output
        Overflow : out STD_LOGIC;  -- High when result > 255
        Zero     : out STD_LOGIC   -- High when result = 0
    );
End component ;

signal res_cla, res_mul : std_logic_vector(7 downto 0);
signal carry_cla : std_logic ;
signal ov_flow_mul, ov_flow_cla, zero_mul, zero_cla : std_logic ;

begin

CLA : CLA_8_BIT
port map(
    A => data_a,
    B => data_b,
    C_in => '0',
    C_out => carry_cla,
    S => res_cla
);

Multiplier : Mul_8bit
port map(
    A => data_a,
    B => data_b,
    p => res_mul,
    Overflow => ov_flow_mul,
    Zero => zero_mul
);

-- actions 
-- '00' -> addition
-- '01' -> subtraction - need to implement
-- '10' -> multiplication
-- '11' -> division - not yet implemented


-- flags order     -    carry, overflow, zero

process(action) begin
    if (action = "00") then
        result <= res_cla;
        flags <= '0' & ov_flow_cla & zero_cla;
    elsif (action = "10") then
        result <= "00000000";
        flags <= "000";
    elsif (action = "10") then
        result <= res_mul;
        flags <= '0' & ov_flow_mul & zero_mul;
    elsif (action = "11") then
        result <= "00000000";
        flags <= "000";
    end if;
end process;

end Behavioral;
