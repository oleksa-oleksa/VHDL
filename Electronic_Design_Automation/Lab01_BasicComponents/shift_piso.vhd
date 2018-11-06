library ieee;
use ieee.std_logic_1164.all;

entity piso is
   port
   (
      clk, clr :  in std_logic;
      d        :  in std_logic_vector( 3 downto 0 );
      q_out    : out std_logic
   );
end piso;

architecture behave of piso is
   type state is (S0, S1, S2, S3 );

   signal act_state, next_state  : state;
   signal q_all                  : std_logic_vector( 3 downto 0 );
   signal ld                     : std_logic;
begin
   process ( clk, clr ) -- Zustandsaktualisierung
   begin
      if ( clr = '1' ) then
         act_state   <= S0;
         ld          <= '1';
      elsif ( falling_edge( clk ) ) then
         case next_state is
            when S0           => ld <= '1';
            when S1 | S2 | S3 => ld <= '0';
            when others       => ld <= '0';
         end case;

         act_state <= next_state;
      end if;
   end process;         -- END Zustandsaktualisierung

   process ( clr, act_state ) -- Uebergang
   begin
      if ( clr = '1' ) then
         next_state <= S0;
      elsif ( clr = '0' ) then
         case act_state is
            when S0     => next_state <= S1;
            when S1     => next_state <= S2;
            when S2     => next_state <= S3;
            when S3     => next_state <= S0;
            when others => next_state <= S0;
         end case;
      end if;
   end process;               -- END Uebergang

   process ( act_state, ld, clr )      -- Ausgang
   begin
      if ( clr = '1' ) then
         q_all <= (others => '0');
      elsif ( clr = '0' ) then
         case act_state is
            when S0  =>
               if ( ld = '1' ) then
                  q_all <= q_all(2 downto 0) & '0';
               end if;
            when S1  =>
               if ( ld = '0' ) then
                  q_all <= d;
               end if;
            when S2 | S3  =>
               if ( ld = '0' ) then
                  q_all <= q_all(2 downto 0) & '0';
               end if;
         end case;
      end if;
   end process;               -- END Ausgang

   q_out <= q_all(3);
end behave;
