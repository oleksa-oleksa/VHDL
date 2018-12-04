library ieee;
use ieee.std_logic_1164.all;

entity tb_pipo is
end tb_pipo;

-------------------------------

architecture test of tb_pipo is

   component pipo
   port
   (
      clk, clr :  in std_logic;                                      -- clock and clear
      en       :  in std_logic;                                      -- enable
      d        :  in std_logic_vector( 3 downto 0 );                 -- data input
      q        : out std_logic_vector( 3 downto 0 )                  -- data output
   );
   end component;

   signal clk, clr, en  : std_logic;
   signal d, q          : std_logic_vector( 3 downto 0 );

begin

   dut: pipo
   port map
   (
      clk, clr, en, d, q
   );

   process                                                           -- clock generating process
   begin
      clk <= '0';
      wait for 5 ns;
      clk <= '1';
      wait for 5 ns;
   end process;

   clr   <=    '1' after   0 ns,    '0' after   3 ns;
   en    <=    '0' after   0 ns,    '1' after  20 ns;
   d     <= "1001" after   0 ns, "0110" after  50 ns;


end test;





