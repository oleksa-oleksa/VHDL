LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- D-FlipFlop
-- Write by Oleksandra Baga, 17.04.2017.

ENTITY dFF IS
  PORT (
     D : IN STD_LOGIC;
     Clock : IN STD_LOGIC;
     Ql, nQl : OUT STD_LOGIC
     );
END dFF;

ARCHITECTURE dFF_Struct OF dFF IS
COMPONENT rsff_nor IS
PORT (
      R, S : IN STD_LOGIC;
      Q, nQ : OUT STD_LOGIC
    );
END COMPONENT rsff_nor;

SIGNAL nCl, Tick, nD, S_sig, R_sig : STD_LOGIC;

BEGIN

Tick <= nCL AND Clock;
nCl <= NOT Clock AFTER 10ps;
nD <= NOT D;
R_sig <= nD AND Tick;
S_sig <= D AND Tick;

DFF_Signal: rsff_nor
PORT MAP (R_sig, S_sig, Ql, nQl);

END dFF_Struct;