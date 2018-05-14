
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity First_part is
    Port ( CLK : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Out_Program_counter : out  STD_LOGIC_VECTOR (5 downto 0));
end First_part;

architecture ARQ_First_Part of First_part is

COMPONENT Adder
	PORT(
		A : IN std_logic_vector(31 downto 0);
		B : IN std_logic_vector(31 downto 0);          
		C : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
COMPONENT Program_Counter
	PORT(
		clock : IN std_logic;
		reset : IN std_logic;
		input : IN std_logic_vector(31 downto 0);          
		output : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;



signal  Radder, Rpc, Rnpc  : STD_LOGIC_VECTOR(31 downto 0);-- asigno señales de 32 bits para luego ser usadas

begin

Out_Program_counter  <= Rpc(5 downto 0);--asigno a la nueva señal RPC el valor de out_Program_counter




--Se hacen las conexiones para el next program counter
Inst_Next_Program_Counter: Program_Counter PORT MAP(
		clock => CLK,
		reset => reset,
		input => Radder,
		output => Rnpc
	);


--se hacen las conexiones para el program counter
inst_pc : Program_Counter PORT MAP(
			clock => CLK,
		   reset => reset,
		   input => Rnpc,
		   output => Rpc
	);

--Empezamos a hacer las conexiones para el sumador 
Inst_Adder: Adder PORT MAP(
		A => "00000000000000000000000000000001",
		B => Rpc,
		C => Radder
	);
end ARQ_First_Part;

