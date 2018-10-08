ENTITY mult2to1 IS
	PORT
	( 
	 IA, IB	: IN  bit;
	 S : IN  bit;
	 E : IN  bit;
	 Y : OUT bit
	);
END mult2to1;

ARCHITECTURE Mux OF mult2to1 IS

BEGIN

-- 2. Variante
	WITH S SELECT
	Y <= (IA AND NOT E) WHEN '0',
			(IB AND NOT E) WHEN '1';
END Mux;