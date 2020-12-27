LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL; 

LIBRARY work;
USE work.ALL;

entity SOMADOR_SUBTRATOR is Port( A : in STD_LOGIC_VECTOR(7 DOWNTO 0);
                                 B  : in STD_LOGIC_VECTOR(7 DOWNTO 0);
                                 C  : in STD_LOGIC;
						         S0 : out STD_LOGIC_VECTOR(7 DOWNTO 0);
						         S1 : out STD_LOGIC_VECTOR(7 DOWNTO 0)); 
end SOMADOR_SUBTRATOR;

architecture estrutural of SOMADOR_SUBTRATOR is

component SOMADOR_COMPLETO is Port( A  : in STD_LOGIC;
								    B  : in STD_LOGIC;
								    C  : in STD_LOGIC;
								    S0 : out STD_LOGIC;
								    S1 : out STD_LOGIC);
end component;
 
signal OP  : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal AUX : STD_LOGIC_VECTOR(6 DOWNTO 0);

begin

    OP <= A xor B;

	somador0: SOMADOR_COMPLETO port map (A(0), OP(0), C, S0(0), AUX(0));
	somador1: SOMADOR_COMPLETO port map (A(1), OP(1), AUX(0), S0(1), AUX(1));  
	somador2: SOMADOR_COMPLETO port map (A(2), OP(2), AUX(1), S0(2), AUX(2));
	somador3: SOMADOR_COMPLETO port map (A(3), OP(3), AUX(2), S0(3), AUX(3));
	somador4: SOMADOR_COMPLETO port map (A(4), OP(4), AUX(3), S0(4), AUX(4));
	somador5: SOMADOR_COMPLETO port map (A(5), OP(5), AUX(4), S0(5), AUX(5));
	somador6: SOMADOR_COMPLETO port map (A(6), OP(6), AUX(5), S0(6), AUX(6));
	somador7: SOMADOR_COMPLETO port map (A(7), OP(7), AUX(6), S0(7), S1);


end estrutural;

