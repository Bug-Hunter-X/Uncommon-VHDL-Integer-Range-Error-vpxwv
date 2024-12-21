```vhdl
entity fixed_counter is
  Port ( clk : in  STD_LOGIC;
         rst : in  STD_LOGIC;
         count : out  INTEGER range 0 to 15);
end entity fixed_counter;

architecture behavioral of fixed_counter is
  signal internal_count : INTEGER range 0 to 15; -- Range specified here!
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