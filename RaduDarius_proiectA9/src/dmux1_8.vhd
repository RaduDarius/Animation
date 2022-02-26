library	IEEE;
use IEEE.STD_LOGIC_1164.all; 
library work;
use work.my_package.all;

entity dmux1_8 is 
	port(I: in std_logic;
	Sel: in std_logic_vector(2 downto 0);
	Q: out std_logic_vector(7 downto 0));
end entity dmux1_8;

architecture arh_dmux1_8 of dmux1_8 is
begin
	process(Sel, I)
	begin
		case(Sel) is
			when "000" => Q(0) <= I;
			when "001" => Q(1) <= I;  
			when "010" => Q(2) <= I;
			when "011" => Q(3) <= I;
			when "100" => Q(4) <= I;
			when "101" => Q(5) <= I;
			when "110" => Q(6) <= I;
			when others => Q(7) <= I;
		end case;
	end process;
end architecture;