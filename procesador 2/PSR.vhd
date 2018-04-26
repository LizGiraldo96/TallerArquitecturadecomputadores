library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PSR is
    Port ( cwp : in  STD_LOGIC;
           nzvcin : in  STD_LOGIC_VECTOR (3 downto 0);
           reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           cout : out  STD_LOGIC;
           ncwp : out  STD_LOGIC);
end PSR;

architecture Behavioral of PSR is

begin
	process(CLK,nzvcin, RESET)
		begin
			if(RESET = '1') then
				cout <= '0';
				ncwp <= '0';
			end if;
			if(rising_edge(CLK)) then
				Cout <= nzvcin(0); 
				ncwp <= cwp;
			end if;
		end process;

end Behavioral;

