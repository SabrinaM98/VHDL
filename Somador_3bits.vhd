LIBRARY ieee;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL; 

entity Somador_3bits is Port( A  : in STD_LOGIC;
								 B  : in STD_LOGIC;
								 C  : in STD_LOGIC;
								 S0 : out STD_LOGIC;
								 S1 : out STD_LOGIC);
end Somador_3bits;

architecture comportamental of Somador_3bits is

begin

	S0 <= A xor B xor C;
    S1 <= (A and B) or (C and (A or B));
    
end comportamental;