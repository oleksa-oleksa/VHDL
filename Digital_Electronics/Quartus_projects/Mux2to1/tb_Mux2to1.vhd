ENTITY tb_Mux2to1 IS
END;

ARCHITECTURE testbench OF tb_Mux2to1 IS
 COMPONENT Mux2to1 
    PORT (IA, IB, S, En : IN BIT;
        Y1, Y2, Y3 : OUT BIT      
       );
 END COMPONENT;

SIGNAL IA : bit := '0'; --Input Stimul
SIGNAL IB : bit := '0';
SIGNAL S : bit := '0';
SIGNAL En : bit := '0';
SIGNAL Y1 : bit;
SIGNAL Y2 : bit;
SIGNAL Y3 : bit;

BEGIN

dut: Mux2to1
PORT MAP (
  IA => IA,
  IB => IB,
  S => S,
  En => En,
  Y1 => Y1,
  Y2 => Y2,
  Y3 => Y3
   );

IA <= '0' AFTER 0ns, '1' AFTER 40ns, '1' AFTER 80ns, '0' AFTER 120ns;
IB <= '1' AFTER 0ns, '0' AFTER 5ns, '1' AFTER 75ns, '0' AFTER 100ns;
En <= '1' AFTER 0ns, '0' AFTER 20ns, '1' AFTER 130ns;
S <= '1' AFTER 0ns, '0' AFTER 25ns, '1' AFTER 50ns, '0' AFTER 80ns, '1' AFTER 100ns, '0' AFTER 115ns;

END testbench;
