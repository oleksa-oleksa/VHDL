LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

ENTITY shift_universal IS
GENERIC (N : integer := 4);
PORT(	CLK, RST, LD:  IN std_logic; -- Control Inputs
	SHL, SHR:  IN std_logic; -- Direction of serial data shift
	D:  IN std_logic_vector(N-1 downto 0); -- Parallel Data Input
	S:  IN std_logic_vector(1 downto 0 ); -- Mode Control Input
	Qp, Qn: OUT std_logic_vector(N-1 downto 0)); -- Parallel Output
END shift_universal;

ARCHITECTURE behav OF shift_universal IS

SIGNAL Qo :std_logic_vector(N-1 downto 0) := (others => 'U');

BEGIN 
shift_universal: PROCESS (D, CLK, RST, LD, SHL, SHR, S) IS
BEGIN
    IF (RST='1') THEN --clear register
        Qo <= ( others => '0' );
    ELSIF ((LD='1') and (rising_edge(CLK) ) ) THEN --LD is active to set D on rising edge
			case S is
				when "10" => -- shift left in
					Qo(N-1 downto 1) <= Qo(N-2 downto 0);
					Qo(0) <= SHL;
				when "01" => -- shift right in
					Qo(N-2 downto 0) <= Qo(N-1 downto 1);
					Qo(N-1) <= SHR;
				when "11" => -- load parallel
					Qo <= D;
				when "00" => -- hold
				when others =>
					Qo <= Qo;
			end case;
    ELSE
	     Qo <= Qo;
    END IF;
END PROCESS shift_universal;

Qp <= Qo;
Qn <= NOT Qo;

END behav;