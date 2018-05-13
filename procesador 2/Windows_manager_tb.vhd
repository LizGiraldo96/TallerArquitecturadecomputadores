
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY Windows_manager_tb IS
END Windows_manager_tb;
 
ARCHITECTURE behavior OF Windows_manager_tb IS 

 
    COMPONENT Windows_manager
    PORT(
         RS1 : IN  std_logic_vector(4 downto 0);
         RS2 : IN  std_logic_vector(4 downto 0);
         RD : IN  std_logic_vector(4 downto 0);
         OP : IN  std_logic_vector(1 downto 0);
         OP3 : IN  std_logic_vector(5 downto 0);
         CWP : IN  std_logic;
         NCWP : OUT  std_logic;
         NRS1 : OUT  std_logic_vector(5 downto 0);
         NRS2 : OUT  std_logic_vector(5 downto 0);
         NRD : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal RS1 : std_logic_vector(4 downto 0) := (others => '0');
   signal RS2 : std_logic_vector(4 downto 0) := (others => '0');
   signal RD : std_logic_vector(4 downto 0) := (others => '0');
   signal OP : std_logic_vector(1 downto 0) := (others => '0');
   signal OP3 : std_logic_vector(5 downto 0) := (others => '0');
   signal CWP : std_logic := '0';

 	--Outputs
   signal NCWP : std_logic;
   signal NRS1 : std_logic_vector(5 downto 0);
   signal NRS2 : std_logic_vector(5 downto 0);
   signal NRD : std_logic_vector(5 downto 0);
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Windows_manager PORT MAP (
          RS1 => RS1,
          RS2 => RS2,
          RD => RD,
          OP => OP,
          OP3 => OP3,
          CWP => CWP,
          NCWP => NCWP,
          NRS1 => NRS1,
          NRS2 => NRS2,
          NRD => NRD
        );


   -- Stimulus process
   stim_proc: process
   begin		
      
               CWP <= '0';
					RS1 <= "11000";
					RS2 <= "01111";
					RD <= "10101";
					OP <= "10";
					OP3 <= "111101";--Restore						
					wait for 40 ns;
					
					CWP <= '1';
					RS1 <= "10000";
					RS2 <= "01000";
					RD <= "10000";
					OP <= "10";
					OP3 <= "111100";--Save
					wait for 40 ns;
					
					CWP <= '0';
					RS1 <= "11111";
					RS2 <= "01000";
					RD <= "10000";
					OP <= "10";
					OP3 <= "111101";--Restore
					wait for 40 ns;
					
					CWP <= '1';
					RS1 <= "11111";
					RS2 <= "11000";
					RD <= "10000";
					OP <= "10";
					OP3 <= "111100";--Save
					wait for 40 ns;
					
					

      wait;
   end process;

END;
