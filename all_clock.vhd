                             -------------------------------------
                             --  Title:ʱ�ӷ�Ƶ��·             --
                             --  Data: 2009-4-16                --
                             -------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
--------------------------------------------------------------------
entity all_clock is
  port( Clk_10kHz       :  in   std_logic;   --10kHzʱ������
		Clk_1250Hz    : out std_logic;   --1.25KHzʱ�����
		Clk_2500Hz    : out std_logic;   --2.5KHzʱ�����
        Clk_1Hz   :  out  std_logic;  --1Hzʱ�����
        Clk_5Hz   :  out  std_logic;  --5Hzʱ����������ڵ���ʱ��
        Clk_1KHz   :  out  std_logic --1KHzʱ�����
       );      
end all_clock;
--------------------------------------------------------------------
architecture behave of all_clock is
  signal Clk_Count1Hz    : integer range 0 to 9999;   --����1Hzʱ�ӵķ�Ƶ������
  signal Clk_Count5Hz    : integer range 0 to 1999;   --����1Hzʱ�ӵķ�Ƶ������
  signal Clk_Count1KHz    : integer range 0 to 9;   --����1KHzʱ�ӵķ�Ƶ������
  signal Clk_Count1250Hz    : integer range 0 to 7;   --����1.25KHzʱ�ӵķ�Ƶ������
  signal Clk_Count2500Hz    : integer range 0 to 3;   --����2.5KHzʱ�ӵķ�Ƶ������
 
  begin
    process(Clk_10kHz) 
      begin
        if(Clk_10kHz'event and Clk_10kHz='1') then
           if(Clk_Count1Hz<9999) then
             Clk_Count1Hz <= Clk_Count1Hz+1;
           else 
             Clk_Count1Hz <= 0;
           end if;
		   if Clk_Count1Hz < 8000 then
			 Clk_1Hz <= '0';
		   else
			 Clk_1Hz <= '1';
		   end if;
		
           if(Clk_Count5Hz<1999) then
             Clk_Count5Hz <= Clk_Count5Hz+1;
           else 
             Clk_Count5Hz <= 0;
           end if;
		   if Clk_Count5Hz < 1000 then
			 Clk_5Hz <= '0';
		   else
			 Clk_5Hz <= '1';
		   end if;
		
           if(Clk_Count1KHz<9) then
             Clk_Count1KHz <= Clk_Count1KHz+1;
           else 
             Clk_Count1KHz <= 0;
           end if;
		   if Clk_Count1KHz < 5 then
			 Clk_1KHz <= '0';
		   else
			 Clk_1KHz <= '1';
		   end if;
           if(Clk_Count1250Hz<7) then
             Clk_Count1250Hz <= Clk_Count1250Hz+1;
           else 
             Clk_Count1250Hz <= 0;
           end if;
		   if Clk_Count1250Hz < 4 then
			 Clk_1250Hz <= '0';
		   else
			 Clk_1250Hz <= '1';
		   end if;
 		
           if(Clk_Count2500Hz<3) then
             Clk_Count2500Hz <= Clk_Count2500Hz+1;
           else 
             Clk_Count2500Hz <= 0;
           end if;
		   if Clk_Count2500Hz < 2 then
			 Clk_2500Hz <= '0';
		   else
			 Clk_2500Hz <= '1';
		   end if;
       end if;
    end process;
end behave;