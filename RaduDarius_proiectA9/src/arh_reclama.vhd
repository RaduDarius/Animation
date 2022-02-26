library	IEEE;
use IEEE.STD_LOGIC_1164.all; 
library work;
use work.my_package.all;

architecture arh_reclama of reclama_animatie is

	component dmux1_4
		port(I: in std_logic;
		Sel: in std_logic_vector(1 downto 0);
		Q: out std_logic_vector(3 downto 0));
	end component;
	for ANOD_SELECTIE: dmux1_4 use entity work.dmux1_4(arh_dmux1_4);

	component dmux1_8
		port(I: in std_logic;
		Sel: in std_logic_vector(2 downto 0);
		Q: out std_logic_vector(7 downto 0));
	end component;
	for MOD_ANIMATIE: dmux1_8 use entity work.dmux1_8(arh_dmux1_8);
			
	component mux8_1 
		port(I: in tip_inMUX;
		Sel: in std_logic_vector(2 downto 0);
		Q: out tip_LITERA);
	end component;
	for SELECTIE_LITERA: mux8_1 use entity work.mux8_1(arh_mux8_1);
	
	component numarator_27bit 
		port(CLK, RESET: in std_logic;
		Q: out std_logic_vector(26 downto 0));
	end component;
	for NUMARATOR: numarator_27bit use entity work.numarator_27bit(arh_numarator27bit);
		
	component Mem_Rom8
		port(A_ROM: in std_logic_vector (2 downto 0); 
			CS_ROM: in std_logic; 
			Q_ROM: out tip_LITERA); 
	end component;	
	for ROM0: Mem_Rom8 use entity work.Mem_Rom8(arh_ROM0);
		
	component Mem_Rom16
		port(A_ROM: in std_logic_vector (3 downto 0); 
			CS_ROM: in std_logic; 
			Q_ROM: out tip_LITERA); 
	end component;
	for ROM1: Mem_Rom16 use entity work.Mem_Rom16(arh_ROM1);
	for ROM2: Mem_Rom16 use entity work.Mem_Rom16(arh_ROM2);
	for ROM3: Mem_Rom16 use entity work.Mem_Rom16(arh_ROM3);
	for ROM4: Mem_Rom16 use entity work.Mem_Rom16(arh_ROM4);
	
	component Mem_Rom32
		port(A_ROM: in std_logic_vector (4 downto 0); 
			CS_ROM: in std_logic; 
			Q_ROM: out tip_LITERA); 
	end component;	
	for ROM5: Mem_Rom32 use entity work.Mem_Rom32(arh_ROM5);
	
	signal Q: std_logic_vector(26 downto 0);
	signal CS: std_logic_vector(7 downto 0);
	signal ROM_LITERA: tip_inMUX;
	signal LITERA_0: tip_LITERA; 
	
begin
	LITERA_0 <= "11111111";
	
	-- Numaram / divizam frecventa
	NUMARATOR: numarator_27bit port map(CLK => CLK, RESET => RESET, Q => Q);
	
	-- Selectam animatia
	MOD_ANIMATIE: dmux1_8 port map(I => EN, Sel => SEL, Q => CS);
	
	-- Clipire
	ROM0: Mem_Rom8 port map(A_ROM(2) => Q(26),
	A_ROM(1) =>	Q(19),
	A_ROM(0) =>	Q(18),
	CS_ROM => CS(0), Q_ROM => ROM_LITERA(0)); 
	
	-- Shifting la dreapta
	ROM1: Mem_Rom16 port map(A_ROM(3) => Q(26),
	A_ROM(2) => Q(25),
	A_ROM(1) =>	Q(19),
	A_ROM(0) =>	Q(18),
	CS_ROM => CS(1), Q_ROM => ROM_LITERA(1));
	
	-- Apare cuvantul litera cu litera
	ROM2: Mem_Rom16 port map(A_ROM(3) => Q(26),
	A_ROM(2) => Q(25),
	A_ROM(1) =>	Q(19),
	A_ROM(0) =>	Q(18),
	CS_ROM => CS(2), Q_ROM => ROM_LITERA(2)); 
	
	-- Clipeste fiecare litera pe rand 
	ROM3: Mem_Rom16 port map(A_ROM(3) => Q(26),
	A_ROM(2) => Q(25),
	A_ROM(1) =>	Q(19),
	A_ROM(0) =>	Q(18),
	CS_ROM => CS(3), Q_ROM => ROM_LITERA(3));	
	
	-- Curgere de sus in jos
	ROM4: Mem_Rom16 port map(A_ROM(3) => Q(26),
	A_ROM(2) => Q(25),
	A_ROM(1) =>	Q(19),
	A_ROM(0) =>	Q(18),	  
	CS_ROM => CS(4), Q_ROM => ROM_LITERA(4));
	
	-- Curgere pe diagonala
	ROM5: Mem_Rom32 port map(A_ROM(4) => Q(26),
	A_ROM(3) => Q(25),
	A_ROM(2) => Q(24),
	A_ROM(1) =>	Q(19),
	A_ROM(0) =>	Q(18),
	CS_ROM => CS(5), Q_ROM => ROM_LITERA(5));
	
	-- Selectam litera ce va fi afisata pe anod
	SELECTIE_LITERA: mux8_1 port map(I(0) => ROM_LITERA(0),
	I(1) => ROM_LITERA(1),
	I(2) => ROM_LITERA(2),
	I(3) => ROM_LITERA(3),
	I(4) => ROM_LITERA(4),
	I(5) => ROM_LITERA(5),
	I(6) => LITERA_0,
	I(7) => LITERA_0, Sel => SEL, Q => Litera); 
	
	-- Selectam anodul pe care se va afisa caracterul
	ANOD_SELECTIE: dmux1_4 port map(I => EN, 
	Sel(0) => Q(18),
	Sel(1) => Q(19),
	Q => Anod);  
	
end architecture;