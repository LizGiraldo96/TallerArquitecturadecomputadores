
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY MuxTB IS
END MuxTB;
 
ARCHITECTURE behavior OF MuxTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Mux
    PORT(
         i : IN  std_logic;
         Registro : IN  std_logic_vector(31 downto 0);
         Imm : IN  std_logic_vector(31 downto 0);
         salida : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal i : std_logic := '0';
   signal Registro : std_logic_vector(31 downto 0) := (others => '0');
   signal Imm : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal salida : std_logic_vector(31 downto 0);
  
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Mux PORT MAP (
          i => i,
          Registro => Registro,
          Imm => Imm,
          salida => salida
        );

  

   -- Stimulus process
   stim_proc: process
   begin		
    
       i <= '0';
		Registro <= "00000000000000000000000000010100";
		wait for 20 ns;
		i <= '1';
		Imm <= "00000000000000000000000000000001";
		wait for 20 ns;
		i <= '0';
		Registro <= "00001001000000000000000000010100";
		wait for 20 ns;

      i <= '1';
		Imm <= "00000000000000000000000000000011";
		

      -- insert stimulus here 

      wait;
   end process;

END;
