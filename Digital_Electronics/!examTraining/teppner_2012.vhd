LIBRARY ieee;
use ieee.std_logic_1164.all;

ENTITY examTimeLineTraining IS
END examTimeLineTraining;

ARCHITECTURE Behaviour_Teppner2012 OF examTimeLineTraining IS
SIGNAL a, b, d, e, clk : std_logic := '0';
SIGNAL r : std_logic := '1';

BEGIN
a <= '1' AFTER 15 ns, '0' AFTER 35 ns, '1' AFTER 45 ns, '0' AFTER 60 ns;
clk <= NOT clk AFTER 10 ns; 
r <= '0' AFTER 25 ns, '1' AFTER 55 ns, '0' AFTER 65 ns;

PROCESS (clk)	
VARIABLE c : std_logic := '0';
	BEGIN
	  b <= a;
	  IF r = '1' THEN
		b <= '0';
		c := b;
		d <= c;
	  ELSE 
		IF (clk = '1' AND clk'EVENT) THEN
			d <= a;
			c := d;
			b <= c;
	  	END IF;
	END IF;

	  e <= b XOR r;
END PROCESS;

END Behaviour_Teppner2012;
