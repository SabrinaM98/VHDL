--exercicio 3.5



LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

LIBRARY work;
USE work.ALL;

entity MULT_COMB_4BITS is port(
                                A : in STD_LOGIC_VECTOR(3 DOWNTO 0);
                                B : in STD_LOGIC_VECTOR(3 DOWNTO 0);
                                M : out STD_LOGIC_VECTOR(7 DOWNTO 0));
end MULT_COMB_4BITS;

architecture mista of MULT_COMB_4BITS is

component MULTIPLICADOR_8BITS is port(
                                        A : in STD_LOGIC_VECTOR(3 DOWNTO 0);
                                        B : in STD_LOGIC_VECTOR(3 DOWNTO 0);
                                        M : out STD_LOGIC_VECTOR(7 DOWNTO 0));
end component;

signal SINAL : STD_LOGIC;

begin

    multiplicador : MULTIPLICADOR_8BITS port map(A, B, M);

    SINAL <= A(3) xor B(3);

end mista;