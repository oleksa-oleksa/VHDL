library ieee;
use ieee.std_logic_1164.all;

entity tb_n_bit_reg is
end tb_n_bit_reg;

-------------------------------

architecture test of tb_n_bit_reg is
   component n_bit_reg
   port
   (
      ld, clr, clk   :  in std_logic;
      d              :  in std_logic_vector(8-1 downto 0);
      q              : out std_logic_vector(8-1 downto 0)
   );
   end component;

   signal ld, clr, clk  : std_logic;
   signal d             : std_logic_vector(8-1 downto 0);
   signal q             : std_logic_vector(8-1 downto 0);

begin

   dut: n_bit_reg
   port map
   (
      ld, clr, clk, d, q    
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
   d     <= "00000000" after   0 ns, "00000001" after   7 ns,
            "00000010" after  17 ns, "00000011" after  26 ns, 
            "00000100" after  40 ns, "00000101" after  52 ns, 
            "00000110" after  59 ns, "00000111" after  66 ns, 
            "00001000" after  78 ns, "00001001" after  86 ns, 
            "00001010" after 100 ns, "00001011" after 110 ns, 
            "11110000" after 120 ns, "11110001" after 130 ns, 
            "11110010" after 140 ns, "11110011" after 150 ns, 
            "11110100" after 160 ns, "11110101" after 170 ns;


end test;

