----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:41:29 03/05/2014 
-- Design Name: 
-- Module Name:    enabler_bus_node_e - enabler_bus_node 
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

entity min_bus_node_e is
	from_prev : in std_logic; -- info from prev node -- are we enabled?
	from_next: in std_logic; -- does the next node wants us to return 1?
	input: in std_logic; -- our input
	
	to_next: out std_logic; -- info to next node -- do we want it to be enabled?
	output: out std_logic; -- our ouput
	to_prev: out std_logic; -- do we want the prev node to return 1?
end min_bus_node_e;

architecture min_bus_node of min_bus_node_e is
begin
	output <= '1' when from_prev = '1' and (from_next = '1' or input = '1') else '0';
	to_next <= '1' when from_prev = '1' and input = '0' else '0';
	to_prev <= '1' when from_prev = '1' and (from_next = '1' or input = '1') else '0';

end min_bus_node;

