----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:14:15 03/10/2014 
-- Design Name: 
-- Module Name:    any_bus_e - any_bus 
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

entity any_bus_e is
	generic(n: natural range 1 to 255);
	port(
		input : in std_logic_vector(n - 1 downto 0);
		output: out std_logic
	);
end any_bus_e;

architecture any_bus of any_bus_e is

begin
	a_bus: if n = 1 generate


end any_bus;

