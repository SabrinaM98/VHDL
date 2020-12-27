library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all; 
use ieee.std_logic_1164."=";

entity CIRC_SEQ is port(
                            CLK : in STD_LOGIC;
                            RST : in STD_LOGIC;
                            S   : out STD_LOGIC);
end CIRC_SEQ;

architecture comportamental of CIRC_SEQ is

signal CONT : STD_LOGIC_VECTOR(2 DOWNTO 0);

begin

    process(CLK,RST)
    begin
        if RST = '1' then
            CONT <= "000";
        elsif rising_edge(CLK) then
            if CONT = "111" then
                S <= '1';
            end if;

            CONT <= CONT + 1;

        end if;
        
    end process;

end comportamental;