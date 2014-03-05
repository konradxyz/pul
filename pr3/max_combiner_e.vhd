----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:58:37 03/05/2014 
-- Design Name: 
-- Module Name:    max_combiner_e - max_combiner 
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

entity max_combiner_e is
	generic(n: natural range 2 to 255);
	port (
		input : in std_logic_vector(n - 1 downto 0);
		output: out std_logic_vector(n - 1 downto 0)
	);
end max_combiner_e;

architecture max_combiner of max_combiner_e is
	signal display_bus: std_logic_vector(n downto 0);
begin
	display_bus(n) <= '0';
	max_bus: for i in 0 to n - 1 generate
		node: entity work.max_bus_node_e port map(display_bus(i + 1), input(i), display_bus(i), output(i));
	end generate max_bus;
end max_combiner;

