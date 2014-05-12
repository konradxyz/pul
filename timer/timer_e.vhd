----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:05:28 05/10/2014 
-- Design Name: 
-- Module Name:    timer_e - timer 
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

entity timer_e is
   generic(n: natural);
	port(
		input: in std_logic_vector(n-1 downto 0);
		clk: in std_logic;
		rst: in std_logic;
		toggle: in std_logic;
		dir: in std_logic;
		output: out std_logic_vector(n - 1 downto 0);
		active: out std_logic;
		ovf: out std_logic
	);
end timer_e;

architecture timer of timer_e is
	signal cnt : unsigned( n - 1  downto 0);
	signal bottom: unsigned ( n - 1 downto 0);
	signal old_toggle: std_logic;
	signal working: std_logic;
	signal ovf_blocked: std_logic;
	signal initialized: std_logic := '0';
begin
	active <= working;
	ovf <= ovf_blocked;
	bottom <= (others => '0');
	output <= std_logic_vector(cnt);
	process(clk)
	begin
		if clk'event and clk = '1' then
			if rst = '0' and initialized = '1' then
				if ovf_blocked = '0' then
					if old_toggle = '0' and toggle = '1' then
						working <= not working;
					else
						if working = '1' then
							if dir = '1' then
								if cnt >= unsigned(input) then
									working <= '0';
									ovf_blocked <= '1';
								else
									cnt <= cnt + 1;
								end if;
							else
								if cnt = bottom then
									working <= '0';
									ovf_blocked <= '1';
								else
									cnt <= cnt - 1;
								end if;
							end if;
						end if;
					end if;	
				end if;
				old_toggle <= toggle;
			else
				if dir = '1' then
					cnt <= (others => '0');
				else
					cnt <= unsigned(input);
				end if;
				old_toggle <= '0';
				working <= '0';
				ovf_blocked <= '0';
				initialized <= '1';
			end if;
		end if;
	end process;
end timer;

