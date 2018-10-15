LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE ieee.numeric_std.all;

ENTITY seven_segment_display IS
PORT( 	 DATA : IN std_logic_vector(3 downto 0); -- binary digit
	 HB : IN std_logic; -- mode decimal/hex selector
	 LTN, BLN : IN std_logic; -- active/inactive display selector
	 A, B, C, D, E, F, G : OUT std_logic);
END seven_segment_display;

ARCHITECTURE Segdis_behavior OF seven_segment_display IS
BEGIN
PROCESS (HB, LTN, BLN) -- Sensivity list

variable data_sum : integer;

BEGIN

data_sum := to_integer(unsigned(DATA));

-- decimal active part
if (HB = '1' AND LTN = '1' AND BLN = '0' AND data_sum <= 9) then
A <= (DATA(0) AND NOT DATA(2) AND NOT DATA(1) AND NOT DATA(3)) 
	OR (DATA(0) AND NOT DATA(2) AND DATA(1) AND DATA(3)) 
	OR (DATA(0) AND DATA(2) AND NOT DATA(1) AND DATA(3)) 
	OR (NOT DATA(0) AND DATA(2) AND NOT DATA(1) AND DATA(3));

B <= (DATA(0) AND DATA(2) AND NOT DATA(1) AND NOT DATA(3)) OR
	(NOT DATA(0) AND DATA(2) AND DATA(1)) OR
	(NOT DATA(0) AND DATA(2) AND DATA(3)) OR
	(DATA(0) AND DATA(1) AND DATA(3));

C <= (NOT DATA(0) AND NOT DATA(2) AND DATA(1) AND NOT DATA(3)) OR
(DATA(2) AND DATA(1) AND DATA(3)) OR
(NOT DATA(0) AND DATA(2) AND DATA(3));

D <= (DATA(0) AND NOT DATA(2) AND NOT DATA(1) AND NOT DATA(3)) OR
(NOT DATA(0) AND DATA(2) AND NOT DATA(1) AND NOT DATA(3)) OR
(NOT DATA(0) AND NOT DATA(2) AND DATA(1) AND DATA(3)) OR
(DATA(0) AND DATA(2) AND DATA(1)); 
 
E <= (DATA(0) AND NOT DATA(3)) OR
(DATA(2) AND NOT DATA(1) AND NOT DATA(3)) OR
(DATA(0) AND DATA(2) AND NOT DATA(1) );

F <= (NOT DATA(2) AND DATA(1) AND NOT DATA(3)) OR
(DATA(0) AND NOT DATA(2) NOT DATA(3)) OR
(DATA(0) AND DATA(1) AND NOT DATA(3)) OR
(DATA(0) AND DATA(2) AND NOT DATA(1) AND DATA(3));

G <= (NOT DATA(2) AND NOT DATA(1) AND NOT DATA(3)) OR
(DATA(0) AND DATA(2) AND DATA(1) AND NOT DATA(3)) OR
(NOT DATA(0) AND DATA(2) AND NOT DATA(1) AND DATA(3));

-- decimal inactive part
elsif (HB = '1' AND LTN = '1' AND BLN = '0' AND data_sum > 9) then
	-- all segments are off
	A <= '0'; B <= '0'; C <= '0'; D <= '0';
	E <= '0'; F <= '0'; G <= '0';

 -- hexadecimal active part
elsif (HB = '0' AND LTN = '1' AND BLN = '0') then

-- inactive display
elsif ( LTN = '0') then
	if (BLN = '1') then
	elsif (BLN = '0') then
	end if;
end if;

END PROCESS;
END Segdis_behavior;