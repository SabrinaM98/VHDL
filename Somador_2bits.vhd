LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Somador_2bits is port(
                                A : in STD_LOGIC;
                                B : in STD_LOGIC;
                                S0 : out STD_LOGIC; 
                                S1 : out std_logic);
end Somador_2bits;

architecture comportamental of Somador_2bits is

begin
    
        S0 <= A xor B;
        S1 <= A and B;
        
end comportamental;