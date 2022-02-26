library	IEEE;
use IEEE.STD_LOGIC_1164.all;
library work;
use work.my_package.all;

entity Mem_Rom16 is
	port(A_ROM: in std_logic_vector (3 downto 0); 
		CS_ROM: in std_logic; 
		Q_ROM: out tip_LITERA); 
end entity;		

architecture arh_ROM1 of Mem_Rom16 is   							 

signal ROM: tip_LITERA;

begin
	
	process(CS_ROM, A_ROM)
	begin
		if(CS_ROM = '1') then
			case (A_ROM) is
				when "0000" => ROM <= ALFABET(20);
				when "0001" => ROM <= ALFABET(19);
				when "0010" => ROM <= ALFABET(2);
				when "0011" => ROM <= ALFABET(13);	
				
				when "0100" => ROM <= ALFABET(13);
				when "0101" => ROM <= ALFABET(20);
				when "0110" => ROM <= ALFABET(19);
				when "0111" => ROM <= ALFABET(2);	
				
				when "1000" => ROM <= ALFABET(2);
				when "1001" => ROM <= ALFABET(13);
				when "1010" => ROM <= ALFABET(20);
				when "1011" => ROM <= ALFABET(19); 
				
				when "1100" => ROM <= ALFABET(19);
				when "1101" => ROM <= ALFABET(2);
				when "1110" => ROM <= ALFABET(13);
				when "1111" => ROM <= ALFABET(20);
				
				when others => ROM <= ALFABET(26);
			end case;
		end if;
		Q_ROM <= ROM;
	end process;
end architecture;	   

architecture arh_ROM2 of Mem_Rom16 is   							 

signal ROM: tip_LITERA;

begin
	
	process(CS_ROM, A_ROM)
	begin
		if(CS_ROM = '1') then
			case (A_ROM) is
				when "0000" => ROM <= ALFABET(20);	
				
				when "0100" => ROM <= ALFABET(20);
				when "0101" => ROM <= ALFABET(19);
				
				when "1000" => ROM <= ALFABET(20);
				when "1001" => ROM <= ALFABET(19);
				when "1010" => ROM <= ALFABET(2);
				
				when "1100" => ROM <= ALFABET(20);
				when "1101" => ROM <= ALFABET(19);
				when "1110" => ROM <= ALFABET(2);
				when "1111" => ROM <= ALFABET(13);
				
				when others => ROM <= ALFABET(26);
			end case;
		end if;
		Q_ROM <= ROM;
	end process;
end architecture;	 	 

architecture arh_ROM3 of Mem_Rom16 is   							 

signal ROM: tip_LITERA;

begin
	
	process(CS_ROM, A_ROM)
	begin
		if(CS_ROM = '1') then
			case (A_ROM) is
				when "0000" => ROM <= ALFABET(20);
				when "0001" => ROM <= ALFABET(20);
				when "0010" => ROM <= ALFABET(20);
				when "0011" => ROM <= ALFABET(20);	
				
				when "0100" => ROM <= ALFABET(19);
				when "0101" => ROM <= ALFABET(19);
				when "0110" => ROM <= ALFABET(19);
				when "0111" => ROM <= ALFABET(19);	
				
				when "1000" => ROM <= ALFABET(2);
				when "1001" => ROM <= ALFABET(2);
				when "1010" => ROM <= ALFABET(2);
				when "1011" => ROM <= ALFABET(2); 
				
				when "1100" => ROM <= ALFABET(13);
				when "1101" => ROM <= ALFABET(13);
				when "1110" => ROM <= ALFABET(13);
				when "1111" => ROM <= ALFABET(13);
				
				when others => ROM <= ALFABET(26);
			end case;
		end if;
		Q_ROM <= ROM;
	end process;
end architecture;	 

architecture arh_ROM4 of Mem_Rom16 is   							 

signal ROM: tip_LITERA;

begin
	
	process(CS_ROM, A_ROM)
	begin
		if(CS_ROM = '1') then
			case (A_ROM) is
				when "0000" => ROM <= "11111111";
				when "0001" => ROM <= "01111111";
				when "0010" => ROM <= "01111111";
				when "0011" => ROM <= "01111111";	
				
				when "0100" => ROM <= "10111011";
				when "0101" => ROM <= "01111011";
				when "0110" => ROM <= "01111011";
				when "0111" => ROM <= "00111011";	
				
				when "1000" => ROM <= "10010011";
				when "1001" => ROM <= "01110011";
				when "1010" => ROM <= "01110011";
				when "1011" => ROM <= "00010011"; 
				
				when "1100" => ROM <= ALFABET(20);
				when "1101" => ROM <= ALFABET(19);
				when "1110" => ROM <= ALFABET(2);
				when "1111" => ROM <= ALFABET(13);
				
				when others => ROM <= ALFABET(26);
			end case;
		end if;
		Q_ROM <= ROM;
	end process;
end architecture;