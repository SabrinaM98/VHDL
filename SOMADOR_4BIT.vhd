LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

LIBRARY work;
USE work.ALL;

entity SOMADOR_4BIT is port(
						A  : in STD_LOGIC_VECTOR(3 DOWNTO 0);
                        B  : in STD_LOGIC_VECTOR(3 DOWNTO 0);
                        C  : in STD_LOGIC;
						S0 : out STD_LOGIC_VECTOR(3 DOWNTO 0);
						S1 : out STD_LOGIC);
end SOMADOR_4BIT;

architecture estrutural of SOMADOR is

component SOMADOR_COMPLETO is Port( A  : in STD_LOGIC;
								    B  : in STD_LOGIC;
								    C  : in STD_LOGIC;
								    S0 : out STD_LOGIC;
								    S1 : out STD_LOGIC);
end component;
 
signal AUX : STD_LOGIC_VECTOR(2 DOWNTO 0);

begin

	somador0: SOMADOR_COMPLETO port map (A(0), B(0), '0', S0(0), AUX(0));
	somador1: SOMADOR_COMPLETO port map (A(1), B(1), AUX(0), S0(1), AUX(1));  
	somador2: SOMADOR_COMPLETO port map (A(2), B(2), AUX(1), S0(2), AUX(2));
	somador3: SOMADOR_COMPLETO port map (A(3), B(3), AUX(2), S0(3), S1);


end estrutural;