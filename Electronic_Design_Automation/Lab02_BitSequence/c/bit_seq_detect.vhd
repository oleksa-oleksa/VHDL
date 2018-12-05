library ieee;
use ieee.std_logic_1164.all;

entity bit_seq_detect is
port (        x :  IN std_logic := 'U';
       clk, rst :  IN std_logic := 'U';
              y : OUT std_logic;
            dff : OUT std_logic_vector(8 downto 0));
end bit_seq_detect;

architecture behavior of bit_seq_detect is

   type states is (A, B, C, D, E, F, G, H, I);
   signal s_state, s_nxt_state : states;

begin

   reg : process (clk, rst, s_state)
   begin
      if ( rst = '0' ) then
         s_state <= A;
      else
         if ( rising_edge(clk) ) then
            s_state <= s_nxt_state;
         else
            s_state <= s_state;
         end if;
      end if;
   end process reg;

   transitions : process(s_state, x)
   begin
      case s_state is
      when A => if ( x = '0' ) then s_nxt_state <= B;
                else                s_nxt_state <= F; 
                end if;
      when B => if ( x = '0' ) then s_nxt_state <= C;
                else                s_nxt_state <= F; 
                end if;
      when C => if ( x = '0' ) then s_nxt_state <= D;
                else                s_nxt_state <= F; 
                end if;
      when D => if ( x = '0' ) then s_nxt_state <= E;
                else                s_nxt_state <= F; 
                end if;
      when E => if ( x = '0' ) then s_nxt_state <= E;
                else                s_nxt_state <= F; 
                end if;
      -----------------------------------------------
      when F => if ( x = '1' ) then s_nxt_state <= G;
                else                s_nxt_state <= B; 
                end if;
      when G => if ( x = '1' ) then s_nxt_state <= H;
                else                s_nxt_state <= B; 
                end if;
      when H => if ( x = '1' ) then s_nxt_state <= I;
                else                s_nxt_state <= B; 
                end if;
      when I => if ( x = '1' ) then s_nxt_state <= I;
                else                s_nxt_state <= B; 
                end if;
      when others => s_nxt_state <= A;
      end case;
   end process transitions;

   output : process(s_state)
   begin
      case s_state is
      when A => dff <= "000000000"; y <= '0';
      when B => dff <= "000000011"; y <= '0';
      when C => dff <= "000000101"; y <= '0';
      when D => dff <= "000001001"; y <= '0';
      when E => dff <= "000010001"; y <= '1';
      when F => dff <= "000100001"; y <= '0';
      when G => dff <= "001000001"; y <= '0';
      when H => dff <= "010000001"; y <= '0';
      when I => dff <= "100000001"; y <= '1';
      when others => dff <= "000000000"; y <= '0';
      end case;
   end process output;

end behavior;
