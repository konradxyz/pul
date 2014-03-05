----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:46:47 03/04/2014 
-- Design Name: 
-- Module Name:    combiner - Behavioral 
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

entity combiner is
	generic(n: natural range 2 to 255);
	port(
		input : in std_logic_vector(n - 1 downto 0);
		fun: in std_logic_vector(1 downto 0);
		enable: in std_logic;
		output: out std_logic_vector(n - 1 downto 0)
	);
end combiner;

architecture Behavioral of combiner is
begin
	output <= input when enable /= '0' else x"00";
end Behavioral;

