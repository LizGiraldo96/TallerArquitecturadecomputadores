
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY Register_FileTB IS
END Register_FileTB;
 
ARCHITECTURE behavior OF Register_FileTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Register_File
    PORT(
         RS1 : IN  std_logic_vector(4 downto 0);
         RS2 : IN  std_logic_vector(4 downto 0);
         RD : IN  std_logic_vector(4 downto 0);
         DWR : IN  std_logic_vector(31 downto 0);
         reset : IN  std_logic;
         CRS1 : OUT  std_logic_vector(31 downto 0);
         CRS2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal RS1 : std_logic_vector(4 downto 0) := (others => '0');
   signal RS2 : std_logic_vector(4 downto 0) := (others => '0');
   signal RD : std_logic_vector(4 downto 0) := (others => '0');
   signal DWR : std_logic_vector(31 downto 0) := (others => '0');
   signal reset : std_logic := '0';

 	--Outputs
   signal CRS1 : std_logic_vector(31 downto 0);
   signal CRS2 : std_logic_vector(31 downto 0);
  
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Register_File PORT MAP (
          RS1 => RS1,
          RS2 => RS2,
          RD => RD,
          DWR => DWR,
          reset => reset,
          CRS1 => CRS1,
          CRS2 => CRS2
        );



   -- Stimulus process
   stim_proc: process
   begin		
      reset<='1';
		wait for 20 ns;
		reset <= '0';
		--escribiendo
      RS1 <= "00000";
      RS2 <= "00000";
      RD <= "00001";-- guarda en ese registro
      DWR <= "00000000000000000000000000110000";
      wait for 20 ns;	
		--leemos
		RS1 <= "00001";
      RS2 <= "00001";
      RD <= "00000";
      wait for 20 ns;
   end process;

END;
