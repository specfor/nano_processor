library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mul_8bit is
    Port (
        A, B : in  STD_LOGIC_VECTOR(7 downto 0);
        P    : out STD_LOGIC_VECTOR(15 downto 0)
    );
end Mul_8bit;

architecture Structural of Mul_8bit is
    -- Half Adder Component
    component HA
        Port ( 
            A, B : in  STD_LOGIC;
            S, C : out STD_LOGIC
        );
    end component;
    
    -- Full Adder Component
    component FA
        Port ( 
            A, B, C_in : in  STD_LOGIC;
            S, C_out   : out STD_LOGIC
        );
    end component;
    
    -- Array types for intermediate signals
    type SumArray is array (0 to 7) of STD_LOGIC_VECTOR(15 downto 0);
    type CarryArray is array (0 to 7) of STD_LOGIC_VECTOR(15 downto 0);
    
    -- Signals with explicit initialization
    signal partial_products : SumArray := (others => (others => '0'));
    signal sum_stage       : SumArray := (others => (others => '0'));
    signal carry_stage     : CarryArray := (others => (others => '0'));
    
begin
    -- Generate partial products (AND gates)
    Gen_Partial: for i in 0 to 7 generate
        Gen_Bits: for j in 0 to 7 generate
            partial_products(i)(j+i) <= A(j) and B(i); -- Shifted alignment
        end generate;
    end generate;
    
    -- First stage initialization
    sum_stage(0)   <= partial_products(0);
    carry_stage(0) <= (others => '0');
    
    -- Cascaded addition stages (7 stages for 8-bit multiplication)
    Gen_Stages: for stage in 1 to 7 generate
        -- Least Significant Bit (Half Adder)
        HA_inst: HA port map (
            A => sum_stage(stage-1)(0),
            B => partial_products(stage)(0),
            S => sum_stage(stage)(0),
            C => carry_stage(stage)(0)
        );
        
        -- Middle Bits (Full Adders)
        Gen_Full_Adders: for bit_pos in 1 to 15 generate
            FA_inst: FA port map (
                A => sum_stage(stage-1)(bit_pos),
                B => partial_products(stage)(bit_pos),
                C_in => carry_stage(stage)(bit_pos-1),
                S => sum_stage(stage)(bit_pos),
                C_out => carry_stage(stage)(bit_pos)
            );
        end generate;
    end generate;
    
    -- Final Product Output
    P <= sum_stage(7);
end Structural;