----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:10:27 03/04/2014 
-- Design Name: 
-- Module Name:    min_combiner_e - Behavioral 
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

entity min_combiner_e is
	generic(n: natural range 2 to 255);
	port (
		input : in std_logic_vector(n - 1 downto 0);
		output: out std_logic_vector(n - 1 downto 0)
	);
end min_combiner_e; 

architecture min_combiner of min_combiner_e is
	signal enable_bus :  std_logic_vector(n downto 0);
	signal display_bus: std_logic_vector(n downto 0);
begin
	enable_bus(0) <= '1';
	display_bus(n) <= '0';
	min_bus : for i in 0 to n - 1 generate
		node : entity work.min_bus_node_e port map(enable_bus(i), display_bus(i + 1), input(i), display_bus(i), enable_bus(i + 1), output(i));
	end generate min_bus;

end min_combiner;

