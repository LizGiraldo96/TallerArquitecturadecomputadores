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
			
			
				if( Aluop = "010000" or Aluop = "011000"  or Aluop = "010100" or Aluop = "011100" or Aluop = "010001" or Aluop = "010101" or Aluop = "010010" or Aluop = "010110" or Aluop = "010011" or Aluop = "010111")then
                if Aluop = "010000" or Aluop = "011000" then --Addcc/ AddXcc
                     PSRout(3) <= ALUout(31);
                    if ALUout = "00000000000000000000000000000000" then 
                         PSRout(2) <= '1';
                    else
                         PSRout(2) <= '0';
                    end if;
                     PSRout(1) <= (CRS1(31) and MUXout(31) and (not ALUout(31))) or ((not CRS1(31)) and (not MUXout(31)) and ALUout(31));
                     PSRout(0) <= (CRS1(31) and MUXout(31)) or ((not ALUout(31)) and (CRS1(31) or MUXout(31)));
                end if;
                
                if Aluop = "010100" or Aluop = "0111000" then --Subcc/ SubXcc
                     PSRout(3) <= ALUout(31);
                    if ALUout = "00000000000000000000000000000000" then 
                        PSRout(2) <= '1';
                    else
                        PSRout(2) <= '0';
                    end if;
                     PSRout(1) <= (CRS1(31) and (not MUXout(31)) and (not ALUout(31))) or ((not CRS1(31)) and MUXout(31) and ALUout(31));
                     PSRout(0) <= ((not CRS1(31)) and MUXout(31)) or (ALUout(31) and ((not CRS1(31)) or MUXout(31)));
					end if;
				else 
				PSRout <= "0000";	
				end if;	
			end process;		 
	

end Behavioral;

