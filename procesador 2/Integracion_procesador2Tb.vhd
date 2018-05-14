
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY Integracion_procesador2Tb IS
END Integracion_procesador2Tb;
 
ARCHITECTURE behavior OF Integracion_procesador2Tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Integracion_Procesador2
    PORT(
         CLK : IN  std_logic;
         Reset : IN  std_logic;
         AluResult : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal Reset : std_logic := '0';

 	--Outputs
   signal AluResult : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Integracion_Procesador2 PORT MAP (
          CLK => CLK,
          Reset => Reset,
          AluResult => AluResult
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
     CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
      wait;
   end process;

END;
