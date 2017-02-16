LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY dtrig IS
PORT ( d : IN std_logic;
       l : IN std_logic;
       q : INOUT std_logic;
       qb : INOUT std_logic );
END dtrig;

ARCHITECTURE behav OF dtrig IS

COMPONENT notand
PORT ( a : IN std_logic;
	   b : IN std_logic;
	   c : INOUT std_logic );
END COMPONENT;

COMPONENT rstrig
PORT ( s : IN std_logic;
       r : IN std_logic;
       q : INOUT std_logic;
       qb : INOUT std_logic );
END COMPONENT;

SIGNAL s1 : std_logic;
SIGNAL s2 : std_logic;

BEGIN
n1 : notand
   PORT MAP (d, l, s1);
n2 : notand
   PORT MAP (s1, l, s2);
rs : rstrig
   PORT MAP (s1, s2, q, qb);
END behav;

CONFIGURATION con OF dtrig IS
FOR behav
   FOR n1, n2 : notand
      USE ENTITY work.notand (behavior);
   END FOR;
   FOR rs : rstrig
      USE ENTITY work.rstrig (behavior);
   END FOR;
END FOR;
END con;
