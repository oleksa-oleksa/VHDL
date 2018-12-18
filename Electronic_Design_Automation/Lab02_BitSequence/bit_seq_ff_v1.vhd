library ieee;
use ieee.std_logic_1164.all;

entity bit_seq_ff_v1 is
   port
   (
      clk, rst :  in std_logic;
      x        :  in std_logic;
      y        : out std_logic
   );
end bit_seq_ff_v1;

architecture behave of bit_seq_ff_v1 is
   component one_bit_reg
      port
      (
         ld, clr, clk   :  in std_logic;
         d_0            :  in std_logic;
         q_0            : out std_logic
      );
  end component;
  signal d_8, d_7, d_6, d_5, d_4, d_3, d_2, d_1, d_0  : std_logic;
  signal q_8, q_7, q_6, q_5, q_4, q_3, q_2, q_1, q_0  : std_logic;
begin
   ------------------------------------------------------------------ FF als Zustaende
   q8: one_bit_reg port map ( '1', '0', clk, d_8, q_8 );
   q7: one_bit_reg port map ( '1', '0', clk, d_7, q_7 );
   q6: one_bit_reg port map ( '1', '0', clk, d_6, q_6 );
   q5: one_bit_reg port map ( '1', '0', clk, d_5, q_5 );
   q4: one_bit_reg port map ( '1', '0', clk, d_4, q_4 );
   q3: one_bit_reg port map ( '1', '0', clk, d_3, q_3 );
   q2: one_bit_reg port map ( '1', '0', clk, d_2, q_2 );
   q1: one_bit_reg port map ( '1', '0', clk, d_1, q_1 );
   q0: one_bit_reg port map ( '1', '0', clk, d_0, q_0 );
   ------------------------------------------------------------------ END FF als Zustaende
   
   -- Erklaerung zu Kombinatorik:
   -- Zustandscodierung per One-Hot, dh a: 0000 0000 1, b: 0000 0001 0, etc.
   -- a - Startzustand
   -- Sonderfaelle:
   -- nach f, wenn in A | B | C | D | E und x = 1
   -- nach b, wenn in A | F | G | H | I und x = 0
   --
   -- Regulaere Faelle:
   -- x = 1: f -> g -> h -> i -> i -> ...
   -- x = 0: b -> c -> d -> e -> e -> ...
   -- Einschraenkung: Nur 1! FF Ausgang darf 1 aufweisen
   process( x, q_8, q_7, q_6, q_5, q_4, q_3, q_2, q_1, q_0 )         -- Kombinatorik/Zustandsaenderung
   begin
      if ( rst = '1' ) then
         d_0 <= '1';
         d_1 <= '0'; d_2 <= '0'; d_3 <= '0'; d_4 <= '0';
         d_5 <= '0'; d_6 <= '0'; d_7 <= '0'; d_8 <= '0';
      elsif ( rst = '0' ) then
         d_0 <=     not q_0 and not q_1 and not q_2 and not q_3 and not q_4 
                and not q_5 and not q_6 and not q_7 and not q_8;
         d_1 <= not x and not q_1 and not q_2 and not q_3 and not q_4
                    and ( q_0 xor q_5 xor q_6 xor q_7 xor q_8 );
         d_2 <= not x and not q_0 and     q_1 and not q_2 and not q_3 
                    and not q_4 and not q_5 and not q_6 and not q_7 and not q_8;
         d_3 <= not x and not q_0 and not q_1 and     q_2 and not q_3 
                    and not q_4 and not q_5 and not q_6 and not q_7 and not q_8;
         d_4 <= not x and not q_0 and not q_1 and not q_2 and (q_3 xor q_4) 
                                and not q_5 and not q_6 and not q_7 and not q_8;
         d_5 <=     x and not q_6 and not q_7 and not q_8 
                    and ( q_0 xor q_1 xor q_2 xor q_3 xor q_4);
         d_6 <=     x and not q_0 and not q_1 and not q_2 and not q_3 
                    and not q_4 and     q_5 and not q_6 and not q_7 and not q_8;
         d_7 <=     x and not q_0 and not q_1 and not q_2 and not q_3 
                    and not q_4 and not q_5 and     q_6 and not q_7 and not q_8;
         d_8 <=     x and not q_0 and not q_1 and not q_2 and not q_3 
                    and not q_4 and not q_5 and not q_6 and (q_7 xor q_8);
      end if;
   end process;                                                      -- END Kombinatorik/Zustandsaenderung

   process ( q_8, q_7, q_6, q_5, q_4, q_3, q_2, q_1, q_0 )           -- Ausgang
   begin
      if ( q_4 = '1' ) then
         y <= '1';
      elsif ( q_8 = '1' ) then
         y <= '1';
      else
         y <= '0';
      end if;
   end process;                                                      -- END Ausgang
end behave;
