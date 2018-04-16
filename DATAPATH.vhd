library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DATAPATH is
    Port ( reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           ALUresult : out  STD_LOGIC_VECTOR (31 downto 0));
end DATAPATH;

architecture Behavioral of DATAPATH is

component Program_Counter
	Port ( clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           input : in  STD_LOGIC_VECTOR (31 downto 0);
           output : out  STD_LOGIC_VECTOR (31 downto 0)
			 );
end component;

component ALU
	Port ( CRS1 : in  STD_LOGIC_VECTOR (31 downto 0);
           CRS2 : in  STD_LOGIC_VECTOR (31 downto 0);
           OP : in  STD_LOGIC_VECTOR (5 downto 0);
           Result : out  STD_LOGIC_VECTOR (31 downto 0)
			);
end component;

component Adder
	Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           C : out  STD_LOGIC_VECTOR (31 downto 0)
			  );
end component;

component Mux
    Port ( i : in  STD_LOGIC;
           Registro : in  STD_LOGIC_VECTOR (31 downto 0);
           Imm : in  STD_LOGIC_VECTOR (31 downto 0);
           salida : out  STD_LOGIC_VECTOR (31 downto 0)
			  );
end component;

component Register_File
Port ( RS1 : in  STD_LOGIC_VECTOR (4 downto 0);
           RS2 : in  STD_LOGIC_VECTOR (4 downto 0);
           RD : in  STD_LOGIC_VECTOR (4 downto 0);
           DWR : in  STD_LOGIC_VECTOR (31 downto 0);
           reset : in  STD_LOGIC;
           CRS1 : out  STD_LOGIC_VECTOR (31 downto 0);
           CRS2 : out  STD_LOGIC_VECTOR (31 downto 0)
			  );
end component;

component SING_EXTENSION
Port ( imm13 : in  STD_LOGIC_VECTOR (12 downto 0);
           OUTput : out  STD_LOGIC_VECTOR (31 downto 0)
			  );
end component;

component UC
    Port ( OP : in  STD_LOGIC_VECTOR (1 downto 0);
           OP3 : in  STD_LOGIC_VECTOR (5 downto 0);
           ALUOP : out  STD_LOGIC_VECTOR (5 downto 0)
			  );
end component;

component instructionMemory
	Port ( 
			  --clk : in STD_LOGIC;
			  address : in  STD_LOGIC_VECTOR (31 downto 0);
           reset : in  STD_LOGIC;
           outInstruction : out  STD_LOGIC_VECTOR (31 downto 0)
			  );
end component;


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


begin

Inst_Adder: Adder PORT MAP(
		A => "00000000000000000000000000000001",
		B => NPCout,
		C => Adderout
	);
	
Inst_Next_Program_Counter: Program_Counter PORT MAP(
		clock => clk,
		reset => reset,
		input => Adderout,
		output => NPCout
	);

Inst_Program_Counter: Program_Counter PORT MAP(
		clock => clk,
		reset => reset,
		input => NPCout,
		output => PCout
	);

Inst_instructionMemory: instructionMemory PORT MAP(
		address => PCout,
		reset => reset,
		outInstruction => IMout
	);

Inst_UC: UC PORT MAP(
		OP => IMout (31 downto 30),
		OP3 => IMout (24 downto 19),
		ALUOP => UCout
	);

Inst_Register_File: Register_File PORT MAP(
		RS1 => IMout(18 downto 14),
		RS2 => IMout (4 downto 0),
		RD => IMout (29 downto 25),
		DWR => ALUout,
		reset => reset,
		CRS1 => RFCRS1,
		CRS2 => RFCRS2
	);

Inst_SING_EXTENSION: SING_EXTENSION PORT MAP(
		imm13 => IMout (12 downto 0),
		OUTput => SINGout
	);

Inst_Mux: Mux PORT MAP(
		i => IMout (13),
		Registro => RFCRS2,
		Imm => SINGout,
		salida => MUXout
	);

Inst_ALU: ALU PORT MAP(
		CRS1 => RFCRS1,
		CRS2 => MUXout,
		OP => UCout,
		Result => ALUout
	);

ALUresult <= Aluout;
end Behavioral;

