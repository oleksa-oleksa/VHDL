LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- bei fallende flanke

ENTITY rsff_nand IS
PORT (
      nS, nR : IN STD_LOGIC;
      Q, nQ : OUT STD_LOGIC
);
END ENTITY rsff_nand;

ARCHITECTURE nRS_FF OF rsff_nand IS
SIGNAL nand1, nand2 : STD_LOGIC;

BEGIN
nand1 <= NOT (nS AND nand2);
nand2 <= NOT (nR AND nand1);
Q <= nand1;
nQ <= nand2;

END nRS_FF;
