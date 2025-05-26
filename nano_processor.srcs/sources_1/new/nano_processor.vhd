----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/16/2025 02:33:53 PM
-- Design Name: 
-- Module Name: nano_processor - Behavioral
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

entity nano_processor is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           flags : out STD_LOGIC_VECTOR (2 downto 0);
           reg7_out : out STD_LOGIC_VECTOR (7 downto 0);
           s_clk_led : out STD_LOGIC;
           seg7_anodes : out std_logic_vector (3 downto 0);
           seg7_cathodes : out std_logic_vector (6 downto 0)
           
--           bus_data : out STD_LOGIC_VECTOR (63 downto 0);
--           pg_counter: out STD_LOGIC_VECTOR (2 downto 0);
--           reg_select:  out STD_LOGIC_VECTOR (2 downto 0)
   );
end nano_processor;

architecture Behavioral of nano_processor is


component Slow_Clk
    Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end component ;

component AU
Port ( data_a : in STD_LOGIC_VECTOR (7 downto 0);
       data_b : in STD_LOGIC_VECTOR (7 downto 0);
       action : in STD_LOGIC_VECTOR (3 downto 0);
       result : out STD_LOGIC_VECTOR (7 downto 0);
       flags : out STD_LOGIC_VECTOR (2 downto 0));
end component ;

component mux_8way_8bit
 Port (A0 : in STD_LOGIC_VECTOR (7 downto 0);
      A1 : in STD_LOGIC_VECTOR (7 downto 0);
      A2 : in STD_LOGIC_VECTOR (7 downto 0);
      A3 : in STD_LOGIC_VECTOR (7 downto 0);
      A4 : in STD_LOGIC_VECTOR (7 downto 0);
      A5 : in STD_LOGIC_VECTOR (7 downto 0);
      A6 : in STD_LOGIC_VECTOR (7 downto 0);
      A7 : in STD_LOGIC_VECTOR (7 downto 0);
      Sel : in STD_LOGIC_VECTOR (2 downto 0);
      mux_8_way_8_bit_out : out STD_LOGIC_VECTOR (7 downto 0));
end component ;

component mux_2way_3bit
Port (A0 : in STD_LOGIC_VECTOR (2 downto 0);
     A1 : in STD_LOGIC_VECTOR (2 downto 0);
     Sel : in std_logic;
     data_out : out STD_LOGIC_VECTOR (2 downto 0));
 end component ;

component ROM_16bit
    Port ( 
        address : in  STD_LOGIC_VECTOR(2 downto 0);  -- 4-bit address (0-15)
        data : out STD_LOGIC_VECTOR(15 downto 0)     -- 16-bit instruction
    );
end component ;

component Register_Bank
Port ( clk : in STD_LOGIC;
   reg_sel : in STD_LOGIC_VECTOR (2 downto 0);
   data_in : in STD_LOGIC_VECTOR (7 downto 0);
   reset : in std_logic;
   data_out : out STD_LOGIC_VECTOR (63 downto 0)
   );
end component ;

component Instruction_Decoder
Port (
    clk : in STD_LOGIC;
    ins_bus : in STD_LOGIC_VECTOR (15 downto 0);
    load_sel : out STD_LOGIC;
    reg_en : out STD_LOGIC_VECTOR (2 downto 0);
    immed_val : out STD_LOGIC_VECTOR (7 downto 0);
    au_reg1_sel : out STD_LOGIC_VECTOR (2 downto 0);
    au_reg2_sel : out STD_LOGIC_VECTOR (2 downto 0);
    au_action_sel : out STD_LOGIC_VECTOR (3 downto 0);
    flags : in STD_LOGIC_VECTOR (2 downto 0);
    jmp_en : out STD_LOGIC;
    jmp_addr : out STD_LOGIC_VECTOR (2 downto 0));
end component ;

component RCA_3bit
 Port ( A    : in  STD_LOGIC_VECTOR (2 downto 0);
      B    : in  STD_LOGIC_VECTOR (2 downto 0);
      C_in : in STD_LOGIC;
      S    : out STD_LOGIC_VECTOR (2 downto 0);
      C_out : out STD_LOGIC);
end component ;

component mux_2way_8bit
Port (A0 : in STD_LOGIC_VECTOR (7 downto 0);
       A1 : in STD_LOGIC_VECTOR (7 downto 0);
       Sel : in std_logic;
       data_out : out STD_LOGIC_VECTOR (7 downto 0));
end component ;

component Program_Counter
Port ( clk : in STD_LOGIC;
       next_addr : in STD_LOGIC_VECTOR (2 downto 0);
       reset : in STD_LOGIC;
       mem_select : out STD_LOGIC_VECTOR (2 downto 0));
end component ;

component Seg7_LUT 
    Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
           data : out STD_LOGIC_VECTOR (6 downto 0));
end component;



signal s_clock : std_logic := '0';
signal ins_bus : std_logic_vector (15 downto 0);
signal prog_counter, next_prog_counter : std_logic_vector (2 downto 0);

