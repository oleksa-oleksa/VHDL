library ieee;
use ieee.std_logic_1164.all;

entity ShiftReg_8Bit is
port (
	D_in : in std_logic;
	clk : in std_logic;
	q_out : out std_logic
);
end shiftReg_8Bit;

Architecture EightBitShift of ShiftReg_8Bit is
signal sreg : std_logic_vector(0 to 7);
begin
process (clk)
variable i : integer;
begin
	i := 7;
	while (i > 1) loop
		sreg(i) <= sreg(i-1);
		i := i - 1;
	end loop;
	sreg(0) <= D_in;
end process;
end EightBitShift;
