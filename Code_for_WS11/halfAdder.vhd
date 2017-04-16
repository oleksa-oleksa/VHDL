LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY halfAdder IS
PORT (bitA, bitB : IN std_logic; 
      sum, carry : OUT std_logic
     );
END halfAdder;

ARCHITECTURE add OF halfAdder IS
BEGIN
  sum <= (NOT bitA AND bitB) OR (bitA AND (NOT bitB));
  carry <= (bitA AND bitB);

END add;
