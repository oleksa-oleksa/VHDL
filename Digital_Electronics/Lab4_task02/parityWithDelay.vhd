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

HoldTime_FirstSignal: PROCESS
BEGIN
WAIT ON X1, X0;
xor1 <= 'X';

WAIT UNTIL (X1'STABLE(Th) AND X0'STABLE(Th));
xor1 <= X1 XOR X0 AFTER Tp;
END PROCESS HoldTime_FirstSignal;

HoldTime_SecondSignal: PROCESS 
BEGIN
WAIT ON X2, xor1;
xor2 <= 'X';

WAIT UNTIL (X2'STABLE(Th) AND xor1'STABLE(Th));
xor2 <= X2 XOR xor1 AFTER Tp;
END PROCESS HoldTime_SecondSignal;

ParityDelay: PROCESS (X2, X1, X0, xor2, xor1) -- Gate Logic is here
BEGIN

-- Saving everything into Dataword with Parity as MSB
Dataword(0) <= X0;
Dataword(1) <= X1;
Dataword(2) <= X2;
Dataword(3) <= xor2; -- Parity as D3

END PROCESS ParityDelay;
END Even;