library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PSR is
    Port ( cwp : in  STD_LOGIC;
           nzvcin : in  STD_LOGIC_VECTOR (3 downto 0);
           reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           cout : out  STD_LOGIC;-- es el carry
           ncwp : out  STD_LOGIC);
end PSR;

architecture Behavioral of PSR is
signal registropsr : std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
begin
	process(CLK,nzvcin,cwp, RESET)
		begin
			if(RESET = '1') then
				ncwp<= '0';
				cout<='0';
			
			else
			if (rising_edge(CLK)) then
				registropsr(23 downto 20)<=nzvcin;
				registropsr(0)<=cwp;
				cout<=registropsr(20);
				ncwp<=cwp;
			end if;
			
			end if;
		end process;


end Behavioral;