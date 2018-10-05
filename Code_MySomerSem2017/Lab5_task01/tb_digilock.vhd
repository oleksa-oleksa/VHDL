library ieee;
use ieee.std_logic_1164.all;

entity tb_digilock is
end tb_digilock;

architecture testbench of tb_digilock is
   component digilock
      port
      (
         x     : in  std_logic;
         clk   : in  std_logic;
         reset : in  std_logic;
         lock  : out std_logic;
         alarm : out std_logic
      );
   end component;

   signal x, clk, alarm   : std_logic := '0';
   signal lock, reset     : std_logic := '1';

begin

   dut: digilock
   port map ( x, clk, reset, lock, alarm);

   clock: process
   begin
      clk <= '0'; wait for 25 ns;
      clk <= '1'; wait for 25 ns;
   end process clock;

   stimulus: process
   begin
      reset <= '1';           wait for 20 ns;
      reset <= '0'; x <= '1'; wait for 50 ns;
                    x <= '1'; wait for 50 ns;
                    x <= '1'; wait for 50 ns;
                    x <= '0'; wait for 50 ns;
                    x <= '1'; wait for 50 ns;
                    x <= '1'; wait for 50 ns;
                    x <= '0'; wait for 50 ns;

   end process stimulus;
end testbench;
