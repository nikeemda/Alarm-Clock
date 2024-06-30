library ieee;
use ieee.std_logic_1164.all;

Entity Register8 is
	Port(DinM : in std_logic_vector(3 downto 0);
		DinL : in std_logic_vector (3 downto 0);
		Load, Clk : in std_logic;
		Dout : out std_logic_vector(7 downto 0));
end Register8;

Architecture behav of Register8 is
	Signal storage : std_logic_vector(7 downto 0);
		begin
		process(DinM, DinL, Load, Clk)
		begin
			if (Clk'event and Clk = '1' and Load = '1') then
				storage(7 downto 4) <= DinM;
				storage(3 downto 0) <= DinL;
			elsif (Clk'event and Clk = '0') then
				Dout <= storage;
			end if;
		end process;
	end;

