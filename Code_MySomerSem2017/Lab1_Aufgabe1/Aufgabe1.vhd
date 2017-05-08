ENTITY Aufgabe1 IS
	PORT
	( 
		IA, IB		: IN  bit;
		S				: IN  bit;
		E				: IN  bit;
		Y1, Y2, Y3	: OUT bit
	);
END Aufgabe1;

ARCHITECTURE Mux OF Aufgabe1 IS

BEGIN

-- 1. VAriante
	Y1 <=	(IA AND NOT E AND NOT S) OR
			(IB AND NOT E AND S );
			
-- 2. Variante
	WITH S SELECT
	Y2 <= (IA AND NOT E) WHEN '0',
			(IB AND NOT E) WHEN '1';
			
-- 3. Variante
	Y3 <= (IA AND NOT E) WHEN S='0' ELSE
			(IB AND NOT E);
END Mux;