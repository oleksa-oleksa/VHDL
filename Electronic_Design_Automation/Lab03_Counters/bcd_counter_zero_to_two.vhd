library ieee;
use ieee.std_logic_1164.all;

entity bcd_counter_zero_to_two is
   port
   (
      clk, ld        :  in std_logic;                                      -- Clock Signal, Load Signal for specific start value
      clr            :  in std_logic;                                      -- Clear Signal
      ld_4bit        :  in std_logic_vector(3 downto 0);                   -- 4 bit input load start value

      twenty         : out std_logic;
      out_4bit       : out std_logic_vector(3 downto 0)                    -- 4 bit output
   );
end bcd_counter_zero_to_two;

architecture behave of bcd_counter_zero_to_two is
   type state is ( s0, s1, s2 );

   signal act_state, next_state  : state;
   signal out_temp               : std_logic_vector(3 downto 0);
begin
   process( clk, clr, ld ) -------------------------------------------- Zustandsaktualisierung
   begin
      if ( clr = '1' ) then                                       -- reset: s0
         act_state <= s0;
      elsif (  ld = '1' ) then                                    -- when load: evaluate the input
         case ld_4bit is
            when "0000" => act_state <= s0;
            when "0001" => act_state <= s1;
            when "0010" => act_state <= s2;
            when others => act_state <= s0;
         end case;
      elsif (  ld = '0' ) then                                    -- normal case: 
         if ( clr = '0' ) then
            if ( rising_edge(clk) ) then                                   -- synchron reset
               act_state <= next_state;
            end if;
         end if;
      end if;
   end process; ------------------------------------------------------- END Zustandsaktualisierung

   process( act_state ) ----------------------------------------------- Ausgang
   begin
      case act_state is
         when     s0 => out_temp <= "0000"; next_state <= s1; twenty <= '0';
         when     s1 => out_temp <= "0001"; next_state <= s2; twenty <= '0';
         when     s2 => out_temp <= "0010"; next_state <= s0; twenty <= '1';
         when others => out_temp <= "0000"; next_state <= s0; twenty <= '0';
      end case;
   end process; ------------------------------------------------------- END Ausgang

   out_4bit <= out_temp;
end behave;
