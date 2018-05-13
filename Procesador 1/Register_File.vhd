
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
type memoriaRam is array (0 to 63) of  STD_LOGIC_VECTOR(31 downto 0);  --- Declaro el alto y ancho de la matriz de tipo memoriaRam
		signal registro : memoriaRam := (others => x"00000000");   --- En este registro guardo las operaciones y lo inicializo en 0

begin

		process(reset, RS1, RS2, RD, DWR)
					begin
							registro(0) <=  x"00000000";
							
							if		(reset = '1') then	
							
										CRS1 <= (others => '0' );
										CRS2 <= (others => '0' );
										registro <= (others => x"00000000");
										
							else
							
										CRS1 <= registro(conv_integer(RS1));
										CRS2 <= registro(conv_integer(RS2));
										if RD /= "00000" then
												registro(conv_integer(RD)) <= DWR;
										end if;
										
							end if;
					
	end process;



end Arq_RF;

