LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Comparator3Bit IS
PORT ( A : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
       B : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
       Gr, Ls, Eq : OUT STD_LOGIC
      );

END Comparator3Bit;

ARCHITECTURE Compare3Bit OF Comparator3Bit IS
BEGIN

Eq <=
NOT ((NOT ((NOT A(2)) AND (NOT A(1)) AND (NOT A(0)) AND (NOT B(2)) AND (NOT B(1)) AND (NOT B(0)))) AND
(NOT ((NOT A(2)) AND (NOT A(1)) AND A(0) AND (NOT B(2)) AND (NOT B(1)) AND B(0))) AND
(NOT ((NOT A(2)) AND A(1) AND (NOT A(0)) AND (NOT B(2)) AND B(1) AND (NOT B(0)))) AND
(NOT ((NOT A(2)) AND A(1) AND A(0) AND (NOT B(2)) AND B(1) AND B(0))) AND
(NOT (A(2) AND (NOT A(1)) AND (NOT A(0)) AND B(2) AND (NOT B(1)) AND (NOT B(0)))) AND
(NOT (A(2) AND (NOT A(1)) AND A(0) AND B(2) AND (NOT B(1)) AND B(0))) AND
(NOT (A(2) AND A(1) AND (NOT A(0)) AND B(2) AND B(1) AND (NOT B(0)))) AND
(NOT (A(2) AND A(1) AND A(0) AND B(2) AND B(1) AND B(0))));

Gr <= 
NOT ((NOT(A(1) AND (NOT B(2)) AND (NOT B(1)) AND B(0))) AND
(NOT (NOT (A(1)) AND (NOT B(2)) AND B(1) AND (NOT B(0)))) AND
(NOT (A(2) AND (NOT A(1)) AND (NOT B(2)) AND B(0))) AND
(NOT (A(2) AND (NOT A(0)) AND (NOT B(2)) AND B(0))) AND
(NOT (A(2) AND (NOT A(0)) AND (NOT B(2)) AND B(1))) AND
(NOT (A(2) AND A(0) AND (NOT B(2)) AND (NOT B(0)))) AND
(NOT (A(2) AND A(0) AND (NOT B(1)) AND (NOT B(0)))) AND
(NOT (A(2) AND A(1) AND (NOT B(2)) AND (NOT B(1)))) AND
(NOT (A(2) AND A(1) AND (NOT B(2)) AND (NOT B(0)))) AND
(NOT (A(2) AND A(1) AND (NOT B(1)) AND (NOT B(0)))) AND
(NOT (A(2) AND (NOT B(2)) AND B(1) AND B(0))) AND
(NOT (A(2) AND A(0) AND (NOT B(2)) AND B(0))) AND
(NOT (A(2) AND A(1) AND (NOT B(2)) AND B(0))) AND
(NOT (A(2) AND A(1) AND (NOT B(2)) AND B(1))) AND
(NOT (A(2) AND A(1) AND B(2) AND (NOT B(1)))) AND
(NOT (A(2) AND A(1) AND A(0) AND (NOT B(2)))) AND
(NOT (A(2) AND A(1) AND A(0) AND (NOT B(0)))));

Ls <= NOT ((NOT Gr) NAND (NOT Eq));

END Compare3Bit;
