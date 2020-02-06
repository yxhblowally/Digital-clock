                             -------------------------------------
                             --  Title:60���Ƽ�����·               --
                             --  Data: 2009-4-16                --
                             -------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
--------------------------------------------------------------------
entity count60 is
  port( Clk_10KHz       :  in   std_logic;   --����ʱ������
        Reset         :  in  std_logic;  --��λ����
        Clk         :  in  std_logic;  --��λ����
        Clk_5Hz         :  in  std_logic;  --��λ����
        SET         :  in  std_logic;  --��λ����
        Cout         :  out  std_logic;  --��λ���
        CountOut       :  buffer  std_logic_vector(6 downto 0) --60���Ƽ������
       );      
end count60;
--------------------------------------------------------------------
architecture behave of count60 is

signal temp_clk : std_logic;
signal pre_temp_clk : std_logic;

  begin

    process(Clk_10KHz,Reset)
      begin
        if(Reset='0') then    --ϵͳ��λ
            temp_clk<='0';
			pre_temp_clk <= '0';
		elsif(Clk_10KHz'event and Clk_10KHz='1') then
			if(SET='0')then
				temp_clk<=Clk_5Hz;
			else
				temp_clk<=Clk;
			end if;
			pre_temp_clk<=temp_clk;
		end if;
    end process;

    process(clk_10KHz,Reset)
      begin
        if(Reset='0') then    --ϵͳ��λ
            CountOut<="0000000";
			Cout <= '0';
        else
			if(clk_10KHz'event and clk_10KHz='1') then    --��������
				if(pre_temp_clk='0' and temp_clk='1') then
					  if(CountOut(3 downto 0)=9) then
						if (CountOut(6 downto 4)=5) then
							Cout <= '1';
							CountOut<="0000000";
						else
							Cout <= '0';
							CountOut<=CountOut+7;
						end if;
					  else 
						CountOut <=CountOut+1;
						Cout <= '0';
					  end if;
				end if;
			end if;
        end if; 
    end process;

end behave;