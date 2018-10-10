LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY tb_shift_universal IS
END tb_shift_universal;

ARCHITECTURE testbench OF tb_shift_universal IS

SIGNAL superN : integer := 4;
COMPONENT shift_universal IS
generic (N : integer := superN);
PORT(	CLK, RST, LD:  IN std_logic; -- Control Inputs
	SHL, SHR:  IN std_logic; -- Direction of serial data shift
	D:  IN std_logic_vector(N-1 downto 0); -- Parallel Data Input
	S:  IN std_logic_vector(1 downto 0 ); -- Mode Control Input
	Qp, Qn: OUT std_logic_vector(N-1 downto 0)); -- Parallel Output
END COMPONENT;

signal N: integer := superN;
SIGNAL clk_s, rst_s, ld_s : std_logic := 'U';

SIGNAL shl_s, shr_s: std_logic := 'U';

SIGNAL s_s : std_logic_vector(1 downto 0) := (others => 'U' );

SIGNAL d_s  : std_logic_vector(N-1 downto 0) := (others => 'U' );
SIGNAL qp_s : std_logic_vector(N-1 downto 0) := (others => 'U' );
SIGNAL qn_s : std_logic_vector(N-1 downto 0) := (others => 'U' );

BEGIN
dut: ENTITY work.shift_universal 
PORT MAP (
      	  CLK => clk_s,
	  RST => rst_s,
	   LD => ld_s,
	   SHL => shl_s,
	   SHR => shr_s,
	    D => d_s,
	    S => s_s,
	   Qp => qp_s,
	   Qn => qn_s );

-- common processes in the separate process
reset_stimul: PROCESS
	BEGIN
	rst_s <= '0'; WAIT FOR 10 ns;
	rst_s <= '1'; WAIT FOR 15 ns;
	rst_s <= '0'; WAIT FOR 500 ns;
END PROCESS;

clock_stimul: PROCESS
	BEGIN
	clk_s <= '0'; WAIT FOR 10 ns;
	clk_s <= '1'; WAIT FOR 10 ns;
END PROCESS;

enable_stimul: PROCESS
	BEGIN
	ld_s <= '1'; WAIT FOR 10 ns;
END PROCESS;

left_stimul: PROCESS
	BEGIN
	shl_s <= '1'; WAIT FOR 8 ns;
	shl_s <= '0'; WAIT FOR 8 ns;
	shl_s <= '0'; WAIT FOR 8 ns;
	shl_s <= '0'; WAIT FOR 8 ns;
	shl_s <= '1'; WAIT FOR 8 ns;
END PROCESS;

right_stimul: PROCESS
	BEGIN
	shr_s <= '0'; WAIT FOR 5 ns;
	shr_s <= '1'; WAIT FOR 5 ns;
	shr_s <= '1'; WAIT FOR 5 ns;
	shr_s <= '0'; WAIT FOR 5 ns;
	shr_s <= '1'; WAIT FOR 5 ns;
END PROCESS;

mode_stimul: PROCESS
	BEGIN
	s_s <= "11"; WAIT FOR 50 ns; -- parallel in
	s_s <= "01"; WAIT FOR 50 ns; -- shift right
	s_s <= "10"; WAIT FOR 50 ns; -- shift left
	s_s <= "00"; WAIT FOR 50 ns; -- hold
END PROCESS;

data_stimul: PROCESS
	BEGIN
	d_s <= "0101"; WAIT FOR 5 ns;
	d_s <= "1000"; WAIT FOR 5 ns;
	d_s <= "1110"; WAIT FOR 10 ns;
	d_s <= "0010"; WAIT FOR 5 ns;
	d_s <= "0101"; WAIT FOR 10 ns;
	d_s <= "1110"; WAIT FOR 5 ns;
	d_s <= "1010"; WAIT FOR 10 ns;
	d_s <= "0011"; WAIT FOR 5 ns;
END PROCESS;

END testbench;