LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

LIBRARY work;
USE work.ALL;

entity MULT_COMB_8BITS is port(
                                A  : in STD_LOGIC_VECTOR(7 DOWNTO 0);
                                B  : in STD_LOGIC_VECTOR(7 DOWNTO 0);
                                S  : out STD_LOGIC_VECTOR(15 DOWNTO 0)
                                VA : out STD_LOGIC);
end MULT_COMB_8BITS;

architecture mista of MULT_COMB_8BITS is

component SOMADOR_4BIT is port(
                        A  : in STD_LOGIC_VECTOR(3 DOWNTO 0);
                        B  : in STD_LOGIC_VECTOR(3 DOWNTO 0);
                        C  : in STD_LOGIC;
                        S0 : out STD_LOGIC_VECTOR(3 DOWNTO 0);
                        S1 : out STD_LOGIC);
end component;

component MULTIPLICADOR_8BITS is port(
                                A : in STD_LOGIC_VECTOR(3 DOWNTO 0);
                                B : in STD_LOGIC_VECTOR(3 DOWNTO 0);
                                M : out STD_LOGIC_VECTOR(7 DOWNTO 0));
end component;

signal M0, M1, M2, M3               : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal AUX0, AUX1, AUX2, AUX3, AUX4 : STD_LOGIC_VECTOR(3 DOWNTO 0);
signal VA0, VA1, VA2, VA3, VA4      : STD_LOGIC;
signal TMP                          : STD_LOGIC_VECTOR(3 DOWNTO 0);

begin

    multiplicador0 : MULTIPLICADOR_8BITS port map(A(3 DOWNTO 0), B(3 DOWNTO 0), M0);
    multiplicador1 : MULTIPLICADOR_8BITS port map(A(3 DOWNTO 0), B(3 DOWNTO 0), M1);
    multiplicador2 : MULTIPLICADOR_8BITS port map(A(7 DOWNTO 4), B(7 DOWNTO 4), M2);
    multiplicador3 : MULTIPLICADOR_8BITS port map(A(7 DOWNTO 4), B(7 DOWNTO 4), M3);

    somador0 : SOMADOR_4BIT port map(M0(7 DOWNTO 4), M1(3 DOWNTO 0), '0', AUX0, VA0); 
    somador1 : SOMADOR_4BIT port map(AUX0, M2(3 DOWNTO 0), '0', AUX1, VA1); 
    somador2 : SOMADOR_4BIT port map(M1(7 DOWNTO 4), M2(7 DOWNTO 4), VA0, AUX2, VA2);   
    somador3 : SOMADOR_4BIT port map(AUX2, M3(3 DOWNTO 0), VA1, S(11 DOWNTO 8), VA3); 

    TMP(3 DOWNTO 1) <= "000";
    TMP(0) <= VA3;
    
    somador4 : SOMADOR_4BIT port map(TMP, M3(7 DOWNTO 4), VA2, S(15 DOWNTO 11), VA4);

    
    S(3 DOWNTO 0) <= M0(3 DOWNTO 0);
    S(7 DOWNTO 4) <= AUX1;



end mista;




