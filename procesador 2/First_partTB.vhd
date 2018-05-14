
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY First_partTB IS
END First_partTB;
 
ARCHITECTURE behavior OF First_partTB IS 

 
    COMPONENT First_part
    PORT(
         CLK : IN  std_logic;
         Reset : IN  std_logic;
         Out_Program_counter : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal Reset : std_logic := '0';

 	--Outputs
   signal Out_Program_counter : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: First_part PORT MAP (
          CLK => CLK,
          Reset => Reset,
          Out_Program_counter => Out_Program_counter
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
       Reset <= '1';
      wait for 20 ns;	
      Reset<= '0';
      wait;
   end process;

END;
