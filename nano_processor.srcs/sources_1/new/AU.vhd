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
           action : in STD_LOGIC_VECTOR (3 downto 0);
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

component Shift_Unit
    Port (
        Data_In    : in  STD_LOGIC_VECTOR(7 downto 0);
        Shift_Amt  : in  STD_LOGIC_VECTOR(2 downto 0);  -- 0-7 bits
        Shift_Type : in  STD_LOGIC;                     -- '0'=right, '1'=left
        Data_Out   : out STD_LOGIC_VECTOR(7 downto 0);
        Carry_Out  : out STD_LOGIC
    );
end component ;

component Bitwise_Logic_Unit
    Port (
        A       : in  STD_LOGIC_VECTOR(7 downto 0);
        B       : in  STD_LOGIC_VECTOR(7 downto 0);
        Op      : in  STD_LOGIC_VECTOR(1 downto 0);  -- 00:AND, 01:OR, 10:XOR, 11:NOT
        Result  : out STD_LOGIC_VECTOR(7 downto 0);
        Zero    : out STD_LOGIC
    );
end component ;



signal res_add, res_mul, res_shift, res_bitwise : std_logic_vector(7 downto 0);
signal carry_add : std_logic ;
signal ov_flow_mul, ov_flow_add, zero_mul, zero_add, carry_shift, zero_bitwise : std_logic ;
signal sub_enable : std_logic;
signal shift_type : std_logic ;
signal bitwise_op : STD_LOGIC_VECTOR(1 downto 0);


begin

bit_logic: Bitwise_Logic_Unit
port map(
    a => data_a,
    b => data_b,
    op => bitwise_op,
    result => res_bitwise,
    zero => zero_bitwise
);

shifter: Shift_Unit
port map(
    data_in => data_a,
    shift_amt => data_b(2 downto 0),
    shift_type => shift_type,
    data_out => res_shift,
    carry_out => carry_shift
);

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
-- '0000' -> addition
-- '0001' -> subtraction
-- '0010' -> multiplication
-- '0011' -> division - not yet implemented
-- '0100' -> left shift
-- '0101' -> right shift
-- '0110' -> bitwise and
-- '0111' -> bitwise or
-- '1000' -> bitwise xor
-- '1001' -> bitwise not

-- flags order     -    carry, overflow, zero


sub_enable <= '0' when action = "0000" else
              '1' when action = "0001" else
              '0';
              
shift_type <=  '1' when action = "0100" else
               '0' when action = "0101" else
               '0';
 
bitwise_op <= "00" when action = "0110" else
              "01" when action = "0111" else
              "10" when action = "1000" else
              "11" when action = "1001" else
              "00";           
               
process(action, res_add, res_mul, res_shift, res_bitwise)
begin
    if (action = "0000") then  -- ADD
        result <= res_add;
        flags <= '0' & ov_flow_add & zero_add;
    elsif (action = "0001") then  -- SUB
        result <= res_add;
        flags <= '0' & ov_flow_add & zero_add;
    elsif (action = "0010") then  -- MUL
        result <= res_mul;
        flags <= '0' & ov_flow_mul & zero_mul;
    elsif (action = "0011") then  -- DIV (not implemented)
        result <= "00000000";
        flags <= "000";
    elsif (action = "0100") then  -- left shift
        result <= res_shift;
        flags <= carry_shift & "00";
    elsif (action = "0101") then  -- right shift    
        result <= res_shift;
        flags <= carry_shift & "00";
    elsif (action = "0110") then  -- bitwise and
        result <= res_bitwise;
        flags <= "00" & zero_bitwise;
    elsif (action = "0111") then  -- bitwise or
        result <= res_bitwise;
        flags <= "00" & zero_bitwise;
    elsif (action = "1000") then  -- bitwise xor
        result <= res_bitwise;
        flags <= "00" & zero_bitwise;
    elsif (action = "1001") then  -- bitwise not
        result <= res_bitwise;
        flags <= "00" & zero_bitwise;
    end if;
end process;

end Behavioral;
