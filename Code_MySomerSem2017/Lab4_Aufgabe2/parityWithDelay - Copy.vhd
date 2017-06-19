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

SIGNAL xor1_tmp, xor1, xor2_tmp, xor2 : STD_LOGIC := 'X'; -- unknown. Impossible to determine this value/result.
BEGIN

CalculatingParity: PROCESS (X0, X1, X2) 
BEGIN
	-- If signal has been stable for Hold Time ns, xor evaluates.
	IF (X0'LAST_EVENT >= Th AND X1'LAST_EVENT >= Th) THEN
		xor1 <= X0 XOR X1 AFTER Tp;

	-- evaluates every delta 
	ELSIF (X0'LAST_EVENT < Th OR X1'LAST_EVENT < Th) THEN
		xor1 <= 'X';
	END IF;

	IF (X2'LAST_EVENT >= Th AND xor1'LAST_EVENT >= Th) THEN
		xor2 <= X2 XOR xor1 AFTER Tp; 

	ELSIF (X0'LAST_EVENT < Th OR X1'LAST_EVENT < Th) THEN
		xor2 <= 'X';
	END IF;

END PROCESS CalculatingParity;

DataSaving: PROCESS (X0, X1, X2, xor1, xor2)
BEGIN
-- Saving everything into Dataword with Parity as MSB
	Dataword(0) <= X0;
	Dataword(1) <= X1;
	Dataword(2) <= X2; --| Eingangssignale als Datenwort
	Dataword(3) <= xor2; -- Parity as D3
END PROCESS DataSaving;

END Even;