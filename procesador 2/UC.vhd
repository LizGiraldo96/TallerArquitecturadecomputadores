library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity UC is
    Port ( OP : in  STD_LOGIC_VECTOR (1 downto 0);
           OP3 : in  STD_LOGIC_VECTOR (5 downto 0);
           ALUOP : out  STD_LOGIC_VECTOR (5 downto 0));
end UC;

architecture ARQ_UC of UC is

signal Result:std_logic_vector(5 downto 0) := "000000";

begin

process(OP3,OP)

begin

case(op) is -- ponemos un caso para op

when "10" => -- Cuando valga 10 debe tener en cuenta las condiciones 
				if(op3="000000") then--ADD
					Result<="000000";
				end if;
				if(op3="010000") then--ADDcc
					Result<="000001";
				end if;
				if(op3="001000") then--ADDX
					Result<="000010";
				end if;
				if(op3="011000") then--ADDXcc
					Result<="000011";
				end if;
				if(op3="000100") then--SUB
					Result<="000100";
				end if;
				if(op3="010100") then--SUBcc
					Result<="000101";
				end if;
				if(op3="001100") then--SUBX
					Result<="000110";
				end if;
				if(op3="011100") then--SUBXcc
					Result<="000111";
				end if;
				if(op3="000001") then--AND
					Result<="001000";
				end if;
				if(op3="010001") then--ANDcc
					Result<="001001";
				end if;
				if(op3="000101") then--ANDN
					Result<="001010";
				end if;
				if(op3="010101") then--ANDNcc
					Result<="001011";
				end if;
				if(op3="000010") then--OR
					Result<="001100";
				end if;
				if(op3="010010") then--ORcc
					Result<="001101";
				end if;
				if(op3="000110") then--ORN
					Result<="001110";
				end if;
				if(op3="010110") then--ORNcc
					Result<="001111";
				end if;
				if(op3="000011") then--XOR
					Result<="010000";
				end if;
				if(op3="010011") then--XORcc
					Result<="010001";
				end if;
				if(op3="000111") then--XNOR
					Result<="010010";
				end if;
				if(op3="010111") then--XNORcc
					Result<="010011";
				end if;
				if(op3="111100") then--SAVE
					Result<="010100";
				end if;
				if(op3="111101") then--RESTORE
					Result<="010101";
				end if;
			when others => 
		   Result <= "111111";
		end case;
	end process;
	ALUOP<=Result;


end ARQ_UC;
