library ieee;
use ieee.std_logic_1164.all;

entity tb_addsub is
end tb_addsub;

-------------------------------

architecture test of tb_addsub is

component addsub is
port(  CLK, RST      : in std_logic;
	  OP            : in std_logic;
          A, B          : in std_logic_vector(7 downto 0);
          R	 	: out std_logic_vector(7 downto 0); 
	  Cout  	: out std_logic_vector(7 downto 0);
          OVERFLOW      : out std_logic
	);
end component;

signal s_clk, s_rst, s_op, s_ov : std_logic := '0';
signal s_a, s_b, s_r : std_logic_vector(7 downto 0) := "UUUUUUUU";
signal s_cout : std_logic_vector(7 downto 0) := "00000000";

begin

dut : ENTITY work.addsub
PORT MAP (
		CLK => s_clk,
		RST => s_rst,
		OP => s_op,
		A => s_a,
		B => s_b,
		R => s_r,
		OVERFLOW => s_ov,
		Cout => s_cout
);

clock_stimul: PROCESS
BEGIN
	s_clk <= '0'; WAIT FOR 5 ns;
	s_clk <= '1'; WAIT FOR 5 ns;
END PROCESS;
	
reset_stimul: PROCESS
BEGIN
	s_rst <= '0'; WAIT FOR 10 ns;
	s_rst <= '1'; WAIT FOR 200 ns;
END PROCESS;

data_stimul_a: PROCESS
BEGIN
	s_a <= "00010010"; WAIT FOR 50 ns; -- 12 => 12 + 23 = 35 => 0011 0101
	s_a <= "00001000"; WAIT FOR 50 ns; -- 08 => 8 + 79 = 87 => 1000 0111
	s_a <= "10010111"; WAIT FOR 50 ns; -- 97 => 97 + 5 = (1)02 => 0000 0010
END PROCESS;

data_stimul_b: PROCESS
BEGIN
	s_b <= "00100011"; WAIT FOR 50 ns; -- 23
	s_b <= "01111001"; WAIT FOR 50 ns; -- 79
	s_b <= "00000101"; WAIT FOR 50 ns; -- 5
END PROCESS;

end test;

