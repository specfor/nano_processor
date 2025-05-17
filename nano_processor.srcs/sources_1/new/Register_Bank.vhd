----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/16/2025 11:40:27 AM
-- Design Name: 
-- Module Name: Register_Bank - Behavioral
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

entity Register_Bank is
    Port ( clk : in STD_LOGIC;
           reg_sel : in STD_LOGIC_VECTOR (2 downto 0);
           data_in : in STD_LOGIC_VECTOR (7 downto 0);
           reset : in std_logic;
           data_out : out STD_LOGIC_VECTOR (63 downto 0)
           );
end Register_Bank;

architecture Behavioral of Register_Bank is

component Reg8
port (
    D : in STD_LOGIC_VECTOR (7 downto 0);
    En : in STD_LOGIC;
    Clk : in STD_LOGIC;
    Reset : in STD_LOGIC;
    Q : out STD_LOGIC_VECTOR (7 downto 0)
);
end component;

component Decoder_3_to_8 is
Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
       Y : out STD_LOGIC_VECTOR (7 downto 0);
       EN : in STD_LOGIC);
end component ;
    

signal reg_sel_sig : STD_LOGIC_VECTOR (7 downto 0);
    
begin
    register_selector : Decoder_3_to_8
    port map (
        I => reg_sel,
        Y => reg_sel_sig,
        En => '1'
    );
    
    RegA : Reg8
    port map (
        D => "00000000",
        En => reg_sel_sig(0),
        Clk => clk,
        Reset => reset       
    );

    RegB : Reg8
    port map (
        D => data_in,
        En => reg_sel_sig(1),
        Clk => clk,
        Reset => reset       
    );

    RegC : Reg8
    port map (
        D => data_in,
        En => reg_sel_sig(2),
        Clk => clk,
        Reset => reset       
    );
    
    RegD : Reg8
    port map (
        D => data_in,
        En => reg_sel_sig(3),
        Clk => clk,
        Reset => reset       
    );

    RegE : Reg8
    port map (
        D => data_in,
        En => reg_sel_sig(4),
        Clk => clk,
        Reset => reset       
    );
    
    RegF : Reg8
    port map (
        D => data_in,
        En => reg_sel_sig(5),
        Clk => clk,
        Reset => reset       
    );
    
    RegG : Reg8
    port map (
        D => data_in,
        En => reg_sel_sig(6),
        Clk => clk,
        Reset => reset       
    );
    
    RegH : Reg8
    port map (
        D => data_in,
        En => reg_sel_sig(7),
        Clk => clk,
        Reset => reset       
    );
end Behavioral;
