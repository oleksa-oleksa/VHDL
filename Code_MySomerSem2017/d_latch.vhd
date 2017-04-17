LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Transparent D-Latch
-- Write by Oleksandra Baga, 17.04.2017.

ENTITY dLatch IS
  PORT (
     D : IN STD_LOGIC;
     Clock : IN STD_LOGIC;
     Ql, nQl : OUT STD_LOGIC
     );
END dLatch;

ARCHITECTURE dLatch_Struct OF dLatch IS
COMPONENT rsff_nor IS
PORT (
      R, S : IN STD_LOGIC;
      Q, nQ : OUT STD_LOGIC
    );
END COMPONENT rsff_nor;

SIGNAL nD, S_sig, R_sig : STD_LOGIC;

BEGIN

nD <= NOT D;
R_sig <= nD AND Clock;
S_sig <= D AND Clock;

DLatch_Signal: rsff_nor
PORT MAP (R_sig, S_sig, Ql, nQl);

END dLatch_Struct;
