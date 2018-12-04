library ieee;
use ieee.std_logic_1164.all;

entity tb_aiken_gray is
end tb_aiken_gray;

-------------------------------

architecture test of tb_aiken_gray is

   component bcd_to_gray
      port
      (
         bcd_in      :  in std_logic_vector(3 downto 0);
         gray_out    : out std_logic_vector(3 downto 0)
      );
   end component;

   signal bcd_in, aiken_out : std_logic_vector(3 downto 0);

begin

   dut: bcd_to_gray
   port map
   (
      bcd_in, aiken_out
   );

   bcd_in <= "0000" after   0 ns, "0001" after  10 ns,
             "0010" after  20 ns, "0011" after  30 ns,
             "0100" after  40 ns, "0101" after  50 ns,
             "0110" after  60 ns, "0111" after  70 ns,
             "1000" after  80 ns, "1001" after  90 ns,
             "1010" after 100 ns, "1011" after 110 ns,
             "1100" after 120 ns, "1101" after 130 ns,
             "1110" after 140 ns, "1111" after 150 ns;

end test;

