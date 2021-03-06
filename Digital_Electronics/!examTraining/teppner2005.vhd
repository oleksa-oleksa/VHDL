LIBRARY ieee;
use ieee.std_logic_1164.all;

ENTITY examTimeLineTraining IS
PORT ( 
	port1 : IN std_logic;
	port_out : OUT std_logic);
END examTimeLineTraining;

ARCHITECTURE Behaviour_Teppner2005 OF examTimeLineTraining IS
SIGNAL a, c, d, e, clk : std_logic := '0';

BEGIN
a <= '1' AFTER 5 ns, '0' AFTER 25 ns, '1' AFTER 35 ns, '0' AFTER 45 ns;
clk <= NOT clk AFTER 10 ns;

PROCESS (clk)	
VARIABLE b : std_logic;
	BEGIN
	  b := a;
	  c <= b;
	  d <= c;
	  e <= b AND d;
END PROCESS;

END Behaviour_Teppner2005;

