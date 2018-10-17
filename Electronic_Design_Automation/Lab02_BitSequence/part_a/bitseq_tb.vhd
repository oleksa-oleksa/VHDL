LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Bit_sequence_tb IS
END Bit_sequence_tb;

ARCHITECTURE behavior OF Bit_sequence_tb IS

COMPONENT Bit_seq
PORT (	CLK, RST, X : IN std_logic;
			Y : OUT std_logic	);
END COMPONENT;

SIGNAL clk : std_logic := '0'; 
SIGNAL rst, x, y : std_logic;

BEGIN

	uut : Bit_seq PORT MAP (clk, rst, x, y);

	PROCESS
	BEGIN
		CLK <= '0'; WAIT FOR 50 ns;
		CLK <= '1'; WAIT FOR 50 ns;
	END PROCESS;
	
	PROCESS
	BEGIN
		rst <= '0'; x <= '0'; WAIT FOR 50 ns;
		rst <= '0'; x <= '0'; WAIT FOR 50 ns;
		rst <= '1'; x <= '0'; WAIT FOR 50 ns;
		x <= '1'; WAIT FOR 50 ns;
		x <= '0'; WAIT FOR 50 ns;
		x <= '0'; WAIT FOR 50 ns;
		x <= '0'; WAIT FOR 50 ns;
		x <= '0'; WAIT FOR 50 ns;
		x <= '1'; WAIT FOR 50 ns;
		x <= '1'; WAIT FOR 50 ns;
		x <= '1'; WAIT FOR 50 ns;
		x <= '1'; WAIT FOR 50 ns;
		x <= '1'; WAIT FOR 50 ns;
		x <= '0'; WAIT FOR 50 ns;
		x <= '0'; WAIT FOR 50 ns;
		x <= '0'; WAIT FOR 50 ns;
	END PROCESS;
		
END behavior;
