
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Integracion_Procesador2 is
    Port ( CLK : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           AluResult : out  STD_LOGIC_VECTOR (31 downto 0));
			  
end Integracion_Procesador2;

architecture ARQ_Integracion_Procesador2 of Integracion_Procesador2 is

COMPONENT First_part
	PORT(
		CLK : IN std_logic;
		Reset : IN std_logic;          
		Out_Program_counter : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;

COMPONENT instructionMemory
	PORT(
		address : IN std_logic_vector(31 downto 0);
		reset : IN std_logic;          
		outInstruction : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
COMPONENT SING_EXTENSION
	PORT(
		imm13 : IN std_logic_vector(12 downto 0);          
		OUTput : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
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
	
COMPONENT Mux
	PORT(
		i : IN std_logic;
		Registro : IN std_logic_vector(31 downto 0);
		Imm : IN std_logic_vector(31 downto 0);          
		salida : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	


COMPONENT ALU
	PORT(
		CRS1 : IN std_logic_vector(31 downto 0);
		CRS2 : IN std_logic_vector(31 downto 0);
		OP : IN std_logic_vector(5 downto 0);
		C : IN std_logic;          
		Result : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
COMPONENT UC
	PORT(
		OP : IN std_logic_vector(1 downto 0);
		OP3 : IN std_logic_vector(5 downto 0);          
		ALUOP : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;
	
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
	
COMPONENT PSRmodifier
	PORT(
		ALUout : IN std_logic_vector(31 downto 0);
		ALUop : IN std_logic_vector(5 downto 0);
		CRS1 : IN std_logic_vector(31 downto 0);
		MUXout : IN std_logic_vector(31 downto 0);          
		PSRout : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	
--Creacion de señales para cada salida de los modulos

signal res_Out_Program_counter: std_logic_vector (5 downto 0);-- para el modulo first part
signal res_OUTput: std_logic_vector(31 downto 0);-- para la extension de signo
signal res_CRS1: std_logic_vector(31 downto 0);--para el modulo de register file
signal res_CRS2: std_logic_vector(31 downto 0);--para el modulo de register file
signal res_salida: std_logic_vector(31 downto 0);-- para el multiplexor
signal res_outInstruction: std_logic_vector(31 downto 0);--para el instruction memory
signal res_Result: std_logic_vector(31 downto 0);--para la ALU
signal res_ALUOP: std_logic_vector(5 downto 0);--para UC
signal res_NCWP: std_logic;--para windows manager
signal res_NRS1: std_logic_vector(5 downto 0); --para windows manager
signal res_NRS2: std_logic_vector(5 downto 0); --para windows manager
signal res_NRD: std_logic_vector(5 downto 0); --para windows manager
signal res_cout: std_logic;-- para PSR
signal res_ncwp_psr: std_logic;-- para PSR
signal res_PSRout: std_logic_vector(3 downto 0);-- para psr modifier
     

begin

Inst_First_part: First_part PORT MAP(
		CLK => clk,
		Reset => reset,
		Out_Program_counter => res_Out_Program_counter
	);
	
Inst_instructionMemory: instructionMemory PORT MAP(
		address => res_Out_Program_counter,
		reset =>reset ,
		outInstruction => res_outInstruction
	);	
Inst_SING_EXTENSION: SING_EXTENSION PORT MAP(
		imm13 => res_outInstruction(12 downto 0),
		OUTput => res_OUTput
	);
	
Inst_Register_File: Register_File PORT MAP(
		nRS1 =>res_NRS1,
		nRS2 => res_NRS2,
		nRD => res_NRD,
		DWR => res_Result ,
		reset => reset,
		CRS1 => res_CRS1,
		CRS2 => res_CRS2
	);
	
Inst_Mux: Mux PORT MAP(
		i => res_outInstruction(13),
		Registro =>res_CRS2,
		Imm => res_OUTput,
		salida => res_salida
	);



Inst_ALU: ALU PORT MAP(
		CRS1 => res_CRS1 ,
		CRS2 =>res_salida ,
		OP => res_ALUOP,
		C => res_cout,
		Result => res_Result
	);

Inst_UC: UC PORT MAP(
		OP =>res_outInstruction(31 downto 30) ,
		OP3 =>res_outInstruction(24 downto 19) ,
		ALUOP => res_ALUOP
	);
Inst_Windows_manager: Windows_manager PORT MAP(
		RS1 => res_outInstruction(18 downto 14),
		RS2 => res_outInstruction(4 downto 0),
		RD => res_outInstruction(29 downto 25),
		OP => res_outInstruction(31 downto 30),
		OP3 => res_outInstruction(24 downto 19),
		CWP => res_ncwp_psr,
		NCWP => res_NCWP,
		NRS1 => res_NRS1,
		NRS2 => res_NRS2,
		NRD => res_NRD
	);
Inst_PSR: PSR PORT MAP(
		cwp => res_NCWP,
		nzvcin => res_PSRout,
		reset =>reset ,
		clk => clk,
		cout => res_cout,
		ncwp => res_ncwp_psr
	);

Inst_PSRmodifier: PSRmodifier PORT MAP(
		ALUout => res_Result,
		ALUop => res_ALUOP ,
		CRS1 =>res_CRS1 ,
		MUXout => res_salida ,
		PSRout => res_PSRout
	);
	
	Aluresult<= res_Result;

end ARQ_Integracion_Procesador2;

