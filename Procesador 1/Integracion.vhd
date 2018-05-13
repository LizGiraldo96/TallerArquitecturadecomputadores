
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity integracion is
    Port ( clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           Resultado : out  STD_LOGIC_VECTOR (31 downto 0));
end integracion;

architecture Behavioral of integracion is

--declaracion de senales

signal s1 : std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
signal s2 : std_logic_vector(31 downto 0);
signal s3 : std_logic_vector(31 downto 0);
signal s4 : std_logic_vector(31 downto 0);





COMPONENT Program_Counter
	PORT(
		clock : IN std_logic;
		reset : IN std_logic;
		input : IN std_logic_vector(31 downto 0);          
		output : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
COMPONENT Adder
	PORT(
		A : IN std_logic_vector(31 downto 0);
		B : IN std_logic_vector(31 downto 0);          
		C : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

begin

Resultado<=s4;--Se hacen las conexiones despues del begin

Inst_Next_Program_Counter: Program_Counter PORT MAP(
		clock => clock,
		reset => reset,
		input => s1,
		output => s3
	);
Inst_Program_Counter: Program_Counter PORT MAP(
		clock =>clock ,
		reset => reset,
		input => s3,
		output => s4
	);
Inst_Adder: Adder PORT MAP(
		A => "00000000000000000000000000000001",
		B => s4,
		C => s1
	);

end Behavioral;

