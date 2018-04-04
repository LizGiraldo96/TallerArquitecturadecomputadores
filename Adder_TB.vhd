
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY Adder_TB IS
END Adder_TB;
 
ARCHITECTURE behavior OF Adder_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Adder
    PORT(
         A : IN  std_logic_vector(31 downto 0);
         B : IN  std_logic_vector(31 downto 0);
         C : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(31 downto 0) := (others => '0');
   signal B : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal C : std_logic_vector(31 downto 0);
  
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Adder PORT MAP (
          A => A,
          B => B,
          C => C
        );

 
 

   -- Stimulus process
   stim_proc: process
   begin		
      
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		A <= "00000000000000000000000000000000";
		B <= "01111111111111111111111111111111";
		wait for 100 ns;	
	
		A <= "00000001111111111111000000000000";
		B <= "00000000000000000000000000000111";
		wait for 100 ns;	
	
		A <= "00000000000000000000000000000111";
		B <= "00000000000000000000000000000111";
		wait for 100 ns;	
   end process;

END;
