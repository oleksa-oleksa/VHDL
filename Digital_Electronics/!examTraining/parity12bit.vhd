LIBRARY ieee;
use ieee.std_logic_1164.all;

ENTITY parity12bit is
PORT ( dataword : in std_logic_vector(11 downto 0);
	clk : in std_logic;
       parity : out std_logic
);
END parity12bit;

ARCHITECTURE Even of parity12bit IS
SIGNAL xor1 : std_logic;
BEGIN -- arc

PROCESS(clk)
BEGIN
xor1 <= dataword(0);
FOR i in 1 to 11 loop	
  xor1 <= xor1 XOR dataword(i);

END LOOP;
parity <=  xor1; 
END process; -- Process
END Even;
