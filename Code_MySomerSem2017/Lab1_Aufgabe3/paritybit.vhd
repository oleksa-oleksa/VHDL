LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY paritybit IS
PORT
(
   X2, X1, X0 : IN bit;
	Dataword   : OUT bit_vector(3 DOWNTO 0)
);
END paritybit;

ARCHITECTURE Odd OF paritybit

SIGNAL xor1, xor2 : bit;

BEGIN
   xor1 <= X0 XOR X1; 
	xor2 <= xor1 XOR X2; -- Parity bilden
	
	Dataword(0) <= X0;
	Dataword(1) <= X1;
	Dataword(2) <= X2; --| Eingangssignale als Datenwort und
	Dataword(3) <= xor2; --| Parity am Datenwort anhaengen
	
END Odd;