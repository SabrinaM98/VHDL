-- exercicio 3.4

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

LIBRARY work;
USE work.ALL;

entity MULTIPLICADOR_4BITS is port(
                                A : in STD_LOGIC_VECTOR(3 DOWNTO 0);
                                B : in STD_LOGIC_VECTOR(3 DOWNTO 0);
                                M : out STD_LOGIC_VECTOR(7 DOWNTO 0));
end MULTIPLICADOR_4BITS;

architecture estrutural of MULTIPLICADOR_4BITS is

component Somador_2bits is port(
                                A : in STD_LOGIC;
                                B : in STD_LOGIC;
                                S0 : out STD_LOGIC; 
                                S1 : out std_logic);
end component;

component SOMADOR_COMPLETO is Port( A  : in STD_LOGIC;
								 B  : in STD_LOGIC;
								 C  : in STD_LOGIC;
								 S0 : out STD_LOGIC;
								 S1 : out STD_LOGIC);
end component;

component Somador_5Bits is port (
                                A  : in STD_LOGIC;
                                B  : in STD_LOGIC;
                                C  : in STD_LOGIC;
                                D  : in STD_LOGIC;
                                E  : in STD_LOGIC;
                                S0 : out STD_LOGIC;
                                S1 : out STD_LOGIC;
                                S2 : out STD_LOGIC);
end component;

component Somador_4Bits is port (
                                A  : in STD_LOGIC;
                                B  : in STD_LOGIC;
                                C  : in STD_LOGIC;
                                D  : in STD_LOGIC;
                                S0 : out STD_LOGIC;
                                S1 : out STD_LOGIC;
                                S2 : out STD_LOGIC);
end component;

signal AUX : STD_LOGIC_VECTOR(14 DOWNTO 0);
signal S : STD_LOGIC_VECTOR(9 DOWNTO 0);

begin

    M(0) <= A(0) and B(0);

    AUX(0) <= A(0) and B(1);
    AUX(1) <= A(1) and B(0);
    SOMADOR1 : Somador_2bits port map(AUX(0), AUX(1), M(1), S(0));

    AUX(2) <= A(0) and B(2);
    AUX(3) <= A(1) and B(1);
    AUX(4) <= A(2) and B(0);
    SOMADOR2 : Somador_4Bits port map(S(0), AUX(2), AUX(3), AUX(4), M(2), S(1), S(2));

    AUX(5) <= A(0) and B(3);
    AUX(6) <= A(1) and B(2);
    AUX(7) <= A(2) and B(1);
    AUX(8) <= A(3) and B(0);
    SOMADOR3 : Somador_5Bits port map(S(1), AUX(5), AUX(6), AUX(7), AUX(8), M(3), S(3), S(4));

    AUX(9) <= A(1) and B(3);
    AUX(10) <= A(2) and B(2);
    AUX(11) <= A(3) and B(1);
    SOMADOR4 : Somador_5Bits port map(S(2), S(3), AUX(9), AUX(10), AUX(11), M(4), S(5), S(6));

    AUX(12) <= A(2) and B(3);
    AUX(13) <= A(3) and B(2);
    SOMADOR5 : Somador_4Bits port map(S(4), S(5), AUX(12), AUX(13), M(5), S(7), S(8));

    AUX(14) <= A(3) and B(3);
    SOMADOR6 : SOMADOR_COMPLETO port map(S(6), S(7), AUX(14), M(6), S(9));

    M(7) <= S(9) or S(8);
            
end estrutural;