----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:06:57 03/04/2014 
-- Design Name: 
-- Module Name:    demo - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity demo is
 port(
	sw:  in  std_logic_vector(7 downto 0);   
   led: out std_logic_vector(7 downto 0);
	--an: in std_logic_vector(3 downto 0);
	btn: in std_logic_vector(3 downto 0)
	--seg: out std_logic_vector(7 downto 0)
 );
       
end demo;

architecture simple of demo is
	signal fun : std_logic_vector(1 downto 0);
	signal enable : std_logic;
begin
	with btn select
		fun <= 
			"00" when "0001",
			"01" when "0010",
			"10" when "0100",
			"11" when others;
	enable <= '1' when btn = "0001" or 
		btn = "0010" or btn = "0100" or btn = "1000" else '0';
	comb: entity work.combiner
		generic map (8)
		port map(sw,  fun, enable, led);
end simple;

