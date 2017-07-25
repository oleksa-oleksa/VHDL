LIBRARY ieee;
use ieee.std_logic_1164.all;

ENTITY examTimeLineTraining IS
END examTimeLineTraining;

ARCHITECTURE Behaviour_Teppner2006 OF examTimeLineTraining IS
SIGNAL a, b, d, e, g, clk : std_logic := '0';

BEGIN
a <= '1' AFTER 15 ns, '0' AFTER 20 ns, '1' AFTER 50 ns, '0' AFTER 60 ns, '1' AFTER 70 ns;
-- clk wave is added in ModelSim 
g <= '0' AFTER 0 ns, '1' AFTER 25 ns;

PROCESS (clk)	
VARIABLE c : std_logic;
	BEGIN
	  IF g = '1' THEN
		c := NOT a;
		d <= c;
		b <= d;
	  ELSE
		c := a;
		b <= c;
		d <= b;
	  END IF;

	  e <= c OR d AFTER 9

 ns;
END PROCESS;

END Behaviour_Teppner2006;
