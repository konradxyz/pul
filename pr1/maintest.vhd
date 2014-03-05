--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:43:10 03/04/2014
-- Design Name:   
-- Module Name:   Z:/MGR/I/pul/projekty/pr1/maintest.vhd
-- Project Name:  pr1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: main
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
 
ENTITY maintest IS
END maintest;
 
ARCHITECTURE behavior OF maintest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT main
    PORT(
         btn : IN  std_logic_vector(3 downto 0);
         sw : IN  std_logic_vector(7 downto 0);
         led : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal btn : std_logic_vector(3 downto 0) := (others => '0');
   signal sw : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal led : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: main PORT MAP (
          btn => btn,
          sw => sw,
          led => led
        );

     stim_proc: process
   begin        
      wait for 1us;
   
      btn(0) <= '1';
      sw <= "01010101";
      assert led = "01010101";
      wait for 1us;
   
      btn(1) <= '1';
      sw <= "11010101";
      assert led = "11010101";
      wait for 1us;
   
      btn(2) <= '1';
      sw(7) <= not sw(7);
      wait;
   end process;
END;
