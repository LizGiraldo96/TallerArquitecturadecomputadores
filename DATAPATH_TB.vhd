LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY DATAPATH_TB IS
END DATAPATH_TB;
 
ARCHITECTURE behavior OF DATAPATH_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DATAPATH
    PORT(
         reset : IN  std_logic;
         clk : IN  std_logic;
         ALUresult : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal reset : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal ALUresult : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DATAPATH PORT MAP (
          reset => reset,
          clk => clk,
          ALUresult => ALUresult
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.	
		reset <= '1';
		
		wait for 100 ns;	
		
		reset <= '0';
		
		wait for 100 ns;
		
		wait;
	end process;

END;
