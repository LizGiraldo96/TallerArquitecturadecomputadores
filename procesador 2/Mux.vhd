
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity Mux is
    Port ( i : in  STD_LOGIC;
           Registro : in  STD_LOGIC_VECTOR (31 downto 0);
           Imm : in  STD_LOGIC_VECTOR (31 downto 0);
           salida : out  STD_LOGIC_VECTOR (31 downto 0));
end Mux;

architecture ARQ_Mux of Mux is


begin

process(i,Registro,Imm)
begin
	if(i='1') then
		salida <= Imm;
	else
		salida <= Registro;
	end if;

end process;
end ARQ_Mux;

