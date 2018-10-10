LIBRARY ieee;
USE ieee.std_logic_1164.all;
 
ENTITY tb_full_adder Is
END tb_full_adder;
 
ARCHITECTURE behavior OF tb_full_adder Is
 
 COMPONENT full_adder
PORT( x, y, ci:  IN std_logic;
          c, s:  OUT std_logic);
END COMPONENT;

 signal x : std_logic := '0';
 signal y : std_logic := '0';
 signal ci : std_logic := '0';

 signal s : std_logic;
 signal c : std_logic;
 
BEGIN
 
 dut: full_adder PORT MAP (
 x => x,
 y => y,
 ci => ci,
 s => s,
 c => c
 );
 
-- stimulus process
stim_proc: process
BEGIN
wait for 100 ns; 

x <= '1';
y <= '0';
ci <= '0';
wait for 10 ns;

x <= '0';
y <= '1';
ci <= '0';
wait for 10 ns;

x <= '1';
y <= '1';
ci <= '0';
wait for 10 ns;

x <= '0';
y <= '0';
ci <= '1';
wait for 10 ns;

x <= '1';
y <= '0';
ci <= '1';
wait for 10 ns;

x <= '0';
y <= '1';
ci <= '1';
wait for 10 ns;

x <= '1';
y <= '1';
ci <= '1';
wait for 10 ns;

end process;
 
END;