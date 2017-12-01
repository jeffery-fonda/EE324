----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/01/2017 10:08:29 AM
-- Design Name: 
-- Module Name: source - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Stopwatch is
    Port ( CLK : in  STD_LOGIC;
           BTN : in  STD_LOGIC_VECTOR (3 downto 0);
           LED : out  STD_LOGIC_VECTOR (3 downto 0);
           AN : out  STD_LOGIC_VECTOR (3 downto 0);
           SSEG : out  STD_LOGIC_VECTOR (7 downto 0));
end Stopwatch;

architecture Behavioral of Stopwatch is

-- variables
signal count, seconds, tens, tenths, hundreths, millis, incstate : integer := 0;
signal runstate : boolean := false;
signal run_cs, run_ns: boolean;
signal mclk, start, stop, reset, inc : STD_LOGIC := '0';

-- procedures
procedure ssd_decode(
		signal decimal : in integer;
		signal ssd_out : out std_logic_vector (7 downto 0)) is
		variable temp : std_logic_vector (7 downto 0);
	begin
		case decimal is
			when 0=> temp := "11000000";
			when 1=> temp := "11111001";
			when 2=> temp := "10100100";
			when 3=> temp := "10110000";
			when 4=> temp := "10011001";
			when 5=> temp := "10010010";
			when 6=> temp := "10000010";
			when 7=> temp := "11111000";
			when 8=> temp := "10000000";
			when 9=> temp := "10010000";
			when 99=> temp := "01111111";
			when others=> temp := "10000110";
		end case;
	ssd_out <= temp;
	ssd_out(7) <= '1';
end ssd_decode;

begin

-- clock divider
process (CLK)
begin
	if rising_edge(CLK) then
		if count = (100000000 / 1000) then
			mclk <= '1';
			count <= 0;
		else
			count <= count + 1;
			mclk <= '0';
		end if;
	end if;
end process;

-- millisecond counter
process (mclk, runstate, reset, inc)
begin
	if (reset = '1')then
		millis <= 0;
		hundreths <= 0;
		tenths <= 0;
		seconds <= 0;
		tens <= 0;
    elsif (inc = '1') then
        millis <= millis + 1;
	elsif (rising_edge(mclk) and runstate = true) then
		if millis = 9 then
			millis <= 0;
			hundreths <= hundreths + 1;
			if hundreths = 9 then
				hundreths <= 0;
				tenths <= tenths + 1;
				if tenths = 9 then
					tenths <= 0;
					seconds <= seconds + 1;
					if seconds = 9 then
						seconds <= 0;
						tens <= tens + 1;
						if tens = 15 then
							tens <= 0;
						end if;
					end if;
				end if;
			end if;
		else	
			millis <= millis + 1;
		end if;
    end if;
end process;



-- display sseg
process (count, tens, seconds, tenths, hundreths, millis)
begin
	if count > 0 and count < 20000 then
		AN <= "1110";
		ssd_decode(decimal => millis, ssd_out => SSEG);
	elsif count > 20000 and count < 40000 then
		AN <= "1101";
		ssd_decode(decimal => hundreths, ssd_out => SSEG);
	elsif count > 40000 and count < 60000 then
		AN <= "1011";
		ssd_decode(decimal => tenths, ssd_out => SSEG);
	elsif count > 60000 and count < 80000 then
		AN <= "0111";
		ssd_decode(decimal => seconds, ssd_out => SSEG);
	else
		AN <= "0111";
		SSEG <= "01111111";
	end if;
end process;

-- 4 bit tens display
process(tens)
begin
	LED <= conv_std_logic_vector(tens, 4);
end process;


process (mclk, start, stop, runstate, inc, incstate) begin
	if rising_edge(mclk) then
		if start = '1' and stop = '0'  then
			runstate <= true;
		elsif stop = '1' and start = '0' then
			runstate <= false;
		else
			runstate <= runstate;
		end if;
	end if;
end process;


start <= BTN(0);
stop <= BTN(1);
reset <= BTN(2);
inc <= BTN(3);

end Behavioral;
