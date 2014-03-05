----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:36:23 03/05/2014 
-- Design Name: 
-- Module Name:    sum_bus_e - sum_bus 
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

entity sum_bus_e is
	generic(n: natural range 2 to 255);
	port(
		input: in std_logic_vector( n - 1 downto 0);
		output: out std_logic;
		enable_next : out std_logic_vector ( n - 1 downto 0);
		enabled : in std_logic_vector( n - 1 downto 0)
	);
end sum_bus_e;

architecture sum_bus of sum_bus_e is
	signal bottom_up: std_logic_vector( n downto 0);
begin
	output <= bottom_up(n);
	bottom_up(0) <= '0';
	s_bus: for i in 0 to n generate
		node : entity work.sum_bus_node_e port map(input(i), enabled(i),  bottom_up(i), enable_next(i), bottom_up(i + 1));
	end generate s_bus;

end sum_bus;

