library ieee;
use ieee.std_logic_1164.all;

entity tb_codierer is
end tb_codierer;

-------------------------------

architecture test of tb_codierer is

   component codierer
      port
      (
         clk, clr, ld   :  in std_logic;
         input          :  in std_logic_vector(3 downto 0);
         output         : out std_logic_vector(6 downto 0)
      );
   end component;

   signal clk, clr, ld : std_logic;
   signal input  : std_logic_vector(3 downto 0);
   signal output : std_logic_vector(6 downto 0);

begin

   dut: codierer
   port map
   (
      clk, clr, ld, input, output
   );

   process
   begin
      clk <= '0'; wait for 5 ns;
      clk <= '1'; wait for 5 ns;
   end process;
   clr <= '1' after   0 ns, '0' after  4 ns;
   ld  <= '1' after   0 ns, '0' after 17 ns;
   input <= "0011" after 0 ns;


end test;

