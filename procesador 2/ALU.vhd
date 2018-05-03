library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;

entity ALU is
    Port ( CRS1 : in  STD_LOGIC_VECTOR (31 downto 0);
           CRS2 : in  STD_LOGIC_VECTOR (31 downto 0);
           OP : in  STD_LOGIC_VECTOR (5 downto 0);
           C : in STD_LOGIC;	
			  Result : out  STD_LOGIC_VECTOR (31 downto 0));
end ALU;	

architecture Behavioral of ALU is

begin

process (CRS1,CRS2,OP)

begin

	case (op) is
		when ("000000") =>          --ADD
			result <= CRS1 + CRS2;
		when ("000001") =>          --ADDcc
			result <= CRS1 + CRS2;	
		when ("000010") =>          --ADDX 
			result <= CRS1 + CRS2 + C;
		when ("000011") =>          --ADDXcc
			result <= CRS1 + CRS2 + C;
		when ("000100") =>          --SUB
			result <= CRS1 - CRS2;
		when ("000101") =>          --SUBcc
			result <= CRS1 - CRS2;
		when ("000110") =>          --SUBX
			result <= CRS1 - CRS2 - C;
		when ("000111") =>          --SUBXcc
			result <= CRS1 - CRS2 - C;
		when ("001000") =>          --AND
			result <= CRS1 and CRS2;
		when ("001001") =>          --ANDcc
			result <= CRS1 and CRS2;
		when ("001010") =>          --ANDN
			result <= CRS1 nand CRS2;
		when ("001011") =>          --ANDNcc
			result <= CRS1 nand CRS2;
		when ("001100") =>          --OR
			result <= CRS1 or CRS2;
		when ("001101") =>          --ORcc
			result <= CRS1 or CRS2;
		when ("001110") =>          --ORN
			result <= CRS1 nor CRS2;
		when ("001111") =>          --ORNcc
			result <= CRS1 nor CRS2;
		when ("010000") =>          --XOR
			result <= CRS1 xor CRS2;
		when ("010001") =>          --XORcc
			result <= CRS1 xor CRS2;
		when ("010010") =>          --XNOR
			result <= CRS1 xnor CRS2;
		when ("010011") =>          --XNORcc
			result <= CRS1 xnor CRS2;
		when others => result <= "00000000000000000000000000000000";
	end case;
end process;


end Behavioral;

