library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Instruction_Decoder is
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
        jmp_addr : out STD_LOGIC_VECTOR (2 downto 0)
    );
end Instruction_Decoder;

architecture Behavioral of Instruction_Decoder is

begin


-- Instructions

-- When instruction have 2 operands, first is destination and second one is source

-- 0000     -   NOP             - 0000 0 000 00000 000
-- 0001     -   Add             - 0001 0 RRR 00000 RRR
-- 0010     -   sub             - 0010 0 RRR 00000 RRR
-- 0011     -   neg             - 0010 0 RRR 00000 000
-- 0100     -   mul             - 0100 0 RRR 00000 RRR
-- 0101     -   mov             - 0101 0 RRR BBBBBBBB       B - BINARY NUMBER
-- 0110     -   Left shift      - 0110 M RRR 00000 RRR      M - LOAD FROM REG (0) OR IMMEDIATE VALUE (1)
-- 0111     -   right shift     - 0111 M RRR 00000 RRR
-- 1000     -   bitwise and     - 1000 M RRR 00000 RRR
-- 1001     -   bitwise or      - 1001 M RRR 00000 RRR
-- 1010     -   bitwise xor     - 1010 M RRR 00000 RRR
-- 1011     -   bitwise not     - 1011 M RRR 00000 RRR
-- 1100     -   jzr             - 1100 0 RRR 00000 DDD      D - ADDRESS TO JUMP TO
-- 1101     -   jz              - 1101 0 000 00000 DDD


-- 0000 0000 00000000


-- AU actions 
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




--process (clk)
process (ins_bus)
begin
    reg_en <= "000";
    immed_val <= (others => '0');
    au_reg1_sel <= (others => '0');
    au_reg2_sel <= (others => '0');
    au_action_sel <= (others => '0');
    jmp_en <= '0';
    jmp_addr <= (others => '0');
    load_sel <= '0';
    
--    if rising_edge(clk) then
        -- Default values (prevent latches)
        

        case ins_bus(15 downto 12) is
            when "0000" =>
                null; 
            when "0001" =>  -- Add
                au_action_sel <= "0000";
                au_reg1_sel <= ins_bus(10 downto 8);
                au_reg2_sel <= ins_bus(2 downto 0);
                reg_en <= ins_bus(10 downto 8);

            when "0010" =>  -- Sub
                au_action_sel <= "0001";
                au_reg1_sel <= ins_bus(10 downto 8);
                au_reg2_sel <= ins_bus(2 downto 0);
                reg_en <= ins_bus(10 downto 8);
                                
            when "0011" =>  -- Neg
                au_action_sel <= "0010";
                au_reg2_sel <= ins_bus(10 downto 8);
                au_reg1_sel <= ins_bus(2 downto 0);
                reg_en <= ins_bus(10 downto 8);

            when "0100" =>  -- Mul
                au_action_sel <= "0011";
                au_reg1_sel <= ins_bus(10 downto 8);
                au_reg2_sel <= ins_bus(2 downto 0);
                reg_en <= ins_bus(10 downto 8);

            when "0101" =>  -- Mov (immediate)
                reg_en <= ins_bus(10 downto 8);
                immed_val <= ins_bus(7 downto 0);
                load_sel <= '1';

            when "0110" =>  -- left shift
                au_action_sel <= "0100";
                au_reg1_sel <= ins_bus(10 downto 8);
                au_reg2_sel <= ins_bus(2 downto 0);
                reg_en <= ins_bus(10 downto 8);
                
            when "0111" =>  -- right shift
                au_action_sel <= "0101";
                au_reg1_sel <= ins_bus(10 downto 8);
                au_reg2_sel <= ins_bus(2 downto 0);
                reg_en <= ins_bus(10 downto 8);
                
            when "1000" =>  -- bitwise and
                au_action_sel <= "0110";
                au_reg1_sel <= ins_bus(10 downto 8);
                au_reg2_sel <= ins_bus(2 downto 0);
                reg_en <= ins_bus(10 downto 8);
                
            when "1001" =>  -- bitwise or
                au_action_sel <= "0111";
                au_reg1_sel <= ins_bus(10 downto 8);
                au_reg2_sel <= ins_bus(2 downto 0);
                reg_en <= ins_bus(10 downto 8);
            
            when "1010" =>  -- bitwise xor
                au_action_sel <= "1000";
                au_reg1_sel <= ins_bus(10 downto 8);
                au_reg2_sel <= ins_bus(2 downto 0);
                reg_en <= ins_bus(10 downto 8);
                
             when "1011" =>  -- bitwise not
               au_action_sel <= "1001";
               au_reg1_sel <= ins_bus(10 downto 8);
               au_reg2_sel <= ins_bus(2 downto 0);
               reg_en <= ins_bus(10 downto 8);
                    
            when "1100" =>  -- JZR (Jump if Register Zero)
                au_action_sel <= "0000";
                au_reg1_sel <= ins_bus(10 downto 8);
                au_reg2_sel <= "000";  -- reg0
                
                if flags(0) = '1' then
                    jmp_en <= '1';
                    jmp_addr <= ins_bus(2 downto 0);
                end if;

            when "1101" =>  -- JZR (Jump if Register Zero)
                if flags(0) = '1' then
                    jmp_en <= '1';
                    jmp_addr <= ins_bus(2 downto 0);
                end if;
                
            when others =>
                -- NOP or undefined instruction
                null;
        end case;
--    end if;
end process;

end Behavioral;
