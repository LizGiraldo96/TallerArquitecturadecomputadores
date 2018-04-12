library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SING_EXTENSION is
    Port ( imm13 : in  STD_LOGIC_VECTOR (12 downto 0);
           OUTput : out  STD_LOGIC_VECTOR (31 downto 0));
end SING_EXTENSION;

architecture Behavioral of SING_EXTENSION is

signal aux: std_logic_vector ( 31 downto 0);

begin

process (imm13)
begin
	aux (12 downto 0) <= imm13;
	if  imm13(12) = '0' then
		aux (31 downto 13) <= "0000000000000000000";
		else
			aux (31 downto 13) <= "1111111111111111111";
		end if;
end process;

OUTput <= aux;

end Behavioral;

