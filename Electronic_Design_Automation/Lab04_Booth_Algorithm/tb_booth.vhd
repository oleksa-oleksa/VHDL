library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_booth is
end tb_booth;

architecture testbench of tb_booth is
	component booth is
	port(
		x, y : in  std_logic_vector(3 downto 0);
		z    : out std_logic_vector(7 downto 0);
		clk, reset : in std_logic
	);
	end component;
	
	signal s_x : std_logic_vector(3 downto 0);
	signal s_y : std_logic_vector(3 downto 0);
	signal s_z : std_logic_vector(7 downto 0);
	signal s_clk   : std_logic := '0';
	signal s_reset : std_logic;
	
begin
	--		s_clk <= '0' after   5 ns, '1' after  10 ns, '0' after  15 ns, '1' after  20 ns, '0' after  25 ns, '1' after  30 ns, '0' after  35 ns, '1' after  40 ns, 
	--					'0' after  45 ns, '1' after  50 ns, '0' after  55 ns, '1' after  60 ns, '0' after  65 ns, '1' after  70 ns, '0' after  75 ns, '1' after  80 ns, 
	--					'0' after  85 ns, '1' after  90 ns, '0' after  95 ns, '1' after 100 ns, 
	--					'0' after 105 ns, '1' after 110 ns, '0' after 115 ns, '1' after 120 ns, '0' after 125 ns, '1' after 130 ns, '0' after 135 ns, '1' after 140 ns, 
	--					'0' after 145 ns, '1' after 150 ns, '0' after 155 ns, '1' after 160 ns, '0' after 165 ns, '1' after 170 ns, '0' after 175 ns, '1' after 180 ns, 
	--					'0' after 185 ns, '1' after 190 ns, '0' after 195 ns, '1' after 200 ns;
		s_clk <= not s_clk after 5 ps;

		dut1: booth 
		Port map(x => s_x,
					y => s_y,
					z => s_z,
					clk   => s_clk,
					reset => s_reset);
		
		
		s_x <= "0110" after 0 ps;
		s_y <= "1001" after 0 ps;
		
		s_reset <= '0' after 0 ps;
end testbench;