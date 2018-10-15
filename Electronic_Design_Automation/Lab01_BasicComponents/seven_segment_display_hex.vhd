LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE ieee.numeric_std.all;

ENTITY seven_segment_display_hex IS
PORT( 	 DATA : IN std_logic_vector(5 downto 0); -- binary digit
	 SSD_OUT : OUT std_logic_vector(6 downto 0));
END seven_segment_display_hex;

ARCHITECTURE Segdis_behavior OF seven_segment_display_hex IS
SIGNAL S : std_logic_vector(6 downto 0);
SIGNAL DIGIT : std_logic_vector(3 downto 0);
SIGNAL LTN, BLN : std_logic;

BEGIN
SSD_OUT <= NOT S;
LTN <= DATA(5);
BLN <= DATA(4);
DIGIT <= DATA(3 downto 0);

PROCESS (DIGIT) -- Sensivity list
BEGIN
IF (LTN = '0') THEN
	S(0) <= BLN;
	S(1) <= BLN;
	S(2) <= BLN;
	S(3) <= BLN;
	S(4) <= BLN;
	S(5) <= BLN;
	S(6) <= BLN;
ELSIF (LTN = '1' AND BLN = '0') THEN
CASE DIGIT IS
	WHEN "0000" => S <= "0111111";
	WHEN "0001" => S <= "0000110";
	WHEN "0010" => S <= "1011011";
	WHEN "0011" => S <= "1001111";
	WHEN "0100" => S <= "1100110";
	WHEN "0101" => S <= "1101101";
	WHEN "0110" => S <= "1111101";
	WHEN "0111" => S <= "0000111";
	WHEN "1000" => S <= "1111111";
	WHEN "1001" => S <= "1101111";
	WHEN "1010" => S <= "1110111";
	WHEN "1011" => S <= "1111100";
	WHEN "1100" => S <= "0111001";
	WHEN "1101" => S <= "1011110";
	WHEN "1110" => S <= "1111001";
	WHEN "1111" => S <= "1110001";
	WHEN OTHERS => S <= "UUUUUUU";
END CASE;
END IF;
END PROCESS;
END Segdis_behavior;