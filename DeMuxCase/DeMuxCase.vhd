LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY DeMuxCase IS
PORT(
	E: IN STD_LOGIC;
--	D: IN STD_LOGIC;
	sel: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	LEDs: OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END DeMuxCase;

ARCHITECTURE df of DeMuxCase IS
BEGIN
	LEDs(7 DOWNTO 4) <= "1111";
	PROCESS(sel, E)
	BEGIN
		CASE E IS
			WHEN '1' =>
				CASE sel IS
					WHEN "00" => LEDs(0) <= '1'; LEDs(1) <= '0'; LEDs(2) <= '0'; LEDs(3) <= '0';
					WHEN "01" => LEDs(1) <= '1'; LEDs(0) <= '0'; LEDs(2) <= '0'; LEDs(3) <= '0';
					WHEN "10" => LEDs(2) <= '1'; LEDs(1) <= '0'; LEDs(0) <= '0'; LEDs(3) <= '0';
					WHEN "11" => LEDs(3) <= '1'; LEDs(1) <= '0'; LEDs(2) <= '0'; LEDs(0) <= '0';
					WHEN OTHERS => NULL;
				END CASE;
			WHEN OTHERS => NULL;
		END CASE;
	END PROCESS;

END df;
