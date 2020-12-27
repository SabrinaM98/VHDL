LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY Somador_5Bits IS PORT (
                                A  : in STD_LOGIC;
                                B  : in STD_LOGIC;
                                C  : in STD_LOGIC;
                                D  : in STD_LOGIC;
                                E  : in STD_LOGIC;
                                S0 : out STD_LOGIC;
                                S1 : out STD_LOGIC;
                                S2 : out STD_LOGIC);
END Somador_5Bits;

ARCHITECTURE Fluxo OF Somador_5Bits IS

SIGNAL S: STD_LOGIC_VECTOR(2 DOWNTO 0);

BEGIN

    S <= ("00" & A) + ("00" & B) + ("00" & C) + ("00" & D) + ("00" & E);
    S0 <= S(0);
    S1 <= S(1);
    S2 <= S(2);
END;