--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:30:30 05/11/2014
-- Design Name:   
-- Module Name:   E:/repos/pul/timer/adder3_t.vhd
-- Project Name:  timer
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: adder3_e
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
 
ENTITY adder3_t IS
END adder3_t;
 
ARCHITECTURE behavior OF adder3_t IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT adder3_e
    PORT(
         input : IN  std_logic_vector(3 downto 0);
         output : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal input : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal output : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: adder3_e PORT MAP (
          input => input,
          output => output
        );

	input <= "1110";
END;
