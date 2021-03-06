library ieee;
use ieee.std_logic_1164.all;

entity tb_parityCheckWithDelay is
end tb_parityCheckWithDelay;

architecture test of tb_parityCheckWithDelay is

   component parityWithDelay
	GENERIC ( Th : TIME := 3 ns;
          	Tp : TIME := 5 ns
	);
	 port
	 (
		X2, X1, X0 : IN STD_LOGIC;
		Dataword   : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	 );
	 end component;
	
    component parityCheckWithDelay
	GENERIC ( Th : TIME := 3 ns;
          	Tp : TIME := 5 ns
	);
        port
        (
         	Dataword   : IN STD_LOGIC_VECTOR (3 DOWNTO 0); 
		isBrocken  : OUT STD_LOGIC
      );
   end component;

   signal X0 : STD_LOGIC := 'X';
	signal X1 : STD_LOGIC := 'X';
	signal X2 : STD_LOGIC := 'X';
	signal Dataword : STD_LOGIC_VECTOR (3 downto 0) := "XXXX";
	signal isBrocken : STD_LOGIC := 'X';

begin
   dut1: parityWithDelay
    port map (
      X2 => X2,
      X1 => X1,
      X0 => X0,
      Dataword => Dataword
     );
	
    dut2: parityCheckWithDelay  -- Device Under Test
    port map(
      Dataword => Dataword,
      isBrocken => isBrocken
    );

X0 <='0' after   0 ns, '1' after  40 ns, '0' after  80 ns, '1' after 120 ns, '0' after 160 ns,
	  '1' after 200 ns, '0' after 240 ns, '1' after 280 ns, '0' after 320 ns, '1' after 360 ns;
X1 <='0' after   0 ns, '0' after  40 ns, '1' after  80 ns, '1' after 120 ns, '0' after 160 ns, 
     '0' after 200 ns, '1' after 240 ns, '1' after 280 ns, '0' after 320 ns, '1' after 360 ns;
X2 <='0' after   0 ns, '0' after  40 ns, '0' after  80 ns, '0' after 120 ns, '1' after 160 ns,
     '1' after 200 ns, '1' after 240 ns, '1' after 280 ns, '0' after 320 ns, '1' after 360 ns;

end test;
