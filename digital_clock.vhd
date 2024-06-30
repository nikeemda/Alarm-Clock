library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.std_logic_arith.all;
use IEEE.numeric_std.all;


entity digital_clock is
port ( 
 clk: in std_logic; 
 resetn: in std_logic;
 SetTime: in std_logic; 
 SetMSD: in std_logic_vector (3 downto 0);
 SetLSD: in std_logic_vector (3 downto 0);
 SetHour: in std_logic; --piushbutton
 SetMinute: in std_logic;
 secclock: out std_logic; 
 
 HMSD: out std_logic_vector(6 downto 0);
 HLSD: out std_logic_vector(6 downto 0);
 MMSD: out std_logic_vector(6 downto 0);
 MLSD: out std_logic_vector(6 downto 0);
 SMSD: out std_logic_vector(6 downto 0);
 SLSD: out std_logic_vector(6 downto 0)
 
 );
end digital_clock;


architecture Behavioral of digital_clock is

component DisplayCkt is
	port(Input: in std_logic_vector(3 downto 0); 
		SevenSeg : out std_logic_vector(6 downto 0)); 
	end component;

component bintohex is 
	port( input : in integer;
		outmsd: out std_logic_vector (3 downto 0);
		outlsd: out std_logic_vector (3 downto 0)
		);
	end component;

component clockdiv is 
	port(
		orig_clk : in STD_LOGIC;
		new_clk : out std_logic
		);
end component;


signal clk_1s: std_logic; -- 1-s clock
signal counter_hour, counter_minute, counter_second: integer;
signal sethr: std_logic_vector (7 downto 0);
signal setmin: std_logic_vector (7 downto 0);
signal hour_out_msd: std_logic_vector (3 downto 0 );
signal hour_out_lsd: std_logic_vector (3 downto 0 );
signal min_out_msd: std_logic_vector (3 downto 0 );
signal min_out_lsd: std_logic_vector (3 downto 0 );
signal sec_out_msd: std_logic_vector (3 downto 0 );
signal sec_out_lsd: std_logic_vector (3 downto 0 );
signal sethourmsd: std_logic_vector (3 downto 0 );
signal sethourlsd: std_logic_vector (3 downto 0 );
signal setminmsd: std_logic_vector (3 downto 0 );
signal setminlsd: std_logic_vector (3 downto 0 );

begin

clock: clockdiv port map (clk, clk_1s); 

regclock: process(SetTime, SetHour, SetMinute, clk_1s, resetn, sethourmsd, sethourlsd, setminmsd, setminlsd)begin

  	if(resetn = '0') then
	 	counter_hour <= 0;
	 	counter_minute <= 0;
	 	counter_second <= 0;
		
	else --rest is 0
		if(SetTime = '0') then
 		
			if(clk_1s'event AND clk_1s = '1') then
				counter_second <= counter_second + 1;
	
			
				if(counter_second >= 59) then -- second > 59 then minute increases
					counter_minute <= counter_minute + 1;
					counter_second <= 0;
					
					if(counter_minute >= 59) then -- minute > 59 then hour increases
						counter_minute <= 0;
						counter_hour <= counter_hour + 1;

						if(counter_hour >= 23) then -- hour > 24 then set hour to 0
							counter_hour <= 0;
							

						end if;
					end if;	
				end if;	
			end if;
		
		else
	
			counter_hour <= 0;
		   counter_minute <= 0;
			counter_second <= 0;

 
			
			if(SetHour ='1') then
				sethourmsd <= "0000";
				sethourlsd <= "0000";
				sethourmsd <= SetMSD;
				sethourlsd <= SetLSD;

			end if;
			

			sethr (7 downto 4) <= sethourmsd;
			sethr (3 downto 0) <= sethourlsd;
			counter_hour <= conv_integer(sethr); 

			if(SetMinute = '0') then
				setminmsd <= "0000";
				setminlsd <= "0000";	
				setminmsd <= SetMSD;
				setminlsd <= SetLSD;
				
			end if;
			
		
			setmin (7 downto 4) <= setminmsd;
			setmin (3 downto 0) <= setminlsd;
			counter_minute <= conv_integer(setmin);


		end if;
	end if;

end process;


	secclock <= clk_1s;

	HourNo: bintohex port map (counter_hour, hour_out_msd, hour_out_lsd);
	MinuteNo: bintohex port map (counter_minute, min_out_msd, min_out_lsd);
	SecondNo: bintohex port map (counter_Second, sec_out_msd, sec_out_lsd);

	HMSDdisp: DisplayCkt port map (hour_out_msd, HMSD); 
	HLSDdisp: DisplayCkt port map (hour_out_lsd, HLSD);
	MMSDdisp: Displayckt port map (min_out_msd, MMSD); 
	MLSDdisp: DisplayCkt port map (min_out_lsd, MLSD); 
	SMSDdisp: Displayckt port map (sec_out_msd, SMSD); 
	SLSDdisp: DisplayCkt port map (sec_out_lsd, SLSD);

	

end Behavioral;



