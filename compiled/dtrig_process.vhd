LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY dtrig_process IS
PORT ( d : IN std_logic;
       l : IN std_logic;
       q : INOUT std_logic;
       qb : INOUT std_logic );
END dtrig_process;

ARCHITECTURE behav OF dtrig_process IS
	--SIGNAL sq : std_logic;
BEGIN
PROCESS(d, l)
   BEGIN
      IF d = '1' then
         IF l = '1' THEN
            q <= '1';
            qb <= '1';
         ELSE
            q <= '1'; 
            qb <= '0';
         END IF;
      ELSE
         IF l = '1' then
            q <= '0'; 
            qb <= '1';
         END IF;
      END IF;
END PROCESS;
END behav;
