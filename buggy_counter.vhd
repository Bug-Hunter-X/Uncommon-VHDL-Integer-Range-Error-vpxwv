```vhdl
entity buggy_counter is
  Port ( clk : in  STD_LOGIC;
         rst : in  STD_LOGIC;
         count : out  INTEGER range 0 to 15); -- Uncommon error: range specified here, not in signal declaration
end entity buggy_counter;

architecture behavioral of buggy_counter is
  signal internal_count : INTEGER := 0; -- Range missing here!
begin
  process (clk, rst)
  begin
    if rst = '1' then
      internal_count <= 0;
    elsif rising_edge(clk) then
      internal_count <= internal_count + 1;
    end if;
  end process;
  count <= internal_count;
end architecture behavioral;
```