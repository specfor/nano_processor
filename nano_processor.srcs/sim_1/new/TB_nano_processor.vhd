----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/16/2025 08:47:10 PM
-- Design Name: 
-- Module Name: TB_nano_processor - Behavioral
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

entity TB_nano_processor is
--  Port ( );
end TB_nano_processor;

architecture Behavioral of TB_nano_processor is

component nano_processor
 Port ( clk : in STD_LOGIC;
          reset : in STD_LOGIC;
          flags : out STD_LOGIC_VECTOR (2 downto 0);
          reg7_out : out STD_LOGIC_VECTOR (7 downto 0);
          s_clk_led : out STD_LOGIC;
         bus_data : out STD_LOGIC_VECTOR (63 downto 0);
         pg_counter: out STD_LOGIC_VECTOR (2 downto 0);
         reg_select:  out STD_LOGIC_VECTOR (2 downto 0));
end component ;

signal clk : std_logic := '1';
signal reset : std_logic := '0';
signal s_clk_led : std_logic;
signal flags, pg_counter, reg_select : std_logic_vector (2 downto 0);
signal reg7 :  std_logic_vector (7 downto 0);
signal bus_d :  std_logic_vector (63 downto 0);

begin

UUT: nano_processor
port map (
    clk => clk,
    flags => flags,
    reset => reset,
    reg7_out => reg7,
    s_clk_led => s_clk_led,
    bus_data => bus_d,
    pg_counter => pg_counter,
    reg_select => reg_select
);


process
begin
    clk <= not clk;
    wait for 10ns;
end process;


end Behavioral;
