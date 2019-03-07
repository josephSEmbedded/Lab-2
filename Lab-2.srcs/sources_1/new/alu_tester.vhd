----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/06/2019 06:03:06 PM
-- Design Name: 
-- Module Name: alu_tester - Behavioral
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

entity alu_tester is
    Port( signal sw : in std_logic_vector(3 downto 0);
          signal clk : in std_logic;
          signal btn : in std_logic_vector(3 downto 0);
          signal led : out std_logic_vector(3 downto 0));
          
end alu_tester;

architecture Behavioral of alu_tester is
    component my_alu is
        port (opcode : in std_logic_vector(3 downto 0);
              clock : in std_logic;
              A : in std_logic_vector(3 downto 0);
              B : in std_logic_vector(3 downto 0);
              output : out std_logic_vector(3 downto 0));
    end component;
    
    component debouncer is
        port (clk : in std_logic;
              btn : in std_logic;
              dbnc : out std_logic);
    end component;
    
    
    signal activateOpCode : std_logic;
    signal activateA : std_logic;
    signal activateB : std_logic;
    signal reset : std_logic;
    
    
    signal regOpCode : std_logic_vector(3 downto 0);
    signal regA : std_logic_vector(3 downto 0);
    signal regB : std_logic_vector(3 downto 0);
    
    
    
begin

    dbnc0 : debouncer port map(clk => clk, btn => btn(0), dbnc => activateOpCode);
    dbnc1 : debouncer port map(clk => clk, btn => btn(1), dbnc => activateA);
    dbnc2 : debouncer port map(clk => clk, btn => btn(2), dbnc => activateB);
    dbnc3 : debouncer port map(clk => clk, btn => btn(3), dbnc => reset);
    
    alu : my_alu port map(clock => clk, opcode => regOpCode, A => regA, B => regB, output => led);
    
    process(clk)
    begin
        if(rising_edge(clk)) then
            if(activateOpCode = '1') then
                regOpCode <= sw;
            end if;
            if(activateA = '1') then
                regA <= sw;
            end if;
            if (activateB = '1') then
                regB <= sw;
            end if;
            if(reset = '1') then
                regOpCode <= "0000";
                regA <= "0000";
                regB <= "0000";
            end if;
        end if;
    end process;
            
end Behavioral;
