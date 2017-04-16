-- It is an old lab task from WS 2011-2012 an Beuth Hochshule Berlin
-- Code using Component

-- Write by Oleksandra Baga, 16.04.2017.

-- The main programm.
-- Parallel Adder using 3 Half Adders.
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY parallelAdder IS
   PORT ( A1, A0, B1, B0 : IN std_logic;
         S2, S1, S0 : OUT std_logic
         );
END parallelAdder;

ARCHITECTURE STRUCTURE OF parallelAdder IS
   COMPONENT halfAdder
     PORT (bitA, bitB : IN std_logic;
           sum, carry : OUT std_logic
          );
   END COMPONENT;

   SIGNAL H0, C0, H1, C1, H2 : std_logic;

   BEGIN

   S0_res : halfAdder
   PORT MAP (
      bitA => A0,
      bitB => B0,
      sum => H0,
      carry => C0
     );

   S0 <= H0;

   S1_res_H1 : halfAdder
   PORT MAP (
      bitA => A1,
      bitB => B1,
      sum => H1,
      carry => C1
     );

   S1_res : halfAdder
   PORT MAP (
       bitA => C0,
       bitB => H1,
       sum => S1,
       carry => H2
      );

   S2_res: halfAdder
   PORT MAP (
       bitA => H2,
       bitB => C1,
       sum => S2
       );

END STRUCTURE;
