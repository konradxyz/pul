----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:59:02 03/05/2014 
-- Design Name: 
-- Module Name:    max_bus_node_e - max_bus_node 
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

entity max_bus_node_e is
	port(
		from_next: in std_logic;
		input: in std_logic;
		to_prev: out std_logic;
		output: out std_logic
	);
end max_bus_node_e;

architecture max_bus_node of max_bus_node_e is

begin
	output <= '1' when from_next = '1' or input = '1' else '0';
	to_prev <= '1' when from_next = '1' or input = '1' else '0';
end max_bus_node;

