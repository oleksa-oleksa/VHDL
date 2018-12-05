library ieee;
use ieee.std_logic_1164.all;

entity bit_seq_detect is
port (        x :  IN std_logic := 'U';
       clk, rst :  IN std_logic := 'U';
              y : OUT std_logic;
            dff : OUT std_logic_vector(8 downto 0));
end bit_seq_detect;

architecture behavior of bit_seq_detect is

   component ms_dff is
   port(     d : IN std_logic := 'U';
      clk, clr : IN std_logic := 'U';
        qp, qn : OUT std_logic);
   end component;

   signal   a ,   b ,   c ,   d ,   e ,   f ,   g ,   h ,   i  : std_logic := 'U';
   signal to_a, to_b, to_c, to_d, to_e, to_f, to_g, to_h, to_i : std_logic := 'U';
   signal s_rst : std_logic := 'U';

begin
   dff <= ( i, h, g, f, e, d, c, b, a );
   s_rst <= not( rst );

   dff0i : ms_dff port map( d => to_a, clk => clk, clr => s_rst, qp => a);
   dff1z : ms_dff port map( d => to_b, clk => clk, clr => s_rst, qp => b);
   dff2z : ms_dff port map( d => to_c, clk => clk, clr => s_rst, qp => c);
   dff3z : ms_dff port map( d => to_d, clk => clk, clr => s_rst, qp => d);
   dff4z : ms_dff port map( d => to_e, clk => clk, clr => s_rst, qp => e);
   dff5o : ms_dff port map( d => to_f, clk => clk, clr => s_rst, qp => f);
   dff6o : ms_dff port map( d => to_g, clk => clk, clr => s_rst, qp => g);
   dff7o : ms_dff port map( d => to_h, clk => clk, clr => s_rst, qp => h);
   dff8o : ms_dff port map( d => to_i, clk => clk, clr => s_rst, qp => i);

   to_a <= '1';

   to_b <= ( not(a) or f or g or h or i ) and ( not x );
   to_c <=   b and ( not x );
   to_d <=   c and ( not x );
   to_e <= ( d or e ) and ( not x );

   to_f <= ( not(a) or b or c or d or e ) and (   x   );
   to_g <=   f and (   x   );
   to_h <=   g and (   x   );
   to_i <= ( h or i ) and (   x   );

   y <= e or i;

end behavior;
