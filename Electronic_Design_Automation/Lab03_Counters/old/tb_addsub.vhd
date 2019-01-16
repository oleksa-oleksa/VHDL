library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_addsub is
end tb_addsub;

-------------------------------

architecture test of tb_addsub is

component addsub is
port(  CLK, RST      : in std_logic;
	  OP            : in std_logic;
          A1, B1, A2, B2 : in unsigned(3 downto 0);
          R1, R2	: out unsigned(3 downto 0); 
	  Cout  	: out std_logic;
          OVERFLOW      : out std_logic
	);
end component;

signal s_clk, s_rst, s_op, s_ov, s_cout : std_logic := '0';
signal s_a1, s_b1, s_a2, s_b2, s_r1, s_r2 : unsigned(3 downto 0) := "UUUU";

begin

dut : ENTITY work.addsub
PORT MAP (
		CLK => s_clk,
		RST => s_rst,
		OP => s_op,
		A1 => s_a1,
		B1 => s_b1,
		A2 => s_a2,
		B2 => s_b2,
		R1 => s_r1,
		R2 => s_r2,
		Cout => s_cout,		
		OVERFLOW => s_ov
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
	s_a1 <= "0010"; -- 12 => 12 + 23 = 35 => 0011 0101
	s_a2 <= "0001"; WAIT FOR 50 ns; -- 12 => 12 + 23 = 35 => 0011 0101
	s_a1 <= "1000";  -- 08 => 8 + 71 = 79 => 0111 1001
	s_a2 <= "0000"; WAIT FOR 50 ns; -- 08 => 8 + 79 = 87 => 1000 0111
	s_a1 <= "0010"; -- 92 => 92 + 5 = 97 => 1001 0111
	s_a2 <= "1001"; WAIT FOR 50 ns; -- 97 => 97 + 5 = (1)02 => 0000 0010
END PROCESS;

data_stimul_b: PROCESS
BEGIN
	s_b1 <= "0011"; -- 23
	s_b2 <= "0010"; WAIT FOR 50 ns; -- 23
	s_b1 <= "0001"; -- 71
	s_b2 <= "0111"; WAIT FOR 50 ns; -- 71
	s_b1 <= "0101";  -- 05
	s_b2 <= "0000"; WAIT FOR 50 ns; -- 5
END PROCESS;
end test;

