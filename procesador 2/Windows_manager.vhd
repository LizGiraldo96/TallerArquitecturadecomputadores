
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use IEEE.STD_LOGIC_ARITH.ALL;

--windows
entity Windows_manager is
    Port ( RS1 : in  STD_LOGIC_VECTOR (4 downto 0);--RS1,RS2 Y RD que vienen del instruction memory son de 5 bits
           RS2 : in  STD_LOGIC_VECTOR (4 downto 0);--
           RD : in  STD_LOGIC_VECTOR (4 downto 0);--
           OP : in  STD_LOGIC_VECTOR (1 downto 0);-- OP Y OP3 para saber que si lo que se viene ejecutando lo que esta en la instruccion es restore o save
           OP3 : in  STD_LOGIC_VECTOR (5 downto 0);--
           CWP : in  STD_LOGIC;-- CWP es la ventana actual de trabajo de la arquitectura lo que lee del psr para hacer el calculo generando nuevos rs1,rs2 y rd
           NCWP : out  STD_LOGIC;-- con este modifica el psr  segun lo que entre restore o store
           NRS1 : out  STD_LOGIC_VECTOR (5 downto 0);-- NRS1 NRS2 Y NRD son de 6 bits de manera que se puedan direccionar 40 registros 
           NRS2 : out  STD_LOGIC_VECTOR (5 downto 0);--
           NRD : out  STD_LOGIC_VECTOR (5 downto 0));--
end Windows_manager;

architecture ARQ_WManager of Windows_manager is



begin
	
	process(OP, OP3, RS1, RS2, RD, CWP)
	begin
		
     ---------------------------------------------------------------------
			--------Teniendo en cuenta el op y op3 que modifican cwp-------------
			
		if( OP = "10" AND (OP3 = "111100" OR  OP3 = "111101" ) )  THEN
		
			if (op3 = "111100") and (CWP='1') then-- Intruccion SAVE
				ncwp<='0';-- Pasa a la ventana 0
			
			elsif (op3 = "111101") and (CWP='0') then --Instruccion  RESTORE
			
				ncwp<='1'; -- Pasa a la ventana 1
					
		   else
			   NCWP<=CWP;
		end if;
      --Primer caso 
		IF( RS1 >= "11000" AND RS1 <= "11111") THEN  --Condicion para modificar RS1 si es mayor o igual que 24 y menor o igual que 31
		
				if cwp = '1' then --si estoy en la ventana 1
					NRS1 <= ('0' & RS1 ) - "10000";  --El nuevo rs1 va a ser igual a rs1 menos 16 y se le asigna un cero a la izquierda
				elsif cwp = '0' then --si estoy en la ventana 0
					NRS1 <= ('0' & RS1 );--el nuevo rs1 no va a sufrir modificaciones se le asigna un o al más significativo
				end if;--Fin de la condicion
				
			-- Segundo caso	
			ELSIF ( RS1 >= "10000" AND RS1 <= "10111") THEN --Condicion para modificar RS1 si es mayor o igual que 16 y menor o igual que 23
		
				if cwp = '1' then --si estoy en la ventana 1
					NRS1 <= ('0' & RS1 ) + "10000"; --El nuevo rs1 va a ser igual a rs1 más 16
				elsif cwp = '0' then-- si estoy en la ventana 0
					NRS1 <= ('0' & RS1 );-- el nuevo rs1 queda igual
				end if;-- fin de la condicion
				
			--Tercer caso 	
			ELSIF ( RS1 >= "01000" AND RS1 <= "01111") THEN --Condicion para modificar RS1 si es mayor o igual que 8 y menor o igual que 15
		
				if cwp = '1' then -- Si estoy en la ventana 1
					NRS1 <= ('0' & RS1 ) + "10000"; --El nuevo rs1 va a ser igual a rs1 más 16
				elsif cwp = '0' then--si estoy en la ventana 0
					NRS1 <= ('0' & RS1 );--el nuevo rs1 queda igual
				end if;
				
			
			ELSE -- de lo contrario 
				
				NRS1 <= ('0' & RS1 ); -- el nuevo rs1 no va a tener modificaciones es un registro global
				
			END IF;
			----------------------------------------------------------
			----------------Modificando rs2---------------------------
			
			
			--Primer caso
			IF( RS2 >= "11000" AND RS2 <= "11111") THEN  
			
				if cwp = '1' then
					NRS2 <= ('0' & RS2 ) - "10000"; 
				elsif cwp = '0' then
					NRS2 <= ('0' & RS2 );
				end if;
				 
			--Segundo caso 	
			ELSIF ( RS2 >= "10000" AND RS2 <= "10111") THEN 
		
				if cwp = '1' then
					NRS2 <= ('0' & RS2 )+ "10000"; 
				elsif cwp = '0' then
					NRS2 <= ('0' & RS2 );
				end if;
				
			--tercer caso	
			ELSIF ( RS2 >= "01000" AND RS2 <= "01111") THEN 
		
				if cwp = '1' then
					NRS2 <= ('0' & RS2 )+ "10000"; 
				elsif cwp = '0' then
					NRS2 <= ('0' & RS2 );
				end if;
				
			--De lo contrario
			ELSE
				NRS2 <= ('0' & RS2 );--No se modifica nada es un registro global

				
			END IF;
			
		      
		-------------------------------------------------------------------------------------	
      -- -----Modificando el RD-----------------------------------------------------------
		
			IF( RD >= "11000" AND RD <= "11111") THEN  --Modificando el RD
	
				if cwp = '1' then
					NRD <= ('0' & RD ) - "10000";
				elsif cwp = '0' then
					NRD <= ('0' & RD ) ;
				end if;
				
				
			ELSIF ( RD >= "10000" AND RD <= "10111") THEN 
		
			if cwp = '1' then
					NRD <= ('0' & RD ) + "10000";
				elsif cwp = '0' then
					NRD <= ('0' & RD );
				end if;

			ELSIF ( RD >= "01000" AND RD <= "01111") THEN 
			
			
				if cwp = '1' then
					NRD <= ('0' & RD ) + "10000";
				elsif cwp = '0' then
					NRD <= ('0' & RD );
				end if;
			ELSE
				NRD <= ('0' & RD ); --No se modifica nada es un registro global
			END IF;
		
		END IF;
	



	end process;
	end ARQ_WManager;

