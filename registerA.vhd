LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY registerA IS
	PORT ( A	  : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
Resetn, Clock : IN STD_LOGIC;
				Q : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
		
END ENTITY;
ARCHITECTURE Behavior OF registerA IS
	BEGIN 
		PROCESS ( Resetn, Clock )
		BEGIN 
			IF Resetn = '0' THEN 
				Q <= "00000000";
			ELSIF Clock'EVENT AND Clock = '1' THEN 
				Q <= A;
			END IF;
		END PROCESS;
END Behavior;
