----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:14:59 05/12/2014 
-- Design Name: 
-- Module Name:    digit_to_seg_e - digit_to_seg 
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

entity digit_to_seg_e is
	port(
		digit: in std_logic_vector(3 downto 0);
		dot: in std_logic;
		seg: out std_logic_vector(7 downto 0)
	);
end digit_to_seg_e;

architecture digit_to_seg of digit_to_seg_e is

begin
	seg <= "10010001";
end digit_to_seg;

