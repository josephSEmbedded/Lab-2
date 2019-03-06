----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/06/2019 05:15:37 PM
-- Design Name: 
-- Module Name: my_alu - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity my_alu is
    Port( signal opcode : in std_logic_vector(3 downto 0);
          signal clock : in std_logic;
          signal A : in std_logic_vector(3 downto 0);
          signal B : in std_logic_vector(3 downto 0);
          signal output : out std_logic_vector(3 downto 0));
end my_alu;

architecture Behavioral of my_alu is

begin
    process (clock)
        begin
            if(rising_edge(clock)) then
                case opcode is
                --OpCode = 0
                    when "0000" => output <= std_logic_vector(unsigned(A)+unsigned(B));
                --OpCode = 1    
                    when "0001" => output <= std_logic_vector(unsigned(A)-unsigned(B));
                --OpCode = 2
                    when "0010" => output <= std_logic_vector(unsigned(A)+1);
                --OpCode = 3
                    when "0011" => output <= std_logic_vector(unsigned(A)-1);
                --OpCode = 4
                    when "0100" => output <= std_logic_vector(0-unsigned(A));
                --OpCode = 5
                    when "0101" => if(A > B) then output <= "0001"; 
                                   else output <= "0000"; 
                                   end if;
                --OpCode = 6
                    when "0110" => output <= std_logic_vector(shift_left(unsigned(A),1));
                    when "0111" => output <= std_logic_vector(shift_right(unsigned(A),1));
                    --Apparently sra sll srl and sla do not exist in VHDl anymore and have been replaced with functions
                    when "1000" => output <= std_logic_vector(shift_right(signed(A), 1));
                    when "1001" => output <= not A;
                    when "1010" => output <= A and B;
                    when "1011" => output <= A or B;
                    when "1100" => output <= A xor B;
                    when "1101" => output <= A xnor B;
                    when "1110" => output <= A nand B;
                    when "1111" => output <= A nor B;
                end case;
            end if;
        end process;
end Behavioral;
