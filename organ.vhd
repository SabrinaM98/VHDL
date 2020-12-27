library ieee; 
use ieee.std_logic_1164.all; 
use IEEE.STD_LOGIC_ARITH.ALL;
use ieee.std_logic_unsigned.all;

LIBRARY work;
USE work.ALL;

entity ORGAO is port(
                            START : in STD_LOGIC;
                            CLK   : in STD_LOGIC;
                            A     : in STD_LOGIC_VECTOR(3 DOWNTO 0);
                            B     : in STD_LOGIC_VECTOR(3 DOWNTO 0);
                            SAIDA : out STD_LOGIC_VECTOR(7 DOWNTO 0));
end ORGAO;


 