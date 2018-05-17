library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;

entity ALU is
    Port ( CRS1 : in  STD_LOGIC_VECTOR (31 downto 0);--registro 1
           CRS2 : in  STD_LOGIC_VECTOR (31 downto 0);--Registro 2
           OP : in  STD_LOGIC_VECTOR (5 downto 0);--entrada del modulo UC 
           C : in STD_LOGIC;--acarreo	
			  Result : out  STD_LOGIC_VECTOR (31 downto 0));--salida del ALU resultado de las operaciones 
end ALU;	

architecture Behavioral of ALU is


begin

	process(OP, CRS1, CRS2)
begin
	 case (OP) is 
      when "000000" => --add
		Result <= CRS1 + CRS2;
		
		when "010000" => --addcc
		Result <= CRS1 + CRS2;
		
		when "001000" => --addx
		Result <= CRS1 + CRS2 + C;
		
		when "011000" => --addXcc
		Result <= CRS1+ CRS2 + C;
		
		when "000100" => --sub
		Result <= CRS1 - CRS2;
		
		when "010100" => --subcc
		Result <= CRS1 - CRS2;
		
		when "001100" => --subx
		Result<= CRS1 - CRS2 - C;
		
		when "011100" => --subXcc
		Result <= CRS1 - CRS2 - C;
		
		when "000001" => --and
		Result <= CRS1 and CRS2;
		
		when "010001" => --andcc
		Result <= CRS1 and CRS2;
		
		when "000010" => --or
		Result <= CRS1 or CRS2;
		
		when "010010" => --orcc
		Result <= CRS1 or CRS2;
		
		when "000011" => --xor
		Result <= CRS1 xor CRS2;
		
		when "010011" => --xorcc
		Result <= CRS1 xor CRS2;
		
		when "000111" => --xnor
		Result<= CRS1 xnor CRS2;
		
		when "010111" => --xnorcc
		Result<= CRS1 xnor CRS2;
		
		when "000101" => --nand
		Result <= CRS1 nand CRS2;
		
		when "010101" => --nandcc
		Result <= CRS1 nand CRS2;
		
		when "000110" => --nor
		Result<= CRS1 nor CRS2;
		
		when "010110" => --norcc
		Result<= CRS1 nor CRS2;
		
		when "111100" => --save
		Result <= CRS1+ CRS2;
		
		when "111101" => --restore
		Result <= CRS1 + CRS2;
      
		when others => 
		Result <= x"00000000";
   end case; 
end process;


end Behavioral;
