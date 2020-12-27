library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity HALF_ADDER is Port( 
                            A  : in STD_LOGIC;
							B  : in STD_LOGIC;
							G : out STD_LOGIC;
							P : out STD_LOGIC);
end HALF_ADDER;

architecture comportamental of HALF_ADDER is

begin

	P <= A xor B;
    G <= A and B;
    
end comportamental;