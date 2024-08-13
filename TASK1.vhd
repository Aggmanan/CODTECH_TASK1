library ieee;
use ieee.std_logic_1164.all;

entity sqdet1 is
port (din,clk,reset: in std_logic;
	detect: out std_logic;
	state: out std_logic_vector(2 downto 0));
end sqdet1;

architecture sqd1 of sqdet1 is 
type statetype is (a,b,c,d);
signal pr_state,nx_state: statetype;
begin 

comb: process (pr_state,din)
begin 
case pr_state is 
when a=>detect <= '0';
	if din = '1' then nx_state <=b;
	else nx_state <=a;
	end if;
when b=>detect <= '0';
	if din = '0' then nx_state <=c;
	else nx_state <=b;
	end if;
when c=>detect<= '0';
	if din = '1' then nx_state <= d;
	else nx_state <= a;
	end if;
when d=>detect<= '1';
	if din = '0' then nx_state <= c;
	else nx_state <= b;
	end if;
when others =>detect <='0';
nx_state<= a;
end case;
end process comb;

flfl: process(clk,reset)
begin 
	if (reset ='1') then pr_state <=a;
	elsif (clk' event and clk ='1') then pr_state<=nx_state;
	end if;
end process flfl;
-- Assign the current state to the output port
  process (pr_state)
    begin
        case pr_state is
            when a => state <= "000";  -- 'A'
            when b => state <= "001";  -- 'B'
            when c => state <= "010";  -- 'C'
            when d => state <= "101";  -- 'D'
            when others => state <= "001";  -- Space (for safety, though this shouldn't occur)
        end case;
    end process;

end sqd1;
