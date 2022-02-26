library	IEEE;
use IEEE.STD_LOGIC_1164.all; 
library work;
use work.my_package.all;

entity dmux1_4 is 
	port(I: in std_logic;
	Sel: in std_logic_vector(1 downto 0);
	Q: out std_logic_vector(3 downto 0));
end entity dmux1_4;

architecture arh_dmux1_4 of dmux1_4 is		

signal D: std_logic_vector(3 downto 0);

begin
	process(Sel, I)					  
	begin	 
		D <= "0000";
		case(Sel) is
			when "00" => D(0) <= I;
			when "01" => D(1) <= I;  
			when "10" => D(2) <= I;
			when others => D(3) <= I;
		end case;
	Q <= not D;
	end process;
end architecture;