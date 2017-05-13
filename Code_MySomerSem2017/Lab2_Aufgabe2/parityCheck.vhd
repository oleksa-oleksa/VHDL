LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY parityCheck IS
PORT
(
  	Dataword   : IN bit_vector(3 DOWNTO 0); -- three switches put the bit directly into array
	isBrocken  : OUT BIT 
);
END parityCheck;

ARCHITECTURE evenParCheck OF parityCheck IS

SIGNAL xor1, Parity : BIT;

BEGIN
   -- calculating expected paritybit
	xor1 <= Dataword(0) XOR Dataword(1); 
	Parity <= xor1 XOR Dataword(2); -- holds the calculated paritybit of dataword (1 or 0)
	
	-- Compare the existing parity with calculated
	-- XOR for detection the error
	-- if XOR2 != Dataword(3) ==> 1 else 0 (no error)
	
	isBrocken <= Dataword(3) XOR Parity;
	
	
END evenParCheck;