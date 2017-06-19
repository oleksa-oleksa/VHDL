library ieee;
use ieee.std_logic_1164.all;

entity tb_delta is
end tb_delta;

architecture testb of tb_delta is

   component delta
      port
      (
         x     : in  std_logic;
         clk   : in  std_logic;
         reset : in  std_logic;
         y     : out std_logic
      );
   end component;

   signal x, clk, reset    : std_logic;
   signal y                : std_logic:='0';

begin
   dut: delta
   port map(x, clk, reset, y);

   clock: process
   begin
      clk <= '0'; wait for 50 ps;
      clk <= '1'; wait for 50 ps;
   end process clock;

   stimulus: process
   begin
      reset <= '1'; x <= '0';  wait for 40 ps;
      reset <= '1'; x <= '1';  wait for 40 ps;
      reset <= '1'; x <= '0';  wait for 40 ps;
      reset <= '1'; x <= '1';  wait for 40 ps;        -- after 160ps, Reset 1 -> 0

      reset <= '0'; x <= '0';  wait for 40 ps;
      reset <= '0'; x <= '1';  wait for 40 ps;
      reset <= '0'; x <= '0';  wait for 40 ps;
      reset <= '0'; x <= '1';  wait for 40 ps;

      reset <= '0'; x <= '0';  wait for 40 ps;
      reset <= '0'; x <= '1';  wait for 40 ps;
      reset <= '0'; x <= '0';  wait for 40 ps;
      reset <= '0'; x <= '1';  wait for 40 ps;
     
   end process stimulus;

end testb;
