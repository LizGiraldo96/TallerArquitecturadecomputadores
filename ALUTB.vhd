LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY ALUTB IS
END ALUTB;
 
ARCHITECTURE behavior OF ALUTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         CRS1 : IN  std_logic_vector(31 downto 0);
         CRS2 : IN  std_logic_vector(31 downto 0);
         OP : IN  std_logic_vector(5 downto 0);
         Result : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CRS1 : std_logic_vector(31 downto 0) := (others => '0');
   signal CRS2 : std_logic_vector(31 downto 0) := (others => '0');
   signal OP : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal Result : std_logic_vector(31 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          CRS1 => CRS1,
          CRS2 => CRS2,
          OP => OP,
          Result => Result
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		CRS1 <= "00000000000000000000000000111000";
		CRS2 <= "00000000000000000000000000001111";
		op <= "000000";
		wait for 100 ns;	
		op <= "000001";
		wait for 100 ns;	
		op <= "000010";
		wait for 100 ns;	
		op <= "000011";
		wait for 100 ns;	
		op <= "000100";
		wait for 100 ns;	
		op <= "000101";
		wait for 100 ns;	
		op <= "000110";
		wait for 100 ns;	
		op <= "000111";
		wait for 100 ns;	
		op <= "001111";
		  
   end process;

END;
