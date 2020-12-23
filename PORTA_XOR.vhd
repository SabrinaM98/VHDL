LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;

entity PORTA_XOR is port (
                            A: in STD_LOGIC;
                            B: in STD_LOGIC;
                            S: out STD_LOGIC);
end PORTA_XOR;

architecture comportamental of PORTA_XOR is

begin

    S <= A XOR B;

end comportamental;