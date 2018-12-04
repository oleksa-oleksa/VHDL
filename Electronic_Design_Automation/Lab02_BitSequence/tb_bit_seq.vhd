library ieee;
use ieee.std_logic_1164.all;

entity tb_bit_seq is
end tb_bit_seq;

-------------------------------

architecture test of tb_bit_seq is

   component bit_seq_ff_v2
   port
   (
      clk, rst :  in std_logic;
      x        :  in std_logic;
      y        : out std_logic
   );
   end component;

   signal clk, rst, x, y  :std_logic;

begin

   dut: bit_seq_ff_v2
   port map
   (
      clk, rst, x, y
   );

   process
   begin
      clk <= '0'; wait for 5 ns;
      clk <= '1'; wait for 5 ns;
   end process;

   rst   <= '1' after   0 ns, '0' after   4 ns;
   x     <= '1' after   0 ns, '0' after  50 ns,
            '0' after  60 ns, '0' after  70 ns,
            '0' after  80 ns, '1' after 100 ns,
            '0' after 110 ns, '1' after 120 ns;


end test;

