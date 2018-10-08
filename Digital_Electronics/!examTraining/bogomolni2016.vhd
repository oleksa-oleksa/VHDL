LIBRARY ieee;
use ieee.std_logic_1164.all;

ENTITY examTimeLineTraining IS

END examTimeLineTraining;

ARCHITECTURE Behaviour_Bogomolni2016 OF examTimeLineTraining IS
SIGNAL a, b, d, f, g_d, e_d : std_logic := '0';
SIGNAL reset : std_logic := '1';
SIGNAL clk: std_logic := '0';

BEGIN
a <= '1' AFTER 15 ns, '0' AFTER 35 ns, '1' AFTER 45 ns, '0' AFTER 62 ns, '1' AFTER 78 ns;
reset <= '0' AFTER 25 ns, '1' AFTER 57 ns, '0' AFTER 63 ns;
clk <= NOT clk AFTER 10 ns;

PROCESS (clk, reset)	
VARIABLE c : std_logic := '0';
	BEGIN
	  IF (reset = '1') THEN
		b <= '0';
		d <= '0';
		c := '0';
	  ELSIF (clk = '1' and clk'event) THEN
		b <= a;
		c := b;
		d <= c;
	  END IF;
END PROCESS;

PROCESS (a)
BEGIN
	f <= a;
END PROCESS;

e_d <= a AFTER 12 ns;
g_d <= TRANSPORT a AFTER 12 ns;

END Behaviour_Bogomolni2016;
