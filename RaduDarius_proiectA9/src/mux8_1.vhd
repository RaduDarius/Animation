library	IEEE;
use IEEE.STD_LOGIC_1164.all; 
library work;
use work.my_package.all;

entity mux8_1 is
	port(I: in tip_inMUX;
	Sel: in std_logic_vector(2 downto 0);
	Q: out tip_LITERA);
end entity;

architecture arh_mux8_1 of mux8_1 is
begin	  
	process(Sel)
	begin
		case(Sel) is
			when "000" => Q <= I(0);
			when "001" => Q <= I(1);
			when "010" => Q <= I(2);
			when "011" => Q <= I(3);
			when "100" => Q <= I(4);
			when "101" => Q <= I(5);
			when "110" => Q <= I(6);
			when others => Q <= I(7);
		end case;
	end process;
end architecture;