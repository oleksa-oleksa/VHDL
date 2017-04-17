LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY parityBitOdd3Bits IS
PORT (
      X2, X1, X0 : IN BIT;
      Dataword : OUT BIT_VECTOR(3 DOWNTO 0)
      );
END parityBitOdd3Bits;

ARCHITECTURE Odd OF parityBitOdd3Bits IS
SIGNAL xor1, xor2 : BIT;

BEGIN

Dataword(0) <= X0;
xor1 <= X0 XOR X1;
Dataword(1) <= X1;
xor2 <= xor1 XOR X2;
Dataword(2) <= X2;
Dataword(3) <= NOT xor2;

END Odd;
