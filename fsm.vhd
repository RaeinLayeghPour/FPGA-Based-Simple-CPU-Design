library ieee;
use ieee.std_logic_1164.all;

entity fsm is
	port( 
		clk 		     : in std_logic;
		data_in 	     : in std_logic;
		reset 	         : in std_logic;
		student_id	     : out std_logic_vector(3 downto 0);
		current_state    : out std_logic_vector(3 downto 0)
	); 
end entity;

architecture machine of fsm is
	type state_type is (s0, s1, s2, s3, s4, s5, s6, s7);
	signal yfsm: state_type;
begin

	-- State transition process (clocked)
	process(clk, reset)
	begin
		if reset = '1' then
			yfsm <= s0;
		elsif rising_edge(clk) then
			case yfsm is
				when s0 =>
					if data_in = '1' then
						yfsm <= s1;
					else
						yfsm <= s0;
					end if;

				when s1 =>
					if data_in = '1' then
						yfsm <= s2;
					else
						yfsm <= s1;
					end if;

				when s2 =>
					if data_in = '1' then
						yfsm <= s3;
					else
						yfsm <= s2;
					end if;

				when s3 =>
					if data_in = '1' then
						yfsm <= s4;
					else
						yfsm <= s3;
					end if;

				when s4 =>
					if data_in = '1' then
						yfsm <= s5;
					else
						yfsm <= s4;
					end if;

				when s5 =>
					if data_in = '1' then
						yfsm <= s6;
					else
						yfsm <= s5;
					end if;

				when s6 =>
					if data_in = '1' then
						yfsm <= s7;
					else
						yfsm <= s6;
					end if;

				when s7 =>
					if data_in = '1' then
						yfsm <= s0;
					else
						yfsm <= s7;
					end if;
			end case;
		end if;
	end process;

	-- Output logic (Moore - depends only on current state)
	process(yfsm)
	begin
		case yfsm is
			when s0 =>
				current_state <= "0000";  -- s0
				student_id <= "0000";     -- 0

			when s1 =>
				current_state <= "0001";  -- s1
				student_id <= "0001";     -- 1

			when s2 =>
				current_state <= "0010";  -- s2
				student_id <= "0010";     -- 2

			when s3 =>
				current_state <= "0011";  -- s3
				student_id <= "0110";     -- 6

			when s4 =>
				current_state <= "0100";  -- s4
				student_id <= "0011";     -- 3

			when s5 =>
				current_state <= "0101";  -- s5
				student_id <= "1001";     -- 9

			when s6 =>
				current_state <= "0110";  -- s6
				student_id <= "0000";     -- 0

			when s7 =>
				current_state <= "0111";  -- s7
				student_id <= "0000";     -- 0
		end case;
	end process;

end architecture machine;
