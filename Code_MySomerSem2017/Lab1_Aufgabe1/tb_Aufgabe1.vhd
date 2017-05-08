ENTITY tb_Aufgabe1 IS
END tb_Aufgabe1;

ARCHITECTURE testbench OF tb_Aufgabe1 IS

	COMPONENT Aufgabe1
	PORT
	(
		IA, IB : IN bit;
		S : IN bit;
		E : IN bit;
		Y1, Y2, Y3 : OUT bit
	);
	END COMPONENT;
	
	SIGNAL IA : bit :='0';
	SIGNAL IB : bit :='0';
	SIGNAL S : bit :='0';
	SIGNAL E : bit :='0';
	SIGNAL Y1 : bit;
	SIGNAL Y2 : bit;
	SIGNAL Y3 : bit;
	
BEGIN
	
	dut: Aufgabe1						-- device under test
	PORT MAP
	(
		IA => IA,
		IB => IB,
		S => S,
		E => E,
		Y1 => Y1,
		Y2 => Y2,
		Y3 => Y3
	);
	
E <= '0' AFTER 0 ns, '1' AFTER 80 ns, '0' AFTER 100 ns;
S <= '1' AFTER 0 ns, '0' AFTER 25 ns, '1' AFTER 50 ns, '0' AFTER 75 ns, '1' AFTER 100 ns, '0' AFTER 125 ns;
IA <= '0' AFTER 0 ns, '1' AFTER 40 ns, '0' AFTER 120 ns;
IB <= '0' AFTER 0 ns, '1' AFTER 60 ns, '0' AFTER 150 ns;

END testbench;