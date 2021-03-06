LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY halfAdderNAND IS
PORT (bitA, bitB : IN std_logic; 
      sum, carry : OUT std_logic
     );
END halfAdderNAND;

ARCHITECTURE add OF halfAdderNAND IS
BEGIN
  sum <= ((NOT bitA) NAND bitB) NAND (bitA NAND (NOT bitB));
  carry <= NOT (bitA NAND bitB);

END add;
