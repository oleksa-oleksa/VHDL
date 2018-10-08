LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY rsff_nor IS
PORT (
      R, S : IN STD_LOGIC;
      Q, nQ : OUT STD_LOGIC
    );
END rsff_nor;

ARCHITECTURE rs_ff_nor OF rsff_nor IS

SIGNAL nor1, nor2 : STD_LOGIC;

BEGIN

nor1 <= NOT (S OR nor2);
nor2 <= NOT (R OR nor1);
Q <= nor2;
nQ <= nor1;

END rs_ff_nor;
