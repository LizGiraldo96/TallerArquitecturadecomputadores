library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity integracion_total2 is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           Result_total : out  STD_LOGIC_VECTOR (31 downto 0));
end integracion_total2;

architecture ARQ_integracion_total2 of integracion_total2 is

--Para la Alu--------------------------------------------
COMPONENT ALU
	PORT(
		CRS1 : IN std_logic_vector(31 downto 0);
		CRS2 : IN std_logic_vector(31 downto 0);
		OP : IN std_logic_vector(5 downto 0);
		C : IN std_logic;          
		Result : OUT std_logic_vector(31 downto 0)
		);
    END COMPONENT;
	 
----Para el sumador--------------------------------

COMPONENT Adder
	PORT(
		A : IN std_logic_vector(31 downto 0);
		B : IN std_logic_vector(31 downto 0);          
		C : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
---Para el multiplexor-----------------------------
COMPONENT Mux
	PORT(
		i : IN std_logic;
		Registro : IN std_logic_vector(31 downto 0);
		Imm : IN std_logic_vector(31 downto 0);          
		salida : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

-----Para el psr modifier----------------------------
	
	COMPONENT PSRmodifier
	PORT(
		ALUout : IN std_logic_vector(31 downto 0);
		ALUop : IN std_logic_vector(5 downto 0);
		CRS1 : IN std_logic_vector(31 downto 0);
		MUXout : IN std_logic_vector(31 downto 0);          
		PSRout : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
-------para el psr---------------------------------------	
COMPONENT PSR
	PORT(
		ncwp : IN std_logic;
		nzvcin : IN std_logic_vector(3 downto 0);
		reset : IN std_logic;
		clk : IN std_logic;          
		C : OUT std_logic;
		cwp : OUT std_logic
		);
	END COMPONENT;
-------------------para el program counter------------------	
COMPONENT Program_Counter
	PORT(
		clock : IN std_logic;
		reset : IN std_logic;
		input : IN std_logic_vector(31 downto 0);          
		output : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
-----------------para el register file---------------------
	
COMPONENT Register_File
	PORT(
		nRS1 : IN std_logic_vector(5 downto 0);
		nRS2 : IN std_logic_vector(5 downto 0);
		nRD : IN std_logic_vector(5 downto 0);
		DWR : IN std_logic_vector(31 downto 0);
		reset : IN std_logic;          
		CRS1 : OUT std_logic_vector(31 downto 0);
		CRS2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
--------------------para la extensión de signo-------------------------
	
COMPONENT SING_EXTENSION
	PORT(
		imm13 : IN std_logic_vector(12 downto 0);          
		OUTput : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
-----------Para la unidad de control-----------------------------------	
COMPONENT UC
	PORT(
		OP : IN std_logic_vector(1 downto 0);
		OP3 : IN std_logic_vector(5 downto 0);          
		ALUOP : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;
--------windows manager-----------------------------------------------
COMPONENT Windows_manager
	PORT(
		RS1 : IN std_logic_vector(4 downto 0);
		RS2 : IN std_logic_vector(4 downto 0);
		RD : IN std_logic_vector(4 downto 0);
		OP : IN std_logic_vector(1 downto 0);
		OP3 : IN std_logic_vector(5 downto 0);
		CWP : IN std_logic;          
		NCWP : OUT std_logic;
		NRS1 : OUT std_logic_vector(5 downto 0);
		NRS2 : OUT std_logic_vector(5 downto 0);
		NRD : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;
	
----------------------para el instruction memory------------------

COMPONENT instructionMemory
	PORT(
		address : IN std_logic_vector(31 downto 0);
		reset : IN std_logic;          
		outInstruction : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	
signal resAlu_Result :std_logic_vector(31 downto 0);-- señal para la alu
signal resAdder_C: std_logic_vector(31 downto 0);-- señal para el sumador
signal resMUX_salida:std_logic_vector(31 downto 0);-- señal para el multiplexor
signal res_PSRout:std_logic_vector(3 downto 0);-- señal para el psr modifier
signal res_C :  std_logic;--para el psr carry
signal res_cwp : std_logic ;--para  el psr  
signal res_output:std_logic_vector(31 downto 0);--para el program counter
signal res_npc:std_logic_vector(31 downto 0);--para el next program counter
signal res_CRS1:std_logic_vector(31 downto 0);--´para el register file
signal res_CRS2:std_logic_vector(31 downto 0);--´para el register file
signal res_OUTputSEU:std_logic_vector(31 downto 0);--para la extension de signo
signal res_ALUOP:std_logic_vector(5 downto 0);--para la unidad de control
signal res_NCWP : std_logic; -- para el windows manager
signal res_NRS1 : std_logic_vector(5 downto 0);--wmanager
signal res_NRS2 :  std_logic_vector(5 downto 0);--wmanager
signal res_NRD : std_logic_vector(5 downto 0);--wmanager
signal res_outInstruction:std_logic_vector(31 downto 0);-- para instruction memory

begin



Inst_Adder: Adder PORT MAP(
		A => "00000000000000000000000000000001",
		B =>res_npc,
		C =>resAdder_C
	);
	
Inst_Next_Program_Counter: Program_Counter PORT MAP(
		clock =>clk ,
		reset => reset,
		input => resAdder_C,
		output => res_npc
	);

Inst_Program_Counter: Program_Counter PORT MAP(
		clock => clk,
		reset => reset,
		input => res_npc,
		output => res_output
	
	);
	
Inst_instructionMemory: instructionMemory PORT MAP(
		address => res_output,
		reset => reset,
		outInstruction => res_outInstruction
	);
	
Inst_SING_EXTENSION: SING_EXTENSION PORT MAP(
		imm13 => res_outInstruction(12 downto 0),
		OUTput => res_OUTputSEU
	);

Inst_PSRmodifier: PSRmodifier PORT MAP(
		ALUout =>resAlu_Result ,
		ALUop =>res_ALUOP ,
		CRS1 => res_CRS1,
		MUXout =>resMUX_salida,-- corregida era del mux
		PSRout => res_PSRout
	);
Inst_PSR: PSR PORT MAP(
		ncwp => res_NCWP,
		nzvcin =>res_PSRout ,
		reset => reset,
		clk =>clk ,
		C =>res_C ,
		cwp => res_cwp
	);

Inst_Windows_manager: Windows_manager PORT MAP(
		RS1 => res_outInstruction(18 downto 14),
		RS2 => res_outInstruction(4 downto 0),
		RD => res_outInstruction(29 downto 25),
		OP => res_outInstruction(31 downto 30),
		OP3 => res_outInstruction(24 downto 19),
		CWP => res_cwp,
		NCWP => res_NCWP,
		NRS1 => res_NRS1,
		NRS2 => res_NRS2,
		NRD => res_NRD
	);
Inst_Register_File: Register_File PORT MAP(
		nRS1 => res_NRS1,
		nRS2 => res_NRS2,
		nRD => res_NRD,
		DWR => resAlu_Result,
		reset =>reset ,
		CRS1 => res_CRS1,
		CRS2 => res_CRS2
	);

Inst_UC: UC PORT MAP(
		OP => res_outInstruction(31 downto 30),
		OP3 =>res_outInstruction(24 downto 19) ,
		ALUOP => res_ALUOP
	);

	
Inst_Mux: Mux PORT MAP(
		i => res_outInstruction(13),
		Registro =>res_CRS2 ,
		Imm => res_OUTputSEU,
		salida => resMUX_salida
	);

Inst_ALU: ALU PORT MAP(
		CRS1 => res_CRS1,
		CRS2 => resMUX_salida,
		OP => res_ALUOP,
		C => res_C ,
		Result => resAlu_Result
	);

	
Result_Total<=resAlu_Result;

end ARQ_integracion_total2;

