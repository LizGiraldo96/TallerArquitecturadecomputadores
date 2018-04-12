
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL; --los vectores estan en representacion binaria pura

entity Register_File is
    Port ( RS1 : in  STD_LOGIC_VECTOR (4 downto 0);
           RS2 : in  STD_LOGIC_VECTOR (4 downto 0);
           RD : in  STD_LOGIC_VECTOR (4 downto 0);
           DWR : in  STD_LOGIC_VECTOR (31 downto 0);
           reset : in  STD_LOGIC;
           CRS1 : out  STD_LOGIC_VECTOR (31 downto 0);
           CRS2 : out  STD_LOGIC_VECTOR (31 downto 0));
end Register_File;

architecture Arq_RF of Register_File is
type ram_type is array (0 to 31) of std_logic_vector(31 downto 0);--tipo de dato arreglo de 0 a 31, cada elemento tiene de 31 a 0
signal RAM:ram_type:=(others=>x"00000000"); --le asigno a la se�al el valor de cero

begin

process(RAM,RS1,RS2,RD,DWR,reset)

begin

if (reset='1') then 
   RAM<=(others =>x"00000000");--llena todas las posiciones de la memoria en cero
   CRS1<=(others=>'0');
	CRS2<=(others=>'0');
else 
   CRS1<= RAM(conv_integer(RS1));-- se�al que utilizo debo convertir a entero e indexo
	CRS2<= RAM(conv_integer(RS2));
	--Esta condicion se hace para escribir en rd
	if(RD /="00000")then
	   RAM(conv_integer(RD))<=DWR; -- escribo cuando rd es diferente de cero
	end if;
end if;

end process;



end Arq_RF;
