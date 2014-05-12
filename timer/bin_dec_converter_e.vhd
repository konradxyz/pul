----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:50:30 05/11/2014 
-- Design Name: 
-- Module Name:    bin_dec_converter_e - bin_dec_converter 
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

entity bin_dec_converter_e is
	generic(
		n: natural;
		d: natural
	);
	port(
		input: in std_logic_vector(n - 1 downto 0);
		output: out std_logic_vector(4 * d - 1 downto 0)
	);
end bin_dec_converter_e;

architecture bin_dec_converter of bin_dec_converter_e is
	type LAYERS_T is array(n - 2 downto 1) of std_logic_vector(4 * d downto 0);
	signal layers: LAYERS_T;
begin
	assert(2**n <= d ** 10);
	layers(n - 2)(n - 1 downto 0) <= input;
	layers(n - 2)(4 * d downto n) <= (others => '0');
	adders: for i in n - 3 downto 1 generate
		adders_layer: for j in 0 to (4 * d - i)/4 - 1 generate
			single_adder: entity work.adder3_e port map(layers(i + 1)(i + j * 4 + 3 downto i + j * 4), layers(i)(i + j * 4 + 3 downto i + j * 4));
		end generate;
		layers(i)(i - 1 downto 0) <= layers(i + 1)(i - 1 downto 0);
		layers(i)(4*d downto 4 * d - (4 * d - i) mod 4) <= layers(i + 1)(4*d downto 4 * d - (4 * d - i) mod 4);
	end generate adders;
	output <= layers(1)(4 * d - 1 downto 0);
end bin_dec_converter;

