LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY 2disreg IS
PORT ( d: IN std_logic;
       c1: IN std_logic;
	   c2: IN std_logic;
	   r: IN std_logic;
	   q: INOUT std_logic );
END 2disreg;

ARCHITECTURE behav OF 2disreg IS
	SIGNAL d1: std_logic;
	SIGNAL d2: std_logic;
BEGIN

PROCESS (d,c,r)
	BEGIN
		IF r = '1' THEN
			IF c1 = '1' THEN
				d1 <= d
			END IF;

			IF c2 = '1' THEN
				d2 <= d1
			END IF;

		ELSE q <= '0';

		END IF;
		q <= d2;

END PROCESS;
END behav;
