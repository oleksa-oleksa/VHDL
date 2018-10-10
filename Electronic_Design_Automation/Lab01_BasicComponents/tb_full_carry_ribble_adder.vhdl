LIBRARY ieee;
USE ieee.std_logic_1164.all;
 
ENTITY tb_full_carry_ribble_adder Is
END tb_full_carry_ribble_adder;
 
ARCHITECTURE behavior OF tb_full_carry_ribble_adder Is
 
COMPONENT full_carry_ribble_adder
PORT(  x:  IN std_logic_vector(3 downto 0);
       y:  IN std_logic_vector(3 downto 0);
      as:  IN std_logic;
    over:  OUT std_logic;
       c:  OUT std_logic;
       s:  OUT std_logic_vector(3 downto 0));
END COMPONENT;

signal x : std_logic_vector(3 downto 0) := (others => 'U');
signal y : std_logic_vector(3 downto 0) := (others => 'U');

signal as: std_logic := 'U';
signal over: std_logic := 'U';
signal c : std_logic := 'U';

signal s : std_logic_vector(3 downto 0) := (others => 'U');

BEGIN

 dut: full_carry_ribble_adder PORT MAP (
 x => x,
 y => y,
 as => as,
 over => over,
 c => c,
 s => s
 );

-- stimulus process
stim_proc: process
BEGIN
wait for 20 ns; 
-- add
x <= "0001";
y <= "0001";
as <= '0';
wait for 10 ns;

x <= "0001";
y <= "0010";
as <= '0';
wait for 10 ns;

x <= "0001";
y <= "0101";
as <= '0';
wait for 10 ns;

x <= "0111";
y <= "0001";
as <= '0';
wait for 10 ns;

x <= "0011";
y <= "0001";
as <= '0';
wait for 10 ns;

x <= "1001";
y <= "0101";
as <= '0';
wait for 10 ns;

-- sub

x <= "0101";
y <= "0001";
as <= '1';
wait for 10 ns;

x <= "0001";
y <= "1100";
as <= '1';
wait for 10 ns;

x <= "1100";
y <= "0010";
as <= '1';
wait for 10 ns;

x <= "0001";
y <= "0101";
as <= '1';
wait for 10 ns;

x <= "0110";
y <= "1111";
as <= '1';
wait for 10 ns;

end process;
 
END;