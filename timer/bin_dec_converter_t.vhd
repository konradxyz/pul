--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:49:56 05/11/2014
-- Design Name:   
-- Module Name:   E:/repos/pul/timer/bin_dec_converter_t.vhd
-- Project Name:  timer
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: bin_dec_converter_e
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
use ieee.numeric_std.all;

 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY bin_dec_converter_t IS
END bin_dec_converter_t;
 
ARCHITECTURE behavior OF bin_dec_converter_t IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT bin_dec_converter_e
	 generic(n: natural; d: natural);
    PORT(
         input : IN  std_logic_vector(n - 1 downto 0);
         output : OUT  std_logic_vector(4 * d - 1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal input : std_logic_vector(15 downto 0) := (others => '1');

 	--Outputs
   signal output : std_logic_vector(4 * 5 - 1 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: bin_dec_converter_e generic map(16, 5) PORT MAP (
          input => input,
          output => output
        );
	input <= std_logic_vector(to_signed(19, 16));
		 

 
END;
