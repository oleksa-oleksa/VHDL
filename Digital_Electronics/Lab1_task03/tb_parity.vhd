library ieee;
use ieee.std_logic_1164.all;

entity tb_parity is
end tb_parity;

architecture test of tb_parity is

   component parity
      port
      (
         X2, X1, X0 : IN bit;	-- X2 = AC27, X1 = AC28, X0 = AB28
         Dataword   : OUT bit_vector(3 DOWNTO 0) -- (3) = E24, (2) = E25, (1) = E22, (0) = E21
      );
   end component;

   signal X2 : bit:= '0'; 
	signal X1 : bit:= '0';
	signal X0 : bit:= '0';
   signal Dataword :bit_vector(3 downto 0);

begin
   dut: parity
   port map
   (
      X2       => X2,
      X1       => X1,
      X0       => X0,
      Dataword => Dataword
   );


X0 <= '0' after 0 ns, '1' after 40 ns, '0' after 80 ns, '1' after 120 ns, '0' after 160 ns, '1' after 200 ns, '0' after 240 ns, '1' after 280 ns, '0' after 320 ns;
X1 <= '0' after 0 ns, '0' after 40 ns, '1' after 80 ns, '1' after 120 ns, '0' after 160 ns, '0' after 200 ns, '1' after 240 ns, '1' after 280 ns, '0' after 320 ns;
X2 <= '0' after 0 ns, '0' after 40 ns, '0' after 80 ns, '0' after 120 ns, '1' after 160 ns, '1' after 200 ns, '1' after 240 ns, '1' after 280 ns, '0' after 320 ns;



end test;
