LIBRARY IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
-- 2^6 = 64. Counts 0 to 63

entity sixBitCounter IS
generic ( counter_start_custom : std_logic_vector(5 downto 0) := "010101"	  
	);
port (
	clk, reset, set : in std_logic;
	counter : out std_logic_vector(5 downto 0)
 	);
end sixBitCounter;

Architecture Beha of sixBitCounter is
signal s_counter : std_logic_vector(5 downto 0);
begin
process (clk, reset, set)
	begin
	if (reset = '1' and set = '1') then -- asynchron reset
		s_counter <= "000000";
	elsif (reset = '1' and set = '0') then
		s_counter <= counter_start_custom;
	end if;	

	if (clk'event and clk = '1' and reset = '0') then
		if (set = '0' and s_counter = "111111") then
			s_counter <= counter_start_custom;
		else
			s_counter <= s_counter + 1;
		end if;
	end if;
end process;

counter <= s_counter;

end beha;


