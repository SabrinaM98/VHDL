library IEEE;
use ieee.std_logic_1164.all;

entity MUX_4_TO_1 is Port (
						E0,E1,E2,E3: in STD_LOGIC;
						C0,C1      : in STD_LOGIC;
						S          : out STD_LOGIC);
end MUX_4_TO_1;

architecture Comportamental of MUX_4_TO_1 is

begin

	SAIDA: process(E0,E1,E2,E3,C0,C1)
	begin
		if C1 = '0' and C0 = '0' then
			S <= E0;
		elsif C1 = '0' and C0 = '1' then
			S <= E1;
		elsif C1 = '1' and C0 = '0' then
			S <= E2;
		else
			S <= E3;
		end if;
		
	end process SAIDA;

end Comportamental;