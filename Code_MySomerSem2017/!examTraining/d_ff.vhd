library ieee;
use ieee.std_logic_1164.all;

entity d_ff is
port (
	D_in : in std_logic;
	clk : in std_logic;
	set : in std_logic;
	reset : in std_logic;
	Q : out std_logic
);
end d_ff;

architecture D_FlipFlop of d_ff is
begin
process (clk)
begin
	if (clk'event and clk = '1') then -- rising edge d ff
		if (reset = '1') then -- hight active reset
			Q <= '0';
		elsif (set = '1') then -- hight acrive preset
			Q <= '1';
		elsif (reset = '0' and set = '0') then
			Q <= D_in;
		end if;
	end if;
end process;
end D_FlipFlop;
