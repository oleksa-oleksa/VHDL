library ieee;
use ieee.std_logic_1164.all;

entity tb_bit_seq_detect is
end tb_bit_seq_detect;

architecture tb_behavior of tb_bit_seq_detect is

   component bit_seq_detect is
   port(         x :  IN std_logic := 'U';
          clk, rst :  IN std_logic := 'U';
                 y : OUT std_logic;
               dff : OUT std_logic_vector(8 downto 0));
   end component;

   signal s_clk : std_logic := '0';
   signal s_x, s_rst, s_y : std_logic := 'U';
   signal s_dff : std_logic_vector(8 downto 0) := (others => 'U');
   signal s_cnt, s_nxt_cnt : integer := 1;

   type states is (UNDEF, A, B, C, D, E, F, G, H, I);
   signal s_state : states;

begin

   s_clk <= not s_clk after 5 ns;

   dut : bit_seq_detect port map(s_x, s_clk, s_rst, s_y, s_dff);

   process(s_x, s_clk, s_dff)
   begin
      if ( s_x'event ) then
         s_nxt_cnt <= 1;
      elsif ( rising_edge(s_clk) ) then
         s_cnt <= s_nxt_cnt;
      elsif ( falling_edge(s_clk) ) then
         s_nxt_cnt <= s_nxt_cnt + 1;
      end if;

      case s_dff is
      when "000000001" => s_state <= A;
      when "000000010" => s_state <= B;
      when "000000100" => s_state <= C;
      when "000001000" => s_state <= D;
      when "000010000" => s_state <= E;
      when "000100000" => s_state <= F;
      when "001000000" => s_state <= G;
      when "010000000" => s_state <= H;
      when "100000000" => s_state <= I;
      when others => s_state <= UNDEF;
      end case;

   end process;

   process
   begin
      s_rst <= 'U'; wait for 3 ns;
      s_rst <= '0'; wait for 3 ns;
      s_rst <= '1'; wait for 550 ns;
   end process;

   stm_x : process
   begin
      wait for 2 ns;
      s_x <= '0'; wait for 10 ns;
      s_x <= '1'; wait for 10 ns;
      s_x <= '0'; wait for 10 ns;
      s_x <= '0'; wait for 10 ns;
      s_x <= '1'; wait for 10 ns;
      s_x <= '1'; wait for 10 ns;
      s_x <= '0'; wait for 10 ns;
      s_x <= '0'; wait for 10 ns;
      s_x <= '0'; wait for 10 ns;
      s_x <= '1'; wait for 10 ns;
      s_x <= '1'; wait for 10 ns;
      s_x <= '1'; wait for 10 ns;
      s_x <= '1'; wait for 10 ns;
      s_x <= '0'; wait for 10 ns;
      s_x <= '0'; wait for 10 ns;
      s_x <= '0'; wait for 10 ns;
      s_x <= '0'; wait for 10 ns;
      s_x <= '0'; wait for 10 ns;
      s_x <= '0'; wait for 10 ns;
      s_x <= '0'; wait for 10 ns;
      s_x <= '1'; wait for 10 ns;
      s_x <= '1'; wait for 10 ns;
      s_x <= '1'; wait for 10 ns;
      s_x <= '1'; wait for 10 ns;
      s_x <= '1'; wait for 10 ns;
      s_x <= '1'; wait for 10 ns;
      s_x <= '1'; wait for 10 ns;
      s_x <= '1'; wait for 10 ns;
   end process stm_x;

end tb_behavior;
