----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Chithra Kurup
-- 
-- Create Date: 10/22/2022 08:52:21 AM
-- Design Name: 
-- Module Name: circular_buffer - Behavioral
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

library ieee;
use ieee.std_logic_1164.all;
 
entity circular_buffer is
  generic (
    BUF_WIDTH : natural;
    BUF_DEPTH : integer
  );
  port (
    clk : in std_logic;
    rst : in std_logic;
 
    -- Write port
    wr_en : in std_logic;
    wr_data : in std_logic_vector(BUF_WIDTH - 1 downto 0);
 
    -- Read port
    rd_en : in std_logic;
    rd_valid : out std_logic;
    rd_data : out std_logic_vector(BUF_WIDTH - 1 downto 0);
 
    -- Flags
    empty : out std_logic;
    full : out std_logic
  );
end circular_buffer;
 
architecture rtl of circular_buffer is
 
  type buf_type is array (0 to BUF_DEPTH - 1) of
    std_logic_vector(wr_data'range);
  signal buf : buf_type;
 
  subtype index_type is integer range buf_type'range;
  signal head : index_type;
  signal tail : index_type;
 
  signal empty_i : std_logic;
  signal full_i : std_logic;
  signal fill_count_i : integer range BUF_DEPTH - 1 downto 0;
 
  -- Generating circular index
  procedure increment(signal index : inout index_type) is
  begin
    if index = index_type'high then
      index <= index_type'low;
    else
      index <= index + 1;
    end if;
  end procedure;
 
begin
 
  -- Copy internal signals to output
  empty <= empty_i;
  full <= full_i;
 
  -- Set the flags
  empty_i <= '1' when fill_count_i = 0 else '0';
  full_i <= '1' when fill_count_i >= BUF_DEPTH - 1 else '0';
 
  -- Update the head pointer in write
  PROC_WRITE : process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        head <= 0;
      else
 
        if wr_en = '1' and full_i = '0' then
          increment(head);
        end if;
 
      end if;
    end if;
  end process;
 
  -- Update the tail pointer on read and set valid
  PROC_READ : process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        tail <= 0;
        rd_valid <= '0';
      else
        rd_valid <= '0';
 
        if rd_en = '1' and empty_i = '0' then
          increment(tail);
          rd_valid <= '1';
        end if;
 
      end if;
    end if;
  end process;
 
  -- Write to and read from the BUFFER
  PROC_BUF : process(clk)
  begin
    if rising_edge(clk) then
      buf(head) <= wr_data;
      rd_data <= buf(tail);
    end if;
  end process;
 
  -- Update the fill count
  PROC_COUNT : process(head, tail)
  begin
    if head < tail then
      fill_count_i <= head - tail + BUF_DEPTH;
    else
      fill_count_i <= head - tail;
    end if;
  end process;
 
end architecture;                                                                                                                                                                     