library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity PSRmodifier is
    Port ( ALUout : in  STD_LOGIC_VECTOR (31 downto 0);
           ALUop : in  STD_LOGIC_VECTOR (5 downto 0);--la que viene del uc
           CRS1 : in  STD_LOGIC_VECTOR (31 downto 0);
           MUXout : in  STD_LOGIC_VECTOR (31 downto 0);
           PSRout : out  STD_LOGIC_VECTOR (3 downto 0));--nzvc
end PSRmodifier;

architecture Behavioral of PSRmodifier is

begin

	process (ALUout,ALUop,CRS1,MUXout)

		begin
			PSRout <= "0000";
			
				if (ALUop="000001" or ALUop="000011") then--para addcc y addxcc
				    PSRout(3) <= ALUout(31);
				    if (ALUout = X"00000000") then
					     PSRout(2) <= '1';
				    else 
					     PSRout(2) <= '0';
				    end if;
				    PSRout(1)<=(CRS1(31) AND MUXout(31) AND (NOT ALUout(31))) OR ((NOT CRS1(31)) AND ( NOT MUXout(31)) AND ALUout(31));
				    PSRout(0)<=(CRS1(31) AND MUXout(31)) OR ((NOT ALUout(31)) AND (CRS1(31) OR MUXout(31)));
	       	end if;
				
				-----------condicion para los subcc y subxcc--------------
				if (ALUop= "000101" or ALUop="000111") then --para subcc y subxcc
				    PSRout(3) <= ALUout(31);
				    if (ALUout = X"00000000") then
					     PSRout(2) <= '1';
				    else 
					     PSRout(2) <= '0';
				    end if;
				
				    PSRout(1)<=(CRS1(31) AND (NOT MUXout(31)) AND (NOT ALUout(31))) OR ((NOT CRS1(31)) AND MUXout(31) AND ALUout(31));
				    PSRout(0)<=((NOT CRS1(31)) AND MUXout(31)) OR (ALUout(31) AND ((NOT CRS1(31)) OR MUXout(31)));
				end if;
				
				----PARA LAS OPERACIONES LOGICAS ANDCC, ANDNCC, ORCC, ORNCC, XORCC, XNORCC
				

				if (ALUop="001001" or ALUop="001011" or ALUop="001101" or ALUop="001111" or ALUop="010001" or ALUop="010011") then
				    PSRout(3) <= ALUout(31);
				if (ALUout = X"00000000") then
				   PSRout<="0100";
				else
				   PSRout<="0000";
				end if;
				
				end if;
				
			
	end process;

end Behavioral;

