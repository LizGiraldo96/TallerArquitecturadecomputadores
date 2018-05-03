library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DATAPATH2 is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
			  ALUresult: out std_logic_vector (31 downto 0)
			  );
end DATAPATH2;

architecture Behavioral of DATAPATH2 is

	COMPONENT ALU
	PORT(
		CRS1 : IN std_logic_vector(31 downto 0);
		CRS2 : IN std_logic_vector(31 downto 0);
		OP : IN std_logic_vector(5 downto 0);
		C : IN std_logic;          
		Result : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT Adder
	PORT(
		A : IN std_logic_vector(31 downto 0);
		B : IN std_logic_vector(31 downto 0);          
		C : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT Mux
	PORT(
		i : IN std_logic;
		Registro : IN std_logic_vector(31 downto 0);
		Imm : IN std_logic_vector(31 downto 0);          
		salida : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT PSRmodifier
	PORT(
		ALUout : IN std_logic_vector(31 downto 0);
		ALUop : IN std_logic_vector(5 downto 0);
		CRS1 : IN std_logic_vector(31 downto 0);
		MUXout : IN std_logic_vector(31 downto 0);          
		PSRout : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	COMPONENT PSR
	PORT(
		cwp : IN std_logic;
		nzvcin : IN std_logic_vector(3 downto 0);
		reset : IN std_logic;
		clk : IN std_logic;          
		cout : OUT std_logic;
		ncwp : OUT std_logic
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

	COMPONENT SING_EXTENSION
	PORT(
		imm13 : IN std_logic_vector(12 downto 0);          
		OUTput : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT UC
	PORT(
		OP : IN std_logic_vector(1 downto 0);
		OP3 : IN std_logic_vector(5 downto 0);          
		ALUOP : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;

	COMPONENT instructionMemory
	PORT(
		address : IN std_logic_vector(31 downto 0);
		reset : IN std_logic;          
		outInstruction : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

signal Adderout : std_logic_vector (31 downto 0);
signal NPCout : std_logic_vector (31 downto 0);
signal PCout : std_logic_vector (31 downto 0);
signal IMout : std_logic_vector (31 downto 0);
signal UCout : std_logic_vector (5 downto 0);
signal RFCRS1 : std_logic_vector (31 downto 0);
signal RFCRS2 : std_logic_vector (31 downto 0);
signal SINGout : std_logic_vector (31 downto 0);
signal MUXout : std_logic_vector (31 downto 0);
signal ALUout : std_logic_vector (31 downto 0);
signal WMout : std_logic_vector (63 downto 0);  ----cambiar
signal WMcCWP : std_logic;
signal PSRCWP : std_logic;
signal PSRC : std_logic;
signal PSRMNZVC : std_logic_vector (3 downto 0);


begin


end Behavioral;

