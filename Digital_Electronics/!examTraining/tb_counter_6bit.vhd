LIBRARY IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity tb_counter_6bit is
end tb_counter_6bit;

architecture testbench of tb_counter_6bit is
component sixBitcounter
port (
	clk, reset, set : in std_logic;
	counter : out std_logic_vector(5 downto 0)
 	);
end component;

signal clk : std_logic := '0';
signal reset, set : std_logic := '1';
signal counter : std_logic_vector(5 downto 0);

begin

dut: sixBitCounter
port map (clk, reset, set, counter);

-- we need 64 clocks for full cycle
-- this is 315 ns
clock: process
begin
	clk <= '0'; wait for 2.5 ns;
	clk <= '1'; wait for 2.5 ns;
end process clock;

reset_stimulus: process
begin
reset <= '1'; wait for 20 ns; 
reset <= '0'; wait for 350 ns; 
reset <= '1'; wait for 20 ns; 
reset <= '0'; wait for 800 ns;
end process reset_stimulus;

set_stimulus: process
begin
set <= '1'; wait for 550 ns;
set <= '0'; wait for 550 ns;
end process set_stimulus;

end testbench;
