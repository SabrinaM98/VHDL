LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL; 

LIBRARY work;
USE work.ALL;

entity CARRY_LOOKAHEAD is Port(
                               A         : in STD_LOGIC_VECTOR(3 DOWNTO 0);
                               B         : in STD_LOGIC_VECTOR(3 DOWNTO 0);
                               C0        : in STD_LOGIC;
                               S         : out STD_LOGIC_VECTOR(3 DOWNTO 0);
                               CARRY_OUT : out STD_LOGIC);
end entity;

architecture mista of CARRY_LOOKAHEAD is

component HALF_ADDER is Port( 
                                A  : in STD_LOGIC;
                                B  : in STD_LOGIC;
                                G  : out STD_LOGIC;
                                P  : out STD_LOGIC);
end component;

signal C1, C2, C3 : STD_LOGIC;
signal P,G        : STD_LOGIC_VECTOR(3 downto 0);

begin

    HA1 : HALF_ADDER port map(A(0), B(0), P(0), G(0));
    HA2 : HALF_ADDER port map(A(1), B(1), P(1), G(1));
    HA3 : HALF_ADDER port map(A(2), B(2), P(2), G(2));
    HA4 : HALF_ADDER port map(A(3), B(3), P(3), G(3));

    S(0) <= C0 xor P(0);
    --S(1) <= ((C0 and P(0)) or G(0)) xor P(1); 

    C1 <= G(0) or (C0 and P(0));
    S(1) <= C1 xor P(1);

    C2 <=
        G(1) or
        (P(1) and G(0)) or
        (P(1) and P(0) and C0);
    S(2) <= C2 xor P(2);

    C3 <=
        G(2) or
        (P(2) and G(1)) or
        (P(2) and P(1) and G(0)) or
        (P(2) and P(1) and P(0) and C0);
    S(3) <= C3 xor P(3);

    CARRY_OUT <=
        G(3) or
        (P(3) and G(2)) or
        (P(3) and P(2) and G(1)) or
        (P(3) and P(2) and P(1) and G(0)) or
        (P(3) and P(2) and P(1) and P(0) and C0);

     

end mista;

