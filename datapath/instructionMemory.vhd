
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use std.textio.all;


entity instructionMemory is
    Port ( 
			  --clk : in STD_LOGIC;
			  address : in  STD_LOGIC_VECTOR (31 downto 0);
           reset : in  STD_LOGIC;
           outInstruction : out  STD_LOGIC_VECTOR (31 downto 0));
end instructionMemory;

architecture arqInstructionMemory of instructionMemory is

type rom_type is array(0 to 63) of bit_vector(31 downto 0);    
impure function prueba(p : in string) return rom_type is                                                         
        FILE q        : text is in p;                       
        variable z : line;                                 
        variable ROM      : rom_type;                                      
     begin                                                        
        for I in rom_type'range loop                                  
            readline (q, z);                               
            read (z, ROM(I));                                 
        end loop;                                                    
        return ROM;                                                  
     end function;                                                
 
signal ROM : rom_type := prueba("1.txt");
	
begin
	process(reset,address,ROM)
	begin
		if(reset = '1') then
			outInstruction <= (others => '0');
		else
			outInstruction <= to_stdlogicvector(ROM(conv_integer(address(5 downto 0))));
		end if;
	end process;

end arqInstructionMemory;