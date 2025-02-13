----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Chithra Kurup
-- 
-- Create Date: 6/6/2023 02:43:13 PM
-- Design Name: 
-- Module Name: TrackBuilder_Common - rtl
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


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
-- use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_MISC.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.tf_pkg.all;
use work.memUtil_pkg.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TrackBuilder_Common is
Generic (
      Seed                : natural := 0;
      NFMPerStubBarrel0   : natural := 0;
      NFMPerStubBarrel    : natural := 0;
      NFMPerStubDisk      : natural := 0;
      NBarrelStubs        : natural := 0;
      NDiskStubs          : natural := 0;
      NTPAR               : natural := 0;
      TPAROffset          : natural := 0
);
Port (
      ap_clk        : in std_logic;
      ap_rst        : in std_logic;
      ap_start      : in std_logic;
      ap_idle       : out std_logic;
      ap_ready      : out std_logic;
      ap_done       : out std_logic;
      bx_V          : in std_logic_vector(2 downto 0);
      bx_o_V        : out std_logic_vector(2 downto 0);
      bx_o_V_ap_vld : out std_logic;
      trackletParameters_0_dataarray_data_V_ce0       : out std_logic;
      trackletParameters_0_dataarray_data_V_address0  : out std_logic_vector(9 downto 0);
      trackletParameters_0_dataarray_data_V_q0        : in std_logic_vector(69 downto 0);
      trackletParameters_1_dataarray_data_V_ce0       : out std_logic;
      trackletParameters_1_dataarray_data_V_address0  : out std_logic_vector(9 downto 0);
      trackletParameters_1_dataarray_data_V_q0        : in std_logic_vector(69 downto 0);
      trackletParameters_2_dataarray_data_V_ce0       : out std_logic;
      trackletParameters_2_dataarray_data_V_address0  : out std_logic_vector(9 downto 0);
      trackletParameters_2_dataarray_data_V_q0        : in std_logic_vector(69 downto 0);
      trackletParameters_3_dataarray_data_V_ce0       : out std_logic;
      trackletParameters_3_dataarray_data_V_address0  : out std_logic_vector(9 downto 0);
      trackletParameters_3_dataarray_data_V_q0        : in std_logic_vector(69 downto 0);
      trackletParameters_4_dataarray_data_V_ce0       : out std_logic;
      trackletParameters_4_dataarray_data_V_address0  : out std_logic_vector(9 downto 0);
      trackletParameters_4_dataarray_data_V_q0        : in std_logic_vector(69 downto 0);
      trackletParameters_5_dataarray_data_V_ce0       : out std_logic;
      trackletParameters_5_dataarray_data_V_address0  : out std_logic_vector(9 downto 0);
      trackletParameters_5_dataarray_data_V_q0        : in std_logic_vector(69 downto 0);
      trackletParameters_6_dataarray_data_V_ce0       : out std_logic;
      trackletParameters_6_dataarray_data_V_address0  : out std_logic_vector(9 downto 0);
      trackletParameters_6_dataarray_data_V_q0        : in std_logic_vector(69 downto 0);
      trackletParameters_7_dataarray_data_V_ce0       : out std_logic;
      trackletParameters_7_dataarray_data_V_address0  : out std_logic_vector(9 downto 0);
      trackletParameters_7_dataarray_data_V_q0        : in std_logic_vector(69 downto 0);
      trackletParameters_8_dataarray_data_V_ce0       : out std_logic;
      trackletParameters_8_dataarray_data_V_address0  : out std_logic_vector(9 downto 0);
      trackletParameters_8_dataarray_data_V_q0        : in std_logic_vector(69 downto 0);
      trackletParameters_9_dataarray_data_V_ce0       : out std_logic;
      trackletParameters_9_dataarray_data_V_address0  : out std_logic_vector(9 downto 0);
      trackletParameters_9_dataarray_data_V_q0        : in std_logic_vector(69 downto 0);
      trackletParameters_10_dataarray_data_V_ce0      : out std_logic;
      trackletParameters_10_dataarray_data_V_address0 : out std_logic_vector(9 downto 0);
      trackletParameters_10_dataarray_data_V_q0       : in std_logic_vector(69 downto 0);
      trackletParameters_11_dataarray_data_V_ce0      : out std_logic;
      trackletParameters_11_dataarray_data_V_address0 : out std_logic_vector(9 downto 0);
      trackletParameters_11_dataarray_data_V_q0       : in std_logic_vector(69 downto 0);
      barrelFullMatches_0_dataarray_data_V_ce0        : out std_logic;
      barrelFullMatches_0_dataarray_data_V_address0   : out std_logic_vector(7 downto 0);
      barrelFullMatches_0_dataarray_data_V_q0         : in std_logic_vector(51 downto 0);
      barrelFullMatches_0_nentries_0_V                : in std_logic_vector(6 downto 0);
      barrelFullMatches_0_nentries_1_V                : in std_logic_vector(6 downto 0);
      barrelFullMatches_1_dataarray_data_V_ce0        : out std_logic;
      barrelFullMatches_1_dataarray_data_V_address0   : out std_logic_vector(7 downto 0);
      barrelFullMatches_1_dataarray_data_V_q0         : in std_logic_vector(51 downto 0);
      barrelFullMatches_1_nentries_0_V                : in std_logic_vector(6 downto 0);
      barrelFullMatches_1_nentries_1_V                : in std_logic_vector(6 downto 0);
      barrelFullMatches_2_dataarray_data_V_ce0        : out std_logic;
      barrelFullMatches_2_dataarray_data_V_address0   : out std_logic_vector(7 downto 0);
      barrelFullMatches_2_dataarray_data_V_q0         : in std_logic_vector(51 downto 0);
      barrelFullMatches_2_nentries_0_V                : in std_logic_vector(6 downto 0);
      barrelFullMatches_2_nentries_1_V                : in std_logic_vector(6 downto 0);
      barrelFullMatches_3_dataarray_data_V_ce0        : out std_logic;
      barrelFullMatches_3_dataarray_data_V_address0   : out std_logic_vector(7 downto 0);
      barrelFullMatches_3_dataarray_data_V_q0         : in std_logic_vector(51 downto 0);
      barrelFullMatches_3_nentries_0_V                : in std_logic_vector(6 downto 0);
      barrelFullMatches_3_nentries_1_V                : in std_logic_vector(6 downto 0);
      barrelFullMatches_4_dataarray_data_V_ce0        : out std_logic;
      barrelFullMatches_4_dataarray_data_V_address0   : out std_logic_vector(7 downto 0);
      barrelFullMatches_4_dataarray_data_V_q0         : in std_logic_vector(51 downto 0);
      barrelFullMatches_4_nentries_0_V                : in std_logic_vector(6 downto 0);
      barrelFullMatches_4_nentries_1_V                : in std_logic_vector(6 downto 0);
      barrelFullMatches_5_dataarray_data_V_ce0        : out std_logic;
      barrelFullMatches_5_dataarray_data_V_address0   : out std_logic_vector(7 downto 0);
      barrelFullMatches_5_dataarray_data_V_q0         : in std_logic_vector(51 downto 0);
      barrelFullMatches_5_nentries_0_V                : in std_logic_vector(6 downto 0);
      barrelFullMatches_5_nentries_1_V                : in std_logic_vector(6 downto 0);
      barrelFullMatches_6_dataarray_data_V_ce0        : out std_logic;
      barrelFullMatches_6_dataarray_data_V_address0   : out std_logic_vector(7 downto 0);
      barrelFullMatches_6_dataarray_data_V_q0         : in std_logic_vector(51 downto 0);
      barrelFullMatches_6_nentries_0_V                : in std_logic_vector(6 downto 0);
      barrelFullMatches_6_nentries_1_V                : in std_logic_vector(6 downto 0);
      barrelFullMatches_7_dataarray_data_V_ce0        : out std_logic;
      barrelFullMatches_7_dataarray_data_V_address0   : out std_logic_vector(7 downto 0);
      barrelFullMatches_7_dataarray_data_V_q0         : in std_logic_vector(51 downto 0);
      barrelFullMatches_7_nentries_0_V                : in std_logic_vector(6 downto 0);
      barrelFullMatches_7_nentries_1_V                : in std_logic_vector(6 downto 0);
      barrelFullMatches_8_dataarray_data_V_ce0        : out std_logic;
      barrelFullMatches_8_dataarray_data_V_address0   : out std_logic_vector(7 downto 0);
      barrelFullMatches_8_dataarray_data_V_q0         : in std_logic_vector(51 downto 0);
      barrelFullMatches_8_nentries_0_V                : in std_logic_vector(6 downto 0);
      barrelFullMatches_8_nentries_1_V                : in std_logic_vector(6 downto 0);
      barrelFullMatches_9_dataarray_data_V_ce0        : out std_logic;
      barrelFullMatches_9_dataarray_data_V_address0   : out std_logic_vector(7 downto 0);
      barrelFullMatches_9_dataarray_data_V_q0         : in std_logic_vector(51 downto 0);
      barrelFullMatches_9_nentries_0_V                : in std_logic_vector(6 downto 0);
      barrelFullMatches_9_nentries_1_V                : in std_logic_vector(6 downto 0);
      barrelFullMatches_10_dataarray_data_V_ce0       : out std_logic;
      barrelFullMatches_10_dataarray_data_V_address0  : out std_logic_vector(7 downto 0);
      barrelFullMatches_10_dataarray_data_V_q0        : in std_logic_vector(51 downto 0);
      barrelFullMatches_10_nentries_0_V               : in std_logic_vector(6 downto 0);
      barrelFullMatches_10_nentries_1_V               : in std_logic_vector(6 downto 0);
      barrelFullMatches_11_dataarray_data_V_ce0       : out std_logic;
      barrelFullMatches_11_dataarray_data_V_address0  : out std_logic_vector(7 downto 0);
      barrelFullMatches_11_dataarray_data_V_q0        : in std_logic_vector(51 downto 0);
      barrelFullMatches_11_nentries_0_V               : in std_logic_vector(6 downto 0);
      barrelFullMatches_11_nentries_1_V               : in std_logic_vector(6 downto 0);
      barrelFullMatches_12_dataarray_data_V_ce0       : out std_logic;
      barrelFullMatches_12_dataarray_data_V_address0  : out std_logic_vector(7 downto 0);
      barrelFullMatches_12_dataarray_data_V_q0        : in std_logic_vector(51 downto 0);
      barrelFullMatches_12_nentries_0_V               : in std_logic_vector(6 downto 0);
      barrelFullMatches_12_nentries_1_V               : in std_logic_vector(6 downto 0);
      barrelFullMatches_13_dataarray_data_V_ce0       : out std_logic;
      barrelFullMatches_13_dataarray_data_V_address0  : out std_logic_vector(7 downto 0);
      barrelFullMatches_13_dataarray_data_V_q0        : in std_logic_vector(51 downto 0);
      barrelFullMatches_13_nentries_0_V               : in std_logic_vector(6 downto 0);
      barrelFullMatches_13_nentries_1_V               : in std_logic_vector(6 downto 0);
      barrelFullMatches_14_dataarray_data_V_ce0       : out std_logic;
      barrelFullMatches_14_dataarray_data_V_address0  : out std_logic_vector(7 downto 0);
      barrelFullMatches_14_dataarray_data_V_q0        : in std_logic_vector(51 downto 0);
      barrelFullMatches_14_nentries_0_V               : in std_logic_vector(6 downto 0);
      barrelFullMatches_14_nentries_1_V               : in std_logic_vector(6 downto 0);
      barrelFullMatches_15_dataarray_data_V_ce0       : out std_logic;
      barrelFullMatches_15_dataarray_data_V_address0  : out std_logic_vector(7 downto 0);
      barrelFullMatches_15_dataarray_data_V_q0        : in std_logic_vector(51 downto 0);
      barrelFullMatches_15_nentries_0_V               : in std_logic_vector(6 downto 0);
      barrelFullMatches_15_nentries_1_V               : in std_logic_vector(6 downto 0);
      barrelFullMatches_16_dataarray_data_V_ce0       : out std_logic;
      barrelFullMatches_16_dataarray_data_V_address0  : out std_logic_vector(7 downto 0);
      barrelFullMatches_16_dataarray_data_V_q0        : in std_logic_vector(51 downto 0);
      barrelFullMatches_16_nentries_0_V               : in std_logic_vector(6 downto 0);
      barrelFullMatches_16_nentries_1_V               : in std_logic_vector(6 downto 0);
      barrelFullMatches_17_dataarray_data_V_ce0       : out std_logic;
      barrelFullMatches_17_dataarray_data_V_address0  : out std_logic_vector(7 downto 0);
      barrelFullMatches_17_dataarray_data_V_q0        : in std_logic_vector(51 downto 0);
      barrelFullMatches_17_nentries_0_V               : in std_logic_vector(6 downto 0);
      barrelFullMatches_17_nentries_1_V               : in std_logic_vector(6 downto 0);
      barrelFullMatches_18_dataarray_data_V_ce0       : out std_logic;
      barrelFullMatches_18_dataarray_data_V_address0  : out std_logic_vector(7 downto 0);
      barrelFullMatches_18_dataarray_data_V_q0        : in std_logic_vector(51 downto 0);
      barrelFullMatches_18_nentries_0_V               : in std_logic_vector(6 downto 0);
      barrelFullMatches_18_nentries_1_V               : in std_logic_vector(6 downto 0);
      barrelFullMatches_19_dataarray_data_V_ce0       : out std_logic;
      barrelFullMatches_19_dataarray_data_V_address0  : out std_logic_vector(7 downto 0);
      barrelFullMatches_19_dataarray_data_V_q0        : in std_logic_vector(51 downto 0);
      barrelFullMatches_19_nentries_0_V               : in std_logic_vector(6 downto 0);
      barrelFullMatches_19_nentries_1_V               : in std_logic_vector(6 downto 0);
      trackWord_V_din               : out std_logic_vector(83 downto 0);
      trackWord_V_full_n            : in std_logic;
      trackWord_V_write             : out std_logic;
      barrelStubWords_0_V_din       : out std_logic_vector(45 downto 0);
      barrelStubWords_0_V_full_n    : in std_logic;
      barrelStubWords_0_V_write     : out std_logic;
      barrelStubWords_1_V_din       : out std_logic_vector(45 downto 0); 
      barrelStubWords_1_V_full_n    : in std_logic;
      barrelStubWords_1_V_write     : out std_logic;
      barrelStubWords_2_V_din       : out std_logic_vector(45 downto 0);
      barrelStubWords_2_V_full_n    : in std_logic;
      barrelStubWords_2_V_write     : out std_logic;
      barrelStubWords_3_V_din       : out std_logic_vector(45 downto 0);
      barrelStubWords_3_V_full_n    : in std_logic;
      barrelStubWords_3_V_write     : out std_logic
  );
