library	IEEE;
use IEEE.STD_LOGIC_1164.all;
library work;
use work.my_package.all;

entity Mem_Rom8 is
	port(A_ROM: in std_logic_vector (2 downto 0); 
		CS_ROM: in std_logic; 
		Q_ROM: out tip_LITERA); 
end entity;		

architecture arh_ROM0 of Mem_Rom8 is   							 

signal ROM: tip_LITERA;

begin
	
	process(CS_ROM, A_ROM)
	begin
		if(CS_ROM = '1') then
			case (A_ROM) is
				when "000" => ROM <= ALFABET(20);
				when "001" => ROM <= ALFABET(19);
				when "010" => ROM <= ALFABET(2);
				when "011" => ROM <= ALFABET(13);
				when others => ROM <= ALFABET(26);
			end case;
		end if;
		Q_ROM <= ROM;
	end process;
end architecture;