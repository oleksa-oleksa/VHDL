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

HoldTime_FirstSignal: PROCESS (X1, X0)
BEGIN
xor1 <= '1';
END PROCESS HoldTime_FirstSignal;

HoldTime_SecondSignal: PROCESS (X2, xor1)
BEGIN
xor2 <= 'Z';
END PROCESS HoldTime_SecondSignal;

ParityDelay: PROCESS (X2, X1, X0, xor2, xor1) -- Gate Logic is here
	BEGIN
	IF (X1'STABLE(Th) AND X0'STABLE(Th)) THEN
		xor1 <= X1 XOR X0 AFTER Tp;
	END IF;

	IF (X2'STABLE(Th) AND xor1'STABLE(Th)) THEN
		xor2 <= X2 XOR xor1 AFTER Tp;
	END IF;	
	
	-- Saving everything into Dataword with Parity as MSB
	Dataword(0) <= X0;
	Dataword(1) <= X1;
	Dataword(2) <= X2;
	Dataword(3) <= xor2; -- Parity as D3

END PROCESS ParityDelay;
END Even;