library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
use IEEE.STD_LOGIC_ARITH.ALL;

entity UC is
    Port ( OP : in  STD_LOGIC_VECTOR (1 downto 0);
           OP3 : in  STD_LOGIC_VECTOR (5 downto 0);
           ALUOP : out  STD_LOGIC_VECTOR (5 downto 0));
end UC;

architecture ARQ_UC of UC is


begin
process(op, op3)
begin
	if(op="10")then
		case(op3) is
			when "000000" => --add
			ALUop <= "000000";
			when "010000" => --addcc
			ALUOP <= "010000";
			when "001000" => --addx
			ALUOP <= "001000";
			when "011000" => --addXcc
			ALUOP <= "011000";
			when "000100" => --sub
			ALUOP <= "000100";
			when "010100" => --subcc
			ALUOP <= "010100";
			when "001100" => --subx
			ALUOP <= "001100";
			when "011100" => --subXcc
			ALUOP <= "011100";
			when "000001" => --and
			ALUOP <= "000001";
			when "010001" => --andcc
			ALUOP <= "010001";
			when "000010" => --or
			ALUOP <= "000010";
			when "010010" => --orcc
			ALUOP <= "010010";
			when "000110" => --nor
			ALUOP <= "000110";
			when "010110" => --norcc
			ALUOP <= "010110";
			when "000011" => --xor 
			ALUOP<= "000011";
			when "010011" => --xorcc 
			ALUOP <= "010011";
			when "000111" => --xnor
			ALUOP <= "000111";
			when "010111" => --xnorcc
			ALUOP <= "010111";
			when "000101" => --nand
			ALUOP <= "000101";
			when "010101" => --nandcc
			ALUOP <= "010101";
			when "111100" => --save
			ALUOP <= "111100";
			when "111101" => --restore
			ALUOP <= "111101";
			when others =>
			ALUOP <= "111111";--el resto de los casos los pone en uno
		end case;
	end if;	
end process;

end ARQ_UC;
