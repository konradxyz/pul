----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:45:07 05/11/2014 
-- Design Name: 
-- Module Name:    divider_e - divider 
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

use ieee.math_real.all;



-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity divider_e is
	generic(n: natural);
	port(
		clk: in std_logic;
		clk_out: out std_logic
	);
end divider_e;

architecture divider of divider_e is
	signal cnt: unsigned( natural(ceil(log2(real(n)))) + 1 downto 0) := (others => '0');
	signal output: std_logic := '0';
begin
	assert(n mod 2 = 0);
	clk_out <= output;
	process (clk)
	begin
		if clk'event and clk = '1' then
			if cnt >= TO_UNSIGNED(natural(n/2), natural(ceil(log2(real(n)))) + 2) then
				cnt <= TO_UNSIGNED(1, natural(ceil(log2(real(n)))) + 2);
				output <= not output;
			else
				cnt <= cnt + 1;
			end if;
		end if;
	end process;
end divider;

