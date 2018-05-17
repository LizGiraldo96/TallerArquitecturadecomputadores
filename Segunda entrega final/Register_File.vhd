
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL; --los vectores estan en representacion binaria pura
use IEEE.STD_LOGIC_ARITH.ALL;
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
	type ram_type is array (0 TO 63) of std_logic_vector(31 downto 0);--tipo de dato arreglo de 0 a 31, cada elemento tiene de 31 a 0
	--signal RAM:ram_type:=(others=>x"00000000"); --le asigno a la señal el valor de cero
   signal registro : ram_type := (others => x"00000000");
begin

process(reset, nRS1, nRS2, nRD, DWR)

begin
registro(0) <=  x"00000000";
                    if		(reset = '1') then	
							
										
										CRS1 <= (others => '0' );
										CRS2 <= (others => '0' );
										
										registro <= (others => x"00000000");
										
							else
							
										CRS1 <= registro(conv_integer(nRS1));
										CRS2 <= registro(conv_integer(nRS2));
										if (nRD /= "00000") then
												registro(conv_integer(nRD)) <= DWR;
										end if;
										
							end if;
					
end process;




end Arq_RF;

