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
    port ( signal Ainput : in std_logic_vector(3 downto 0);
           signal Binput : in std_logic_vector(3 downto 0);
           signal C0Input : in std_logic;
           signal C3Output : out std_logic; 
           signal Svector :  out std_logic);
end ripple_tb;

architecture TestBench of ripple_tb is

component ripple_adder is
    port ( Avec : in std_logic_vector(3 downto 0);
           Bvec : in std_logic_vector(3 downto 0);
           C0 : in std_logic;
           Svec : out std_logic_vector(3 downto 0);
           C4 : out std_logic);
end component;

begin




end TestBench;
