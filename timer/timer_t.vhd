--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:57:31 05/10/2014
-- Design Name:   
-- Module Name:   E:/repos/pul/timer/timer_t.vhd
-- Project Name:  timer
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: timer_e
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
 
ENTITY timer_t IS
END timer_t;
 
ARCHITECTURE behavior OF timer_t IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT timer_e
   generic(n: natural range 2 to 255);
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
    END COMPONENT;
    

   --Inputs
   signal inputa : std_logic_vector(7 downto 0) := (others => '1');
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal toggle : std_logic := '0';
   signal dir : std_logic := '0';

 	--Outputs
   signal outputa : std_logic_vector(7 downto 0);
   signal active : std_logic;
   signal ovf : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: timer_e GENERIC MAP(8) PORT MAP (
          input => inputa,
          clk => clk,
          rst => rst,
          toggle => toggle,
          dir => dir,
          output => outputa,
          active => active,
          ovf => ovf
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
      wait for clk_period*10;
		toggle <= '0';
		      wait for clk_period*10;
		toggle <= '1';


      -- insert stimulus here 

      wait;
   end process;
   stim_proc2: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
      wait for clk_period*13;
	--	toggle <= '1';

      -- insert stimulus here 

      wait;
   end process;


END;
