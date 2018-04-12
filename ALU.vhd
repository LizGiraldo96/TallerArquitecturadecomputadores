library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;

entity ALU is
    Port ( CRS1 : in  STD_LOGIC_VECTOR (31 downto 0);
           CRS2 : in  STD_LOGIC_VECTOR (31 downto 0);
           OP : in  STD_LOGIC_VECTOR (5 downto 0);
           Result : out  STD_LOGIC_VECTOR (31 downto 0));
end ALU;

architecture Behavioral of ALU is

begin

process (CRS1,CRS2,OP)

begin

	case (op) is
		when "000000" =>
			result <= CRS1 + CRS2;
		when "000001" =>
			result <= CRS1 - CRS2;
		when "000010" =>
			result <= CRS1 or CRS2;
		when "000011" =>
			result <= CRS1 xor CRS2;
		when "000100" =>
			result <= CRS1 xnor CRS2;
		when "000101" =>
			result <= CRS1 nor CRS2;
		when "000110" =>
			result <= CRS1 nand CRS2;
		when "000111" =>
			result <= CRS1 and CRS2;	
		when others => result <= "00000000000000000000000000000000";
	end case;
end process;


end Behavioral;

