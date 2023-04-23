LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY SevenSeg IS
PORT(
	SWs: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	LEDs: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	LEDg: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	Seg: OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
	Sel: IN STD_LOGIC
	);
END SevenSeg;

ARCHITECTURE df OF SevenSeg IS
BEGIN

--	Sel(0) <= '1';
--	Sel(1) <= '0';
	LEDg <= "11111111";

	PROCESS(SWs, Sel)
	BEGIN
		IF Sel = '0' THEN
			Seg(0) <= '0';
			Seg(1) <= '1';
		ELSIF Sel = '1' THEN
			Seg(0) <= '1';
			Seg(1) <= '0';
		END IF;

		CASE SWs is
			WHEN "0000" => LEDs <= "1111110"; -- 0
			WHEN "0001" => LEDs <= "0110000"; -- 1
			WHEN "0010" => LEDs <= "1101101"; -- 2
			WHEN "0011" => LEDs <= "1111001"; -- 3
			WHEN "0100" => LEDs <= "0010011"; -- 4
			WHEN "0101" => LEDs <= "1011011"; -- 5
			WHEN "0110" => LEDs <= "1011111"; -- 6
			WHEN "0111" => LEDs <= "1110000"; -- 7
			WHEN "1000" => LEDs <= "1111111"; -- 8
			WHEN "1001" => LEDs <= "1111011"; -- 9
			WHEN OTHERS => LEDs <= "0011100";
		END CASE;
	END PROCESS;
END df;
