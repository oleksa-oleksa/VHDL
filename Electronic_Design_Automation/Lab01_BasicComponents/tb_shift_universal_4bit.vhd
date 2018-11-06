library ieee;
use ieee.std_logic_1164.all;

entity tb_universal_4bit is
end tb_universal_4bit;

-------------------------------

architecture test of tb_universal_4bit is

   component universal_4bit
      port
      (
         s           :  in std_logic_vector( 1 downto 0 );              -- switch mode
         p           :  in std_logic_vector( 3 downto 0 );              -- parallel input
         shr, shl    :  in std_logic;                                   -- shift right, shift left
         clk, rst    :  in std_logic;                                   -- clock, reset

         q           : out std_logic_vector( 3 downto 0 )               -- output
      );
   end component;

   signal p                   : std_logic_vector( 3 downto 0 );
   signal q                   : std_logic_vector( 3 downto 0 );
   signal s                   : std_logic_vector( 1 downto 0 );
   signal shr, shl, clk, rst  : std_logic;

begin

   dut: universal_4bit
   port map
   (
      s, p, shr, shl, clk, rst, q
   );

   process                                                           -- clk signal
   begin
      clk <= '0';
      wait for 5 ns;
      clk <= '1';
      wait for 5 ns;
   end process;

   rst   <= '1'      after   0 ns, '0'    after   4 ns;
   s     <= "11"     after   5 ns, "01"   after  13 ns,
            "10"     after  33 ns, "00"   after  50 ns;
   shr   <= '0'      after   0 ns, '1'    after   5 ns,
            '0'      after  23 ns;
   shl   <= '0'      after   0 ns, '1'    after  18 ns,
            '0'      after  43 ns;
   p     <= "1001"   after   0 ns;


end test;

