
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL; --los vectores estan en representacion binaria pura

entity Register_File is
    Port ( nRS1 : in  STD_LOGIC_VECTOR (5 downto 0);
           nRS2 : in  STD_LOGIC_VECTOR (5 downto 0);
           nRD : in  STD_LOGIC_VECTOR (5 downto 0);
           DWR : in  STD_LOGIC_VECTOR (31 downto 0);
           reset : in  STD_LOGIC;
           CRS1 : out  STD_LOGIC_VECTOR (31 downto 0);
           CRS2 : out  STD_LOGIC_VECTOR (31 downto 0));
end Register_File;

architecture Arq_RF of Register_File is
type ram_type is array (0 to 31) of std_logic_vector(31 downto 0);--tipo de dato arreglo de 0 a 31, cada elemento tiene de 31 a 0
signal RAM:ram_type:=(others=>x"00000000"); --le asigno a la señal el valor de cero

begin

process(RAM,nRS1,nRS2,nRD,DWR,reset)

begin

if (reset='1') then 
   RAM<=(others =>x"00000000");--llena todas las posiciones de la memoria en cero
   CRS1<=(others=>'0');
	CRS2<=(others=>'0');
else 
   CRS1<= RAM(conv_integer(nRS1));-- señal que utilizo debo convertir a entero e indexo
	CRS2<= RAM(conv_integer(nRS2));
	--Esta condicion se hace para escribir en rd
	if(nRD /="00000")then
	   RAM(conv_integer(nRD))<=DWR; -- escribo cuando rd es diferente de cero
	end if;
end if;

end process;



end Arq_RF;

