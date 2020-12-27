library ieee; 
use ieee.std_logic_1164.all; 
use IEEE.STD_LOGIC_ARITH.ALL;
use ieee.std_logic_unsigned.all;

entity REG_8BIT_SHIFT_RIGHT is port(
                            ENT   : in STD_LOGIC_VECTOR(7 DOWNTO 0)
                            CLK   : in STD_LOGIC;
                            S     : out STD_LOGIC_VECTOR(7 DOWNTO 0));
end REG_8BIT_SHIFT_RIGHT;

architecture comportamental of REG_8BIT is

--signal AUX : STD_LOGIC_VECTOR(7 DOWNTO 0);

begin

    process(CLK)
    begin
        if rising_edge(CLK) then
            for i in 7 to 0 loop
                S(i-1) <= ENT(i);
            end loop;
        end if;
    end process;
 
end comportamental;