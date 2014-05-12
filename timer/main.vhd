----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:40:36 05/11/2014 
-- Design Name: 
-- Module Name:    main_e - main 
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

entity main_e is
 port(mclk: in std_logic;
       btn:  in  std_logic_vector(3 downto 0);
		 sw: in std_logic_vector(7 downto 0);
       led:  out std_logic_vector(7 downto 0);
       seg:  out std_logic_vector(7 downto 0);
       an:   out std_logic_vector(3 downto 0));
end main_e;

architecture main of main_e is
	signal counter: std_logic_vector(15 downto 0);
	signal clk: std_logic;
	signal output: std_logic_vector(15 downto 0);
	signal digits: std_logic_vector(19 downto 0);
	signal active: std_logic;
	signal seg_input: std_logic_vector(31 downto 0);
begin
	counter(15 downto 9) <= sw(7 downto 1);
	counter(8 downto 0) <= (others => '0');
	divider: entity work.divider_e generic map(50000) port map(mclk, clk);
	timer: entity work.timer_e generic map(16) port map(counter, clk, btn(3), btn(0), sw(0), output, led(7), active);
	converter: entity work.bin_dec_converter_e generic map(16, 5) port map(output, digits);
	digit0: entity work.digit_to_seg_e port map(digits(7 downto 4), active, seg_input(7 downto 0));
	digit1: entity work.digit_to_seg_e port map(digits(11 downto 8), '0', seg_input(15 downto 8));
	digit2: entity work.digit_to_seg_e port map(digits(15 downto 12), '1', seg_input(23 downto 16));
	digit3: entity work.digit_to_seg_e port map(digits(19 downto 16), '0', seg_input(31 downto 24));
	display: entity work.seg_display_e port map(seg_input, clk, seg, an);
end main;

