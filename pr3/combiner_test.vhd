--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:04:08 03/04/2014
-- Design Name:   
-- Module Name:   Z:/MGR/I/pul/projekty/pr3/combiner_test.vhd
-- Project Name:  pr3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: combiner
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
 
ENTITY combiner_test IS
END combiner_test;
 
ARCHITECTURE behavior OF combiner_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT combiner
    PORT(
         input : IN  std_logic_vector(7 downto 0);
         funl : IN  std_logic;
         funh : IN  std_logic;
         enable : IN  std_logic;
         output : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal input : std_logic_vector(7 downto 0) := (others => '0');
   signal funl : std_logic := '0';
   signal funh : std_logic := '0';
   signal enable : std_logic := '0';

 	--Outputs
   signal output : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: combiner PORT MAP (
          input => input,
          funl => funl,
          funh => funh,
          enable => enable,
          output => output
        );

  

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

		input <= x"11";

      -- insert stimulus here 

      wait;
   end process;

END;
