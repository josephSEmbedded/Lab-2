----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2019 07:43:28 PM
-- Design Name: 
-- Module Name: ripple_tb - TestBench
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

entity ripple_tb is
end ripple_tb;

architecture TestBench of ripple_tb is

component ripple_adder is
    port ( Avec : in std_logic_vector(3 downto 0);
           Bvec : in std_logic_vector(3 downto 0);
           C0 : in std_logic;
           Svec : out std_logic_vector(3 downto 0);
           C4 : out std_logic);
end component;

signal A : std_logic_vector(3 downto 0);
signal B : std_logic_vector(3 downto 0);
signal C0 : std_logic;
signal sumVector : std_logic_vector(3 downto 0);
signal finalCarryOut : std_logic;

begin

A <= "0101";
B <= "0001";
C0 <= '0';

add :  ripple_adder port map(Avec => A, Bvec => B, C0 => C0, Svec => sumVector, C4 => finalCarryOut);




end TestBench;
