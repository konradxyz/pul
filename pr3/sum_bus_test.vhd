--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:35:01 03/06/2014
-- Design Name:   
-- Module Name:   E:/repos/pul/pr3/sum_bus_test.vhd
-- Project Name:  pr3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: sum_bus_e
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY sum_bus_test IS
END sum_bus_test;
 
ARCHITECTURE behavior OF sum_bus_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT sum_bus_e
    PORT(
         input : IN  std_logic_vector(7 downto 0);
         output : OUT  std_logic;
         enable_next : OUT  std_logic_vector(7 downto 0);
         enabled : IN  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
     

   --Inputs
   signal input : std_logic_vector(7 downto 0) := (others => '0');
   signal enabled : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal output : std_logic;
   signal enable_next : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: entity work.sum_bus_e
		generic map (8)
		PORT MAP (
          input => input,
          output => output,
          enable_next => enable_next,
          enabled => enabled
        );


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		input <= "00100010";
		enabled <= "11111000";

      -- insert stimulus here 

      wait;
   end process;

END;
