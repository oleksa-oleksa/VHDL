library ieee;
use ieee.std_logic_1164.all;

entity tb_one_bit_reg is
end tb_one_bit_reg;

-------------------------------

architecture test of tb_one_bit_reg is

   component one_bit_reg

   port
   (
      ld, clr, clk   :  in std_logic;
      d_0            :  in std_logic;
      q_0            : out std_logic
   );
   end component;

   signal ld, clr, clk, d_0   : std_logic;
   signal q_0                 : std_logic;

begin

   dut: one_bit_reg
   port map
   (
      ld, clr, clk, d_0, q_0
   );

   clk_signal : process
   begin
      clk   <= '0';
      wait for 5 ns;
      clk   <= '1';
      wait for 5 ns;
   end process;

   clr   <= '0' after   0 ns, '1' after   2 ns,
            '0' after  15 ns;
   ld    <= '1' after   0 ns, '0' after  10 ns,
            '1' after  35 ns, '0' after 140 ns;
   d_0   <= '0' after   0 ns, '1' after   7 ns,
            '0' after  17 ns, '1' after  26 ns, 
            '0' after  40 ns, '1' after  52 ns, 
            '0' after  59 ns, '1' after  66 ns, 
            '0' after  78 ns, '1' after  86 ns, 
            '0' after 100 ns, '1' after 110 ns, 
            '0' after 120 ns, '1' after 130 ns, 
            '0' after 140 ns, '1' after 150 ns, 
            '0' after 160 ns, '1' after 170 ns;


end test;

