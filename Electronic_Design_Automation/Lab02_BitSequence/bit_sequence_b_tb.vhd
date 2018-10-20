LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY bit_sequence_b_tb IS
END bit_sequence_b_tb;

ARCHITECTURE behavior OF bit_sequence_b_tb IS

COMPONENT bit_sequence_b
PORT (	CLK, RST, X : IN std_logic;
	Y : OUT std_logic;
	Z : OUT std_logic_vector(8 downto 0));
END COMPONENT;

SIGNAL s_clk : std_logic := '0'; 
SIGNAL s_rst, s_x, s_y : std_logic;
SIGNAL s_z : std_logic_vector(8 downto 0);

BEGIN

dut : ENTITY work.bit_sequence_b
PORT MAP (
		CLK => s_clk,
		RST => s_rst,
		X => s_x,
		Y => s_y,
		Z => s_z
);

clock_stimul: PROCESS
BEGIN
	s_clk <= '0'; WAIT FOR 5 ns;
	s_clk <= '1'; WAIT FOR 5 ns;
END PROCESS;
	
reset_stimul: PROCESS
BEGIN
	s_rst <= '0'; WAIT FOR 10 ns;
	s_rst <= '1'; WAIT FOR 100 ns;
END PROCESS;

data_stimul: PROCESS
BEGIN
	s_x <= '0'; WAIT FOR 20 ns;
	s_x <= '1'; WAIT FOR 80 ns;
	s_x <= '0'; WAIT FOR 50 ns;
	s_x <= '1'; WAIT FOR 10 ns;
	s_x <= '0'; WAIT FOR 20 ns;
END PROCESS;
		
END behavior;
