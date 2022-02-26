library	IEEE;
use IEEE.STD_LOGIC_1164.all; 

package my_package is
	
	type tip_LITERA is array(7 downto 0) of std_logic;
	type tip_ALFABET is array(26 downto 0) of tip_LITERA;
	type tip_inMUX is array(7 downto 0) of tip_LITERA;
	
	constant ALFABET: tip_ALFABET := (
	
	 0 => "00010001",--A
	 1 => "00000001",--B
	 2 => "01100011",--C
	 3 => "00000111",--D
	 4 => "01100001",--E
	 5 => "01110001",--F
	 6 => "01000011",--G
	 7 => "10010001",--H
	 8 => "11110011",--I
	 9 => "10000111",--J
	10 => "10100001",--K
	11 => "11100011",--L
	12 => "01010101",--M
	13 => "00010011",--N		
	14 => "00000011",--O
	15 => "00110001",--P
	16 => "00100011",--Q
	17 => "00100001",--R
	18 => "01001001",--S
	19 => "01110011",--T
	20 => "10000011",--U
	21 => "10001011",--V
	22 => "10101001",--W
	23 => "01101101",--X
	24 => "10001001",--Y
	25 => "00100101",--Z
	26 => "11111111" ); --SPATIU
	
end package;