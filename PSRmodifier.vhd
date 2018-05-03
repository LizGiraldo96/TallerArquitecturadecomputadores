library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity PSRmodifier is
    Port ( ALUout : in  STD_LOGIC_VECTOR (31 downto 0);
           ALUop : in  STD_LOGIC_VECTOR (5 downto 0);
           CRS1 : in  STD_LOGIC_VECTOR (31 downto 0);
           MUXout : in  STD_LOGIC_VECTOR (31 downto 0);
           PSRout : out  STD_LOGIC_VECTOR (3 downto 0));
end PSRmodifier;

architecture Behavioral of PSRmodifier is

begin

	process (ALUout,ALUop,CRS1,MUXout)

		begin
			PSRout <= "0000";
			if (ALUop="000001" or ALUop="000011" or ALUop="000101"or ALUop="000111" or ALUop="001001" or ALUop="001011" or ALUop="001101" or ALUop="001111" or ALUop="010001" or ALUop="010011" ) then
				PSRout(3) <= ALUout(31);
				if (ALUout = X"00000000") then
					PSRout(2) <= '1';
				else 
					PSRout(2) <= '0';
				end if;
				if (ALUop="000001" or ALUop="000011") then --ADDcc / ADDXcc
					PSRout(0) <= ((CRS1(31) and MUXout(31)) or (not ALUout(31) and (CRS1(31) or MUXout(31))));
					PSRout(1) <= ((CRS1(31) and MUXout(31) and not ALUout(31)) or (not CRS1(31) and not MUTout(31) and ALUout(31)));
				end if;

				if (ALUop="000101"or ALUop="000111") then --SUBcc / SUBXcc
					PSRout(0) <= ((not CRS1(31) and MUXout(31)) or (ALUout(31) and (not CRS1(31) or Muxout(31))));
					PSRout(1) <= ((CRS1(31) and not MUXout(31) and not ALUout(31)) or (not CRS1(31) and MUXout(31) and ALURouts(31)));
				end if;
			end if;
	end process;

end Behavioral;

