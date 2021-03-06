                             -------------------------------------
                             --  Title:七段码管选通控制         --
                             --  Data: 2009-4-16                --
                             -------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
--------------------------------------------------------------------
entity sel_time is
  port( Clk_1KHz       :  in   std_logic;   --1KHz时钟输入
        Reset       :  in   std_logic;   --复位输入
		second       :  in  std_logic_vector(6 downto 0); --秒
		minute       :  in  std_logic_vector(6 downto 0); --分钟
		hour       :  in  std_logic_vector(5 downto 0); --小时
        BCD_OUT   :  out  std_logic_vector(4 downto 0);  --BCD码输出
        SEL   :  buffer  std_logic_vector(2 downto 0) --七段码管扫描驱动
       );      
end sel_time;
--------------------------------------------------------------------
architecture behave of sel_time is
 
  begin
    process(Clk_1KHz) 
      begin
        if(Clk_1KHz'event and Clk_1KHz='1') then
           if(SEL<7) then
             SEL<=SEL+1;
           else 
             SEL<="000";
           end if;
        end if;
    end process;

    process(SEL,Reset)      
      begin
		if(Reset='0')then
			BCD_OUT<="00000";
		else
			case (SEL) is
			 when "000"=>BCD_OUT<="000" & hour(5 downto 4); --时十位
			 when "001"=>BCD_OUT<='0' & hour(3 downto 0);  --时个位
			 when "010"=>BCD_OUT<="10011";  --间隔符
			 when "011"=>BCD_OUT<="00" & minute(6 downto 4);  --分十位
			 when "100"=>BCD_OUT<='0' & minute(3 downto 0);  --分个位
			 when "101"=>BCD_OUT<="10011";  --间隔符
			 when "110"=>BCD_OUT<="00" & second(6 downto 4);  --秒十位
			 when "111"=>BCD_OUT<='0' & second(3 downto 0);  --秒个位
			end case;
		end if;        
    end process;
end behave;
