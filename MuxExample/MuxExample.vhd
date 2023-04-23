LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY MuxExample IS
PORT(
	A: IN STD_LOGIC;
	B: IN STD_LOGIC;
	C: IN STD_LOGIC;
	D: IN STD_LOGIC;
	sel: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	LEDs: OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END MuxExample;

ARCHITECTURE df of MuxExample IS
	BEGIN
		LEDs(7 DOWNTO 1) <= "1111111";
		PROCESS(sel, A, B, C, D)
		BEGIN
			CASE sel IS
				WHEN "00" => LEDs(0) <= A;
				WHEN "01" => LEDs(0) <= B;
				WHEN "10" => LEDs(0) <= C;
				WHEN "11" => LEDs(0) <= D;
				WHEN OTHERS => NULL;
			END CASE;
		END PROCESS;

END df;
