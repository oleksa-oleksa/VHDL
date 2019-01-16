library ieee;
use ieee.std_logic_1164.all;

entity tb_bcd_arith is
end tb_bcd_arith;

-------------------------------

architecture test of tb_bcd_arith is
   component bcd_arith 
      port
      (
         c_in                    :  in std_logic;
         sign_op1, sign_op2      :  in std_logic;
         op1_ten, op1_one        :  in std_logic_vector(3 downto 0);
         op2_ten, op2_one        :  in std_logic_vector(3 downto 0);

         c_out                   : out std_logic;
         sign_result             : out std_logic;
         result_ten, result_one  : out std_logic_vector(3 downto 0)
      );
   end component;

   signal c_in, sign_op1, sign_op2, c_out, sign_result : std_logic;
   signal op1_ten, op1_one, op2_ten, op2_one, result_ten, result_one : std_logic_vector(3 downto 0);
begin

   dut: bcd_arith 
   port map
   (
      c_in, sign_op1, sign_op2, op1_ten, op1_one, op2_ten, op2_one, c_out, sign_result, result_ten, result_one
   );

   process
   begin
      sign_op1 <= '0'; sign_op2 <= '0'; wait for 2500 ps;
      sign_op1 <= '0'; sign_op2 <= '1'; wait for 2500 ps;
      sign_op1 <= '1'; sign_op2 <= '0'; wait for 2500 ps;
      sign_op1 <= '1'; sign_op2 <= '1'; wait for 2500 ps;
   end process;
   c_in     <= '0' after 0 ns;

   op1_ten <= "0011" after  0 ns, "1000" after 10 ns,
              "0010" after 20 ns, "0111" after 30 ns,
              "0101" after 40 ns, "1001" after 50 ns,
              "0110" after 60 ns, "0100" after 70 ns,
              "0100" after 80 ns, "0100" after 90 ns;
   op1_one <= "1000" after  0 ns, "1000" after 10 ns,
              "1000" after 20 ns, "0100" after 30 ns,
              "1000" after 40 ns, "0110" after 50 ns,
              "1000" after 60 ns, "0100" after 70 ns,
              "0100" after 80 ns, "1000" after 90 ns;

   op2_ten <= "0100" after  0 ns, "1000" after 10 ns,
              "0011" after 20 ns, "0100" after 30 ns,
              "0011" after 40 ns, "0100" after 50 ns,
              "0100" after 60 ns, "0000" after 70 ns,
              "0000" after 80 ns, "0011" after 90 ns;
   op2_one <= "0111" after  0 ns, "1000" after 10 ns,
              "0011" after 20 ns, "0001" after 30 ns,
              "0010" after 40 ns, "0110" after 50 ns,
              "0111" after 60 ns, "0011" after 70 ns,
              "1000" after 80 ns, "0100" after 90 ns;


end test;


