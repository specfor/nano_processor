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

component Adder_Subtractor
    Port ( A      : in  STD_LOGIC_VECTOR(7 downto 0);
           B      : in  STD_LOGIC_VECTOR(7 downto 0);
           M      : in  STD_LOGIC;  -- 0=add, 1=subtract
           S      : out STD_LOGIC_VECTOR(7 downto 0);
           C_out  : out STD_LOGIC;
           ZeroFlag : out STD_LOGIC;
           Overflow : out STD_LOGIC);
end component ;

component Mul_8bit_optimized
    Port (
        A, B     : in  STD_LOGIC_VECTOR(7 downto 0);
        P        : out STD_LOGIC_VECTOR(7 downto 0);
        Overflow : out STD_LOGIC;
        Zero     : out STD_LOGIC
    );
End component ;

signal res_add, res_mul : std_logic_vector(7 downto 0);
signal carry_add : std_logic ;
signal ov_flow_mul, ov_flow_add, zero_mul, zero_add : std_logic ;
signal sub_enable : std_logic;

begin

adder_sub : Adder_Subtractor
port map(
    A => data_a,
    B => data_b,
    M => sub_enable,
    C_out => carry_add,
    S => res_add,
    ZeroFlag => zero_add,
    Overflow => ov_flow_add    
);

Multiplier : Mul_8bit_optimized
port map(
    A => data_a,
    B => data_b,
    p => res_mul,
    Overflow => ov_flow_mul,
    Zero => zero_mul
);

-- actions 
-- '00' -> addition
-- '01' -> subtraction
-- '10' -> multiplication
-- '11' -> division - not yet implemented


-- flags order     -    carry, overflow, zero


sub_enable <= '0' when action = "00" else
              '1' when action = "01" else
              '0';
              
process(action)
begin
    if (action = "00") then  -- ADD
      result <= res_add;
      flags <= '0' & ov_flow_add & zero_add;
    elsif (action = "01") then  -- SUB
      result <= res_add;
      flags <= '0' & ov_flow_add & zero_add;
    elsif (action = "10") then  -- MUL
      result <= res_mul;
      flags <= '0' & ov_flow_mul & zero_mul;
    elsif (action = "11") then  -- DIV (not implemented)
      result <= "00000000";
      flags <= "000";
    end if;
end process;

end Behavioral;