signal au_out, imm_value, reg_inp_data, au_inp1, au_inp2 : std_logic_vector (7 downto 0);
signal load_sel : std_logic;
signal au_reg_1_sel, au_reg_2_sel, reg_sel, flags_au : std_logic_vector (2 downto 0);
signal reg_bank_data : std_logic_vector (63 downto 0);

signal au_action_sel : std_logic_vector (3 downto 0);

signal pc_jmp_addr, pc_inc_by1_addr : STD_LOGIC_VECTOR (2 downto 0);
signal enable_jmp : std_logic;

signal seg7_lut_addr : std_logic_vector (3 downto 0);
signal seg7_digit_sel : std_logic := '0';

signal seg7_count : integer range 0 to 99999 := 0;
signal seg7_tick : std_logic := '0';

begin

sl_clk : slow_clk
port map(
    clk_in => clk,
    clk_out => s_clock
);

load_sel_mux : mux_2way_8bit
port map(
    a0 => au_out,
    a1 => imm_value,
    sel => load_sel,
    data_out => reg_inp_data
);

pc : Program_Counter
port map(
    clk => s_clock,
    next_addr => next_prog_counter,
    reset => reset,
    mem_select => prog_counter
);

program_counter_sel_mux : mux_2way_3bit
port map(
    a0 => pc_inc_by1_addr,
    a1 => pc_jmp_addr,
    sel => enable_jmp,                       
    data_out => next_prog_counter
);

pc_incrementor : RCA_3bit
port map(
 a => prog_counter,
 b => "001",
 c_in => '0',
 s => pc_inc_by1_addr,
 c_out => open
);


ins_decoder : Instruction_Decoder
port map (
    clk => s_clock,
    ins_bus => ins_bus,
    load_sel => load_sel,
    reg_en => reg_sel,
    immed_val => imm_value,
    au_reg1_sel => au_reg_1_sel,
    au_reg2_sel => au_reg_2_sel,
    au_action_sel => au_action_sel,
    flags => flags_au,
    jmp_en => enable_jmp,
    jmp_addr => pc_jmp_addr
);

rom : ROM_16bit
port map (
    address => prog_counter,
    data => ins_bus
);

reg_bank : Register_Bank
port map(
    clk => s_clock,
    reg_sel => reg_sel,
    data_in => reg_inp_data,
    reset => reset,
    data_out => reg_bank_data
);

au_reg1_sel_mux : mux_8way_8bit
port map(
    a0 => reg_bank_data(7 downto 0),
    a1 => reg_bank_data(15 downto 8),
    a2 => reg_bank_data(23 downto 16),
    a3 => reg_bank_data(31 downto 24),
    a4 => reg_bank_data(39 downto 32),
    a5 => reg_bank_data(47 downto 40),
    a6 => reg_bank_data(55 downto 48),
    a7 => reg_bank_data(63 downto 56),
    sel => au_reg_1_sel,
    mux_8_way_8_bit_out => au_inp1
);

au_reg2_sel_mux : mux_8way_8bit
port map(
    a0 => reg_bank_data(7 downto 0),
    a1 => reg_bank_data(15 downto 8),
    a2 => reg_bank_data(23 downto 16),
    a3 => reg_bank_data(31 downto 24),
    a4 => reg_bank_data(39 downto 32),
    a5 => reg_bank_data(47 downto 40),
    a6 => reg_bank_data(55 downto 48),
    a7 => reg_bank_data(63 downto 56),
    sel => au_reg_2_sel,
    mux_8_way_8_bit_out => au_inp2
);

au_module : AU
port map(
    data_a => au_inp1,
    data_b => au_inp2,
    action => au_action_sel,
    result => au_out,
    flags => flags_au
);

seg7_module : Seg7_LUT
port map(
    address => seg7_lut_addr,
    data => seg7_cathodes
);


reg7_out <= reg_bank_data(63 downto 56);
s_clk_led <= s_clock;
flags <= flags_au;


--bus_data <= reg_bank_data;
--pg_counter <= prog_counter;
--reg_select <= reg_sel;


process(clk)
begin
    if rising_edge(clk) then
        if seg7_count = 99999 then
            seg7_count <= 0;
            seg7_tick <= '1';
        else
            seg7_count <= seg7_count + 1;
            seg7_tick <= '0';
        end if;
    end if;
end process;

seg7_process : process(clk)
begin
    if rising_edge(clk) then
        if seg7_tick = '1' then
            if seg7_digit_sel = '0' then
                seg7_anodes <= "1110"; -- first digit
                seg7_lut_addr <= reg_bank_data(59 downto 56); -- lower nibble
            else
                seg7_anodes <= "1101"; -- second digit
                seg7_lut_addr <= reg_bank_data(63 downto 60); -- upper nibble
            end if;
            seg7_digit_sel <= not seg7_digit_sel;
        end if;
    end if;
end process;



end Behavioral;
