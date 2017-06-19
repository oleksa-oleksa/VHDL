LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY parityWithDelay IS

GENERIC ( Th : TIME := 3 ns;
          Tp : TIME := 5 ns
);
PORT
(
   X2, X1, X0 : IN STD_LOGIC; 
   Dataword   : OUT STD_LOGIC_VECTOR(3 DOWNTO 0) 
);

END parityWithDelay;

ARCHITECTURE Even OF parityWithDelay IS

SIGNAL xor2, xor1 : STD_LOGIC; 

BEGIN

ParityDelay: PROCESS  -- Using wait for detecting events
BEGIN

WAIT ON X2, X1, X0;

-- Saving everything into Dataword with Parity as MSB
Dataword(0) <= X0;
Dataword(1) <= X1;
Dataword(2) <= X2; 


IF (X1'EVENT OR X0'EVENT) THEN
	xor2 <= 'X';
	Dataword(3) <= xor2; -- Parity as D3
	WAIT FOR Th;
	
	IF (X1'LAST_EVENT >= Th AND X0'LAST_EVENT >= Th) THEN
		xor2 <= X1 XOR X0 AFTER Tp;
		WAIT FOR Tp;
		Dataword(3) <= xor2; -- Parity as D3
		
		
	END IF;
END IF;




END PROCESS ParityDelay;
END Even;