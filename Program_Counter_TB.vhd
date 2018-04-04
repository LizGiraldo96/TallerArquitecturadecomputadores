
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY Program_Counter_TB IS
END Program_Counter_TB;
 
ARCHITECTURE behavior OF Program_Counter_TB IS 
 
    
 
    COMPONENT Program_Counter
    PORT(
         clock : IN  std_logic;
         reset : IN  std_logic;
         input : IN  std_logic_vector(31 downto 0);
         output : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal reset : std_logic := '0';
   signal input : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal output : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Program_Counter PORT MAP (
          clock => clock,
          reset => reset,
          input => input,
          output => output
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		
      input <= "00000000000000000000000000000000";
      wait for clock_period*10;
	
		input <= "00000000000000000000000000000000";
      wait for clock_period*10;
	
		input <= "11111111111111111111111111111111";
      wait for clock_period*10;
	
		input <= "00000000000000011111111111111111";
      wait for clock_period*10;
	
		input <= "11111111111111100000000000000000";
      wait for clock_period*10;
		reset <= '1';
	
		input <= "00000000000000000000000000000000";
      wait for clock_period*10;

		input <= "00000000000000000000000000000000";
      wait for clock_period*10;
	
		input <= "11111111111111111111111111111111";
      wait for clock_period*10;

		input <= "00000000000000011111111111111111";
      wait for clock_period*10;
	
		input <= "11111111111111100000000000000000";
      wait for clock_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
