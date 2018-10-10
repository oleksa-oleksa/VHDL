LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;

ENTITY Segdis IS
PORT( B0, B1, B2, B3:  IN std_logic;
	 A, B, C, D, E, F, G:  OUT std_logic);
END Segdis;

ARCHITECTURE Segdis_behavior OF Segdis IS
BEGIN
   A <= not ( B0 OR B2 OR (B1 AND B3) OR (NOT B1 AND NOT B3) );
   B <= not ( (NOT B1) OR (NOT B2 AND NOT B3) OR (B2 AND B3) );
   C <= not ( B1 OR NOT B2 OR B3 );
   D <= not ( (NOT B1 AND NOT B3) OR (B2 AND NOT B3) OR (B1 AND NOT B2 AND B3) OR (NOT B1 AND B2) OR B0 );
   E <= not ( (NOT B1 AND NOT B3) OR (B2 AND NOT B3) );
   F <= not ( B0 OR (NOT B2 AND NOT B3) OR (B1 AND NOT B2) OR (B1  AND NOT B3));
   G <= not ( B0 OR (B1 AND NOT B2) OR (NOT B1 AND B2) OR (B2  AND NOT B3));
END Segdis_behavior;