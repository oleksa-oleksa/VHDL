library ieee;
use ieee.std_logic_1164.all;

entity bcd_counter is
   port
   (
      clk, ld        :  in std_logic;                                      -- Clock Signal, Load Signal for specific start value
      clr            :  in std_logic;                                      -- Clear Signal
      ld_4bit        :  in std_logic_vector(3 downto 0);                   -- 4 bit input load start value
      out_4bit       : out std_logic_vector(3 downto 0)                    -- 4 bit output
   );
end bcd_counter;

architecture behave of bcd_counter is
   type state is ( s0, s1, s2, s3, s4, s5, s6, s7, s8, s9 );

   signal act_state, next_state  : state;
   signal out_temp               : std_logic_vector(3 downto 0);
begin
   process( clk, clr, ld ) -------------------------------------------- Zustandsaktualisierung
   begin
      if ( rising_edge(clk) ) then                                   -- synchron reset
         if ( clr = '1' ) then                                       -- reset: s0
            act_state <= s0;
         elsif (  ld = '1' ) then                                    -- when load: evaluate the input
            case ld_4bit is
               when "0000" => act_state <= s0;
               when "0001" => act_state <= s1;
               when "0010" => act_state <= s2;
               when "0011" => act_state <= s3;
               when "0100" => act_state <= s4;
               when "0101" => act_state <= s5;
               when "0110" => act_state <= s6;
               when "0111" => act_state <= s7;
               when "1000" => act_state <= s8;
               when "1001" => act_state <= s9;
               when others => act_state <= s0;
            end case;
         elsif (  ld = '0' ) then                                    -- normal case: 
            if ( clr = '0' ) then
               act_state <= next_state;
            end if;
         end if;
      end if;
   end process; ------------------------------------------------------- END Zustandsaktualisierung

   process( act_state ) ----------------------------------------------- Ausgang
   begin
      case act_state is
         when     s0 => out_temp <= "0000"; next_state <= s1;
         when     s1 => out_temp <= "0001"; next_state <= s2;
         when     s2 => out_temp <= "0010"; next_state <= s3;
         when     s3 => out_temp <= "0011"; next_state <= s4;
         when     s4 => out_temp <= "0100"; next_state <= s5;
         when     s5 => out_temp <= "0101"; next_state <= s6;
         when     s6 => out_temp <= "0110"; next_state <= s7;
         when     s7 => out_temp <= "0111"; next_state <= s8;
         when     s8 => out_temp <= "1000"; next_state <= s9;
         when     s9 => out_temp <= "1001"; next_state <= s0;
         when others => out_temp <= "0000"; next_state <= s0;
      end case;
   end process; ------------------------------------------------------- END Ausgang

   out_4bit <= out_temp;
end behave;
