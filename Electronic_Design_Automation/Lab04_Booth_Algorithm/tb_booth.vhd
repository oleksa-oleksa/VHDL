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
	signal s_reset : std_logic := '0';
	
begin

dut: ENTITY work.booth

PORT MAP (
	x => s_x,
	y => s_y,
	z => s_z,
	clk => s_clk,
	reset => s_reset
);

-- common processes in the separate process

-- test: 6*(-7) = -42 (1101 )
data_stimul_X: PROCESS
BEGIN
    s_x <= "0110"; WAIT FOR 100 ns;
END PROCESS;

data_stimul_Y: PROCESS
BEGIN
    s_y <= "1001"; WAIT FOR 100 ns;
END PROCESS;

clock_stimul: PROCESS 
BEGIN
    s_clk <= '1'; WAIT FOR 5 ns;
    s_clk <= '0'; WAIT FOR 5 ns;
END PROCESS; 

reset_stimul: PROCESS
BEGIN
    s_reset <= '0'; WAIT FOR 280 ns;
    s_reset <= '1'; WAIT FOR 20 ns;
END PROCESS;

end testbench;