library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

library work;
use work.all;

entity CRONOMETRO is port(
						CLK         : in STD_LOGIC;
						INICIA_PARA : in STD_LOGIC;
						ZERAR       : in STD_LOGIC;
						SAIDA       : out STD_LOGIC_VECTOR(6 DOWNTO 0);
						T1          : out STD_LOGIC;
						T2          : out STD_LOGIC;
						T3          : out STD_LOGIC;
						T4          : out STD_LOGIC);
end CRONOMETRO;

architecture mista of CRONOMETRO is

component MUX_4_TO_1 is port(
							E0,E1,E2,E3 : in STD_LOGIC;
							C0,C1       : in STD_LOGIC;
							S           : out STD_LOGIC);
end component;

--signal S1,S2,S3,S4        : STD_LOGIC;
signal conta1             : STD_LOGIC_VECTOR(16 DOWNTO 0);
signal conta_binario      : STD_LOGIC_VECTOR(5 DOWNTO 0);
signal RST_640            : STD_LOGIC;
signal RST_320            : STD_LOGIC;
signal RST_10             : STD_LOGIC;
signal CLK_640            : STD_LOGIC;
signal CLK_320, CLK_160   : STD_LOGIC;
signal CLK_10             : STD_LOGIC;
signal OP                 : STD_LOGIC_VECTOR(3 DOWNTO 0);
signal C                  : STD_LOGIC_VECTOR(1 DOWNTO 0);
signal CLK_JK             : STD_LOGIC;
signal Q,C0, C1         : STD_LOGIC;
signal CLK_conts          : STD_LOGIC;
signal RST_conts          : STD_LOGIC;
signal sel_display_cont   : STD_LOGIC_VECTOR(1 DOWNTO 0);
signal CENTESIMO          : STD_LOGIC_VECTOR(3 DOWNTO 0);
signal UNIDADE            : STD_LOGIC_VECTOR(3 DOWNTO 0);
signal DEZENA             : STD_LOGIC_VECTOR(3 DOWNTO 0);
signal MINUTO             : STD_LOGIC_VECTOR(3 DOWNTO 0);
signal CONT_CENT,CONT_UNI : STD_LOGIC_VECTOR(3 DOWNTO 0);
signal CONT_DEZ,CONT_MIN  : STD_LOGIC_VECTOR(3 DOWNTO 0);
--signal E0,E1,E2,E3,E4,E5,E6,E7: STD_LOGIC;
--signal E8,E9,E10,E11,E12,E13,E14,E15: STD_LOGIC;
signal E0,E1,E2,E3        : STD_LOGIC_VECTOR(3 DOWNTO 0);
signal S0,S1,S2,S3        : STD_LOGIC_VECTOR(3 DOWNTO 0);

