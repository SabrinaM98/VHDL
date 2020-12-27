library ieee; 
use ieee.std_logic_1164.all; 
use IEEE.STD_LOGIC_ARITH.ALL;
use ieee.std_logic_unsigned.all;

LIBRARY work;
USE work.ALL;

entity MULT_SEQ is port(
                            START : in STD_LOGIC;
                            CLK   : in STD_LOGIC;
                            A     : in STD_LOGIC_VECTOR(3 DOWNTO 0);
                            B     : in STD_LOGIC_VECTOR(3 DOWNTO 0);
                            SAIDA : out STD_LOGIC_VECTOR(7 DOWNTO 0));
end MULT_SEQ;

architecture comportamental of MULT_SEQ is

signal TMP  : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal CONT : STD_LOGIC_VECTOR(3 DOWNTO 0);
signal REG1 : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal REG2 : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal REG3 : STD_LOGIC_VECTOR(3 DOWNTO 0);

begin
    
    REG1 <= "0000" & B;
    REG3 <= A;
    REG2 <= (others=>'0');
    CONT <= "0000";

    process(CLK)
    if rising_edge(CLK) then
        CONT <= CONT + '1';
        if REG3(0) <= '1' then
            REG2
        end if;

    else
        REG1 <= REG1(6 DOWNTO 0) & '0';
        REG3 <= '0' & REG3(6 DOWNTO 0);
        --desloca reg3 pra direita    
            
    end if;

end comportamental;
