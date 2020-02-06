                             -------------------------------------
                             --  Title:整点报时电路             --
                             --  Data: 2009-4-16                --
                             -------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
--------------------------------------------------------------------
entity alert is
  port( Reset         :  in  std_logic;  --复位输入
		Clk_1250Hz    : in std_logic;   --1.25KHz时钟输入
		Clk_2500Hz    : in std_logic;   --2.5KHz时钟输入
		second       :  in  std_logic_vector(6 downto 0); --秒输入
		minute       :  in  std_logic_vector(6 downto 0); --分钟输入
        speak   :  out  std_logic; --扬声器输出
        lamp   :  out  std_logic_vector(4 downto 0) --彩灯控制输出
       );      
end alert;
--------------------------------------------------------------------
architecture behave of alert is
 
  begin
    process(minute,second,Reset) 
      begin
		if (minute=0 and second=0 and Reset='1') then
			lamp<="11111";
			speak<=Clk_2500Hz;
		elsif(minute="1011001")then
			if (second="1010000")then
				lamp<="10000";
				speak<=Clk_1250Hz;
			elsif(second="1010010")then
				lamp<="01000";
				speak<=Clk_1250Hz;
			elsif(second="1010100")then
				lamp<="00100";
				speak<=Clk_1250Hz;
			elsif(second="1010110")then
				lamp<="00010";
				speak<=Clk_1250Hz;
			elsif(second="1011000")then
				lamp<="00001";
				speak<=Clk_1250Hz;
			else
				lamp<="00000";
				speak<='0';
			end if;
		else
			lamp<="00000";
			speak<='0';
		end if;
    end process;
end behave;
