LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- It is an old lab task from WS 2011-2012 an Beuth Hochschule Berlin
-- Code using Vector

-- Write by Oleksandra Baga, 16.04.2017.

-- The main programm.
-- Parallel Adder using 3 Half Adders.

ENTITY parallelAdderVector IS
PORT ( A : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
       B : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
       S : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
     );
END parallelAdderVector;

ARCHITECTURE STRUCTURE OF parallelAdderVector IS 
COMPONENT halfAdderNAND IS
  PORT (
       bitA, bitB : IN STD_LOGIC;
       sum, carry : OUT STD_LOGIC
       );

END COMPONENT;

SIGNAL H0, C0, H1, C1, H2 : STD_LOGIC;

BEGIN
 S0_res : halfAdderNAND
 PORT MAP ( 
         bitA => A(0),
         bitB => B(0),
         sum => H0,
         carry => C0
           );

 S(0) <= H0;

 S1_res_H1 : halfAdderNAND
 PORT MAP ( 
         bitA => A(1),
         bitB => B(1),
         sum => H1,
         carry => C1
           );

 S1_res : halfAdderNAND
 PORT MAP ( 
         bitA => C0,
         bitB => H1,
         sum => S(1),
         carry => H2
           );

 S2_res : halfAdderNAND
 PORT MAP ( 
         bitA => H2,
         bitB => C1,
         sum => S(2)
         );

END STRUCTURE;