LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY disreg IS
PORT ( d: IN std_logic;
	   c1: IN std_logic;
	   c2: IN std_logic;
       r: IN std_logic;
       q1: INOUT std_logic;
	   q2: INOUT std_logic );
END disreg;

ARCHITECTURE behav OF disreg IS
	SIGNAL d1: std_logic;
	SIGNAL d2: std_logic;
	SIGNAL d3: std_logic;
	SIGNAL d4: std_logic;

BEGIN

PROCESS (d,c1,c2,r)
	BEGIN
	
	IF r = '1' THEN
		IF c1 = '1' THEN
			d1 <= d;
			d3 <= d2;
		END IF;

		IF c2 = '1' THEN
			d2 <= d1;
			d4 <= d3;
		END IF;
		q1 <= d2;
		q2 <= d4;

	ELSE
		q1 <= '0';
		q2 <= '0';

	END IF;

END PROCESS;
END behav;
