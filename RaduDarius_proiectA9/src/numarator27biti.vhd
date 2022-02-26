library	IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;
library work;
use work.my_package.all;

entity numarator_27bit is
	port(CLK, RESET: in std_logic;
		Q: out std_logic_vector(26 downto 0));
end entity;

architecture arh_numarator27bit of numarator_27bit is
begin
	process(CLK, RESET)
	variable numar: integer := 0;
	begin
		if(RESET = '1') then numar := 0;
		elsif(CLK = '1' and CLK'EVENT) then
			if(numar < 134217728) then
				numar := numar + 1;
			else
				numar := 0;
			end if;
		end if;
		
		Q <= std_logic_vector(to_unsigned(numar,Q'LENGTH));
	end process;
end architecture;