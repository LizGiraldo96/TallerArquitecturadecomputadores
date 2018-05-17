
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
			if(Op ="10" and Op3 ="111100") then   --SAVE 
			     nCwp <='0';
         elsif(Op = "10" and Op3 ="111101") then  --RESTORE
              nCwp <='1';
         end if;
			
			--Rs1
			if(Rs1 >= "10000" and Rs1 <="10111") then 
                nRs1 <= conv_std_logic_vector(( conv_integer(Rs1) + conv_integer(Cwp) * 16),6);  --local 			
			
			elsif(Rs1 >= "11000" and Rs1 <= "11111") then
                nRs1 <= conv_std_logic_vector(( conv_integer(Rs1) - conv_integer(Cwp) * 16),6);  --input			
            
			elsif (Rs1 >= "01000" and Rs1 <= "01111") then
				nRs1 <=conv_std_logic_vector(( conv_integer(Rs1) + conv_integer(Cwp) * 16),6);   --output

			elsif (Rs1 >= "00000" and Rs1 <= "00111") then 
				nRs1 <= conv_std_logic_vector(( conv_integer(Rs1)),6);  
            
            end if;
 
			-- Rs2
			if (Rs2 >= "10000" and Rs2 <= "10111") then
				nRs2 <=conv_std_logic_vector(( conv_integer(Rs2) + conv_integer(Cwp) * 16),6); --local 
			
			elsif (Rs2 >= "11000" and Rs2 <= "11111") then
				nRs2 <=conv_std_logic_vector(( conv_integer(Rs2) - conv_integer(Cwp) * 16),6);  --input
			
			elsif (Rs2 >= "01000" and Rs2 <= "01111") then
				nRs2 <=conv_std_logic_vector(( conv_integer(Rs2) + conv_integer(Cwp) * 16),6);  --output
				
			elsif (Rs2 >= "00000" and Rs2 <= "00111") then 
				nRs2 <= conv_std_logic_vector(( conv_integer(Rs2)),6);	
			
			end if;
	
	
			--Rd
			if (Rd >= "10000" and Rd <= "10111") then
				nRd <= conv_std_logic_vector(( conv_integer(Rd) + conv_integer(Cwp) * 16),6);   --local 
			
			elsif (Rd >= "11000" and Rd<= "11111") then
				nRd <= conv_std_logic_vector(( conv_integer(Rd) - conv_integer(Cwp) * 16),6);   --input
			
			elsif (Rd >= "01000" and Rd <= "01111") then
				nRd <=conv_std_logic_vector(( conv_integer(Rd) + conv_integer(Cwp) * 16),6);    --output
			
			elsif (Rd >= "00000" and Rd <= "00111") then 
				nRd <= conv_std_logic_vector((conv_integer(Rd)),6);	
			end if;


	end process;
	end ARQ_WManager;

