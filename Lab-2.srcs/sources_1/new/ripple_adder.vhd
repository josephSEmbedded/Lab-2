----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2019 07:23:10 PM
-- Design Name: 
-- Module Name: ripple_adder - Structural
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

entity ripple_adder is
    Port(signal Avec : in std_logic_vector(3 downto 0);
         signal Bvec : in std_logic_vector(3 downto 0);
         signal C0 : in std_logic;
         signal Svec : out std_logic_vector(3 downto 0);
         signal C4 : out std_logic);
         
end ripple_adder;

architecture Structural of ripple_adder is

component adder is
    port( A : in std_logic;
          B : in std_logic;
          Cin: in std_logic;
          Sum : out std_logic;
          Cout : out std_logic);
end component;

signal C1 : std_logic;
signal C2 : std_logic;
signal C3 : std_logic;

begin

add0 : adder port map ( A => Avec(0), B => Bvec(0), Cin => C0, Cout => C1, Sum => Svec(0));
add1 : adder port map ( A => Avec(1), B => Bvec(1), Cin => C1, Cout => C2, Sum => Svec(1));
add2 : adder port map ( A => Avec(2), B => Bvec(2), Cin => C2, Cout => C3, Sum => Svec(2));
add3 : adder port map ( A => Avec(3), B => Bvec(3), Cin => C3, Cout => C4, Sum => Svec(3));




end Structural;
