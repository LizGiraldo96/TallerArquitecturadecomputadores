
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY UC_TB IS
END UC_TB;
 
ARCHITECTURE behavior OF UC_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT UC
    PORT(
         OP : IN  std_logic_vector(1 downto 0);
         OP3 : IN  std_logic_vector(5 downto 0);
         ALUOP : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal OP : std_logic_vector(1 downto 0) := (others => '0');
   signal OP3 : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal ALUOP : std_logic_vector(5 downto 0);
	
	BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: UC PORT MAP (
          OP => OP,
          OP3 => OP3,
          ALUOP => ALUOP
        );


 

   -- Stimulus process
   stim_proc: process
   begin		
      
      
      OP<="10";
		wait for 20 ns;
		OP<="10";
		OP3<="000000";
		wait for 20 ns;
		OP<="10";
		OP3<="000100";
		wait for 20 ns;
		OP<="10";
		OP3<="000001";
	
		
		

   

      wait;
   end process;

END;
