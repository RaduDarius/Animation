library	IEEE;
use IEEE.STD_LOGIC_1164.all;
library work;
use work.my_package.all;

entity Mem_Rom32 is
	port(A_ROM: in std_logic_vector (4 downto 0); 
		CS_ROM: in std_logic; 
		Q_ROM: out tip_LITERA); 
end entity;	

architecture arh_ROM5 of Mem_Rom32 is
signal ROM: tip_LITERA;
begin
	process(A_ROM, CS_ROM)
	begin
		if(CS_ROM = '1') then
			case(A_ROM) is
				when "00000" => ROM <= "10111011";
				
				when "00100" => ROM <= ALFABET(20);
				when "00101" => ROM <= "01111011";
				
				when "01000" => ROM <= ALFABET(20);
				when "01001" => ROM <= ALFABET(19);
				when "01010" => ROM <= "01111011";
				
				when "01100" => ROM <= ALFABET(20);
				when "01101" => ROM <= ALFABET(19);
				when "01110" => ROM <= ALFABET(2);
				when "01111" => ROM <= "10111011";		
				
				when "10000" => ROM <= ALFABET(20);
				when "10001" => ROM <= ALFABET(19);
				when "10010" => ROM <= ALFABET(2);
				when "10011" => ROM <= ALFABET(13);	
				
				when others => ROM <= ALFABET(26); 
			end case;
		end if;
		Q_ROM <= ROM;
	end process;
end architecture;