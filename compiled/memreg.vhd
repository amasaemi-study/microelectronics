LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY memreg IS
PORT ( d : IN std_logic;
       c : IN std_logic;
       r : IN std_logic; 
       q1 : INOUT std_logic;
       q2 : INOUT std_logic );
END memreg;

ARCHITECTURE behav OF memreg IS
	SIGNAL d1:std_logic;
	SIGNAL d2:std_logic;
	SIGNAL d3:std_logic;
	SIGNAL d4:std_logic;
BEGIN
	PROCESS(d,c,r)
	BEGIN
		IF r = '1' THEN
			IF c = '1' THEN
				d1 <= d;
				d3 <= d2;
			ELSE
				d2 <= d1;
				d4 <= d3;
			END IF;

		ELSE q1 <= '0';
			q2 <= '0';
		END IF;
	
		q1 <= d2;
		q2 <= d4;
	END PROCESS;

END behav;
