library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity main is
port (
btn : in std_logic_vector (3 downto 0);
sw : in std_logic_vector (7 downto 0);
led : out std_logic_vector (7 downto 0)
);
end main;
architecture behavioral of main is
begin
led <= sw;
end behavioral;