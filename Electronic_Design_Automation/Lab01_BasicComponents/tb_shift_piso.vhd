library ieee;
use ieee.std_logic_1164.all;

entity tb_piso is
end tb_piso;

-------------------------------

architecture test of tb_piso is

   component piso
   port
   (
      clk, clr       :  in std_logic;
      d              :  in std_logic_vector( 3 downto 0 );
      q_out          : out std_logic
   );
   end component;

   signal clk, clr, q_out     : std_logic;
   signal d                   : std_logic_vector( 3 downto 0 );

begin

   dut: piso
   port map
   (
      clk, clr, d, q_out
   );

   process  -- clk signal
   begin
      clk <= '0'; wait for 5 ns;
      clk <= '1'; wait for 5 ns;
   end process;

   clr   <= '1'      after   1 ns,    '0' after   3 ns;
   d     <= "1010"   after   0 ns, "0011" after  40 ns;


end test;

