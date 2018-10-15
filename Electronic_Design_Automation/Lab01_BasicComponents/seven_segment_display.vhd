LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE ieee.numeric_std.all;

ENTITY seven_segment_display IS
PORT( 	 DATA : IN std_logic_vector(6 downto 0); 
	 SSD_OUT : OUT std_logic_vector(6 downto 0));
END seven_segment_display;

ARCHITECTURE Segdis_behavior OF seven_segment_display IS

COMPONENT seven_segment_display_decimal IS
PORT( 	 DATA : IN std_logic_vector(5 downto 0); -- binary digit
	 SSD_OUT : OUT std_logic_vector(6 downto 0));
END COMPONENT;

COMPONENT seven_segment_display_hex IS
PORT( 	 DATA : IN std_logic_vector(5 downto 0); -- binary digit
	 SSD_OUT : OUT std_logic_vector(6 downto 0));
END COMPONENT;

SIGNAL S1, S0 : std_logic_vector(6 downto 0);
SIGNAL HB : std_logic;

BEGIN
HB <= DATA(6);
PROCESS (DATA) -- Sensivity list
BEGIN
	IF (HB = '0') THEN
		SSD_OUT <= S0;
	ELSIF (HB = '1') THEN
		SSD_OUT <= S1;
	ELSE
		SSD_OUT <= "1111111";
	END IF;
END PROCESS;

UNIT_1: seven_segment_display_hex PORT MAP(DATA(5 DOWNTO 0), S0);
UNIT_2: seven_segment_display_decimal PORT MAP(DATA(5 DOWNTO 0), S1);

END Segdis_behavior; 