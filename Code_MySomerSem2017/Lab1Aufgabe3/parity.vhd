LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY parity IS
PORT
(
   X2, X1, X0 : IN bit; -- X2 = AC27, X1 = AC28, X0 = AB28
	Dataword   : OUT bit_vector(3 DOWNTO 0) -- (3) = E24, (2) = E25, (1) = E22, (0) = E21
);
END parity;

ARCHITECTURE Odd OF parity IS

SIGNAL xor1, xor2 : bit;

BEGIN
   xor1 <= X0 XOR X1; 
	xor2 <= xor1 XOR X2; -- Parity bilden
	
	-- alternativ: Dataword <= xor2 & X2 & X1 & X0
	Dataword(0) <= X0;
	Dataword(1) <= X1;
	Dataword(2) <= X2; --| Eingangssignale als Datenwort und
	Dataword(3) <= xor2; --| Parity am Datenwort anhaengen
	
END Odd;