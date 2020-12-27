library ieee; 
use ieee.std_logic_1164.all; 
use IEEE.STD_LOGIC_ARITH.ALL;
use ieee.std_logic_unsigned.all;

entity CIRC_SEQ_DIV3 is port(
                            RST : in STD_LOGIC;
                            CLK : in STD_LOGIC;
                            S   : out STD_LOGIC);
end CIRC_SEQ_DIV3;

architecture comportamental of CIRC_SEQ_DIV3 is

signal CONT : STD_LOGIC_VECTOR(2 DOWNTO 0);

begin

    process(CLK,RST)
    begin
        if RST = '1' then
             CONT <= "000";
        elsif rising_edge(CLK) then
            if CONT = "011" then
                S <= '1';
            elsif CONT = "110" then
                S <= '1';
            CONT <= CONT + 1;
            end if;
        end if;
    end process;

end comportamental;

-- 000 0
-- 001 1
-- 010 2
-- 011 3
-- 100 4
-- 101 5
-- 110 6
-- 111 7



