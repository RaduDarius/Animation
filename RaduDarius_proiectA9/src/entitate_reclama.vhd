library	IEEE;
use IEEE.STD_LOGIC_1164.all; 
library work;
use work.my_package.all;

entity reclama_animatie is

	port(EN, RESET, CLK: in std_logic;
	SEL: in std_logic_vector(2 downto 0);
	Litera: out tip_LITERA;
	Anod: out std_logic_vector(3 downto 0) );

end entity reclama_animatie;