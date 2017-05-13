library ieee;
use ieee.std_logic_1164.all;

entity tb_errorGenerator is
end tb_errorGenerator;

architecture test of tb_errorGenerator is

   component parity
	 port
	 (
		X2, X1, X0 : IN bit;
		Dataword   : OUT bit_vector(3 DOWNTO 0)
	 );
	 end component;
	
    component parityCheck
      port
      (
         Dataword   : IN bit_vector(3 DOWNTO 0); 
			isBrocken  : OUT BIT
      );
   end component;

   signal X0 : bit := '0';
	signal X1 : bit := '0';
	signal X2 : bit := '0';
	signal Dataword : bit_vector(3 downto 0);
	signal isBrocken : bit;

begin
   dut1: parity
    port map (
      X2 => X2,
      X1 => X1,
      X0 => X0,
      Dataword => Dataword
     );
	
    dut2: parityCheck  -- Device Under Test
    port map(
      Dataword => Dataword,
      isBrocken => isBrocken
    );


X0 <= '0' after 0 ns, '1' after 40 ns, '0' after 80 ns, '1' after 120 ns, '0' after 160 ns, '1' after 200 ns, '0' after 240 ns, '1' after 280 ns, '0' after 320 ns;
X1 <= '0' after 0 ns, '0' after 40 ns, '1' after 80 ns, '1' after 120 ns, '0' after 160 ns, '0' after 200 ns, '1' after 240 ns, '1' after 280 ns, '0' after 320 ns;
X2 <= '0' after 0 ns, '1' after 40 ns, '0' after 80 ns, '0' after 120 ns, '1' after 160 ns, '0' after 200 ns, '1' after 240 ns, '0' after 280 ns, '0' after 320 ns;



end test;
