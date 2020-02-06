----------------------------------------
                             --  Title: ������ʾ�����������       --
                             --  Data: 2009-4-19                   --
                             -------------------------------��--------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
--------------------------------------------------------------------
entity deled is
  port( d  :  in  std_logic_vector(4 downto 0);   --��BCD����չһλ�����λΪ��0��������ʾԭ���ġ�0~F����
                                                  --���λΪ��1����ʾ�������
        ledag  :  out  std_logic_vector(6 downto 0)    --
       );      
end deled;
--------------------------------------------------------------------
architecture display of deled is

   begin 
      process(d)--�������ʾ 
      begin
      case  d  is
          when  "00000" => ledag <="0111111"; --0
          when  "00001" => ledag <="0000110"; --1
          when  "00010" => ledag <="1011011"; --2
          when  "00011" => ledag <="1001111"; --3
          when  "00100" => ledag <="1100110"; --4
          when  "00101" => ledag <="1101101"; --5
          when  "00110" => ledag <="1111101"; --6
          when  "00111" => ledag <="0000111"; --7
          when  "01000" => ledag <="1111111"; --8
          when  "01001" => ledag <="1101111"; --9
          when  "01010" => ledag <="1110111"; --A
          when  "01011" => ledag <="1111100"; --b
          when  "01100" => ledag <="0111001"; --C
          when  "01101" => ledag <="1011110"; --d
          when  "01110" => ledag <="1111001"; --E
          when  "01111" => ledag <="1000111"; --F
          when  "10000" => ledag <="0011000"; --��������
          when  "10001" => ledag <="1001000"; --��=���ţ������־����ͨ
          when  "10010" => ledag <="0010100"; --��||���ţ������־����ͨ
          when  "10011" => ledag <="1000000"; --��-���ţ��ָ���
          when  others => ledag <="0000000"; --����
     end  case;
   end  process;
  end  display;