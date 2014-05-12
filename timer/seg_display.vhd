----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:27:00 05/12/2014 
-- Design Name: 
-- Module Name:    seg_display_e - seg_display 
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
use ieee.numeric_std.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity seg_display_e is
	port(
		input: in std_logic_vector(31 downto 0);
		clk: in std_logic;
		seg: out std_logic_vector(7 downto 0);
		an: out std_logic_vector(3 downto 0)
	);
end seg_display_e;

architecture seg_display of seg_display_e is
	signal digit: unsigned(1 downto 0) := TO_UNSIGNED(0, 2);
begin
	with digit select
		an <= 
			"0001" when "00",
			"0010" when "01",
			"0100" when "10",
			"1000" when others;
		
	with digit select
		seg <=
			input(7 downto 0) when "00",
			input(15 downto 8) when "01",
			input(23 downto 16) when "10",
			input(31 downto 24) when others;
	
	process(clk)
	begin
		if clk'event and clk = '1' then
			if digit = TO_UNSIGNED(3, 2) then
				digit <= TO_UNSIGNED(0, 2);
			else
				digit <= digit + 1;
			end if;	
		end if;
	end process;

end seg_display;

