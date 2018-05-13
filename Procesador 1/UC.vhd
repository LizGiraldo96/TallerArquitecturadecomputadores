
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
				if(op3="000100") then--SUB
					Result<="000001";
				end if;
				if(op3="000010") then--OR
					Result<="000010";
				end if;
				if(op3="000011") then--XOR
					Result<="000011";
				end if;
				if(op3="000111") then--XNOR
					Result<="000100";
				end if;
				if(op3="000110") then--ORN
					Result<="000101";
				end if;
				if(op3="000101") then--ANDN
					Result<="000110";
				end if;
				if(op3="000001") then--AND
					Result<="000111";
				end if;
				
	
			when others => 
		   Result <= "111111";
		end case;
	end process;
	ALUOP<=Result;


end ARQ_UC;

