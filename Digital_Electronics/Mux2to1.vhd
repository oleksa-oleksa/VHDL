LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Mux2to1 IS
 PORT (IA, IB, S, En : IN BIT;
        Y1, Y2, Y3 : OUT BIT      
);
END Mux2to1;

ARCHITECTURE Mux of Mux2to1 IS

BEGIN 

-- unbedingte Signalzuweisung
Y1 <= (IA AND NOT EN AND NOT S) OR (IB AND NOT EN AND S);

-- selektive 
WITH S SELECT
Y2 <= (IA AND NOT EN) WHEN '0',
      (IB AND NOT EN) WHEN '1';

-- bedingte
Y3 <= (IA AND NOT EN) WHEN S = '0' ELSE
      (IB AND NOT EN);

END Mux;