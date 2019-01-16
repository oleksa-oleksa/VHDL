library ieee;
use ieee.std_logic_1164.all;

entity bcd_counter_zero_to_five is
   port
   (
      clk, ld        :  in std_logic;                                      -- Clock Signal, Load Signal for specific start value
      clr            :  in std_logic;                                      -- Clear Signal
      ld_4bit        :  in std_logic_vector(3 downto 0);                   -- 4 bit input load start value

      overflow       : out std_logic;                                      -- Signal for ten
      out_4bit       : out std_logic_vector(3 downto 0)                    -- 4 bit output
   );
end bcd_counter_zero_to_five;

architecture behave of bcd_counter_zero_to_five is
   type state is ( s0, s1, s2, s3, s4, s5 );

   signal act_state, next_state  : state;
   signal out_temp               : std_logic_vector(3 downto 0);
begin
   process( clk, clr, ld ) -------------------------------------------- Zustandsaktualisierung
   begin
      if ( clr = '1' ) then                                          -- reset: s0
         act_state   <= s0;
         overflow    <= '0';
      elsif ( clr = '0' ) then
         if (  ld = '1' ) then                                       -- when load: evaluate the input
            case ld_4bit is
               when "0000" => act_state <= s0;
               when "0001" => act_state <= s1;
               when "0010" => act_state <= s2;
               when "0011" => act_state <= s3;
               when "0100" => act_state <= s4;
               when "0101" => act_state <= s5;
               when others => act_state <= s0;
            end case;
         elsif (  ld = '0' ) then                                    -- normal case: 
            if ( rising_edge(clk) ) then
               if ( (act_state = s5) and (next_state = s0) ) then
                  overflow <= '1';
               else
                  overflow <= '0';
               end if;

               act_state <= next_state;
            end if;
         end if;
      end if;
   end process; ------------------------------------------------------- END Zustandsaktualisierung

   process( act_state ) ----------------------------------------------- Ausgang
   begin
      case act_state is
         when     s0 => out_temp <= "0000"; next_state <= s1; -- overflow <= '0';
         when     s1 => out_temp <= "0001"; next_state <= s2; -- overflow <= '0';
         when     s2 => out_temp <= "0010"; next_state <= s3; -- overflow <= '0';
         when     s3 => out_temp <= "0011"; next_state <= s4; -- overflow <= '0';
         when     s4 => out_temp <= "0100"; next_state <= s5; -- overflow <= '0';
         when     s5 => out_temp <= "0101"; next_state <= s0; -- overflow <= '1';
         when others => out_temp <= "0000"; next_state <= s0; -- overflow <= '0';
      end case;
   end process; ------------------------------------------------------- END Ausgang

   out_4bit <= out_temp;
end behave;