begin
	
	divisor_frequencia_640: process(CLK, RST_640)
	begin
		if conta1 = "10011000100101101" then
			RST_640 <= '1';
		else
			RST_640 <= '0';		
		end if;
		
		if RST_640 = '1' then
			conta1 <= "00000000000000000";
		elsif rising_edge(CLK) then
			conta1 <= conta1 + 1;		
		end if;
		
		CLK_640 <= conta1(16);
		
	end process;
	
	divisor_frequencia_320_160_10: process(CLK_640)
	begin
		if rising_edge(CLK_640) then
			conta_binario <= conta_binario + '1';			
		end if;
		
		CLK_320 <= conta_binario(0);
		CLK_160 <= conta_binario(1);
		CLK_10 <= conta_binario(5);
		
	end process;
	
	debounce: process(CLK_320, INICIA_PARA)
	begin
		if rising_edge(CLK_320) then
			OP(0) <= INICIA_PARA;
			OP(3 DOWNTO 1) <= OP(2 downto 0);
		end if;
	
		CLK_JK <= not(OP(0) or OP(1) or OP(2) or OP(3));
 
	end process;
    
	flip_flop_JK: process(CLK_JK)
	begin
		if rising_edge(CLK_JK) then
			Q <= not(Q);
		end if;
			
	end process;
	
	porta_and: process(CLK_10, Q)
	begin
		
		CLK_conts <= (CLK_10 and Q);
		
	end process;
	
	contadores: process(CLK_conts, RST_conts)
	begin
		if RST_conts = '1' then
			CONT_CENT <= "0000";
		elsif rising_edge(CLK_conts) then
			if CONT_CENT = "1001" then
				CONT_CENT <= "0000";
			else
				CONT_CENT <= CONT_CENT + '1';
			end if;
		end if;
		
		CENTESIMO <= CONT_CENT;
		
		if RST_conts = '1' then
			CONT_UNI <= "0000";
		elsif rising_edge(CLK_conts) then
			if CONT_CENT = "1001" then
				if CONT_UNI = "1001" then
					CONT_UNI <= "0000";
				else
					CONT_UNI <= CONT_UNI + '1';
				end if;
			end if;
		end if;
		
		UNIDADE <= CONT_UNI;
		
		if RST_conts = '1' then
			CONT_DEZ <= "0000";
		elsif rising_edge(CLK_conts) then
			if CONT_UNI = "1001" then
				if CONT_DEZ = "1001" then
					CONT_DEZ <= "0000";
				else
					CONT_DEZ <= CONT_DEZ + '1';
				end if;
			end if;
		end if;
		
		DEZENA <= CONT_DEZ;
		
		if RST_conts = '1' then
			CONT_MIN <= "0000";
		elsif rising_edge(CLK_conts) then
			if CONT_DEZ = "1001" then
				if CONT_MIN = "1001" then
					CONT_MIN <= "0000";
				else
					CONT_MIN <= CONT_MIN + '1';
				end if;
			end if;
		end if;
		
		MINUTO <= CONT_MIN;
		
	end process;
	
	E0(0) <= CENTESIMO(0);
	E0(1) <= UNIDADE(0);
	E0(2) <= DEZENA(0);
	E0(3) <= MINUTO(0);
	
	E1(0) <= CENTESIMO(1);
	E1(1) <= UNIDADE(1);
	E1(2) <= DEZENA(1);
	E1(3) <= MINUTO(1);
	
	E2(0) <= CENTESIMO(2);
	E2(1) <= UNIDADE(2);
	E2(2) <= DEZENA(2);
	E2(3) <= MINUTO(2);
	
	E0(0) <= CENTESIMO(2);
	E0(1) <= UNIDADE(2);
	E0(2) <= DEZENA(2);
	E0(3) <= MINUTO(2);
	
	sel_display: process(CLK_160)
	begin
		if rising_edge(CLK_160) then 
			sel_display_cont <= sel_display_cont + 1;
		end if;	
		C0 <= sel_display_cont(0);
		C1 <= sel_display_cont(1);
		
		T1 <= NOT(C1) and NOT(C0);
		T2 <= NOT(C1) and C0;
		T3 <= C1 and NOT(C0);
		T4 <= C1 and C0;
	
	end process;
	
	mux: process(E0,E1,E2,E3,C0,C1)
	begin
		
		if C1 = '0' and C0 = '0' then
			S0 <= E0(3 DOWNTO 0);
		elsif C1 = '0' and C0 = '1' then
			S1 <= E1(3 DOWNTO 0);
		elsif C1 = '1' and C0 = '0' then
			S2 <= E2(3 DOWNTO 0);
		else
			S3 <= E3(3 DOWNTO 0);
			 
		end if;
		
	end process;
	
	--Mux1: MUX_4_TO_1 port map(E0,E1,E2,E3,C0,C1,S1);
	--Mux2: MUX_4_TO_1 port map(E4,E5,E6,E7,C0,C1,S2);
	--Mux3: MUX_4_TO_1 port map(E8,E9,E10,E11,C0,C1,S3);
	--Mux4: MUX_4_TO_1 port map(E12,E13,E14,E15,C0,C1,S4);
	
	decodificador_bcd_7seg: process(S0,S1,S2,S3)
	begin
		case S0 is
			when "0000" => SAIDA <= "1111110";
			when "0001" => SAIDA <= "0110000";
			when "0010" => SAIDA <= "1101101";
			when "0011" => SAIDA <= "1111001";
			when "0100" => SAIDA <= "1110011";
			when "0101" => SAIDA <= "1011011";
			when "0110" => SAIDA <= "1011111";
			when "0111" => SAIDA <= "1110000";
			when "1000" => SAIDA <= "1111111";
			when "1001" => SAIDA <= "1110111";
			when others => SAIDA <= "0000000";
		end case;
		
		case S1 is
			when "0000" => SAIDA <= "1111110";
			when "0001" => SAIDA <= "0110000";
			when "0010" => SAIDA <= "1101101";
			when "0011" => SAIDA <= "1111001";
			when "0100" => SAIDA <= "1110011";
			when "0101" => SAIDA <= "1011011";
			when "0110" => SAIDA <= "1011111";
			when "0111" => SAIDA <= "1110000";
			when "1000" => SAIDA <= "1111111";
			when "1001" => SAIDA <= "1110111";
			when others => SAIDA <= "0000000";
		end case;
		
		case S2 is
			when "0000" => SAIDA <= "1111110";
			when "0001" => SAIDA <= "0110000";
			when "0010" => SAIDA <= "1101101";
			when "0011" => SAIDA <= "1111001";
			when "0100" => SAIDA <= "1110011";
			when "0101" => SAIDA <= "1011011";
			when "0110" => SAIDA <= "1011111";
			when "0111" => SAIDA <= "1110000";
			when "1000" => SAIDA <= "1111111";
			when "1001" => SAIDA <= "1110111";
			when others => SAIDA <= "0000000";
		end case;
		
		case S3 is
			when "0000" => SAIDA <= "1111110";
			when "0001" => SAIDA <= "0110000";
			when "0010" => SAIDA <= "1101101";
			when "0011" => SAIDA <= "1111001";
			when "0100" => SAIDA <= "1110011";
			when "0101" => SAIDA <= "1011011";
			when "0110" => SAIDA <= "1011111";
			when "0111" => SAIDA <= "1110000";
			when "1000" => SAIDA <= "1111111";
			when "1001" => SAIDA <= "1110111";
			when others => SAIDA <= "0000000";
		end case;
		
	end process;

end mista;
	
	