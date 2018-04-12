LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY SING_EXTENSION_TB IS
END SING_EXTENSION_TB;
 
ARCHITECTURE behavior OF SING_EXTENSION_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SING_EXTENSION
    PORT(
         imm13 : IN  std_logic_vector(12 downto 0);
         OUTput : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal imm13 : std_logic_vector(12 downto 0) := (others => '0');

 	--Outputs
   signal OUTput : std_logic_vector(31 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SING_EXTENSION PORT MAP (
          imm13 => imm13,
          OUTput => OUTput
        );
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		imm13 <= "0111111111111";
      wait for 100 ns;	
		imm13 <= "0000000000001";
      wait for 100 ns;	
		imm13 <= "1000000000000";
      wait for 100 ns;	
		imm13 <= "1111111111110";

      wait;
   end process;

END;
