LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY parityWithDelay IS

GENERIC ( Th : TIME := 3 ns;
          Tp : TIME := 5 ns
);
PORT
(
   X2, X1, X0 : IN STD_LOGIC; -- X2 = AC27, X1 = AC28, X0 = AB28
   Dataword   : OUT STD_LOGIC_VECTOR(3 DOWNTO 0) -- (3) = E24, (2) = E25, (1) = E22, (0) = E21
);
END parityWithDelay;

ARCHITECTURE Even OF parityWithDelay IS

SIGNAL xor1, xor2 : STD_LOGIC := 'X'; -- unknown. Impossible to determine this value/result.
BEGIN

-- WAIT FOR is not synthesisable - SOLUTION IS REJECTED

ParityCreator: PROCESS -- Wait statement is illegal for sensivity list. 
	BEGIN

   	Dataword(0) <= X0;
	Dataword(1) <= X1;
	Dataword(2) <= X2; --| Eingangssignale als Datenwort
 
	WAIT FOR Th; -- HOLD TIME 3 ns
	xor1 <= X0 XOR X1 AFTER Tp; -- Propagation Delay 5 ns
	WAIT FOR Th; -- 3 ns
	xor2 <= xor1 XOR X2 AFTER Tp; -- 5 ns
	Dataword(3) <= xor2; --| Parity as D3


	
	
	
	END PROCESS ParityCreator;
END Even;