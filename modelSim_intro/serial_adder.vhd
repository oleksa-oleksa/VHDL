LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- This is a serial adder from Intel Tutorium for Altera
-- downto corresponds to little endian. This means that the least significant bit 
-- is stored at the lowest position. 
-- So in L downto R, L corresponds to the Most Significant Bit (MSB) 
-- and R to the Least Significant Bit (LSB). 
-- to corresponds to big endian. So in L to R, L is the LSB and R the MSB.

ENTITY serial IS
   PORT(
        A : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        B : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        start : IN STD_LOGIC;
        resetn : IN STD_LOGIC;
        clock : IN STD_LOGIC;
        sum : OUT STD_LOGIC_VECTOR(8 DOWNTO 0)
       );
END serial;

ARCHITECTURE Behaviour OF serial IS

-- Registers.
-- SIGNAL serves to pass values in and out the circuit, 
-- as well as between its internal units. 
-- In other words, a signal represents circuit interconnects (wires). 
-- For instance,all PORTS of an ENTITY are signals by default.


     SIGNAL A_reg : STD_LOGIC_VECTOR(7 DOWNTO 0);
     SIGNAL B_reg : STD_LOGIC_VECTOR (7 DOWNTO 0);
     SIGNAL SUM_reg : STD_LOGIC_VECTOR (8 DOWNTO 0);
     SIGNAL cin : STD_LOGIC;

-- Wires
     SIGNAL reset : STD_LOGIC;
     SIGNAL enable : STD_LOGIC;
     SIGNAl load : STD_LOGIC;
     SIGNAl bit_sum : STD_LOGIC;
     SIGNAl bit_carry : STD_LOGIC;

 BEGIN
     PROCESS (clock)
     BEGIN
     IF clock'EVENT AND clock = '1' THEN
      IF (enable = '1') THEN 
        IF (reset = '1') THEN
          cin <= '0';
        ELSE
          cin <= bit_carry;
        END IF;
       END IF;
     END IF;
     END PROCESS;

-- Component FSM. 
-- Control FSM.

 my_control : entity work.FSM(Behaviour)
 PORT MAP(start, clock, resetn, reset, enable, load);

-- Datapath.
 reg_A : entity work.shift_reg(Behaviour)
 PORT MAP(clock, '0', A, '0', enable, load, A_reg);

 reg_B : entity work.shift_reg(Behaviour)
 PORT MAP(clock, '0', B, '0', enable, load, B_reg);

-- full adder.
 bit_carry <= (A_reg(0) AND B_reg(0)) OR (A_reg(0) AND cin) OR (B_reg(0) AND cin); 
 bit_sum <= A_reg(0) XOR B_reg(0) XOR cin;

 reg_sum : entity work.shift_reg
 GENERIC MAP(9)
 PORT MAP(clock, reset, B"000000000", bit_sum, enable, '0', sum);

END Behaviour;