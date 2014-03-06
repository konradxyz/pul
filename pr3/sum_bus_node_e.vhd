----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:42:18 03/05/2014 
-- Design Name: 
-- Module Name:    sum_bus_node_e - sum_bus_node 
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

entity sum_bus_node_e is
	port(
		input: in std_logic; --input
		enabled: in std_logic; -- are we working
		from_prev: in std_logic; -- maybe someone has find 1 already?
		
		enable_next: out std_logic; -- sometimes we need to enable next bus (from certain point of course)
		output: out std_logic -- and this is our output
	);
end sum_bus_node_e;

architecture sum_bus_node of sum_bus_node_e is
	signal c : std_logic;
begin
	output <= '1' when enabled = '1' and (input = '1' or from_prev = '1') else '0';
	enable_next <= from_prev;
end sum_bus_node;