end TrackBuilder_Common;

architecture rtl of TrackBuilder_Common is   
 
constant kNBitsTBBuffer            : natural := 1;
constant kMinNMatches              : natural := 2;
constant kNBitsTCID                : natural := 7;
constant kNBitsITC                 : natural := 4;
constant kNBits_MemAddr            : natural := 7;
constant kNBitsTrackletID          : natural := kNBitsTCID + kNBits_MemAddr;
constant kNBits_BX                 : natural := 3;
constant kTMUX                     : natural := 18;   --For hourglass project
constant kMaxProc                  : natural := kTMUX * 6;  
constant NFMBarrel                 : natural := NFMPerStubBarrel0 + (NBarrelStubs - 1) * NFMPerStubBarrel;
constant NFMDisk                   : natural := NDiskStubs * NFMPerStubDisk;
constant buffer_width              : natural := 52;
constant buffer_depth_const        : unsigned(1 downto 0) := "01";
--constant buffer_depth              : integer := 2;
constant buffer_depth              : integer := to_integer(shift_left(buffer_depth_const, kNBitsTBBuffer));
subtype TCIDType is std_logic_vector(kNBitsTCID-1 downto 0);
--signal TCID                        : TCIDType := (others => '0');
subtype IndexType is std_logic_vector(kNBits_MemAddr-1 downto 0);
--signal nTracks                     : IndexType := (others => '0');
--signal trackletIndex               : IndexType := (others => '0');
subtype TrackletIDType is std_logic_vector(kNBitsTrackletID-1 downto 0);
--signal TrackletID                  : TrackletIDType := (others => '0');
constant kInvalidTrackletID        : TrackletIDType := std_logic_vector(to_unsigned(16#3FFF#,TrackletIDType'length));
-- constant kInvalidTrackletID        : std_logic_vector(kNBitsTrackletID-1 downto 0) := X"3FFF";
signal min_id_d                    : TrackletIDType := kInvalidTrackletID;
signal barrel_min_id               : TrackletIDType := kInvalidTrackletID;
signal disk_min_id                 : TrackletIDType := kInvalidTrackletID;
subtype BXType is std_logic_vector(kNBits_BX-1 downto 0);
signal reg_bx_V                    : BXType := (others => '0');
-- List of regions for memory template parameters
type region_type is (BARRELPS, BARREL2S, BARRELOL, BARREL, DISKPS, DISK2S, DISK, BARREL_FOR_MC, DISK_FOR_MC);
signal RegionType                  : region_type := BARRELPS;
-- Read and write indices for the circular buffers 
type   barrel_mem_index_type is array (0 to NFMBarrel-1) of std_logic_vector(kNBits_MemAddr-1 downto 0);                                                         
signal barrel_mem_index_d          : barrel_mem_index_type := (others =>(others =>'0'));
type   disk_mem_index_type is array (0 to NFMDisk-1) of std_logic_vector(kNBits_MemAddr-1 downto 0);                                                         
signal disk_mem_index              : disk_mem_index_type := (others =>(others =>'0'));   
type   barrel_read_index_type is array (0 to NFMBarrel-1) of std_logic_vector(kNBitsTBBuffer-1 downto 0);                                                         
signal barrel_read_index           : barrel_read_index_type := (others =>(others =>'0'));   
type   disk_read_index_type is array (0 to NFMDisk-1) of std_logic_vector(kNBitsTBBuffer-1 downto 0);                                                         
signal disk_read_index             : disk_read_index_type := (others =>(others =>'0'));   
type   barrel_write_index_type is array (0 to NFMBarrel-1) of std_logic_vector(kNBitsTBBuffer-1 downto 0);                                                         
signal barrel_write_index          : barrel_write_index_type := (others =>(others =>'0'));   
type   disk_write_index_type is array (0 to NFMDisk-1) of std_logic_vector(kNBitsTBBuffer-1 downto 0);                                                         
signal disk_write_index            : disk_write_index_type := (others =>(others =>'0'));
-- signal empty                       : std_logic := '0';
signal barrel_valid_d              : std_logic_vector(NFMBarrel-1 downto 0) := (others => '0');
signal disk_valid                  : std_logic_vector(NFMDisk-1 downto 0) := (others => '0');

signal barrel_buf_wr_en_array      : std_logic_vector(NFMBarrel-1 downto 0) := (others => '0');
signal disk_buf_wr_en_array        : std_logic_vector(NFMDisk-1 downto 0) := (others => '0');
type   barrel_buf_wr_data_type is array (0 to NFMBarrel-1) of std_logic_vector(buffer_width - 1 downto 0);                                                        
signal barrel_buf_wr_data_array    : barrel_buf_wr_data_type := (others =>(others =>'0'));
type   disk_buf_wr_data_type is array (0 to NFMDisk-1) of std_logic_vector(buffer_width - 1 downto 0);                                                        
signal disk_buf_wr_data_array      : disk_buf_wr_data_type := (others =>(others =>'0'));
signal barrel_buf_rd_en_array      : std_logic_vector(NFMBarrel-1 downto 0) := (others => '0');
signal disk_buf_rd_en_array        : std_logic_vector(NFMDisk-1 downto 0) := (others => '0');
signal barrel_buf_rd_valid_array   : std_logic_vector(NFMBarrel-1 downto 0) := (others => '0');
signal disk_buf_rd_valid_array     : std_logic_vector(NFMDisk-1 downto 0) := (others => '0');
type   barrel_buf_rd_data_type is array (0 to NFMBarrel-1) of std_logic_vector(buffer_width - 1 downto 0);                                                        
signal barrel_buf_rd_data_array    : barrel_buf_rd_data_type := (others =>(others =>'0'));
type   disk_buf_rd_data_type is array (0 to NFMDisk-1) of std_logic_vector(buffer_width - 1 downto 0);                                                        
signal disk_buf_rd_data_array      : disk_buf_rd_data_type := (others =>(others =>'0'));
signal barrel_buf_empty_array      : std_logic_vector(NFMBarrel-1 downto 0) := (others => '0');
signal disk_buf_empty_array        : std_logic_vector(NFMDisk-1 downto 0) := (others => '0');
signal barrel_buf_full_array       : std_logic_vector(NFMBarrel-1 downto 0) := (others => '0');
signal disk_buf_full_array         : std_logic_vector(NFMDisk-1 downto 0) := (others => '0');
type t_arr_FM_52_DATA_array is array (0 to NFMBarrel-1) of std_logic_vector(51 downto 0);
signal FM_52_DATA_inputs_d         : t_arr_FM_52_DATA_array := (others =>(others =>'0'));
type t_arr_FM_52_ADDR_array is array (0 to NFMBarrel-1) of std_logic_vector(7 downto 0);
signal FM_52_ADDR_outputs          : t_arr_FM_52_ADDR_array := (others =>(others =>'0'));
type t_arr_FM_52_NENT_array is array (0 to NFMBarrel-1) of std_logic_vector(6 downto 0);
signal FM_52_NENT_0_inputs_d         : t_arr_FM_52_NENT_array := (others =>(others =>'0'));
signal FM_52_NENT_1_inputs_d         : t_arr_FM_52_NENT_array := (others =>(others =>'0'));
signal FM_52_NENT_inputs_d           : t_arr_FM_52_NENT_array := (others =>(others =>'0'));

signal barrel_stub_0_d              : std_logic_vector(buffer_width - 1 downto 0) := (others => '0'); 
signal barrel_stub_1_d              : std_logic_vector(buffer_width - 1 downto 0) := (others => '0');
signal barrel_stub_d                : std_logic_vector(buffer_width - 1 downto 0) := (others => '0'); 
signal barrel_stub_index_d          : std_logic_vector(9 downto 0) := (others => '0');
signal barrel_stub_r_d              : std_logic_vector(6 downto 0) := (others => '0');
signal barrel_phi_res_d             : std_logic_vector(11 downto 0) := (others => '0');
signal barrel_z_res_d               : std_logic_vector(8 downto 0) := (others => '0');
signal barrel_id_0_d                : TrackletIDType := (others => '0'); 
signal barrel_id_1_d                : TrackletIDType := (others => '0');
-- wait fsm state
type wait_fsm_state_type is (Idle, WaitMemory, WaitMemory2, DataReady);
signal wait_fsm_state              : wait_fsm_state_type := Idle;  
signal num_barrel                  : natural := 0;
signal invalid_data_array_d          : std_logic_vector(NFMBarrel-1 downto 0) := (others => '0');
signal done_fm_data_collection_d     : std_logic := '0';
--signal tpar_num                    : natural := 0;
-- NFMPerStubBarrel won't work for seed L1L2
type t_arr_TPAR_70_ADDR_array is array (0 to NTPAR-1) of std_logic_vector(9 downto 0);
signal TPAR_70_ADDR_outputs          : t_arr_TPAR_70_ADDR_array := (others =>(others =>'0'));
type t_arr_TPAR_70_DATA_array is array (0 to NTPAR-1) of std_logic_vector(69 downto 0);
signal TPAR_70_DATA_inputs_d         : t_arr_TPAR_70_DATA_array := (others =>(others =>'0'));
signal nMatches_d                    : std_logic_vector(2 downto 0) := (others => '0'); 
--signal nFM                         : natural := 0;
--signal nFMCumulative               : natural := 0;
-- maximum function doesn't work for sim
-- subtype nFM_range is natural range 0 to maximum(NFMPerStubBarrel, NFMPerStubBarrel0);
subtype nFM_range is natural range 0 to NFMPerStubBarrel0;
signal barrel_stub_valid_d           : std_logic := '0';
--signal i_mem                       : natural := 0;
--signal i_fm                        : natural := 0;
signal index_events_d                : natural := 0;
signal index_getFM                   : natural := 0;
signal index_barrel_stub_association : natural := 0;

type barrel_stub_mem is
record
    StubValid        : std_logic;
    StubIndex        : std_logic_vector(9 downto 0);
    StubR            : std_logic_vector(6 downto 0);
    PhiRes           : std_logic_vector(11 downto 0); 
    ZRes             : std_logic_vector(8 downto 0);  
    TrackIndex       : std_logic_vector(6 downto 0); 
end record; 
type barrel_stub_mem_array is array ( 0 to 7 ) of barrel_stub_mem;
type trackfit_mem is
record
    TFSEEDTYPE        : std_logic_vector(2 downto 0);
    Rinv              : std_logic_vector(13 downto 0);
    Phi0              : std_logic_vector(17 downto 0);
    Z0                : std_logic_vector(9 downto 0); 
    T                 : std_logic_vector(13 downto 0);
    barrel_stub_mems  : barrel_stub_mem_array;  
    TrackValid        : std_logic;
end record; 
signal trackFit_data_d             : trackfit_mem := (TFSEEDTYPE => (others => '0'), Rinv => (others => '0'), Phi0 => (others => '0'), Z0 => (others => '0'), T => (others => '0'), barrel_stub_mems => (others =>(StubValid => '0', StubIndex => (others => '0'), StubR => (others => '0'), PhiRes => (others => '0'), ZRes => (others => '0'), TrackIndex => (others => '0'))), TrackValid => '0');
signal tpar_write_addr_done        : std_logic := '0';
signal tpar_data_ready             : std_logic := '0';
signal barrel_fm_write_addr_done   : std_logic := '0';
signal barrel_fm_data_ready        : std_logic := '0';
constant DELAY                     : natural   := 3;
type t_arr_TCID is array (0 to DELAY-1) of TCIDType;
type t_arr_tpar_num is array (0 to DELAY-1) of natural;
signal TCID_array                  : t_arr_TCID := (others =>(others =>'0'));
signal tpar_num_array              : t_arr_tpar_num := (others =>(0));

begin
bx_o_V  <= reg_bx_V;
trackletParameters_0_dataarray_data_V_address0  <= TPAR_70_ADDR_outputs(0);
trackletParameters_1_dataarray_data_V_address0  <= TPAR_70_ADDR_outputs(1);
trackletParameters_2_dataarray_data_V_address0  <= TPAR_70_ADDR_outputs(2);
trackletParameters_3_dataarray_data_V_address0  <= TPAR_70_ADDR_outputs(3);
trackletParameters_4_dataarray_data_V_address0  <= TPAR_70_ADDR_outputs(4) when Seed = 0;
trackletParameters_5_dataarray_data_V_address0  <= TPAR_70_ADDR_outputs(5) when Seed = 0;
trackletParameters_6_dataarray_data_V_address0  <= TPAR_70_ADDR_outputs(6) when Seed = 0;
trackletParameters_7_dataarray_data_V_address0  <= TPAR_70_ADDR_outputs(7) when Seed = 0;
trackletParameters_8_dataarray_data_V_address0  <= TPAR_70_ADDR_outputs(8) when Seed = 0;
trackletParameters_9_dataarray_data_V_address0  <= TPAR_70_ADDR_outputs(9) when Seed = 0;
trackletParameters_10_dataarray_data_V_address0 <= TPAR_70_ADDR_outputs(10) when Seed = 0;
trackletParameters_11_dataarray_data_V_address0 <= TPAR_70_ADDR_outputs(11) when Seed = 0;
barrelFullMatches_0_dataarray_data_V_address0   <= FM_52_ADDR_outputs(0);
barrelFullMatches_1_dataarray_data_V_address0   <= FM_52_ADDR_outputs(1);
barrelFullMatches_2_dataarray_data_V_address0   <= FM_52_ADDR_outputs(2);
barrelFullMatches_3_dataarray_data_V_address0   <= FM_52_ADDR_outputs(3);
barrelFullMatches_4_dataarray_data_V_address0   <= FM_52_ADDR_outputs(4);
barrelFullMatches_5_dataarray_data_V_address0   <= FM_52_ADDR_outputs(5);
barrelFullMatches_6_dataarray_data_V_address0   <= FM_52_ADDR_outputs(6);
barrelFullMatches_7_dataarray_data_V_address0   <= FM_52_ADDR_outputs(7);
barrelFullMatches_8_dataarray_data_V_address0   <= FM_52_ADDR_outputs(8);
barrelFullMatches_9_dataarray_data_V_address0   <= FM_52_ADDR_outputs(9);
barrelFullMatches_10_dataarray_data_V_address0  <= FM_52_ADDR_outputs(10);
barrelFullMatches_11_dataarray_data_V_address0  <= FM_52_ADDR_outputs(11);
barrelFullMatches_12_dataarray_data_V_address0  <= FM_52_ADDR_outputs(12);
barrelFullMatches_13_dataarray_data_V_address0  <= FM_52_ADDR_outputs(13);
barrelFullMatches_14_dataarray_data_V_address0  <= FM_52_ADDR_outputs(14);
barrelFullMatches_15_dataarray_data_V_address0  <= FM_52_ADDR_outputs(15);
barrelFullMatches_16_dataarray_data_V_address0  <= FM_52_ADDR_outputs(16) when Seed = 2 or Seed = 3;
barrelFullMatches_17_dataarray_data_V_address0  <= FM_52_ADDR_outputs(17) when Seed = 2 or Seed = 3;
barrelFullMatches_18_dataarray_data_V_address0  <= FM_52_ADDR_outputs(18) when Seed = 2 or Seed = 3;
barrelFullMatches_19_dataarray_data_V_address0  <= FM_52_ADDR_outputs(19) when Seed = 2 or Seed = 3;
ap_idle   <= '0';
ap_ready  <= '0';
trackletParameters_0_dataarray_data_V_ce0  <= '1';
trackletParameters_1_dataarray_data_V_ce0  <= '1';
trackletParameters_2_dataarray_data_V_ce0  <= '1';
trackletParameters_3_dataarray_data_V_ce0  <= '1';
trackletParameters_4_dataarray_data_V_ce0  <= '1' when Seed = 0;
trackletParameters_5_dataarray_data_V_ce0  <= '1' when Seed = 0;
trackletParameters_6_dataarray_data_V_ce0  <= '1' when Seed = 0;
trackletParameters_7_dataarray_data_V_ce0  <= '1' when Seed = 0;
trackletParameters_8_dataarray_data_V_ce0  <= '1' when Seed = 0;
trackletParameters_9_dataarray_data_V_ce0  <= '1' when Seed = 0;
trackletParameters_10_dataarray_data_V_ce0 <= '1' when Seed = 0;
trackletParameters_11_dataarray_data_V_ce0 <= '1' when Seed = 0;
barrelFullMatches_0_dataarray_data_V_ce0   <= '1';
barrelFullMatches_1_dataarray_data_V_ce0   <= '1';
barrelFullMatches_2_dataarray_data_V_ce0   <= '1';
barrelFullMatches_3_dataarray_data_V_ce0   <= '1';
barrelFullMatches_4_dataarray_data_V_ce0   <= '1';
barrelFullMatches_5_dataarray_data_V_ce0   <= '1';
barrelFullMatches_6_dataarray_data_V_ce0   <= '1';
barrelFullMatches_7_dataarray_data_V_ce0   <= '1';
barrelFullMatches_8_dataarray_data_V_ce0   <= '1';
barrelFullMatches_9_dataarray_data_V_ce0   <= '1';
barrelFullMatches_10_dataarray_data_V_ce0  <= '1';
barrelFullMatches_11_dataarray_data_V_ce0  <= '1';
barrelFullMatches_12_dataarray_data_V_ce0  <= '1';
barrelFullMatches_13_dataarray_data_V_ce0  <= '1';
barrelFullMatches_14_dataarray_data_V_ce0  <= '1';
barrelFullMatches_15_dataarray_data_V_ce0  <= '1';
barrelFullMatches_16_dataarray_data_V_ce0  <= '1' when Seed = 2 or Seed = 3;
barrelFullMatches_17_dataarray_data_V_ce0  <= '1' when Seed = 2 or Seed = 3;
barrelFullMatches_18_dataarray_data_V_ce0  <= '1' when Seed = 2 or Seed = 3;
barrelFullMatches_19_dataarray_data_V_ce0  <= '1' when Seed = 2 or Seed = 3;

--=============================--
-- Circular Buffer Insts
--=============================--
barrel_fm_buffers : for index in 0 to NFMBarrel-1 generate
  barrel_circular_buffer_inst : entity work.circular_buffer
  generic map (
      BUF_WIDTH => buffer_width,
      BUF_DEPTH => buffer_depth -- 1 sll kNBitsTBBuffer
  )
  port map (
      clk => ap_clk,
      rst => ap_rst,
      wr_en => barrel_buf_wr_en_array (index),
      wr_data => barrel_buf_wr_data_array (index),
      rd_en => barrel_buf_rd_en_array (index),
      rd_valid => barrel_buf_rd_valid_array (index),
      rd_data => barrel_buf_rd_data_array (index),
      empty => barrel_buf_empty_array (index),
      full => barrel_buf_full_array (index)
  );
end generate barrel_fm_buffers;
  
disk_fm_buffers : for index in 0 to NFMDisk-1 generate  
  disk_circular_buffer_inst : entity work.circular_buffer
  generic map (
      BUF_WIDTH => buffer_width,
      BUF_DEPTH => buffer_depth -- 1 sll kNBitsTBBuffer
  )
  port map (
      clk => ap_clk,
      rst => ap_rst,
      wr_en => disk_buf_wr_en_array (index),
      wr_data => disk_buf_wr_data_array (index),
      rd_en => disk_buf_rd_en_array (index),
      rd_valid => disk_buf_rd_valid_array (index),
      rd_data => disk_buf_rd_data_array (index),
      empty => disk_buf_empty_array (index),
      full => disk_buf_full_array (index)
  );
end generate disk_fm_buffers;   

--=============================--
-- Wait process to fetch data from memory -- 
--=============================--  
wait_process : process( ap_clk ) 
begin 
  if rising_edge(ap_clk) then 
      if ap_rst = '1' then 
         wait_fsm_state <= Idle;
         barrel_fm_data_ready <= '0';
         tpar_data_ready <= '0';
      else
        case wait_fsm_state is
          when Idle =>
            barrel_fm_data_ready <= '0';
            tpar_data_ready <= '0';
            if barrel_fm_write_addr_done = '1' or tpar_write_addr_done = '1' then
              wait_fsm_state <= WaitMemory;
            end if;
          when WaitMemory =>
            wait_fsm_state <= WaitMemory2;
          when WaitMemory2 =>
            -- It takes 2 clock cycles for the data to appear
            wait_fsm_state <= DataReady;
          when DataReady =>
            if barrel_fm_write_addr_done = '1' then
              barrel_fm_data_ready <= '1';
            end if;
            if tpar_write_addr_done = '1' then
              tpar_data_ready <= '1';
            end if;
            wait_fsm_state <= Idle;
          when others => 
            wait_fsm_state <= Idle; 
       end case;
     end if;  
  end if; 
end process;                      

--=============================--
-- Main process -- 
--=============================--
main_proc : process( ap_clk ) 
  variable empty                       : std_logic := '0';
  variable trackFit_data               : trackfit_mem := (TFSEEDTYPE => (others => '0'), Rinv => (others => '0'), Phi0 => (others => '0'), Z0 => (others => '0'), T => (others => '0'), barrel_stub_mems => (others =>(StubValid => '0', StubIndex => (others => '0'), StubR => (others => '0'), PhiRes => (others => '0'), ZRes => (others => '0'), TrackIndex => (others => '0'))), TrackValid => '0');
  variable FM_52_DATA_inputs           : t_arr_FM_52_DATA_array := (others =>(others =>'0'));
  variable FM_52_NENT_0_inputs         : t_arr_FM_52_NENT_array := (others =>(others =>'0'));
  variable FM_52_NENT_1_inputs         : t_arr_FM_52_NENT_array := (others =>(others =>'0'));
  variable TPAR_70_DATA_inputs         : t_arr_TPAR_70_DATA_array := (others =>(others =>'0'));
  variable done_fm_data_collection     : std_logic := '0';
  variable barrel_stub_0               : std_logic_vector(buffer_width - 1 downto 0) := (others => '0'); 
  variable barrel_id_0                 : TrackletIDType := (others => '0');
  variable barrel_valid                : std_logic_vector(NFMBarrel-1 downto 0) := (others => '0');
  variable barrel_stub_1               : std_logic_vector(buffer_width - 1 downto 0) := (others => '0');
  variable barrel_id_1                 : TrackletIDType := (others => '0');
  variable min_id                      : TrackletIDType := kInvalidTrackletID;
  variable TCID                        : TCIDType := (others => '0');
  variable TrackletID                  : TrackletIDType := (others => '0');
  variable trackletIndex               : IndexType := (others => '0');
  variable tpar_num                    : natural := 0;
  variable nMatches                    : std_logic_vector(2 downto 0) := (others => '0'); 
  variable nFM                         : natural := 0;
  variable nFMCumulative               : natural := 0;
  variable barrel_stub_valid           : std_logic := '0';
  variable i_mem                       : natural := 0;
  variable i_fm                        : natural := 0;
  variable barrel_stub                 : std_logic_vector(buffer_width - 1 downto 0) := (others => '0'); 
  variable barrel_stub_index           : std_logic_vector(9 downto 0) := (others => '0');
  variable barrel_stub_r               : std_logic_vector(6 downto 0) := (others => '0');
  variable barrel_phi_res              : std_logic_vector(11 downto 0) := (others => '0');
  variable barrel_z_res                : std_logic_vector(8 downto 0) := (others => '0');
  variable nTracks                     : IndexType := (others => '0');
  variable FM_52_NENT_inputs           : t_arr_FM_52_NENT_array := (others =>(others =>'0'));
  variable invalid_data_array          : std_logic_vector(NFMBarrel-1 downto 0) := (others => '0');
  variable barrel_mem_index            : barrel_mem_index_type := (others =>(others =>'0'));
  variable index_events                : natural := 0;
  --variable TCID_array                  : t_arr_TCID := (others =>(others =>'0'));
  --variable tpar_num_array              : t_arr_tpar_num := (others =>(0));
begin
  if rising_edge(ap_clk) then
    if ap_rst = '1' then 
      empty                     := '0';
      reg_bx_V                  <= (others =>'0');
      tpar_write_addr_done      <= '0';  
      barrel_fm_write_addr_done <= '0';
      done_fm_data_collection   := '0';
      barrel_buf_wr_data_array  <= (others =>(others =>'0'));
      barrel_buf_wr_en_array    <= (others =>'0');
      barrel_buf_rd_en_array    <= (others =>'0');
      trackFit_data             := (TFSEEDTYPE => (others => '0'), Rinv => (others => '0'), Phi0 => (others => '0'), Z0 => (others => '0'), T => (others => '0'), barrel_stub_mems => (others =>(StubValid => '0', StubIndex => (others => '0'), StubR => (others => '0'), PhiRes => (others => '0'), ZRes => (others => '0'), TrackIndex => (others => '0'))), TrackValid => '0');
      invalid_data_array        := (others =>'0');
      index_events              := 0;
      bx_o_V_ap_vld             <= '0';
      ap_done                   <= '0';  
      barrel_valid              := (others =>'0');
      trackWord_V_din <= (others => '0'); 
      barrelStubWords_0_V_din <= (others =>'0');
      barrelStubWords_1_V_din <= (others =>'0');
      barrelStubWords_2_V_din <= (others =>'0');
      barrelStubWords_3_V_din <= (others =>'0');
      trackWord_V_write         <= '0';
      barrelStubWords_0_V_write <= '0';
      barrelStubWords_1_V_write <= '0';
      barrelStubWords_2_V_write <= '0';
      barrelStubWords_3_V_write <= '0';
    else 
      if ap_start = '1' then
          --reg_bx_V  <= bx_V;
          -- Initializing for every set of events (108 cycles)
          bx_o_V_ap_vld <= '0';
          ap_done <= '0';  
          if index_events < kMaxProc then
            if index_events = 0 then 
              empty := '1';
            else
              empty := '0';
            end if;
            -- Initializing for every event
--            barrel_buf_wr_en_array    <= (others =>'0');
--            barrel_buf_rd_en_array    <= (others =>'0');
--            barrel_valid              <= (others =>'0');
            trackWord_V_write         <= '0';
            barrelStubWords_0_V_write <= '0';
            barrelStubWords_1_V_write <= '0';
            barrelStubWords_2_V_write <= '0';
            barrelStubWords_3_V_write <= '0';
            trackFit_data             := (TFSEEDTYPE => (others => '0'), Rinv => (others => '0'), Phi0 => (others => '0'), Z0 => (others => '0'), T => (others => '0'), barrel_stub_mems => (others =>(StubValid => '0', StubIndex => (others => '0'), StubR => (others => '0'), PhiRes => (others => '0'), ZRes => (others => '0'), TrackIndex => (others => '0'))), TrackValid => '0');
            if Seed = 0 then
              FM_52_DATA_inputs         := (barrelFullMatches_0_dataarray_data_V_q0, barrelFullMatches_1_dataarray_data_V_q0, barrelFullMatches_2_dataarray_data_V_q0, barrelFullMatches_3_dataarray_data_V_q0, barrelFullMatches_4_dataarray_data_V_q0, barrelFullMatches_5_dataarray_data_V_q0,
              barrelFullMatches_6_dataarray_data_V_q0, barrelFullMatches_7_dataarray_data_V_q0, barrelFullMatches_8_dataarray_data_V_q0, barrelFullMatches_9_dataarray_data_V_q0, barrelFullMatches_10_dataarray_data_V_q0, barrelFullMatches_11_dataarray_data_V_q0, barrelFullMatches_12_dataarray_data_V_q0,
              barrelFullMatches_13_dataarray_data_V_q0, barrelFullMatches_14_dataarray_data_V_q0, barrelFullMatches_15_dataarray_data_V_q0);
              FM_52_NENT_0_inputs       := (barrelFullMatches_0_nentries_0_V, barrelFullMatches_1_nentries_0_V, barrelFullMatches_2_nentries_0_V, barrelFullMatches_3_nentries_0_V, barrelFullMatches_4_nentries_0_V, barrelFullMatches_5_nentries_0_V,
              barrelFullMatches_6_nentries_0_V, barrelFullMatches_7_nentries_0_V, barrelFullMatches_8_nentries_0_V, barrelFullMatches_9_nentries_0_V, barrelFullMatches_10_nentries_0_V,
              barrelFullMatches_11_nentries_0_V, barrelFullMatches_12_nentries_0_V, barrelFullMatches_13_nentries_0_V, barrelFullMatches_14_nentries_0_V, barrelFullMatches_15_nentries_0_V);
              FM_52_NENT_1_inputs       := (barrelFullMatches_0_nentries_1_V, barrelFullMatches_1_nentries_1_V, barrelFullMatches_2_nentries_1_V, barrelFullMatches_3_nentries_1_V, barrelFullMatches_4_nentries_1_V, barrelFullMatches_5_nentries_1_V,
              barrelFullMatches_6_nentries_1_V, barrelFullMatches_7_nentries_1_V, barrelFullMatches_8_nentries_1_V, barrelFullMatches_9_nentries_1_V, barrelFullMatches_10_nentries_1_V,
              barrelFullMatches_11_nentries_1_V, barrelFullMatches_12_nentries_1_V, barrelFullMatches_13_nentries_1_V, barrelFullMatches_14_nentries_1_V, barrelFullMatches_15_nentries_1_V);
              TPAR_70_DATA_inputs       := (trackletParameters_0_dataarray_data_V_q0, trackletParameters_1_dataarray_data_V_q0, trackletParameters_2_dataarray_data_V_q0, trackletParameters_3_dataarray_data_V_q0, trackletParameters_4_dataarray_data_V_q0, trackletParameters_5_dataarray_data_V_q0, trackletParameters_6_dataarray_data_V_q0, trackletParameters_7_dataarray_data_V_q0,
              trackletParameters_8_dataarray_data_V_q0, trackletParameters_9_dataarray_data_V_q0, trackletParameters_10_dataarray_data_V_q0, trackletParameters_11_dataarray_data_V_q0);
            elsif Seed = 1 then
              FM_52_DATA_inputs         := (barrelFullMatches_0_dataarray_data_V_q0, barrelFullMatches_1_dataarray_data_V_q0, barrelFullMatches_2_dataarray_data_V_q0, barrelFullMatches_3_dataarray_data_V_q0, barrelFullMatches_4_dataarray_data_V_q0, barrelFullMatches_5_dataarray_data_V_q0,
              barrelFullMatches_6_dataarray_data_V_q0, barrelFullMatches_7_dataarray_data_V_q0, barrelFullMatches_8_dataarray_data_V_q0, barrelFullMatches_9_dataarray_data_V_q0, barrelFullMatches_10_dataarray_data_V_q0, barrelFullMatches_11_dataarray_data_V_q0, barrelFullMatches_12_dataarray_data_V_q0,
              barrelFullMatches_13_dataarray_data_V_q0, barrelFullMatches_14_dataarray_data_V_q0, barrelFullMatches_15_dataarray_data_V_q0);
              FM_52_NENT_0_inputs       := (barrelFullMatches_0_nentries_0_V, barrelFullMatches_1_nentries_0_V, barrelFullMatches_2_nentries_0_V, barrelFullMatches_3_nentries_0_V, barrelFullMatches_4_nentries_0_V, barrelFullMatches_5_nentries_0_V,
              barrelFullMatches_6_nentries_0_V, barrelFullMatches_7_nentries_0_V, barrelFullMatches_8_nentries_0_V, barrelFullMatches_9_nentries_0_V, barrelFullMatches_10_nentries_0_V,
              barrelFullMatches_11_nentries_0_V, barrelFullMatches_12_nentries_0_V, barrelFullMatches_13_nentries_0_V, barrelFullMatches_14_nentries_0_V, barrelFullMatches_15_nentries_0_V);
              FM_52_NENT_1_inputs       := (barrelFullMatches_0_nentries_1_V, barrelFullMatches_1_nentries_1_V, barrelFullMatches_2_nentries_1_V, barrelFullMatches_3_nentries_1_V, barrelFullMatches_4_nentries_1_V, barrelFullMatches_5_nentries_1_V,
              barrelFullMatches_6_nentries_1_V, barrelFullMatches_7_nentries_1_V, barrelFullMatches_8_nentries_1_V, barrelFullMatches_9_nentries_1_V, barrelFullMatches_10_nentries_1_V,
              barrelFullMatches_11_nentries_1_V, barrelFullMatches_12_nentries_1_V, barrelFullMatches_13_nentries_1_V, barrelFullMatches_14_nentries_1_V, barrelFullMatches_15_nentries_1_V);
              TPAR_70_DATA_inputs       := (trackletParameters_0_dataarray_data_V_q0, trackletParameters_1_dataarray_data_V_q0, trackletParameters_2_dataarray_data_V_q0, trackletParameters_3_dataarray_data_V_q0);
              else
              FM_52_DATA_inputs         := (barrelFullMatches_0_dataarray_data_V_q0, barrelFullMatches_1_dataarray_data_V_q0, barrelFullMatches_2_dataarray_data_V_q0, barrelFullMatches_3_dataarray_data_V_q0, barrelFullMatches_4_dataarray_data_V_q0, barrelFullMatches_5_dataarray_data_V_q0,
              barrelFullMatches_6_dataarray_data_V_q0, barrelFullMatches_7_dataarray_data_V_q0, barrelFullMatches_8_dataarray_data_V_q0, barrelFullMatches_9_dataarray_data_V_q0, barrelFullMatches_10_dataarray_data_V_q0, barrelFullMatches_11_dataarray_data_V_q0, barrelFullMatches_12_dataarray_data_V_q0,
              barrelFullMatches_13_dataarray_data_V_q0, barrelFullMatches_14_dataarray_data_V_q0, barrelFullMatches_15_dataarray_data_V_q0, barrelFullMatches_16_dataarray_data_V_q0, barrelFullMatches_17_dataarray_data_V_q0, barrelFullMatches_18_dataarray_data_V_q0, barrelFullMatches_19_dataarray_data_V_q0);
              FM_52_NENT_0_inputs       := (barrelFullMatches_0_nentries_0_V, barrelFullMatches_1_nentries_0_V, barrelFullMatches_2_nentries_0_V, barrelFullMatches_3_nentries_0_V, barrelFullMatches_4_nentries_0_V, barrelFullMatches_5_nentries_0_V,
              barrelFullMatches_6_nentries_0_V, barrelFullMatches_7_nentries_0_V, barrelFullMatches_8_nentries_0_V, barrelFullMatches_9_nentries_0_V, barrelFullMatches_10_nentries_0_V,
              barrelFullMatches_11_nentries_0_V, barrelFullMatches_12_nentries_0_V, barrelFullMatches_13_nentries_0_V, barrelFullMatches_14_nentries_0_V, barrelFullMatches_15_nentries_0_V, barrelFullMatches_16_nentries_0_V, barrelFullMatches_17_nentries_0_V, barrelFullMatches_18_nentries_0_V, barrelFullMatches_19_nentries_0_V);
              FM_52_NENT_1_inputs       := (barrelFullMatches_0_nentries_1_V, barrelFullMatches_1_nentries_1_V, barrelFullMatches_2_nentries_1_V, barrelFullMatches_3_nentries_1_V, barrelFullMatches_4_nentries_1_V, barrelFullMatches_5_nentries_1_V,
              barrelFullMatches_6_nentries_1_V, barrelFullMatches_7_nentries_1_V, barrelFullMatches_8_nentries_1_V, barrelFullMatches_9_nentries_1_V, barrelFullMatches_10_nentries_1_V,
              barrelFullMatches_11_nentries_1_V, barrelFullMatches_12_nentries_1_V, barrelFullMatches_13_nentries_1_V, barrelFullMatches_14_nentries_1_V, barrelFullMatches_15_nentries_1_V, barrelFullMatches_16_nentries_1_V, barrelFullMatches_17_nentries_1_V, barrelFullMatches_18_nentries_1_V, barrelFullMatches_19_nentries_1_V);
              TPAR_70_DATA_inputs       := (trackletParameters_0_dataarray_data_V_q0, trackletParameters_1_dataarray_data_V_q0, trackletParameters_2_dataarray_data_V_q0, trackletParameters_3_dataarray_data_V_q0);
              end if;
            min_id                    := kInvalidTrackletID;
            
            --if done_fm_data_collection = '1' or empty = '1' then    
              done_fm_data_collection   := '0';   
              -- Determining the minimum tracklet ID from the current set of full matches.
              -- Reading from the circular buffers
              barrel_min_id : for j in 0 to NFMBarrel-1 loop
                barrel_buf_rd_en_array(j) <= '1';
                if barrel_buf_rd_valid_array(j) = '1' then
                  barrel_stub_0 := barrel_buf_rd_data_array(j);
                  -- Last 14 bits of FullMatch memory is TrackletID
                  barrel_id_0 := barrel_stub_0(51 downto 38);
                  if (empty = '0' and (barrel_id_0 /= kInvalidTrackletID)) then
                    barrel_valid(j) := '1';
                  end if;
                end if;
                -- Compare the given barrel and disk IDs against each barrel ID
                barrel_barrel_id_comp : for k in 0 to NFMBarrel-1 loop
                  barrel_buf_rd_en_array(k) <= '1';
                  if barrel_buf_rd_valid_array(k) = '1' then
                    barrel_stub_1 := barrel_buf_rd_data_array(k);
                    -- Last 14 bits of FullMatch memory is TrackletID
                    barrel_id_1 := barrel_stub_1(51 downto 38);
                    if (barrel_valid(j) = '1' and (barrel_id_0 <= barrel_id_1)) then
                      barrel_valid(j) := '1';
                    end if;
                  end if;
                end loop barrel_barrel_id_comp;
                if barrel_valid(j) = '1' then
                  min_id := barrel_id_0;
                else
                  min_id := min_id;
                end if;
              end loop barrel_min_id;
            --end if;           
            -- Initialize a TrackFit object using the tracklet parameters associated
            -- with the minimum tracklet ID.
            if (min_id /= kInvalidTrackletID) then
              -- hardcoded
              -- TCID <= std_logic_vector(shift_right(unsigned(min_id), kNBits_MemAddr));
              TCID_array(0) <= min_id(13 downto 7);
              TrackletID := std_logic_vector(to_unsigned(16#7F#,TrackletIDType'length));
              -- trackletIndex <= min_id(6 downto 0) and TrackletID(6 downto 0);
              trackletIndex := min_id(6 downto 0);
            else
              TrackletID := std_logic_vector(to_unsigned(TPAROffset, TrackletIDType'length));
              TCID_array(0) <= TrackletID(6 downto 0);
              trackletIndex := (others => '0');
            end if;
            tpar_num_array(0) <= to_integer(unsigned(TCID_array(0) - std_logic_vector(to_unsigned(TPAROffset, TCIDType'length))));
            -- bx bits used as msb of address to choose from the 5 pages of TPAR memory
            -- Remove
            if tpar_num_array(0) <= 3 then
            TPAR_70_ADDR_outputs(tpar_num_array(0)) <= bx_V & trackletIndex;
            tpar_write_addr_done <= '1';
            -- Waiting for 2 clock cycles
            for index_delay in DELAY-1 downto 1 loop        
              TCID_array(index_delay) <= TCID_array(index_delay-1);
              tpar_num_array(index_delay) <= tpar_num_array(index_delay-1);
            end loop;
            --if tpar_data_ready = '1' then
                --tpar_write_addr_done <= '0'; 
                -- Setting TFSEEDTYPE of size kTFSeedTypeSize = 3
                -- hardcoded
                -- trackFit_data.TFSEEDTYPE <= std_logic_vector(shift_right(unsigned(TCID), kNBitsITC));
                trackFit_data.TFSEEDTYPE :=TCID_array(DELAY-1)(6 downto 4);
                -- Setting Rinv of size 14
                trackFit_data.Rinv := TPAR_70_DATA_inputs(tpar_num_array(DELAY-1))(55 downto 42);
                -- Setting Phi0 of size 18
                trackFit_data.Phi0 := TPAR_70_DATA_inputs(tpar_num_array(DELAY-1))(41 downto 24);
                -- Setting Z0 of size 10
                trackFit_data.Z0 := TPAR_70_DATA_inputs(tpar_num_array(DELAY-1))(23 downto 14);
                -- Setting T of size 14
                trackFit_data.T := TPAR_70_DATA_inputs(tpar_num_array(DELAY-1))(13 downto 0);
            --end if;
              end if;
            
            -- Retrieve the full information for each full match that has the minimum
            -- tracklet ID and assign it to the appropriate field of the TrackFit object.
            -- There can be up to eight matches (3 bits)             
            nMatches := (others => '0');         
            barrel_stub_association : for j in 0 to NBarrelStubs-1 loop
              if j = 0 then
                nFM := NFMPerStubBarrel0;
              else
                nFM := NFMPerStubBarrel;
              end if;
              if j = 0 then
                nFMCumulative := 0;
              elsif j = 1 then
                nFMCumulative := NFMPerStubBarrel0;
              else
                nFMCumulative := NFMPerStubBarrel0 + (j - 1) * NFMPerStubBarrel;
              end if;
              barrel_stub_valid := '0';
              for k in nFM_range loop
                if k >= 0  and k < nFM then
                  barrel_stub_valid := (barrel_stub_valid or barrel_valid(nFMCumulative + k));
                end if;
              end loop;
              if barrel_stub_valid = '1' then
                nMatches := nMatches + 1;
              end if;
--              for k in 1 to 7 loop
--                if (nFM > k and barrel_valid(nFMCumulative + k) = '1') then
--                  i_mem <= nFMCumulative + k;
--                  i_fm <= to_integer(unsigned(barrel_read_index(nFMCumulative + k)));
--                else
--                  i_mem <= nFMCumulative;
--                  i_fm <= to_integer(unsigned(barrel_read_index(nFMCumulative)));
--                end if;
--              end loop; 
              if (nFM > 7 and barrel_valid(nFMCumulative + 7) = '1') then
                i_mem := nFMCumulative + 7;
                i_fm  := to_integer(unsigned(barrel_read_index(nFMCumulative + 7)));
              elsif (nFM > 6 and barrel_valid(nFMCumulative + 6) = '1') then
                i_mem := nFMCumulative + 6;
                i_fm  := to_integer(unsigned(barrel_read_index(nFMCumulative + 6)));
              elsif (nFM > 5 and barrel_valid(nFMCumulative + 5) = '1') then
                i_mem := nFMCumulative + 5;
                i_fm  := to_integer(unsigned(barrel_read_index(nFMCumulative + 5)));
              elsif (nFM > 4 and barrel_valid(nFMCumulative + 4) = '1') then
                i_mem := nFMCumulative + 4;
                i_fm  := to_integer(unsigned(barrel_read_index(nFMCumulative + 4)));
              elsif (nFM > 3 and barrel_valid(nFMCumulative + 3) = '1') then
                i_mem := nFMCumulative + 3;
                i_fm  := to_integer(unsigned(barrel_read_index(nFMCumulative + 3)));
              elsif (nFM > 2 and barrel_valid(nFMCumulative + 2) = '1') then
                i_mem := nFMCumulative + 2;
                i_fm  := to_integer(unsigned(barrel_read_index(nFMCumulative + 2)));
              elsif (nFM > 1 and barrel_valid(nFMCumulative + 1) = '1') then
                i_mem := nFMCumulative + 1;
                i_fm  := to_integer(unsigned(barrel_read_index(nFMCumulative + 1)));
              else
                i_mem := nFMCumulative;
                i_fm  := to_integer(unsigned(barrel_read_index(nFMCumulative)));
              end if;              
              
              barrel_buf_rd_en_array(i_mem) <= '1';
              if barrel_buf_rd_valid_array(i_mem) = '1' then
                -- Haven't included i_fm here
                barrel_stub := barrel_buf_rd_data_array(i_mem);
              end if;
              if barrel_stub_valid = '1' then
                barrel_stub_index := barrel_stub(37 downto 28);
                barrel_stub_r := barrel_stub(27 downto 21);
                barrel_phi_res := barrel_stub(20 downto 9);
                barrel_z_res := barrel_stub(8 downto 0);
              else
                barrel_stub_index := (others => '0');
                barrel_stub_r := (others => '0');
                barrel_phi_res := (others => '0');
                barrel_z_res := (others => '0');
              end if;
              trackFit_data.barrel_stub_mems(j).StubValid := barrel_stub_valid;
              trackFit_data.barrel_stub_mems(j).StubIndex := barrel_stub_index;
              trackFit_data.barrel_stub_mems(j).StubR := barrel_stub_r;
              trackFit_data.barrel_stub_mems(j).PhiRes := barrel_phi_res;
              trackFit_data.barrel_stub_mems(j).ZRes := barrel_z_res;
              trackFit_data.barrel_stub_mems(j).TrackIndex := nTracks;  
            end loop barrel_stub_association; 
            -- Only tracks with at least two matches are valid.
            if (nMatches >= kMinNMatches) then
              trackFit_data.TrackValid := '1';  
            end if;    
            -- Output the track word and eight stub words associated with the TrackFit
            -- object that was constructed.
            if (trackFit_data.TrackValid) = '1' then
              -- Initializing trackWord_V_din(nTracks)
              trackWord_V_din <= (others => '0'); 
              -- Setting TrackValid of size 1
              trackWord_V_din(83) <= trackFit_data.TrackValid;
              -- Setting TFSEEDTYPE of size 3
              trackWord_V_din(82 downto 80) <= trackFit_data.TFSEEDTYPE;
              -- Setting Rinv of size 14
              trackWord_V_din(79 downto 66) <= trackFit_data.Rinv;
              -- Setting Phi0 of size 18
              trackWord_V_din(65 downto 48) <= trackFit_data.Phi0;
              -- Setting Z0 of size 10
              trackWord_V_din(47 downto 38) <= trackFit_data.Z0;
              -- Setting T of size 14
              trackWord_V_din(37 downto 24) <= trackFit_data.T;
              trackWord_V_write <= '1';
              -- Initializing barrelStubWords_0-3_V_din(nTracks)
              barrelStubWords_0_V_din <= (others =>'0');
              barrelStubWords_1_V_din <= (others =>'0');
              barrelStubWords_2_V_din <= (others =>'0');
              barrelStubWords_3_V_din <= (others =>'0');
              barrel_stub_words : for j in 0 to NBarrelStubs-1 loop
                case j is
                    when 0 => if trackFit_data.barrel_stub_mems(j).StubValid = '1' then
                                  barrelStubWords_0_V_din(45) <= trackFit_data.barrel_stub_mems(j).StubValid;
                                  barrelStubWords_0_V_din(44 downto 38) <= trackFit_data.barrel_stub_mems(j).TrackIndex;
                                  barrelStubWords_0_V_din(37 downto 28) <= trackFit_data.barrel_stub_mems(j).StubIndex;
                                  barrelStubWords_0_V_din(27 downto 21) <= trackFit_data.barrel_stub_mems(j).StubR;
                                  barrelStubWords_0_V_din(20 downto 9) <= trackFit_data.barrel_stub_mems(j).PhiRes;
                                  barrelStubWords_0_V_din(8 downto 0) <= trackFit_data.barrel_stub_mems(j).ZRes;  
                              else
                                  barrelStubWords_0_V_din <= (others =>'0');
                              end if;
                              barrelStubWords_0_V_write <= '1';
                    when 1 => if trackFit_data.barrel_stub_mems(j).StubValid = '1' then
                                  barrelStubWords_1_V_din(45) <= trackFit_data.barrel_stub_mems(j).StubValid;
                                  barrelStubWords_1_V_din(44 downto 38) <= trackFit_data.barrel_stub_mems(j).TrackIndex;
                                  barrelStubWords_1_V_din(37 downto 28) <= trackFit_data.barrel_stub_mems(j).StubIndex;
                                  barrelStubWords_1_V_din(27 downto 21) <= trackFit_data.barrel_stub_mems(j).StubR;
                                  barrelStubWords_1_V_din(20 downto 9) <= trackFit_data.barrel_stub_mems(j).PhiRes;
                                  barrelStubWords_1_V_din(8 downto 0) <= trackFit_data.barrel_stub_mems(j).ZRes;  
                              else
                                  barrelStubWords_1_V_din <= (others =>'0');
                              end if;
                              barrelStubWords_1_V_write <= '1';
                    when 2 => if trackFit_data.barrel_stub_mems(j).StubValid = '1' then
                                  barrelStubWords_2_V_din(45) <= trackFit_data.barrel_stub_mems(j).StubValid;
                                  barrelStubWords_2_V_din(44 downto 38) <= trackFit_data.barrel_stub_mems(j).TrackIndex;
                                  barrelStubWords_2_V_din(37 downto 28) <= trackFit_data.barrel_stub_mems(j).StubIndex;
                                  barrelStubWords_2_V_din(27 downto 21) <= trackFit_data.barrel_stub_mems(j).StubR;
                                  barrelStubWords_2_V_din(20 downto 9) <= trackFit_data.barrel_stub_mems(j).PhiRes;
                                  barrelStubWords_2_V_din(8 downto 0) <= trackFit_data.barrel_stub_mems(j).ZRes;  
                              else
                                  barrelStubWords_2_V_din <= (others =>'0');
                              end if;
                              barrelStubWords_2_V_write <= '1';
                    when 3 => if trackFit_data.barrel_stub_mems(j).StubValid = '1' then
                                  barrelStubWords_3_V_din(45) <= trackFit_data.barrel_stub_mems(j).StubValid;
                                  barrelStubWords_3_V_din(44 downto 38) <= trackFit_data.barrel_stub_mems(j).TrackIndex;
                                  barrelStubWords_3_V_din(37 downto 28) <= trackFit_data.barrel_stub_mems(j).StubIndex;
                                  barrelStubWords_3_V_din(27 downto 21) <= trackFit_data.barrel_stub_mems(j).StubR;
                                  barrelStubWords_3_V_din(20 downto 9) <= trackFit_data.barrel_stub_mems(j).PhiRes;
                                  barrelStubWords_3_V_din(8 downto 0) <= trackFit_data.barrel_stub_mems(j).ZRes;  
                              else
                                  barrelStubWords_3_V_din <= (others =>'0');
                              end if;
                              barrelStubWords_3_V_write <= '1';
                    when others => barrelStubWords_0_V_write <= '0';
                                   barrelStubWords_1_V_write <= '0';
                                   barrelStubWords_2_V_write <= '0';
                                   barrelStubWords_3_V_write <= '0';
                end case;
              end loop barrel_stub_words;
            end if; 
            if (nMatches >= kMinNMatches) then
              nTracks := nTracks + 1;  
            end if;   
            
            -- Update the circular buffer indices and read a new element from each of
            -- the input full-match memories.
            getFM : for j in 0 to NFMBarrel-1 loop 
                -- for odd bx, use page 1 of nentries and for even, page 0
                if bx_V(0) = '1' then
                  FM_52_NENT_inputs(j) := FM_52_NENT_1_inputs(j);
                else
                  FM_52_NENT_inputs(j) := FM_52_NENT_0_inputs(j);
                end if;
                --  The following if condition is the substitute for getFM function in HLS
                if (barrel_mem_index(j) < FM_52_NENT_inputs(j)) then
                  -- lsb of bx used as msb of address to choose from the 2 pages
                  FM_52_ADDR_outputs(j) <= bx_V(0) & barrel_mem_index(j);
                  invalid_data_array(j) := '0';
                else
                  invalid_data_array(j) := '1';
                end if;
                if (empty = '1' or barrel_buf_full_array(j) /= '1') then
                  barrel_mem_index(j) := barrel_mem_index(j) + 1;
                end if; 
            end loop getFM;
            barrel_fm_write_addr_done <= '1';
            -- Waiting for 2 clock cycles
            --if barrel_fm_data_ready = '1' then  
              --barrel_fm_write_addr_done <= '0';
              -- Writing to the circular buffers
              barrel_circular_buffer_update : for j in 0 to NFMBarrel-1 loop
                -- If there are no more full matches, set all data to dummy values.
                --if invalid_data_array(j) = '1' then
                  --barrel_buf_wr_data_array(j)(51 downto 38) <= kInvalidTrackletID;
                --else
                  barrel_buf_wr_data_array(j) <= FM_52_DATA_inputs(j);
                --end if;
                barrel_buf_wr_en_array(j) <= '1';
              end loop barrel_circular_buffer_update;
              done_fm_data_collection := '1'; 
            --end if;    
            
            index_events := index_events + 1;        
          else
            reg_bx_V  <= bx_V - 1;
            --reg_bx_V <= reg_bx_V + 1;
            bx_o_V_ap_vld <= '1';
            ap_done <= '1';  
            index_events := 0;
          end if; 
          -- To see these in the waves
          barrel_stub_valid_d <= barrel_stub_valid;
          done_fm_data_collection_d <= done_fm_data_collection;
          nMatches_d <= nMatches;
          index_events_d <= index_events;
          min_id_d <= min_id;
          trackFit_data_d <= trackFit_data;
          barrel_valid_d <= barrel_valid;
          FM_52_DATA_inputs_d <= FM_52_DATA_inputs;
          barrel_mem_index_d <= barrel_mem_index;
          barrel_stub_0_d <= barrel_stub_0;
          barrel_stub_1_d <= barrel_stub_1;
          barrel_stub_d <= barrel_stub;
          barrel_stub_index_d <= barrel_stub_index;
          barrel_stub_r_d <= barrel_stub_r;
          barrel_phi_res_d <= barrel_phi_res;
          barrel_z_res_d <= barrel_z_res;
          barrel_id_0_d <= barrel_id_0;
          barrel_id_1_d <= barrel_id_1;
          invalid_data_array_d <= invalid_data_array;
          TPAR_70_DATA_inputs_d <= TPAR_70_DATA_inputs;
          FM_52_NENT_0_inputs_d <= FM_52_NENT_0_inputs;
          FM_52_NENT_1_inputs_d <= FM_52_NENT_1_inputs;
          FM_52_NENT_inputs_d <= FM_52_NENT_inputs;
      end if; 
    end if;
  end if;     
end process;

end;