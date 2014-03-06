----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:05:30 03/05/2014 
-- Design Name: 
-- Module Name:    sum_comb_e - sum_comb 
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

entity sum_combiner_e is
	generic(n: natural range 1 to 255);
	port (
		input : in std_logic_vector(n - 1 downto 0);
		output: out std_logic_vector(n - 1 downto 0)
	);
end sum_combiner_e;

architecture sum_combiner of sum_combiner_e is
	type N_LOGIC_VECTOR is array (n downto 0) of std_logic_vector(n - 1 downto 0);
	signal bus_connectors: N_LOGIC_VECTOR;
begin
	bus_connectors(0) <= (others => '1');
	s_comb: for i in 0 to n - 1 generate
		s_bus : entity work.sum_bus_e generic map(n) port map(input, output(i),  bus_connectors(i + 1), bus_connectors(i));
	end generate s_comb;
end sum_combiner;

