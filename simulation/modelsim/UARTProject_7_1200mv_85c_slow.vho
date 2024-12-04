-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"

-- DATE "12/04/2024 14:46:04"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	top_level IS
    PORT (
	MSC : IN std_logic_vector(3 DOWNTO 0);
	SSC : IN std_logic_vector(3 DOWNTO 0);
	GClock : IN std_logic;
	GReset : IN std_logic;
	SSCS : IN std_logic;
	RxD : IN std_logic;
	BaudRateSel : IN std_logic_vector(2 DOWNTO 0);
	MSTL : OUT std_logic_vector(2 DOWNTO 0);
	SSTL : OUT std_logic_vector(2 DOWNTO 0);
	TxD : OUT std_logic
	);
END top_level;

-- Design Ports Information
-- MSC[0]	=>  Location: PIN_AC14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- MSC[1]	=>  Location: PIN_Y17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- MSC[2]	=>  Location: PIN_F14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- MSC[3]	=>  Location: PIN_U26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RxD	=>  Location: PIN_AE3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- MSTL[0]	=>  Location: PIN_L24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- MSTL[1]	=>  Location: PIN_J25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- MSTL[2]	=>  Location: PIN_L28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SSTL[0]	=>  Location: PIN_K28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SSTL[1]	=>  Location: PIN_L26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SSTL[2]	=>  Location: PIN_K27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- TxD	=>  Location: PIN_G27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SSC[0]	=>  Location: PIN_L27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SSC[1]	=>  Location: PIN_L23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SSC[2]	=>  Location: PIN_J26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SSC[3]	=>  Location: PIN_M25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- GClock	=>  Location: PIN_J1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- GReset	=>  Location: PIN_AH14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SSCS	=>  Location: PIN_G28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- BaudRateSel[2]	=>  Location: PIN_AD14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- BaudRateSel[1]	=>  Location: PIN_Y14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- BaudRateSel[0]	=>  Location: PIN_Y15,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF top_level IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_MSC : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_SSC : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_GClock : std_logic;
SIGNAL ww_GReset : std_logic;
SIGNAL ww_SSCS : std_logic;
SIGNAL ww_RxD : std_logic;
SIGNAL ww_BaudRateSel : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_MSTL : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_SSTL : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_TxD : std_logic;
SIGNAL \uart_block|baudrate|mux|o~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \uart_block|baudrate|divby8|int_clk~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \uart_block|baudrate|ripple_divby2:2:divby256_k|int_clk~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \uart_block|baudrate|ripple_divby2:1:divby256_k|int_clk~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \GClock~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \uart_block|baudrate|divby41|int_clk~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \uart_block|baudrate|ripple_divby2:4:divby256_k|int_clk~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \uart_block|baudrate|divby256_0|int_clk~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \uart_block|baudrate|ripple_divby2:3:divby256_k|int_clk~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \uart_block|baudrate|ripple_divby2:5:divby256_k|int_clk~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \GReset~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \MSC[0]~input_o\ : std_logic;
SIGNAL \MSC[1]~input_o\ : std_logic;
SIGNAL \MSC[2]~input_o\ : std_logic;
SIGNAL \MSC[3]~input_o\ : std_logic;
SIGNAL \RxD~input_o\ : std_logic;
SIGNAL \MSTL[0]~output_o\ : std_logic;
SIGNAL \MSTL[1]~output_o\ : std_logic;
SIGNAL \MSTL[2]~output_o\ : std_logic;
SIGNAL \SSTL[0]~output_o\ : std_logic;
SIGNAL \SSTL[1]~output_o\ : std_logic;
SIGNAL \SSTL[2]~output_o\ : std_logic;
SIGNAL \TxD~output_o\ : std_logic;
SIGNAL \GClock~input_o\ : std_logic;
SIGNAL \GClock~inputclkctrl_outclk\ : std_logic;
SIGNAL \lab3|ssc_counter|reg|reg:0:biti|int_q~0_combout\ : std_logic;
SIGNAL \SSC[2]~input_o\ : std_logic;
SIGNAL \SSC[3]~input_o\ : std_logic;
SIGNAL \lab3|ssc_counter|reg|reg:2:biti|int_q~0_combout\ : std_logic;
SIGNAL \lab3|ssc_counter|reg|reg:2:biti|int_q~q\ : std_logic;
SIGNAL \lab3|controller|w~4_combout\ : std_logic;
SIGNAL \SSC[0]~input_o\ : std_logic;
SIGNAL \SSC[1]~input_o\ : std_logic;
SIGNAL \lab3|controller|w~3_combout\ : std_logic;
SIGNAL \SSCS~input_o\ : std_logic;
SIGNAL \lab3|sscs_debounce|int_nextState[0]~1_combout\ : std_logic;
SIGNAL \lab3|sscs_debounce|int_nextState[1]~0_combout\ : std_logic;
SIGNAL \lab3|controller|dFFy0|int_q~0_combout\ : std_logic;
SIGNAL \GReset~input_o\ : std_logic;
SIGNAL \GReset~inputclkctrl_outclk\ : std_logic;
SIGNAL \lab3|controller|dFFy0|int_q~q\ : std_logic;
SIGNAL \lab3|controller|w~2_combout\ : std_logic;
SIGNAL \lab3|controller|w~1_combout\ : std_logic;
SIGNAL \lab3|controller|w~5_combout\ : std_logic;
SIGNAL \lab3|controller|reset_counter|int_q~q\ : std_logic;
SIGNAL \lab3|ssc_counter|reg|reg:0:biti|int_q~q\ : std_logic;
SIGNAL \lab3|ssc_counter|reg|reg:1:biti|int_q~0_combout\ : std_logic;
SIGNAL \lab3|ssc_counter|reg|reg:1:biti|int_q~q\ : std_logic;
SIGNAL \lab3|ssc_counter|reg|reg:3:biti|int_q~0_combout\ : std_logic;
SIGNAL \lab3|ssc_counter|reg|reg:3:biti|int_q~q\ : std_logic;
SIGNAL \lab3|controller|w~0_combout\ : std_logic;
SIGNAL \lab3|controller|i_y1~2_combout\ : std_logic;
SIGNAL \lab3|controller|i_y1~3_combout\ : std_logic;
SIGNAL \lab3|controller|dFFy1|int_q~q\ : std_logic;
SIGNAL \lab3|controller|B~0_combout\ : std_logic;
SIGNAL \lab3|controller|A~combout\ : std_logic;
SIGNAL \lab3|controller|B~1_combout\ : std_logic;
SIGNAL \lab3|controller|B~2_combout\ : std_logic;
SIGNAL \uart_block|baudrate|divby41|Add0~0_combout\ : std_logic;
SIGNAL \uart_block|baudrate|divby41|int_count~1_combout\ : std_logic;
SIGNAL \uart_block|baudrate|divby41|Add0~1\ : std_logic;
SIGNAL \uart_block|baudrate|divby41|Add0~2_combout\ : std_logic;
SIGNAL \uart_block|baudrate|divby41|Add0~3\ : std_logic;
SIGNAL \uart_block|baudrate|divby41|Add0~4_combout\ : std_logic;
SIGNAL \uart_block|baudrate|divby41|Equal0~0_combout\ : std_logic;
SIGNAL \uart_block|baudrate|divby41|Add0~9\ : std_logic;
SIGNAL \uart_block|baudrate|divby41|Add0~10_combout\ : std_logic;
SIGNAL \uart_block|baudrate|divby41|int_count~2_combout\ : std_logic;
SIGNAL \uart_block|baudrate|divby41|Add0~5\ : std_logic;
SIGNAL \uart_block|baudrate|divby41|Add0~6_combout\ : std_logic;
SIGNAL \uart_block|baudrate|divby41|int_count~0_combout\ : std_logic;
SIGNAL \uart_block|baudrate|divby41|Add0~7\ : std_logic;
SIGNAL \uart_block|baudrate|divby41|Add0~8_combout\ : std_logic;
SIGNAL \uart_block|baudrate|divby41|int_clk~0_combout\ : std_logic;
SIGNAL \uart_block|baudrate|divby41|int_clk~feeder_combout\ : std_logic;
SIGNAL \uart_block|baudrate|divby41|int_clk~q\ : std_logic;
SIGNAL \uart_block|baudrate|divby41|int_clk~clkctrl_outclk\ : std_logic;
SIGNAL \uart_block|baudrate|divby256_0|int_count~0_combout\ : std_logic;
SIGNAL \uart_block|baudrate|divby256_0|int_count~q\ : std_logic;
SIGNAL \uart_block|baudrate|divby256_0|int_clk~0_combout\ : std_logic;
SIGNAL \uart_block|baudrate|divby256_0|int_clk~feeder_combout\ : std_logic;
SIGNAL \uart_block|baudrate|divby256_0|int_clk~q\ : std_logic;
SIGNAL \uart_block|baudrate|divby256_0|int_clk~clkctrl_outclk\ : std_logic;
SIGNAL \uart_block|baudrate|ripple_divby2:1:divby256_k|int_count~0_combout\ : std_logic;
SIGNAL \uart_block|baudrate|ripple_divby2:1:divby256_k|int_count~q\ : std_logic;
SIGNAL \uart_block|baudrate|ripple_divby2:1:divby256_k|int_clk~0_combout\ : std_logic;
SIGNAL \uart_block|baudrate|ripple_divby2:1:divby256_k|int_clk~feeder_combout\ : std_logic;
SIGNAL \uart_block|baudrate|ripple_divby2:1:divby256_k|int_clk~q\ : std_logic;
SIGNAL \BaudRateSel[2]~input_o\ : std_logic;
SIGNAL \BaudRateSel[1]~input_o\ : std_logic;
SIGNAL \BaudRateSel[0]~input_o\ : std_logic;
SIGNAL \uart_block|baudrate|mux|Equal6~4_combout\ : std_logic;
SIGNAL \uart_block|baudrate|ripple_divby2:1:divby256_k|int_clk~clkctrl_outclk\ : std_logic;
SIGNAL \uart_block|baudrate|ripple_divby2:2:divby256_k|int_count~0_combout\ : std_logic;
SIGNAL \uart_block|baudrate|ripple_divby2:2:divby256_k|int_count~q\ : std_logic;
SIGNAL \uart_block|baudrate|ripple_divby2:2:divby256_k|int_clk~0_combout\ : std_logic;
SIGNAL \uart_block|baudrate|ripple_divby2:2:divby256_k|int_clk~q\ : std_logic;
SIGNAL \uart_block|baudrate|ripple_divby2:2:divby256_k|int_clk~clkctrl_outclk\ : std_logic;
SIGNAL \uart_block|baudrate|ripple_divby2:3:divby256_k|int_count~0_combout\ : std_logic;
SIGNAL \uart_block|baudrate|ripple_divby2:3:divby256_k|int_count~q\ : std_logic;
SIGNAL \uart_block|baudrate|ripple_divby2:3:divby256_k|int_clk~0_combout\ : std_logic;
SIGNAL \uart_block|baudrate|ripple_divby2:3:divby256_k|int_clk~q\ : std_logic;
SIGNAL \uart_block|baudrate|ripple_divby2:3:divby256_k|int_clk~clkctrl_outclk\ : std_logic;
SIGNAL \uart_block|baudrate|ripple_divby2:4:divby256_k|int_count~0_combout\ : std_logic;
SIGNAL \uart_block|baudrate|ripple_divby2:4:divby256_k|int_count~q\ : std_logic;
SIGNAL \uart_block|baudrate|ripple_divby2:4:divby256_k|int_clk~0_combout\ : std_logic;
SIGNAL \uart_block|baudrate|ripple_divby2:4:divby256_k|int_clk~feeder_combout\ : std_logic;
SIGNAL \uart_block|baudrate|ripple_divby2:4:divby256_k|int_clk~q\ : std_logic;
SIGNAL \uart_block|baudrate|mux|Equal6~0_combout\ : std_logic;
SIGNAL \uart_block|baudrate|ripple_divby2:4:divby256_k|int_clk~clkctrl_outclk\ : std_logic;
SIGNAL \uart_block|baudrate|ripple_divby2:5:divby256_k|int_count~0_combout\ : std_logic;
SIGNAL \uart_block|baudrate|ripple_divby2:5:divby256_k|int_count~q\ : std_logic;
SIGNAL \uart_block|baudrate|ripple_divby2:5:divby256_k|int_clk~0_combout\ : std_logic;
SIGNAL \uart_block|baudrate|ripple_divby2:5:divby256_k|int_clk~feeder_combout\ : std_logic;
SIGNAL \uart_block|baudrate|ripple_divby2:5:divby256_k|int_clk~q\ : std_logic;
SIGNAL \uart_block|baudrate|ripple_divby2:5:divby256_k|int_clk~clkctrl_outclk\ : std_logic;
SIGNAL \uart_block|baudrate|ripple_divby2:6:divby256_k|int_count~0_combout\ : std_logic;
SIGNAL \uart_block|baudrate|ripple_divby2:6:divby256_k|int_count~q\ : std_logic;
SIGNAL \uart_block|baudrate|ripple_divby2:6:divby256_k|int_clk~0_combout\ : std_logic;
SIGNAL \uart_block|baudrate|ripple_divby2:6:divby256_k|int_clk~feeder_combout\ : std_logic;
SIGNAL \uart_block|baudrate|ripple_divby2:6:divby256_k|int_clk~q\ : std_logic;
SIGNAL \uart_block|baudrate|ripple_divby2:7:divby256_k|int_count~0_combout\ : std_logic;
SIGNAL \uart_block|baudrate|ripple_divby2:7:divby256_k|int_count~q\ : std_logic;
SIGNAL \uart_block|baudrate|ripple_divby2:7:divby256_k|int_clk~0_combout\ : std_logic;
SIGNAL \uart_block|baudrate|ripple_divby2:7:divby256_k|int_clk~q\ : std_logic;
SIGNAL \uart_block|baudrate|mux|o~5_combout\ : std_logic;
SIGNAL \uart_block|baudrate|mux|Equal6~1_combout\ : std_logic;
SIGNAL \uart_block|baudrate|mux|o~4_combout\ : std_logic;
SIGNAL \uart_block|baudrate|mux|Equal6~2_combout\ : std_logic;
SIGNAL \uart_block|baudrate|mux|o~3_combout\ : std_logic;
SIGNAL \uart_block|baudrate|mux|Equal6~3_combout\ : std_logic;
SIGNAL \uart_block|baudrate|mux|o~2_combout\ : std_logic;
SIGNAL \uart_block|baudrate|mux|o~1_combout\ : std_logic;
SIGNAL \uart_block|baudrate|mux|Equal6~5_combout\ : std_logic;
SIGNAL \uart_block|baudrate|mux|o~0_combout\ : std_logic;
SIGNAL \uart_block|baudrate|mux|Equal6~6_combout\ : std_logic;
SIGNAL \uart_block|baudrate|mux|o~combout\ : std_logic;
SIGNAL \uart_block|baudrate|mux|o~clkctrl_outclk\ : std_logic;
SIGNAL \uart_block|baudrate|divby8|int_count[0]~2_combout\ : std_logic;
SIGNAL \uart_block|baudrate|divby8|int_count[1]~1_combout\ : std_logic;
SIGNAL \uart_block|baudrate|divby8|int_count[2]~0_combout\ : std_logic;
SIGNAL \uart_block|baudrate|divby8|int_clk~0_combout\ : std_logic;
SIGNAL \uart_block|baudrate|divby8|int_clk~feeder_combout\ : std_logic;
SIGNAL \uart_block|baudrate|divby8|int_clk~q\ : std_logic;
SIGNAL \uart_block|baudrate|divby8|int_clk~clkctrl_outclk\ : std_logic;
SIGNAL \uart_block|detect_inc|signal_prev~0_combout\ : std_logic;
SIGNAL \uart_block|detect_inc|signal_prev~q\ : std_logic;
SIGNAL \uart_block|detect_inc|process_0~0_combout\ : std_logic;
SIGNAL \uart_block|detect_inc|edge_detected~q\ : std_logic;
SIGNAL \uart_block|enable_tx|int_q~0_combout\ : std_logic;
SIGNAL \uart_block|enable_tx|int_q~q\ : std_logic;
SIGNAL \uart_block|T|controller|d0~0_combout\ : std_logic;
SIGNAL \uart_block|T|controller|d0~1_combout\ : std_logic;
SIGNAL \uart_block|T|controller|DFF_0|int_q~q\ : std_logic;
SIGNAL \uart_block|T|counter|reg|reg:0:biti|int_q~0_combout\ : std_logic;
SIGNAL \uart_block|T|controller|d0~2_combout\ : std_logic;
SIGNAL \uart_block|T|counter|reg|reg:0:biti|int_q~q\ : std_logic;
SIGNAL \uart_block|T|counter|reg|reg:1:biti|int_q~0_combout\ : std_logic;
SIGNAL \uart_block|T|counter|reg|reg:1:biti|int_q~q\ : std_logic;
SIGNAL \uart_block|T|counter|reg|reg:2:biti|int_q~0_combout\ : std_logic;
SIGNAL \uart_block|T|counter|reg|reg:2:biti|int_q~1_combout\ : std_logic;
SIGNAL \uart_block|T|counter|reg|reg:2:biti|int_q~q\ : std_logic;
SIGNAL \uart_block|T|controller|DFF_1|int_q~0_combout\ : std_logic;
SIGNAL \uart_block|T|controller|DFF_1|int_q~q\ : std_logic;
SIGNAL \uart_block|counter|reg|reg:0:biti|int_q~0_combout\ : std_logic;
SIGNAL \uart_block|counter|reg|reg:2:biti|int_q~0_combout\ : std_logic;
SIGNAL \uart_block|counter|reg|reg:2:biti|int_q~q\ : std_logic;
SIGNAL \uart_block|counter_reset~combout\ : std_logic;
SIGNAL \uart_block|counter|reg|reg:0:biti|int_q~q\ : std_logic;
SIGNAL \uart_block|counter|reg|reg:1:biti|int_q~0_combout\ : std_logic;
SIGNAL \uart_block|counter|reg|reg:1:biti|int_q~q\ : std_logic;
SIGNAL \mux|o[4]~1_combout\ : std_logic;
SIGNAL \mux|o[1]~2_combout\ : std_logic;
SIGNAL \mux|o[1]~3_combout\ : std_logic;
SIGNAL \uart_block|T|controller|loadTDR~0_combout\ : std_logic;
SIGNAL \uart_block|T|TDR|reg:1:biti|int_q~q\ : std_logic;
SIGNAL \mux|o[2]~4_combout\ : std_logic;
SIGNAL \mux|o[2]~5_combout\ : std_logic;
SIGNAL \uart_block|T|TDR|reg:2:biti|int_q~q\ : std_logic;
SIGNAL \mux|o[3]~6_combout\ : std_logic;
SIGNAL \mux|o[3]~7_combout\ : std_logic;
SIGNAL \uart_block|T|TDR|reg:3:biti|int_q~q\ : std_logic;
SIGNAL \mux|o[6]~11_combout\ : std_logic;
SIGNAL \uart_block|T|TDR|reg:6:biti|int_q~q\ : std_logic;
SIGNAL \uart_block|T|TSR|muxes:6:muxi|o~0_combout\ : std_logic;
SIGNAL \uart_block|T|TSR|dffs:6:biti|int_q~q\ : std_logic;
SIGNAL \mux|o[5]~10_combout\ : std_logic;
SIGNAL \uart_block|T|TDR|reg:5:biti|int_q~q\ : std_logic;
SIGNAL \uart_block|T|TSR|muxes:5:muxi|o~0_combout\ : std_logic;
SIGNAL \uart_block|T|TSR|dffs:5:biti|int_q~q\ : std_logic;
SIGNAL \mux|o[4]~8_combout\ : std_logic;
SIGNAL \mux|o[4]~9_combout\ : std_logic;
SIGNAL \uart_block|T|TDR|reg:4:biti|int_q~q\ : std_logic;
SIGNAL \uart_block|T|TSR|muxes:4:muxi|o~0_combout\ : std_logic;
SIGNAL \uart_block|T|TSR|dffs:4:biti|int_q~q\ : std_logic;
SIGNAL \uart_block|T|TSR|muxes:3:muxi|o~0_combout\ : std_logic;
SIGNAL \uart_block|T|TSR|dffs:3:biti|int_q~q\ : std_logic;
SIGNAL \uart_block|T|TSR|muxes:2:muxi|o~0_combout\ : std_logic;
SIGNAL \uart_block|T|TSR|dffs:2:biti|int_q~q\ : std_logic;
SIGNAL \uart_block|T|TSR|muxes:1:muxi|o~0_combout\ : std_logic;
SIGNAL \uart_block|T|TSR|dffs:1:biti|int_q~q\ : std_logic;
SIGNAL \mux|o[0]~0_combout\ : std_logic;
SIGNAL \uart_block|T|TDR|reg:0:biti|int_q~q\ : std_logic;
SIGNAL \uart_block|T|TSR|mux0|o~0_combout\ : std_logic;
SIGNAL \uart_block|T|TSR|dffs:0:biti|int_q~q\ : std_logic;
SIGNAL \uart_block|T|output_mux|o[0]~0_combout\ : std_logic;
SIGNAL \uart_block|baudrate|divby41|int_count\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \uart_block|baudrate|divby8|int_count\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \lab3|sscs_debounce|int_currentState\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \uart_block|ALT_INV_counter_reset~combout\ : std_logic;
SIGNAL \uart_block|T|controller|ALT_INV_d0~2_combout\ : std_logic;
SIGNAL \lab3|controller|reset_counter|ALT_INV_int_q~q\ : std_logic;
SIGNAL \ALT_INV_GReset~inputclkctrl_outclk\ : std_logic;
SIGNAL \lab3|controller|ALT_INV_B~2_combout\ : std_logic;
SIGNAL \lab3|controller|ALT_INV_A~combout\ : std_logic;
SIGNAL \lab3|controller|dFFy1|ALT_INV_int_q~q\ : std_logic;

BEGIN

ww_MSC <= MSC;
ww_SSC <= SSC;
ww_GClock <= GClock;
ww_GReset <= GReset;
ww_SSCS <= SSCS;
ww_RxD <= RxD;
ww_BaudRateSel <= BaudRateSel;
MSTL <= ww_MSTL;
SSTL <= ww_SSTL;
TxD <= ww_TxD;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\uart_block|baudrate|mux|o~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \uart_block|baudrate|mux|o~combout\);

\uart_block|baudrate|divby8|int_clk~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \uart_block|baudrate|divby8|int_clk~q\);

\uart_block|baudrate|ripple_divby2:2:divby256_k|int_clk~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \uart_block|baudrate|ripple_divby2:2:divby256_k|int_clk~q\);

\uart_block|baudrate|ripple_divby2:1:divby256_k|int_clk~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \uart_block|baudrate|ripple_divby2:1:divby256_k|int_clk~q\);

\GClock~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \GClock~input_o\);

\uart_block|baudrate|divby41|int_clk~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \uart_block|baudrate|divby41|int_clk~q\);

\uart_block|baudrate|ripple_divby2:4:divby256_k|int_clk~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \uart_block|baudrate|ripple_divby2:4:divby256_k|int_clk~q\);

\uart_block|baudrate|divby256_0|int_clk~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \uart_block|baudrate|divby256_0|int_clk~q\);

\uart_block|baudrate|ripple_divby2:3:divby256_k|int_clk~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \uart_block|baudrate|ripple_divby2:3:divby256_k|int_clk~q\);

\uart_block|baudrate|ripple_divby2:5:divby256_k|int_clk~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \uart_block|baudrate|ripple_divby2:5:divby256_k|int_clk~q\);

\GReset~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \GReset~input_o\);
\uart_block|ALT_INV_counter_reset~combout\ <= NOT \uart_block|counter_reset~combout\;
\uart_block|T|controller|ALT_INV_d0~2_combout\ <= NOT \uart_block|T|controller|d0~2_combout\;
\lab3|controller|reset_counter|ALT_INV_int_q~q\ <= NOT \lab3|controller|reset_counter|int_q~q\;
\ALT_INV_GReset~inputclkctrl_outclk\ <= NOT \GReset~inputclkctrl_outclk\;
\lab3|controller|ALT_INV_B~2_combout\ <= NOT \lab3|controller|B~2_combout\;
\lab3|controller|ALT_INV_A~combout\ <= NOT \lab3|controller|A~combout\;
\lab3|controller|dFFy1|ALT_INV_int_q~q\ <= NOT \lab3|controller|dFFy1|int_q~q\;

-- Location: IOOBUF_X115_Y48_N2
\MSTL[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \lab3|controller|dFFy1|int_q~q\,
	devoe => ww_devoe,
	o => \MSTL[0]~output_o\);

-- Location: IOOBUF_X115_Y51_N2
\MSTL[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \lab3|controller|B~0_combout\,
	devoe => ww_devoe,
	o => \MSTL[1]~output_o\);

-- Location: IOOBUF_X115_Y47_N16
\MSTL[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \lab3|controller|ALT_INV_A~combout\,
	devoe => ww_devoe,
	o => \MSTL[2]~output_o\);

-- Location: IOOBUF_X115_Y49_N2
\SSTL[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \lab3|controller|dFFy1|ALT_INV_int_q~q\,
	devoe => ww_devoe,
	o => \SSTL[0]~output_o\);

-- Location: IOOBUF_X115_Y50_N2
\SSTL[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \lab3|controller|B~1_combout\,
	devoe => ww_devoe,
	o => \SSTL[1]~output_o\);

-- Location: IOOBUF_X115_Y50_N9
\SSTL[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \lab3|controller|ALT_INV_B~2_combout\,
	devoe => ww_devoe,
	o => \SSTL[2]~output_o\);

-- Location: IOOBUF_X115_Y52_N2
\TxD~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \uart_block|T|output_mux|o[0]~0_combout\,
	devoe => ww_devoe,
	o => \TxD~output_o\);

-- Location: IOIBUF_X0_Y36_N8
\GClock~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_GClock,
	o => \GClock~input_o\);

-- Location: CLKCTRL_G2
\GClock~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \GClock~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \GClock~inputclkctrl_outclk\);

-- Location: LCCOMB_X110_Y50_N8
\lab3|ssc_counter|reg|reg:0:biti|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \lab3|ssc_counter|reg|reg:0:biti|int_q~0_combout\ = !\lab3|ssc_counter|reg|reg:0:biti|int_q~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \lab3|ssc_counter|reg|reg:0:biti|int_q~q\,
	combout => \lab3|ssc_counter|reg|reg:0:biti|int_q~0_combout\);

-- Location: IOIBUF_X115_Y51_N8
\SSC[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SSC(2),
	o => \SSC[2]~input_o\);

-- Location: IOIBUF_X115_Y47_N22
\SSC[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SSC(3),
	o => \SSC[3]~input_o\);

-- Location: LCCOMB_X110_Y50_N24
\lab3|ssc_counter|reg|reg:2:biti|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \lab3|ssc_counter|reg|reg:2:biti|int_q~0_combout\ = \lab3|ssc_counter|reg|reg:2:biti|int_q~q\ $ (((\lab3|ssc_counter|reg|reg:1:biti|int_q~q\ & \lab3|ssc_counter|reg|reg:0:biti|int_q~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lab3|ssc_counter|reg|reg:1:biti|int_q~q\,
	datac => \lab3|ssc_counter|reg|reg:2:biti|int_q~q\,
	datad => \lab3|ssc_counter|reg|reg:0:biti|int_q~q\,
	combout => \lab3|ssc_counter|reg|reg:2:biti|int_q~0_combout\);

-- Location: FF_X110_Y50_N25
\lab3|ssc_counter|reg|reg:2:biti|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \GClock~inputclkctrl_outclk\,
	d => \lab3|ssc_counter|reg|reg:2:biti|int_q~0_combout\,
	clrn => \lab3|controller|reset_counter|ALT_INV_int_q~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \lab3|ssc_counter|reg|reg:2:biti|int_q~q\);

-- Location: LCCOMB_X110_Y50_N12
\lab3|controller|w~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \lab3|controller|w~4_combout\ = (\SSC[2]~input_o\ & (\lab3|ssc_counter|reg|reg:2:biti|int_q~q\ & (\SSC[3]~input_o\ $ (!\lab3|ssc_counter|reg|reg:3:biti|int_q~q\)))) # (!\SSC[2]~input_o\ & (!\lab3|ssc_counter|reg|reg:2:biti|int_q~q\ & (\SSC[3]~input_o\ $ 
-- (!\lab3|ssc_counter|reg|reg:3:biti|int_q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SSC[2]~input_o\,
	datab => \SSC[3]~input_o\,
	datac => \lab3|ssc_counter|reg|reg:3:biti|int_q~q\,
	datad => \lab3|ssc_counter|reg|reg:2:biti|int_q~q\,
	combout => \lab3|controller|w~4_combout\);

-- Location: IOIBUF_X115_Y48_N8
\SSC[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SSC(0),
	o => \SSC[0]~input_o\);

-- Location: IOIBUF_X115_Y49_N8
\SSC[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SSC(1),
	o => \SSC[1]~input_o\);

-- Location: LCCOMB_X110_Y50_N22
\lab3|controller|w~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \lab3|controller|w~3_combout\ = (\SSC[0]~input_o\ & (\lab3|ssc_counter|reg|reg:0:biti|int_q~q\ & (\SSC[1]~input_o\ $ (!\lab3|ssc_counter|reg|reg:1:biti|int_q~q\)))) # (!\SSC[0]~input_o\ & (!\lab3|ssc_counter|reg|reg:0:biti|int_q~q\ & (\SSC[1]~input_o\ $ 
-- (!\lab3|ssc_counter|reg|reg:1:biti|int_q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SSC[0]~input_o\,
	datab => \SSC[1]~input_o\,
	datac => \lab3|ssc_counter|reg|reg:0:biti|int_q~q\,
	datad => \lab3|ssc_counter|reg|reg:1:biti|int_q~q\,
	combout => \lab3|controller|w~3_combout\);

-- Location: IOIBUF_X115_Y52_N8
\SSCS~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SSCS,
	o => \SSCS~input_o\);

-- Location: LCCOMB_X109_Y50_N4
\lab3|sscs_debounce|int_nextState[0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \lab3|sscs_debounce|int_nextState[0]~1_combout\ = (!\lab3|sscs_debounce|int_currentState\(1) & (!\lab3|sscs_debounce|int_currentState\(0) & \SSCS~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \lab3|sscs_debounce|int_currentState\(1),
	datac => \lab3|sscs_debounce|int_currentState\(0),
	datad => \SSCS~input_o\,
	combout => \lab3|sscs_debounce|int_nextState[0]~1_combout\);

-- Location: FF_X109_Y50_N5
\lab3|sscs_debounce|int_currentState[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \GClock~inputclkctrl_outclk\,
	d => \lab3|sscs_debounce|int_nextState[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \lab3|sscs_debounce|int_currentState\(0));

-- Location: LCCOMB_X109_Y50_N10
\lab3|sscs_debounce|int_nextState[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \lab3|sscs_debounce|int_nextState[1]~0_combout\ = (\SSCS~input_o\ & ((\lab3|sscs_debounce|int_currentState\(0)) # (\lab3|sscs_debounce|int_currentState\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SSCS~input_o\,
	datab => \lab3|sscs_debounce|int_currentState\(0),
	datac => \lab3|sscs_debounce|int_currentState\(1),
	combout => \lab3|sscs_debounce|int_nextState[1]~0_combout\);

-- Location: FF_X109_Y50_N11
\lab3|sscs_debounce|int_currentState[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \GClock~inputclkctrl_outclk\,
	d => \lab3|sscs_debounce|int_nextState[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \lab3|sscs_debounce|int_currentState\(1));

-- Location: LCCOMB_X110_Y50_N28
\lab3|controller|dFFy0|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \lab3|controller|dFFy0|int_q~0_combout\ = \lab3|controller|dFFy0|int_q~q\ $ (\lab3|controller|w~5_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \lab3|controller|dFFy0|int_q~q\,
	datad => \lab3|controller|w~5_combout\,
	combout => \lab3|controller|dFFy0|int_q~0_combout\);

-- Location: IOIBUF_X58_Y0_N15
\GReset~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_GReset,
	o => \GReset~input_o\);

-- Location: CLKCTRL_G19
\GReset~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \GReset~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \GReset~inputclkctrl_outclk\);

-- Location: FF_X110_Y50_N29
\lab3|controller|dFFy0|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \GClock~inputclkctrl_outclk\,
	d => \lab3|controller|dFFy0|int_q~0_combout\,
	clrn => \ALT_INV_GReset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \lab3|controller|dFFy0|int_q~q\);

-- Location: LCCOMB_X109_Y50_N6
\lab3|controller|w~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \lab3|controller|w~2_combout\ = (!\lab3|controller|dFFy0|int_q~q\ & ((\lab3|controller|dFFy1|int_q~q\) # ((\lab3|sscs_debounce|int_currentState\(1) & !\lab3|sscs_debounce|int_currentState\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lab3|sscs_debounce|int_currentState\(1),
	datab => \lab3|controller|dFFy1|int_q~q\,
	datac => \lab3|sscs_debounce|int_currentState\(0),
	datad => \lab3|controller|dFFy0|int_q~q\,
	combout => \lab3|controller|w~2_combout\);

-- Location: LCCOMB_X110_Y50_N0
\lab3|controller|w~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \lab3|controller|w~1_combout\ = (\lab3|controller|dFFy0|int_q~q\ & \lab3|controller|w~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \lab3|controller|dFFy0|int_q~q\,
	datad => \lab3|controller|w~0_combout\,
	combout => \lab3|controller|w~1_combout\);

-- Location: LCCOMB_X110_Y50_N14
\lab3|controller|w~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \lab3|controller|w~5_combout\ = (\lab3|controller|w~1_combout\) # ((\lab3|controller|w~4_combout\ & (\lab3|controller|w~3_combout\ & \lab3|controller|w~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lab3|controller|w~4_combout\,
	datab => \lab3|controller|w~3_combout\,
	datac => \lab3|controller|w~2_combout\,
	datad => \lab3|controller|w~1_combout\,
	combout => \lab3|controller|w~5_combout\);

-- Location: FF_X110_Y50_N21
\lab3|controller|reset_counter|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \GClock~inputclkctrl_outclk\,
	asdata => \lab3|controller|w~5_combout\,
	clrn => \ALT_INV_GReset~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \lab3|controller|reset_counter|int_q~q\);

-- Location: FF_X110_Y50_N9
\lab3|ssc_counter|reg|reg:0:biti|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \GClock~inputclkctrl_outclk\,
	d => \lab3|ssc_counter|reg|reg:0:biti|int_q~0_combout\,
	clrn => \lab3|controller|reset_counter|ALT_INV_int_q~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \lab3|ssc_counter|reg|reg:0:biti|int_q~q\);

-- Location: LCCOMB_X110_Y50_N10
\lab3|ssc_counter|reg|reg:1:biti|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \lab3|ssc_counter|reg|reg:1:biti|int_q~0_combout\ = \lab3|ssc_counter|reg|reg:1:biti|int_q~q\ $ (\lab3|ssc_counter|reg|reg:0:biti|int_q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \lab3|ssc_counter|reg|reg:1:biti|int_q~q\,
	datad => \lab3|ssc_counter|reg|reg:0:biti|int_q~q\,
	combout => \lab3|ssc_counter|reg|reg:1:biti|int_q~0_combout\);

-- Location: FF_X110_Y50_N11
\lab3|ssc_counter|reg|reg:1:biti|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \GClock~inputclkctrl_outclk\,
	d => \lab3|ssc_counter|reg|reg:1:biti|int_q~0_combout\,
	clrn => \lab3|controller|reset_counter|ALT_INV_int_q~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \lab3|ssc_counter|reg|reg:1:biti|int_q~q\);

-- Location: LCCOMB_X110_Y50_N30
\lab3|ssc_counter|reg|reg:3:biti|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \lab3|ssc_counter|reg|reg:3:biti|int_q~0_combout\ = \lab3|ssc_counter|reg|reg:3:biti|int_q~q\ $ (((\lab3|ssc_counter|reg|reg:1:biti|int_q~q\ & (\lab3|ssc_counter|reg|reg:2:biti|int_q~q\ & \lab3|ssc_counter|reg|reg:0:biti|int_q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lab3|ssc_counter|reg|reg:1:biti|int_q~q\,
	datab => \lab3|ssc_counter|reg|reg:2:biti|int_q~q\,
	datac => \lab3|ssc_counter|reg|reg:3:biti|int_q~q\,
	datad => \lab3|ssc_counter|reg|reg:0:biti|int_q~q\,
	combout => \lab3|ssc_counter|reg|reg:3:biti|int_q~0_combout\);

-- Location: FF_X110_Y50_N31
\lab3|ssc_counter|reg|reg:3:biti|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \GClock~inputclkctrl_outclk\,
	d => \lab3|ssc_counter|reg|reg:3:biti|int_q~0_combout\,
	clrn => \lab3|controller|reset_counter|ALT_INV_int_q~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \lab3|ssc_counter|reg|reg:3:biti|int_q~q\);

-- Location: LCCOMB_X110_Y50_N2
\lab3|controller|w~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \lab3|controller|w~0_combout\ = (\lab3|ssc_counter|reg|reg:3:biti|int_q~q\ & (!\lab3|ssc_counter|reg|reg:1:biti|int_q~q\ & (!\lab3|ssc_counter|reg|reg:0:biti|int_q~q\ & !\lab3|ssc_counter|reg|reg:2:biti|int_q~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lab3|ssc_counter|reg|reg:3:biti|int_q~q\,
	datab => \lab3|ssc_counter|reg|reg:1:biti|int_q~q\,
	datac => \lab3|ssc_counter|reg|reg:0:biti|int_q~q\,
	datad => \lab3|ssc_counter|reg|reg:2:biti|int_q~q\,
	combout => \lab3|controller|w~0_combout\);

-- Location: LCCOMB_X109_Y50_N28
\lab3|controller|i_y1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \lab3|controller|i_y1~2_combout\ = ((!\lab3|controller|w~2_combout\) # (!\lab3|controller|w~4_combout\)) # (!\lab3|controller|w~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \lab3|controller|w~3_combout\,
	datac => \lab3|controller|w~4_combout\,
	datad => \lab3|controller|w~2_combout\,
	combout => \lab3|controller|i_y1~2_combout\);

-- Location: LCCOMB_X109_Y50_N20
\lab3|controller|i_y1~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \lab3|controller|i_y1~3_combout\ = \lab3|controller|dFFy1|int_q~q\ $ (((\lab3|controller|dFFy0|int_q~q\ & ((\lab3|controller|w~0_combout\) # (!\lab3|controller|i_y1~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lab3|controller|w~0_combout\,
	datab => \lab3|controller|dFFy0|int_q~q\,
	datac => \lab3|controller|dFFy1|int_q~q\,
	datad => \lab3|controller|i_y1~2_combout\,
	combout => \lab3|controller|i_y1~3_combout\);

-- Location: FF_X109_Y50_N21
\lab3|controller|dFFy1|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \GClock~inputclkctrl_outclk\,
	d => \lab3|controller|i_y1~3_combout\,
	clrn => \ALT_INV_GReset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \lab3|controller|dFFy1|int_q~q\);

-- Location: LCCOMB_X110_Y50_N18
\lab3|controller|B~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \lab3|controller|B~0_combout\ = (\lab3|controller|dFFy0|int_q~q\ & !\lab3|controller|dFFy1|int_q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \lab3|controller|dFFy0|int_q~q\,
	datad => \lab3|controller|dFFy1|int_q~q\,
	combout => \lab3|controller|B~0_combout\);

-- Location: LCCOMB_X110_Y50_N20
\lab3|controller|A\ : cycloneive_lcell_comb
-- Equation(s):
-- \lab3|controller|A~combout\ = (\lab3|controller|dFFy1|int_q~q\) # (\lab3|controller|dFFy0|int_q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \lab3|controller|dFFy1|int_q~q\,
	datad => \lab3|controller|dFFy0|int_q~q\,
	combout => \lab3|controller|A~combout\);

-- Location: LCCOMB_X110_Y50_N6
\lab3|controller|B~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \lab3|controller|B~1_combout\ = (\lab3|controller|dFFy0|int_q~q\ & \lab3|controller|dFFy1|int_q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \lab3|controller|dFFy0|int_q~q\,
	datad => \lab3|controller|dFFy1|int_q~q\,
	combout => \lab3|controller|B~1_combout\);

-- Location: LCCOMB_X110_Y50_N16
\lab3|controller|B~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \lab3|controller|B~2_combout\ = (\lab3|controller|dFFy0|int_q~q\) # (!\lab3|controller|dFFy1|int_q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \lab3|controller|dFFy0|int_q~q\,
	datad => \lab3|controller|dFFy1|int_q~q\,
	combout => \lab3|controller|B~2_combout\);

-- Location: LCCOMB_X58_Y72_N20
\uart_block|baudrate|divby41|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|baudrate|divby41|Add0~0_combout\ = \uart_block|baudrate|divby41|int_count\(0) $ (VCC)
-- \uart_block|baudrate|divby41|Add0~1\ = CARRY(\uart_block|baudrate|divby41|int_count\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_block|baudrate|divby41|int_count\(0),
	datad => VCC,
	combout => \uart_block|baudrate|divby41|Add0~0_combout\,
	cout => \uart_block|baudrate|divby41|Add0~1\);

-- Location: LCCOMB_X58_Y72_N10
\uart_block|baudrate|divby41|int_count~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|baudrate|divby41|int_count~1_combout\ = (\uart_block|baudrate|divby41|Add0~0_combout\ & (((\uart_block|baudrate|divby41|int_count\(4)) # (!\uart_block|baudrate|divby41|Equal0~0_combout\)) # (!\uart_block|baudrate|divby41|int_count\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_block|baudrate|divby41|Add0~0_combout\,
	datab => \uart_block|baudrate|divby41|int_count\(5),
	datac => \uart_block|baudrate|divby41|int_count\(4),
	datad => \uart_block|baudrate|divby41|Equal0~0_combout\,
	combout => \uart_block|baudrate|divby41|int_count~1_combout\);

-- Location: FF_X58_Y72_N11
\uart_block|baudrate|divby41|int_count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \GClock~inputclkctrl_outclk\,
	d => \uart_block|baudrate|divby41|int_count~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_block|baudrate|divby41|int_count\(0));

-- Location: LCCOMB_X58_Y72_N22
\uart_block|baudrate|divby41|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|baudrate|divby41|Add0~2_combout\ = (\uart_block|baudrate|divby41|int_count\(1) & (!\uart_block|baudrate|divby41|Add0~1\)) # (!\uart_block|baudrate|divby41|int_count\(1) & ((\uart_block|baudrate|divby41|Add0~1\) # (GND)))
-- \uart_block|baudrate|divby41|Add0~3\ = CARRY((!\uart_block|baudrate|divby41|Add0~1\) # (!\uart_block|baudrate|divby41|int_count\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uart_block|baudrate|divby41|int_count\(1),
	datad => VCC,
	cin => \uart_block|baudrate|divby41|Add0~1\,
	combout => \uart_block|baudrate|divby41|Add0~2_combout\,
	cout => \uart_block|baudrate|divby41|Add0~3\);

-- Location: FF_X58_Y72_N23
\uart_block|baudrate|divby41|int_count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \GClock~inputclkctrl_outclk\,
	d => \uart_block|baudrate|divby41|Add0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_block|baudrate|divby41|int_count\(1));

-- Location: LCCOMB_X58_Y72_N24
\uart_block|baudrate|divby41|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|baudrate|divby41|Add0~4_combout\ = (\uart_block|baudrate|divby41|int_count\(2) & (\uart_block|baudrate|divby41|Add0~3\ $ (GND))) # (!\uart_block|baudrate|divby41|int_count\(2) & (!\uart_block|baudrate|divby41|Add0~3\ & VCC))
-- \uart_block|baudrate|divby41|Add0~5\ = CARRY((\uart_block|baudrate|divby41|int_count\(2) & !\uart_block|baudrate|divby41|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \uart_block|baudrate|divby41|int_count\(2),
	datad => VCC,
	cin => \uart_block|baudrate|divby41|Add0~3\,
	combout => \uart_block|baudrate|divby41|Add0~4_combout\,
	cout => \uart_block|baudrate|divby41|Add0~5\);

-- Location: FF_X58_Y72_N25
\uart_block|baudrate|divby41|int_count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \GClock~inputclkctrl_outclk\,
	d => \uart_block|baudrate|divby41|Add0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_block|baudrate|divby41|int_count\(2));

-- Location: LCCOMB_X58_Y72_N18
\uart_block|baudrate|divby41|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|baudrate|divby41|Equal0~0_combout\ = (!\uart_block|baudrate|divby41|int_count\(0) & (\uart_block|baudrate|divby41|int_count\(3) & (!\uart_block|baudrate|divby41|int_count\(1) & !\uart_block|baudrate|divby41|int_count\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_block|baudrate|divby41|int_count\(0),
	datab => \uart_block|baudrate|divby41|int_count\(3),
	datac => \uart_block|baudrate|divby41|int_count\(1),
	datad => \uart_block|baudrate|divby41|int_count\(2),
	combout => \uart_block|baudrate|divby41|Equal0~0_combout\);

-- Location: LCCOMB_X58_Y72_N28
\uart_block|baudrate|divby41|Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|baudrate|divby41|Add0~8_combout\ = (\uart_block|baudrate|divby41|int_count\(4) & (\uart_block|baudrate|divby41|Add0~7\ $ (GND))) # (!\uart_block|baudrate|divby41|int_count\(4) & (!\uart_block|baudrate|divby41|Add0~7\ & VCC))
-- \uart_block|baudrate|divby41|Add0~9\ = CARRY((\uart_block|baudrate|divby41|int_count\(4) & !\uart_block|baudrate|divby41|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \uart_block|baudrate|divby41|int_count\(4),
	datad => VCC,
	cin => \uart_block|baudrate|divby41|Add0~7\,
	combout => \uart_block|baudrate|divby41|Add0~8_combout\,
	cout => \uart_block|baudrate|divby41|Add0~9\);

-- Location: LCCOMB_X58_Y72_N30
\uart_block|baudrate|divby41|Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|baudrate|divby41|Add0~10_combout\ = \uart_block|baudrate|divby41|Add0~9\ $ (\uart_block|baudrate|divby41|int_count\(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \uart_block|baudrate|divby41|int_count\(5),
	cin => \uart_block|baudrate|divby41|Add0~9\,
	combout => \uart_block|baudrate|divby41|Add0~10_combout\);

-- Location: LCCOMB_X58_Y72_N16
\uart_block|baudrate|divby41|int_count~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|baudrate|divby41|int_count~2_combout\ = (\uart_block|baudrate|divby41|Add0~10_combout\ & ((\uart_block|baudrate|divby41|int_count\(4)) # ((!\uart_block|baudrate|divby41|int_count\(5)) # (!\uart_block|baudrate|divby41|Equal0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_block|baudrate|divby41|int_count\(4),
	datab => \uart_block|baudrate|divby41|Equal0~0_combout\,
	datac => \uart_block|baudrate|divby41|int_count\(5),
	datad => \uart_block|baudrate|divby41|Add0~10_combout\,
	combout => \uart_block|baudrate|divby41|int_count~2_combout\);

-- Location: FF_X58_Y72_N17
\uart_block|baudrate|divby41|int_count[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \GClock~inputclkctrl_outclk\,
	d => \uart_block|baudrate|divby41|int_count~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_block|baudrate|divby41|int_count\(5));

-- Location: LCCOMB_X58_Y72_N26
\uart_block|baudrate|divby41|Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|baudrate|divby41|Add0~6_combout\ = (\uart_block|baudrate|divby41|int_count\(3) & (!\uart_block|baudrate|divby41|Add0~5\)) # (!\uart_block|baudrate|divby41|int_count\(3) & ((\uart_block|baudrate|divby41|Add0~5\) # (GND)))
-- \uart_block|baudrate|divby41|Add0~7\ = CARRY((!\uart_block|baudrate|divby41|Add0~5\) # (!\uart_block|baudrate|divby41|int_count\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \uart_block|baudrate|divby41|int_count\(3),
	datad => VCC,
	cin => \uart_block|baudrate|divby41|Add0~5\,
	combout => \uart_block|baudrate|divby41|Add0~6_combout\,
	cout => \uart_block|baudrate|divby41|Add0~7\);

-- Location: LCCOMB_X58_Y72_N14
\uart_block|baudrate|divby41|int_count~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|baudrate|divby41|int_count~0_combout\ = (\uart_block|baudrate|divby41|Add0~6_combout\ & ((\uart_block|baudrate|divby41|int_count\(4)) # ((!\uart_block|baudrate|divby41|Equal0~0_combout\) # (!\uart_block|baudrate|divby41|int_count\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_block|baudrate|divby41|int_count\(4),
	datab => \uart_block|baudrate|divby41|int_count\(5),
	datac => \uart_block|baudrate|divby41|Add0~6_combout\,
	datad => \uart_block|baudrate|divby41|Equal0~0_combout\,
	combout => \uart_block|baudrate|divby41|int_count~0_combout\);

-- Location: FF_X58_Y72_N15
\uart_block|baudrate|divby41|int_count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \GClock~inputclkctrl_outclk\,
	d => \uart_block|baudrate|divby41|int_count~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_block|baudrate|divby41|int_count\(3));

-- Location: FF_X58_Y72_N29
\uart_block|baudrate|divby41|int_count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \GClock~inputclkctrl_outclk\,
	d => \uart_block|baudrate|divby41|Add0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_block|baudrate|divby41|int_count\(4));

-- Location: LCCOMB_X58_Y72_N12
\uart_block|baudrate|divby41|int_clk~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|baudrate|divby41|int_clk~0_combout\ = \uart_block|baudrate|divby41|int_clk~q\ $ (((!\uart_block|baudrate|divby41|int_count\(4) & (\uart_block|baudrate|divby41|int_count\(5) & \uart_block|baudrate|divby41|Equal0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011010011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_block|baudrate|divby41|int_count\(4),
	datab => \uart_block|baudrate|divby41|int_count\(5),
	datac => \uart_block|baudrate|divby41|int_clk~q\,
	datad => \uart_block|baudrate|divby41|Equal0~0_combout\,
	combout => \uart_block|baudrate|divby41|int_clk~0_combout\);

-- Location: LCCOMB_X58_Y72_N8
\uart_block|baudrate|divby41|int_clk~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|baudrate|divby41|int_clk~feeder_combout\ = \uart_block|baudrate|divby41|int_clk~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_block|baudrate|divby41|int_clk~0_combout\,
	combout => \uart_block|baudrate|divby41|int_clk~feeder_combout\);

-- Location: FF_X58_Y72_N9
\uart_block|baudrate|divby41|int_clk\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \GClock~inputclkctrl_outclk\,
	d => \uart_block|baudrate|divby41|int_clk~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_block|baudrate|divby41|int_clk~q\);

-- Location: CLKCTRL_G13
\uart_block|baudrate|divby41|int_clk~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \uart_block|baudrate|divby41|int_clk~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \uart_block|baudrate|divby41|int_clk~clkctrl_outclk\);

-- Location: LCCOMB_X57_Y33_N20
\uart_block|baudrate|divby256_0|int_count~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|baudrate|divby256_0|int_count~0_combout\ = !\uart_block|baudrate|divby256_0|int_count~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \uart_block|baudrate|divby256_0|int_count~q\,
	combout => \uart_block|baudrate|divby256_0|int_count~0_combout\);

-- Location: FF_X57_Y33_N21
\uart_block|baudrate|divby256_0|int_count\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \uart_block|baudrate|divby41|int_clk~clkctrl_outclk\,
	d => \uart_block|baudrate|divby256_0|int_count~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_block|baudrate|divby256_0|int_count~q\);

-- Location: LCCOMB_X57_Y33_N6
\uart_block|baudrate|divby256_0|int_clk~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|baudrate|divby256_0|int_clk~0_combout\ = \uart_block|baudrate|divby256_0|int_clk~q\ $ (\uart_block|baudrate|divby256_0|int_count~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \uart_block|baudrate|divby256_0|int_clk~q\,
	datad => \uart_block|baudrate|divby256_0|int_count~q\,
	combout => \uart_block|baudrate|divby256_0|int_clk~0_combout\);

-- Location: LCCOMB_X57_Y33_N26
\uart_block|baudrate|divby256_0|int_clk~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|baudrate|divby256_0|int_clk~feeder_combout\ = \uart_block|baudrate|divby256_0|int_clk~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \uart_block|baudrate|divby256_0|int_clk~0_combout\,
	combout => \uart_block|baudrate|divby256_0|int_clk~feeder_combout\);

-- Location: FF_X57_Y33_N27
\uart_block|baudrate|divby256_0|int_clk\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \uart_block|baudrate|divby41|int_clk~clkctrl_outclk\,
	d => \uart_block|baudrate|divby256_0|int_clk~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_block|baudrate|divby256_0|int_clk~q\);

-- Location: CLKCTRL_G14
\uart_block|baudrate|divby256_0|int_clk~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \uart_block|baudrate|divby256_0|int_clk~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \uart_block|baudrate|divby256_0|int_clk~clkctrl_outclk\);

-- Location: LCCOMB_X57_Y33_N28
\uart_block|baudrate|ripple_divby2:1:divby256_k|int_count~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|baudrate|ripple_divby2:1:divby256_k|int_count~0_combout\ = !\uart_block|baudrate|ripple_divby2:1:divby256_k|int_count~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \uart_block|baudrate|ripple_divby2:1:divby256_k|int_count~q\,
	combout => \uart_block|baudrate|ripple_divby2:1:divby256_k|int_count~0_combout\);

-- Location: FF_X57_Y33_N29
\uart_block|baudrate|ripple_divby2:1:divby256_k|int_count\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \uart_block|baudrate|divby256_0|int_clk~clkctrl_outclk\,
	d => \uart_block|baudrate|ripple_divby2:1:divby256_k|int_count~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_block|baudrate|ripple_divby2:1:divby256_k|int_count~q\);

-- Location: LCCOMB_X57_Y33_N24
\uart_block|baudrate|ripple_divby2:1:divby256_k|int_clk~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|baudrate|ripple_divby2:1:divby256_k|int_clk~0_combout\ = \uart_block|baudrate|ripple_divby2:1:divby256_k|int_clk~q\ $ (\uart_block|baudrate|ripple_divby2:1:divby256_k|int_count~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \uart_block|baudrate|ripple_divby2:1:divby256_k|int_clk~q\,
	datad => \uart_block|baudrate|ripple_divby2:1:divby256_k|int_count~q\,
	combout => \uart_block|baudrate|ripple_divby2:1:divby256_k|int_clk~0_combout\);

-- Location: LCCOMB_X57_Y33_N0
\uart_block|baudrate|ripple_divby2:1:divby256_k|int_clk~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|baudrate|ripple_divby2:1:divby256_k|int_clk~feeder_combout\ = \uart_block|baudrate|ripple_divby2:1:divby256_k|int_clk~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \uart_block|baudrate|ripple_divby2:1:divby256_k|int_clk~0_combout\,
	combout => \uart_block|baudrate|ripple_divby2:1:divby256_k|int_clk~feeder_combout\);

-- Location: FF_X57_Y33_N1
\uart_block|baudrate|ripple_divby2:1:divby256_k|int_clk\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \uart_block|baudrate|divby256_0|int_clk~clkctrl_outclk\,
	d => \uart_block|baudrate|ripple_divby2:1:divby256_k|int_clk~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_block|baudrate|ripple_divby2:1:divby256_k|int_clk~q\);

-- Location: IOIBUF_X56_Y0_N15
\BaudRateSel[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_BaudRateSel(2),
	o => \BaudRateSel[2]~input_o\);

-- Location: IOIBUF_X56_Y0_N8
\BaudRateSel[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_BaudRateSel(1),
	o => \BaudRateSel[1]~input_o\);

-- Location: IOIBUF_X56_Y0_N1
\BaudRateSel[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_BaudRateSel(0),
	o => \BaudRateSel[0]~input_o\);

-- Location: LCCOMB_X58_Y1_N12
\uart_block|baudrate|mux|Equal6~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|baudrate|mux|Equal6~4_combout\ = (!\BaudRateSel[2]~input_o\ & (\BaudRateSel[1]~input_o\ & !\BaudRateSel[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BaudRateSel[2]~input_o\,
	datac => \BaudRateSel[1]~input_o\,
	datad => \BaudRateSel[0]~input_o\,
	combout => \uart_block|baudrate|mux|Equal6~4_combout\);

-- Location: CLKCTRL_G11
\uart_block|baudrate|ripple_divby2:1:divby256_k|int_clk~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \uart_block|baudrate|ripple_divby2:1:divby256_k|int_clk~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \uart_block|baudrate|ripple_divby2:1:divby256_k|int_clk~clkctrl_outclk\);

-- Location: LCCOMB_X58_Y1_N28
\uart_block|baudrate|ripple_divby2:2:divby256_k|int_count~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|baudrate|ripple_divby2:2:divby256_k|int_count~0_combout\ = !\uart_block|baudrate|ripple_divby2:2:divby256_k|int_count~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \uart_block|baudrate|ripple_divby2:2:divby256_k|int_count~q\,
	combout => \uart_block|baudrate|ripple_divby2:2:divby256_k|int_count~0_combout\);

-- Location: FF_X58_Y1_N29
\uart_block|baudrate|ripple_divby2:2:divby256_k|int_count\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \uart_block|baudrate|ripple_divby2:1:divby256_k|int_clk~clkctrl_outclk\,
	d => \uart_block|baudrate|ripple_divby2:2:divby256_k|int_count~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_block|baudrate|ripple_divby2:2:divby256_k|int_count~q\);

-- Location: LCCOMB_X58_Y1_N26
\uart_block|baudrate|ripple_divby2:2:divby256_k|int_clk~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|baudrate|ripple_divby2:2:divby256_k|int_clk~0_combout\ = \uart_block|baudrate|ripple_divby2:2:divby256_k|int_clk~q\ $ (\uart_block|baudrate|ripple_divby2:2:divby256_k|int_count~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \uart_block|baudrate|ripple_divby2:2:divby256_k|int_clk~q\,
	datad => \uart_block|baudrate|ripple_divby2:2:divby256_k|int_count~q\,
	combout => \uart_block|baudrate|ripple_divby2:2:divby256_k|int_clk~0_combout\);

-- Location: FF_X58_Y1_N19
\uart_block|baudrate|ripple_divby2:2:divby256_k|int_clk\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \uart_block|baudrate|ripple_divby2:1:divby256_k|int_clk~clkctrl_outclk\,
	asdata => \uart_block|baudrate|ripple_divby2:2:divby256_k|int_clk~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_block|baudrate|ripple_divby2:2:divby256_k|int_clk~q\);

-- Location: CLKCTRL_G16
\uart_block|baudrate|ripple_divby2:2:divby256_k|int_clk~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \uart_block|baudrate|ripple_divby2:2:divby256_k|int_clk~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \uart_block|baudrate|ripple_divby2:2:divby256_k|int_clk~clkctrl_outclk\);

-- Location: LCCOMB_X58_Y1_N2
\uart_block|baudrate|ripple_divby2:3:divby256_k|int_count~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|baudrate|ripple_divby2:3:divby256_k|int_count~0_combout\ = !\uart_block|baudrate|ripple_divby2:3:divby256_k|int_count~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \uart_block|baudrate|ripple_divby2:3:divby256_k|int_count~q\,
	combout => \uart_block|baudrate|ripple_divby2:3:divby256_k|int_count~0_combout\);

-- Location: FF_X58_Y1_N3
\uart_block|baudrate|ripple_divby2:3:divby256_k|int_count\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \uart_block|baudrate|ripple_divby2:2:divby256_k|int_clk~clkctrl_outclk\,
	d => \uart_block|baudrate|ripple_divby2:3:divby256_k|int_count~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_block|baudrate|ripple_divby2:3:divby256_k|int_count~q\);

-- Location: LCCOMB_X58_Y1_N14
\uart_block|baudrate|ripple_divby2:3:divby256_k|int_clk~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|baudrate|ripple_divby2:3:divby256_k|int_clk~0_combout\ = \uart_block|baudrate|ripple_divby2:3:divby256_k|int_clk~q\ $ (\uart_block|baudrate|ripple_divby2:3:divby256_k|int_count~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \uart_block|baudrate|ripple_divby2:3:divby256_k|int_clk~q\,
	datad => \uart_block|baudrate|ripple_divby2:3:divby256_k|int_count~q\,
	combout => \uart_block|baudrate|ripple_divby2:3:divby256_k|int_clk~0_combout\);

-- Location: FF_X58_Y1_N11
\uart_block|baudrate|ripple_divby2:3:divby256_k|int_clk\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \uart_block|baudrate|ripple_divby2:2:divby256_k|int_clk~clkctrl_outclk\,
	asdata => \uart_block|baudrate|ripple_divby2:3:divby256_k|int_clk~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_block|baudrate|ripple_divby2:3:divby256_k|int_clk~q\);

-- Location: CLKCTRL_G15
\uart_block|baudrate|ripple_divby2:3:divby256_k|int_clk~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \uart_block|baudrate|ripple_divby2:3:divby256_k|int_clk~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \uart_block|baudrate|ripple_divby2:3:divby256_k|int_clk~clkctrl_outclk\);

-- Location: LCCOMB_X57_Y1_N28
\uart_block|baudrate|ripple_divby2:4:divby256_k|int_count~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|baudrate|ripple_divby2:4:divby256_k|int_count~0_combout\ = !\uart_block|baudrate|ripple_divby2:4:divby256_k|int_count~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \uart_block|baudrate|ripple_divby2:4:divby256_k|int_count~q\,
	combout => \uart_block|baudrate|ripple_divby2:4:divby256_k|int_count~0_combout\);

-- Location: FF_X57_Y1_N29
\uart_block|baudrate|ripple_divby2:4:divby256_k|int_count\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \uart_block|baudrate|ripple_divby2:3:divby256_k|int_clk~clkctrl_outclk\,
	d => \uart_block|baudrate|ripple_divby2:4:divby256_k|int_count~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_block|baudrate|ripple_divby2:4:divby256_k|int_count~q\);

-- Location: LCCOMB_X57_Y1_N16
\uart_block|baudrate|ripple_divby2:4:divby256_k|int_clk~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|baudrate|ripple_divby2:4:divby256_k|int_clk~0_combout\ = \uart_block|baudrate|ripple_divby2:4:divby256_k|int_clk~q\ $ (\uart_block|baudrate|ripple_divby2:4:divby256_k|int_count~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \uart_block|baudrate|ripple_divby2:4:divby256_k|int_clk~q\,
	datad => \uart_block|baudrate|ripple_divby2:4:divby256_k|int_count~q\,
	combout => \uart_block|baudrate|ripple_divby2:4:divby256_k|int_clk~0_combout\);

-- Location: LCCOMB_X57_Y1_N20
\uart_block|baudrate|ripple_divby2:4:divby256_k|int_clk~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|baudrate|ripple_divby2:4:divby256_k|int_clk~feeder_combout\ = \uart_block|baudrate|ripple_divby2:4:divby256_k|int_clk~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \uart_block|baudrate|ripple_divby2:4:divby256_k|int_clk~0_combout\,
	combout => \uart_block|baudrate|ripple_divby2:4:divby256_k|int_clk~feeder_combout\);

-- Location: FF_X57_Y1_N21
\uart_block|baudrate|ripple_divby2:4:divby256_k|int_clk\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \uart_block|baudrate|ripple_divby2:3:divby256_k|int_clk~clkctrl_outclk\,
	d => \uart_block|baudrate|ripple_divby2:4:divby256_k|int_clk~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_block|baudrate|ripple_divby2:4:divby256_k|int_clk~q\);

-- Location: LCCOMB_X58_Y1_N18
\uart_block|baudrate|mux|Equal6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|baudrate|mux|Equal6~0_combout\ = (\BaudRateSel[1]~input_o\ & (\BaudRateSel[2]~input_o\ & !\BaudRateSel[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BaudRateSel[1]~input_o\,
	datab => \BaudRateSel[2]~input_o\,
	datad => \BaudRateSel[0]~input_o\,
	combout => \uart_block|baudrate|mux|Equal6~0_combout\);

-- Location: CLKCTRL_G18
\uart_block|baudrate|ripple_divby2:4:divby256_k|int_clk~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \uart_block|baudrate|ripple_divby2:4:divby256_k|int_clk~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \uart_block|baudrate|ripple_divby2:4:divby256_k|int_clk~clkctrl_outclk\);

-- Location: LCCOMB_X57_Y1_N18
\uart_block|baudrate|ripple_divby2:5:divby256_k|int_count~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|baudrate|ripple_divby2:5:divby256_k|int_count~0_combout\ = !\uart_block|baudrate|ripple_divby2:5:divby256_k|int_count~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \uart_block|baudrate|ripple_divby2:5:divby256_k|int_count~q\,
	combout => \uart_block|baudrate|ripple_divby2:5:divby256_k|int_count~0_combout\);

-- Location: FF_X57_Y1_N19
\uart_block|baudrate|ripple_divby2:5:divby256_k|int_count\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \uart_block|baudrate|ripple_divby2:4:divby256_k|int_clk~clkctrl_outclk\,
	d => \uart_block|baudrate|ripple_divby2:5:divby256_k|int_count~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_block|baudrate|ripple_divby2:5:divby256_k|int_count~q\);

-- Location: LCCOMB_X57_Y1_N24
\uart_block|baudrate|ripple_divby2:5:divby256_k|int_clk~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|baudrate|ripple_divby2:5:divby256_k|int_clk~0_combout\ = \uart_block|baudrate|ripple_divby2:5:divby256_k|int_clk~q\ $ (\uart_block|baudrate|ripple_divby2:5:divby256_k|int_count~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \uart_block|baudrate|ripple_divby2:5:divby256_k|int_clk~q\,
	datad => \uart_block|baudrate|ripple_divby2:5:divby256_k|int_count~q\,
	combout => \uart_block|baudrate|ripple_divby2:5:divby256_k|int_clk~0_combout\);

-- Location: LCCOMB_X57_Y1_N30
\uart_block|baudrate|ripple_divby2:5:divby256_k|int_clk~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|baudrate|ripple_divby2:5:divby256_k|int_clk~feeder_combout\ = \uart_block|baudrate|ripple_divby2:5:divby256_k|int_clk~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \uart_block|baudrate|ripple_divby2:5:divby256_k|int_clk~0_combout\,
	combout => \uart_block|baudrate|ripple_divby2:5:divby256_k|int_clk~feeder_combout\);

-- Location: FF_X57_Y1_N31
\uart_block|baudrate|ripple_divby2:5:divby256_k|int_clk\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \uart_block|baudrate|ripple_divby2:4:divby256_k|int_clk~clkctrl_outclk\,
	d => \uart_block|baudrate|ripple_divby2:5:divby256_k|int_clk~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_block|baudrate|ripple_divby2:5:divby256_k|int_clk~q\);

-- Location: CLKCTRL_G17
\uart_block|baudrate|ripple_divby2:5:divby256_k|int_clk~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \uart_block|baudrate|ripple_divby2:5:divby256_k|int_clk~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \uart_block|baudrate|ripple_divby2:5:divby256_k|int_clk~clkctrl_outclk\);

-- Location: LCCOMB_X56_Y1_N24
\uart_block|baudrate|ripple_divby2:6:divby256_k|int_count~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|baudrate|ripple_divby2:6:divby256_k|int_count~0_combout\ = !\uart_block|baudrate|ripple_divby2:6:divby256_k|int_count~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \uart_block|baudrate|ripple_divby2:6:divby256_k|int_count~q\,
	combout => \uart_block|baudrate|ripple_divby2:6:divby256_k|int_count~0_combout\);

-- Location: FF_X56_Y1_N25
\uart_block|baudrate|ripple_divby2:6:divby256_k|int_count\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \uart_block|baudrate|ripple_divby2:5:divby256_k|int_clk~clkctrl_outclk\,
	d => \uart_block|baudrate|ripple_divby2:6:divby256_k|int_count~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_block|baudrate|ripple_divby2:6:divby256_k|int_count~q\);

-- Location: LCCOMB_X56_Y1_N20
\uart_block|baudrate|ripple_divby2:6:divby256_k|int_clk~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|baudrate|ripple_divby2:6:divby256_k|int_clk~0_combout\ = \uart_block|baudrate|ripple_divby2:6:divby256_k|int_clk~q\ $ (\uart_block|baudrate|ripple_divby2:6:divby256_k|int_count~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \uart_block|baudrate|ripple_divby2:6:divby256_k|int_clk~q\,
	datad => \uart_block|baudrate|ripple_divby2:6:divby256_k|int_count~q\,
	combout => \uart_block|baudrate|ripple_divby2:6:divby256_k|int_clk~0_combout\);

-- Location: LCCOMB_X56_Y1_N26
\uart_block|baudrate|ripple_divby2:6:divby256_k|int_clk~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|baudrate|ripple_divby2:6:divby256_k|int_clk~feeder_combout\ = \uart_block|baudrate|ripple_divby2:6:divby256_k|int_clk~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \uart_block|baudrate|ripple_divby2:6:divby256_k|int_clk~0_combout\,
	combout => \uart_block|baudrate|ripple_divby2:6:divby256_k|int_clk~feeder_combout\);

-- Location: FF_X56_Y1_N27
\uart_block|baudrate|ripple_divby2:6:divby256_k|int_clk\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \uart_block|baudrate|ripple_divby2:5:divby256_k|int_clk~clkctrl_outclk\,
	d => \uart_block|baudrate|ripple_divby2:6:divby256_k|int_clk~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_block|baudrate|ripple_divby2:6:divby256_k|int_clk~q\);

-- Location: LCCOMB_X56_Y1_N28
\uart_block|baudrate|ripple_divby2:7:divby256_k|int_count~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|baudrate|ripple_divby2:7:divby256_k|int_count~0_combout\ = !\uart_block|baudrate|ripple_divby2:7:divby256_k|int_count~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \uart_block|baudrate|ripple_divby2:7:divby256_k|int_count~q\,
	combout => \uart_block|baudrate|ripple_divby2:7:divby256_k|int_count~0_combout\);

-- Location: FF_X56_Y1_N29
\uart_block|baudrate|ripple_divby2:7:divby256_k|int_count\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \uart_block|baudrate|ripple_divby2:6:divby256_k|int_clk~q\,
	d => \uart_block|baudrate|ripple_divby2:7:divby256_k|int_count~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_block|baudrate|ripple_divby2:7:divby256_k|int_count~q\);

-- Location: LCCOMB_X56_Y1_N18
\uart_block|baudrate|ripple_divby2:7:divby256_k|int_clk~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|baudrate|ripple_divby2:7:divby256_k|int_clk~0_combout\ = \uart_block|baudrate|ripple_divby2:7:divby256_k|int_clk~q\ $ (\uart_block|baudrate|ripple_divby2:7:divby256_k|int_count~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \uart_block|baudrate|ripple_divby2:7:divby256_k|int_clk~q\,
	datad => \uart_block|baudrate|ripple_divby2:7:divby256_k|int_count~q\,
	combout => \uart_block|baudrate|ripple_divby2:7:divby256_k|int_clk~0_combout\);

-- Location: FF_X56_Y1_N19
\uart_block|baudrate|ripple_divby2:7:divby256_k|int_clk\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \uart_block|baudrate|ripple_divby2:6:divby256_k|int_clk~q\,
	d => \uart_block|baudrate|ripple_divby2:7:divby256_k|int_clk~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_block|baudrate|ripple_divby2:7:divby256_k|int_clk~q\);

-- Location: LCCOMB_X56_Y1_N6
\uart_block|baudrate|mux|o~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|baudrate|mux|o~5_combout\ = (\uart_block|baudrate|mux|Equal6~0_combout\ & (\uart_block|baudrate|ripple_divby2:6:divby256_k|int_clk~q\)) # (!\uart_block|baudrate|mux|Equal6~0_combout\ & 
-- ((\uart_block|baudrate|ripple_divby2:7:divby256_k|int_clk~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_block|baudrate|mux|Equal6~0_combout\,
	datac => \uart_block|baudrate|ripple_divby2:6:divby256_k|int_clk~q\,
	datad => \uart_block|baudrate|ripple_divby2:7:divby256_k|int_clk~q\,
	combout => \uart_block|baudrate|mux|o~5_combout\);

-- Location: LCCOMB_X58_Y1_N10
\uart_block|baudrate|mux|Equal6~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|baudrate|mux|Equal6~1_combout\ = (!\BaudRateSel[1]~input_o\ & (\BaudRateSel[2]~input_o\ & \BaudRateSel[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BaudRateSel[1]~input_o\,
	datab => \BaudRateSel[2]~input_o\,
	datad => \BaudRateSel[0]~input_o\,
	combout => \uart_block|baudrate|mux|Equal6~1_combout\);

-- Location: LCCOMB_X57_Y1_N26
\uart_block|baudrate|mux|o~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|baudrate|mux|o~4_combout\ = (\uart_block|baudrate|mux|Equal6~1_combout\ & ((!\uart_block|baudrate|ripple_divby2:5:divby256_k|int_clk~q\))) # (!\uart_block|baudrate|mux|Equal6~1_combout\ & (!\uart_block|baudrate|mux|o~5_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \uart_block|baudrate|mux|o~5_combout\,
	datac => \uart_block|baudrate|ripple_divby2:5:divby256_k|int_clk~q\,
	datad => \uart_block|baudrate|mux|Equal6~1_combout\,
	combout => \uart_block|baudrate|mux|o~4_combout\);

-- Location: LCCOMB_X58_Y1_N24
\uart_block|baudrate|mux|Equal6~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|baudrate|mux|Equal6~2_combout\ = (\BaudRateSel[2]~input_o\ & (!\BaudRateSel[1]~input_o\ & !\BaudRateSel[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BaudRateSel[2]~input_o\,
	datac => \BaudRateSel[1]~input_o\,
	datad => \BaudRateSel[0]~input_o\,
	combout => \uart_block|baudrate|mux|Equal6~2_combout\);

-- Location: LCCOMB_X57_Y1_N6
\uart_block|baudrate|mux|o~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|baudrate|mux|o~3_combout\ = (\uart_block|baudrate|mux|Equal6~2_combout\ & (!\uart_block|baudrate|ripple_divby2:4:divby256_k|int_clk~q\)) # (!\uart_block|baudrate|mux|Equal6~2_combout\ & ((\uart_block|baudrate|mux|o~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \uart_block|baudrate|ripple_divby2:4:divby256_k|int_clk~q\,
	datac => \uart_block|baudrate|mux|o~4_combout\,
	datad => \uart_block|baudrate|mux|Equal6~2_combout\,
	combout => \uart_block|baudrate|mux|o~3_combout\);

-- Location: LCCOMB_X58_Y1_N20
\uart_block|baudrate|mux|Equal6~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|baudrate|mux|Equal6~3_combout\ = (!\BaudRateSel[2]~input_o\ & (\BaudRateSel[1]~input_o\ & \BaudRateSel[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BaudRateSel[2]~input_o\,
	datac => \BaudRateSel[1]~input_o\,
	datad => \BaudRateSel[0]~input_o\,
	combout => \uart_block|baudrate|mux|Equal6~3_combout\);

-- Location: LCCOMB_X58_Y1_N30
\uart_block|baudrate|mux|o~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|baudrate|mux|o~2_combout\ = (\uart_block|baudrate|mux|Equal6~3_combout\ & (\uart_block|baudrate|ripple_divby2:3:divby256_k|int_clk~q\)) # (!\uart_block|baudrate|mux|Equal6~3_combout\ & ((!\uart_block|baudrate|mux|o~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_block|baudrate|ripple_divby2:3:divby256_k|int_clk~q\,
	datac => \uart_block|baudrate|mux|o~3_combout\,
	datad => \uart_block|baudrate|mux|Equal6~3_combout\,
	combout => \uart_block|baudrate|mux|o~2_combout\);

-- Location: LCCOMB_X58_Y1_N6
\uart_block|baudrate|mux|o~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|baudrate|mux|o~1_combout\ = (\uart_block|baudrate|mux|Equal6~4_combout\ & ((!\uart_block|baudrate|ripple_divby2:2:divby256_k|int_clk~q\))) # (!\uart_block|baudrate|mux|Equal6~4_combout\ & (!\uart_block|baudrate|mux|o~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010110101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_block|baudrate|mux|Equal6~4_combout\,
	datac => \uart_block|baudrate|mux|o~2_combout\,
	datad => \uart_block|baudrate|ripple_divby2:2:divby256_k|int_clk~q\,
	combout => \uart_block|baudrate|mux|o~1_combout\);

-- Location: LCCOMB_X58_Y1_N4
\uart_block|baudrate|mux|Equal6~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|baudrate|mux|Equal6~5_combout\ = (!\BaudRateSel[2]~input_o\ & (!\BaudRateSel[1]~input_o\ & \BaudRateSel[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BaudRateSel[2]~input_o\,
	datac => \BaudRateSel[1]~input_o\,
	datad => \BaudRateSel[0]~input_o\,
	combout => \uart_block|baudrate|mux|Equal6~5_combout\);

-- Location: LCCOMB_X57_Y33_N18
\uart_block|baudrate|mux|o~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|baudrate|mux|o~0_combout\ = (\uart_block|baudrate|mux|Equal6~5_combout\ & (!\uart_block|baudrate|ripple_divby2:1:divby256_k|int_clk~q\)) # (!\uart_block|baudrate|mux|Equal6~5_combout\ & ((\uart_block|baudrate|mux|o~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \uart_block|baudrate|ripple_divby2:1:divby256_k|int_clk~q\,
	datac => \uart_block|baudrate|mux|o~1_combout\,
	datad => \uart_block|baudrate|mux|Equal6~5_combout\,
	combout => \uart_block|baudrate|mux|o~0_combout\);

-- Location: LCCOMB_X58_Y1_N22
\uart_block|baudrate|mux|Equal6~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|baudrate|mux|Equal6~6_combout\ = (!\BaudRateSel[2]~input_o\ & (!\BaudRateSel[1]~input_o\ & !\BaudRateSel[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BaudRateSel[2]~input_o\,
	datac => \BaudRateSel[1]~input_o\,
	datad => \BaudRateSel[0]~input_o\,
	combout => \uart_block|baudrate|mux|Equal6~6_combout\);

-- Location: LCCOMB_X57_Y33_N12
\uart_block|baudrate|mux|o\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|baudrate|mux|o~combout\ = LCELL((\uart_block|baudrate|mux|Equal6~6_combout\ & ((\uart_block|baudrate|divby256_0|int_clk~q\))) # (!\uart_block|baudrate|mux|Equal6~6_combout\ & (!\uart_block|baudrate|mux|o~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \uart_block|baudrate|mux|o~0_combout\,
	datac => \uart_block|baudrate|divby256_0|int_clk~q\,
	datad => \uart_block|baudrate|mux|Equal6~6_combout\,
	combout => \uart_block|baudrate|mux|o~combout\);

-- Location: CLKCTRL_G12
\uart_block|baudrate|mux|o~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \uart_block|baudrate|mux|o~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \uart_block|baudrate|mux|o~clkctrl_outclk\);

-- Location: LCCOMB_X1_Y36_N22
\uart_block|baudrate|divby8|int_count[0]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|baudrate|divby8|int_count[0]~2_combout\ = !\uart_block|baudrate|divby8|int_count\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \uart_block|baudrate|divby8|int_count\(0),
	combout => \uart_block|baudrate|divby8|int_count[0]~2_combout\);

-- Location: FF_X1_Y36_N23
\uart_block|baudrate|divby8|int_count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \uart_block|baudrate|mux|o~clkctrl_outclk\,
	d => \uart_block|baudrate|divby8|int_count[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_block|baudrate|divby8|int_count\(0));

-- Location: LCCOMB_X1_Y36_N24
\uart_block|baudrate|divby8|int_count[1]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|baudrate|divby8|int_count[1]~1_combout\ = \uart_block|baudrate|divby8|int_count\(1) $ (\uart_block|baudrate|divby8|int_count\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \uart_block|baudrate|divby8|int_count\(1),
	datad => \uart_block|baudrate|divby8|int_count\(0),
	combout => \uart_block|baudrate|divby8|int_count[1]~1_combout\);

-- Location: FF_X1_Y36_N25
\uart_block|baudrate|divby8|int_count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \uart_block|baudrate|mux|o~clkctrl_outclk\,
	d => \uart_block|baudrate|divby8|int_count[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_block|baudrate|divby8|int_count\(1));

-- Location: LCCOMB_X1_Y36_N26
\uart_block|baudrate|divby8|int_count[2]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|baudrate|divby8|int_count[2]~0_combout\ = \uart_block|baudrate|divby8|int_count\(2) $ (((\uart_block|baudrate|divby8|int_count\(1) & \uart_block|baudrate|divby8|int_count\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_block|baudrate|divby8|int_count\(1),
	datac => \uart_block|baudrate|divby8|int_count\(2),
	datad => \uart_block|baudrate|divby8|int_count\(0),
	combout => \uart_block|baudrate|divby8|int_count[2]~0_combout\);

-- Location: FF_X1_Y36_N27
\uart_block|baudrate|divby8|int_count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \uart_block|baudrate|mux|o~clkctrl_outclk\,
	d => \uart_block|baudrate|divby8|int_count[2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_block|baudrate|divby8|int_count\(2));

-- Location: LCCOMB_X1_Y36_N28
\uart_block|baudrate|divby8|int_clk~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|baudrate|divby8|int_clk~0_combout\ = \uart_block|baudrate|divby8|int_clk~q\ $ (((\uart_block|baudrate|divby8|int_count\(2) & (\uart_block|baudrate|divby8|int_count\(0) & \uart_block|baudrate|divby8|int_count\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_block|baudrate|divby8|int_count\(2),
	datab => \uart_block|baudrate|divby8|int_clk~q\,
	datac => \uart_block|baudrate|divby8|int_count\(0),
	datad => \uart_block|baudrate|divby8|int_count\(1),
	combout => \uart_block|baudrate|divby8|int_clk~0_combout\);

-- Location: LCCOMB_X1_Y36_N30
\uart_block|baudrate|divby8|int_clk~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|baudrate|divby8|int_clk~feeder_combout\ = \uart_block|baudrate|divby8|int_clk~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \uart_block|baudrate|divby8|int_clk~0_combout\,
	combout => \uart_block|baudrate|divby8|int_clk~feeder_combout\);

-- Location: FF_X1_Y36_N31
\uart_block|baudrate|divby8|int_clk\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \uart_block|baudrate|mux|o~clkctrl_outclk\,
	d => \uart_block|baudrate|divby8|int_clk~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_block|baudrate|divby8|int_clk~q\);

-- Location: CLKCTRL_G1
\uart_block|baudrate|divby8|int_clk~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \uart_block|baudrate|divby8|int_clk~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \uart_block|baudrate|divby8|int_clk~clkctrl_outclk\);

-- Location: LCCOMB_X113_Y50_N2
\uart_block|detect_inc|signal_prev~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|detect_inc|signal_prev~0_combout\ = (\GReset~input_o\) # ((!\uart_block|T|controller|DFF_0|int_q~q\ & !\uart_block|T|controller|DFF_1|int_q~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101110101011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \GReset~input_o\,
	datab => \uart_block|T|controller|DFF_0|int_q~q\,
	datac => \uart_block|T|controller|DFF_1|int_q~q\,
	combout => \uart_block|detect_inc|signal_prev~0_combout\);

-- Location: FF_X113_Y50_N3
\uart_block|detect_inc|signal_prev\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \uart_block|baudrate|divby8|int_clk~clkctrl_outclk\,
	d => \uart_block|detect_inc|signal_prev~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_block|detect_inc|signal_prev~q\);

-- Location: LCCOMB_X113_Y50_N4
\uart_block|detect_inc|process_0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|detect_inc|process_0~0_combout\ = (!\uart_block|detect_inc|signal_prev~q\ & (!\uart_block|T|controller|DFF_1|int_q~q\ & !\uart_block|T|controller|DFF_0|int_q~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \uart_block|detect_inc|signal_prev~q\,
	datac => \uart_block|T|controller|DFF_1|int_q~q\,
	datad => \uart_block|T|controller|DFF_0|int_q~q\,
	combout => \uart_block|detect_inc|process_0~0_combout\);

-- Location: FF_X113_Y50_N5
\uart_block|detect_inc|edge_detected\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \uart_block|baudrate|divby8|int_clk~clkctrl_outclk\,
	d => \uart_block|detect_inc|process_0~0_combout\,
	sclr => \GReset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_block|detect_inc|edge_detected~q\);

-- Location: LCCOMB_X112_Y50_N6
\uart_block|enable_tx|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|enable_tx|int_q~0_combout\ = !\uart_block|detect_inc|edge_detected~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \uart_block|detect_inc|edge_detected~q\,
	combout => \uart_block|enable_tx|int_q~0_combout\);

-- Location: FF_X112_Y50_N7
\uart_block|enable_tx|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \uart_block|baudrate|divby8|int_clk~clkctrl_outclk\,
	d => \uart_block|enable_tx|int_q~0_combout\,
	clrn => \ALT_INV_GReset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_block|enable_tx|int_q~q\);

-- Location: LCCOMB_X111_Y50_N14
\uart_block|T|controller|d0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|T|controller|d0~0_combout\ = (!\uart_block|T|controller|DFF_1|int_q~q\ & (!\uart_block|T|controller|DFF_0|int_q~q\ & !\uart_block|enable_tx|int_q~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_block|T|controller|DFF_1|int_q~q\,
	datab => \uart_block|T|controller|DFF_0|int_q~q\,
	datad => \uart_block|enable_tx|int_q~q\,
	combout => \uart_block|T|controller|d0~0_combout\);

-- Location: LCCOMB_X111_Y50_N0
\uart_block|T|controller|d0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|T|controller|d0~1_combout\ = (\uart_block|T|controller|d0~0_combout\) # ((\uart_block|T|controller|DFF_1|int_q~q\ & ((!\uart_block|T|counter|reg|reg:2:biti|int_q~0_combout\) # (!\uart_block|T|counter|reg|reg:2:biti|int_q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_block|T|counter|reg|reg:2:biti|int_q~q\,
	datab => \uart_block|T|controller|d0~0_combout\,
	datac => \uart_block|T|controller|DFF_1|int_q~q\,
	datad => \uart_block|T|counter|reg|reg:2:biti|int_q~0_combout\,
	combout => \uart_block|T|controller|d0~1_combout\);

-- Location: FF_X111_Y50_N1
\uart_block|T|controller|DFF_0|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \uart_block|baudrate|divby8|int_clk~clkctrl_outclk\,
	d => \uart_block|T|controller|d0~1_combout\,
	clrn => \ALT_INV_GReset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_block|T|controller|DFF_0|int_q~q\);

-- Location: LCCOMB_X111_Y50_N4
\uart_block|T|counter|reg|reg:0:biti|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|T|counter|reg|reg:0:biti|int_q~0_combout\ = \uart_block|T|counter|reg|reg:0:biti|int_q~q\ $ (((\uart_block|T|controller|DFF_0|int_q~q\ & \uart_block|T|controller|DFF_1|int_q~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \uart_block|T|controller|DFF_0|int_q~q\,
	datac => \uart_block|T|counter|reg|reg:0:biti|int_q~q\,
	datad => \uart_block|T|controller|DFF_1|int_q~q\,
	combout => \uart_block|T|counter|reg|reg:0:biti|int_q~0_combout\);

-- Location: LCCOMB_X111_Y50_N26
\uart_block|T|controller|d0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|T|controller|d0~2_combout\ = (!\uart_block|T|controller|DFF_1|int_q~q\ & !\uart_block|T|controller|DFF_0|int_q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \uart_block|T|controller|DFF_1|int_q~q\,
	datad => \uart_block|T|controller|DFF_0|int_q~q\,
	combout => \uart_block|T|controller|d0~2_combout\);

-- Location: FF_X111_Y50_N5
\uart_block|T|counter|reg|reg:0:biti|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \uart_block|baudrate|divby8|int_clk~clkctrl_outclk\,
	d => \uart_block|T|counter|reg|reg:0:biti|int_q~0_combout\,
	clrn => \uart_block|T|controller|ALT_INV_d0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_block|T|counter|reg|reg:0:biti|int_q~q\);

-- Location: LCCOMB_X111_Y50_N10
\uart_block|T|counter|reg|reg:1:biti|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|T|counter|reg|reg:1:biti|int_q~0_combout\ = \uart_block|T|counter|reg|reg:1:biti|int_q~q\ $ (((\uart_block|T|controller|DFF_0|int_q~q\ & (\uart_block|T|controller|DFF_1|int_q~q\ & \uart_block|T|counter|reg|reg:0:biti|int_q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_block|T|controller|DFF_0|int_q~q\,
	datab => \uart_block|T|controller|DFF_1|int_q~q\,
	datac => \uart_block|T|counter|reg|reg:1:biti|int_q~q\,
	datad => \uart_block|T|counter|reg|reg:0:biti|int_q~q\,
	combout => \uart_block|T|counter|reg|reg:1:biti|int_q~0_combout\);

-- Location: FF_X111_Y50_N11
\uart_block|T|counter|reg|reg:1:biti|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \uart_block|baudrate|divby8|int_clk~clkctrl_outclk\,
	d => \uart_block|T|counter|reg|reg:1:biti|int_q~0_combout\,
	clrn => \uart_block|T|controller|ALT_INV_d0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_block|T|counter|reg|reg:1:biti|int_q~q\);

-- Location: LCCOMB_X112_Y50_N28
\uart_block|T|counter|reg|reg:2:biti|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|T|counter|reg|reg:2:biti|int_q~0_combout\ = (\uart_block|T|controller|DFF_0|int_q~q\ & (\uart_block|T|controller|DFF_1|int_q~q\ & (\uart_block|T|counter|reg|reg:0:biti|int_q~q\ & \uart_block|T|counter|reg|reg:1:biti|int_q~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_block|T|controller|DFF_0|int_q~q\,
	datab => \uart_block|T|controller|DFF_1|int_q~q\,
	datac => \uart_block|T|counter|reg|reg:0:biti|int_q~q\,
	datad => \uart_block|T|counter|reg|reg:1:biti|int_q~q\,
	combout => \uart_block|T|counter|reg|reg:2:biti|int_q~0_combout\);

-- Location: LCCOMB_X111_Y50_N24
\uart_block|T|counter|reg|reg:2:biti|int_q~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|T|counter|reg|reg:2:biti|int_q~1_combout\ = \uart_block|T|counter|reg|reg:2:biti|int_q~q\ $ (\uart_block|T|counter|reg|reg:2:biti|int_q~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \uart_block|T|counter|reg|reg:2:biti|int_q~q\,
	datad => \uart_block|T|counter|reg|reg:2:biti|int_q~0_combout\,
	combout => \uart_block|T|counter|reg|reg:2:biti|int_q~1_combout\);

-- Location: FF_X111_Y50_N25
\uart_block|T|counter|reg|reg:2:biti|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \uart_block|baudrate|divby8|int_clk~clkctrl_outclk\,
	d => \uart_block|T|counter|reg|reg:2:biti|int_q~1_combout\,
	clrn => \uart_block|T|controller|ALT_INV_d0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_block|T|counter|reg|reg:2:biti|int_q~q\);

-- Location: LCCOMB_X111_Y50_N22
\uart_block|T|controller|DFF_1|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|T|controller|DFF_1|int_q~0_combout\ = (\uart_block|T|controller|DFF_0|int_q~q\ & (((!\uart_block|T|counter|reg|reg:2:biti|int_q~0_combout\)) # (!\uart_block|T|counter|reg|reg:2:biti|int_q~q\))) # (!\uart_block|T|controller|DFF_0|int_q~q\ & 
-- (((\uart_block|T|controller|DFF_1|int_q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111010011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_block|T|counter|reg|reg:2:biti|int_q~q\,
	datab => \uart_block|T|controller|DFF_0|int_q~q\,
	datac => \uart_block|T|controller|DFF_1|int_q~q\,
	datad => \uart_block|T|counter|reg|reg:2:biti|int_q~0_combout\,
	combout => \uart_block|T|controller|DFF_1|int_q~0_combout\);

-- Location: FF_X111_Y50_N23
\uart_block|T|controller|DFF_1|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \uart_block|baudrate|divby8|int_clk~clkctrl_outclk\,
	d => \uart_block|T|controller|DFF_1|int_q~0_combout\,
	clrn => \ALT_INV_GReset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_block|T|controller|DFF_1|int_q~q\);

-- Location: LCCOMB_X112_Y50_N8
\uart_block|counter|reg|reg:0:biti|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|counter|reg|reg:0:biti|int_q~0_combout\ = \uart_block|counter|reg|reg:0:biti|int_q~q\ $ (\uart_block|detect_inc|edge_detected~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \uart_block|counter|reg|reg:0:biti|int_q~q\,
	datad => \uart_block|detect_inc|edge_detected~q\,
	combout => \uart_block|counter|reg|reg:0:biti|int_q~0_combout\);

-- Location: LCCOMB_X112_Y50_N0
\uart_block|counter|reg|reg:2:biti|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|counter|reg|reg:2:biti|int_q~0_combout\ = \uart_block|counter|reg|reg:2:biti|int_q~q\ $ (((\uart_block|detect_inc|edge_detected~q\ & (\uart_block|counter|reg|reg:0:biti|int_q~q\ & \uart_block|counter|reg|reg:1:biti|int_q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_block|detect_inc|edge_detected~q\,
	datab => \uart_block|counter|reg|reg:0:biti|int_q~q\,
	datac => \uart_block|counter|reg|reg:2:biti|int_q~q\,
	datad => \uart_block|counter|reg|reg:1:biti|int_q~q\,
	combout => \uart_block|counter|reg|reg:2:biti|int_q~0_combout\);

-- Location: FF_X112_Y50_N1
\uart_block|counter|reg|reg:2:biti|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \uart_block|baudrate|divby8|int_clk~clkctrl_outclk\,
	d => \uart_block|counter|reg|reg:2:biti|int_q~0_combout\,
	clrn => \uart_block|ALT_INV_counter_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_block|counter|reg|reg:2:biti|int_q~q\);

-- Location: LCCOMB_X112_Y50_N16
\uart_block|counter_reset\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|counter_reset~combout\ = (\GReset~input_o\) # ((\uart_block|counter|reg|reg:1:biti|int_q~q\ & (!\uart_block|counter|reg|reg:0:biti|int_q~q\ & \uart_block|counter|reg|reg:2:biti|int_q~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \GReset~input_o\,
	datab => \uart_block|counter|reg|reg:1:biti|int_q~q\,
	datac => \uart_block|counter|reg|reg:0:biti|int_q~q\,
	datad => \uart_block|counter|reg|reg:2:biti|int_q~q\,
	combout => \uart_block|counter_reset~combout\);

-- Location: FF_X112_Y50_N9
\uart_block|counter|reg|reg:0:biti|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \uart_block|baudrate|divby8|int_clk~clkctrl_outclk\,
	d => \uart_block|counter|reg|reg:0:biti|int_q~0_combout\,
	clrn => \uart_block|ALT_INV_counter_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_block|counter|reg|reg:0:biti|int_q~q\);

-- Location: LCCOMB_X112_Y50_N14
\uart_block|counter|reg|reg:1:biti|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|counter|reg|reg:1:biti|int_q~0_combout\ = \uart_block|counter|reg|reg:1:biti|int_q~q\ $ (((\uart_block|counter|reg|reg:0:biti|int_q~q\ & \uart_block|detect_inc|edge_detected~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \uart_block|counter|reg|reg:0:biti|int_q~q\,
	datac => \uart_block|counter|reg|reg:1:biti|int_q~q\,
	datad => \uart_block|detect_inc|edge_detected~q\,
	combout => \uart_block|counter|reg|reg:1:biti|int_q~0_combout\);

-- Location: FF_X112_Y50_N15
\uart_block|counter|reg|reg:1:biti|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \uart_block|baudrate|divby8|int_clk~clkctrl_outclk\,
	d => \uart_block|counter|reg|reg:1:biti|int_q~0_combout\,
	clrn => \uart_block|ALT_INV_counter_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_block|counter|reg|reg:1:biti|int_q~q\);

-- Location: LCCOMB_X111_Y50_N30
\mux|o[4]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \mux|o[4]~1_combout\ = (!\uart_block|counter|reg|reg:1:biti|int_q~q\ & (\uart_block|counter|reg|reg:2:biti|int_q~q\ & !\uart_block|counter|reg|reg:0:biti|int_q~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_block|counter|reg|reg:1:biti|int_q~q\,
	datab => \uart_block|counter|reg|reg:2:biti|int_q~q\,
	datad => \uart_block|counter|reg|reg:0:biti|int_q~q\,
	combout => \mux|o[4]~1_combout\);

-- Location: LCCOMB_X111_Y50_N28
\mux|o[1]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \mux|o[1]~2_combout\ = (\uart_block|counter|reg|reg:1:biti|int_q~q\) # ((\uart_block|counter|reg|reg:0:biti|int_q~q\ & ((\lab3|controller|dFFy1|int_q~q\) # (!\lab3|controller|dFFy0|int_q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101010111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_block|counter|reg|reg:1:biti|int_q~q\,
	datab => \lab3|controller|dFFy0|int_q~q\,
	datac => \uart_block|counter|reg|reg:0:biti|int_q~q\,
	datad => \lab3|controller|dFFy1|int_q~q\,
	combout => \mux|o[1]~2_combout\);

-- Location: LCCOMB_X111_Y50_N6
\mux|o[1]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \mux|o[1]~3_combout\ = (\mux|o[4]~1_combout\ & (((!\uart_block|counter|reg|reg:2:biti|int_q~q\ & \mux|o[1]~2_combout\)) # (!\lab3|controller|B~1_combout\))) # (!\mux|o[4]~1_combout\ & (!\uart_block|counter|reg|reg:2:biti|int_q~q\ & 
-- ((\mux|o[1]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011101100001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mux|o[4]~1_combout\,
	datab => \uart_block|counter|reg|reg:2:biti|int_q~q\,
	datac => \lab3|controller|B~1_combout\,
	datad => \mux|o[1]~2_combout\,
	combout => \mux|o[1]~3_combout\);

-- Location: LCCOMB_X111_Y50_N8
\uart_block|T|controller|loadTDR~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|T|controller|loadTDR~0_combout\ = (!\uart_block|T|controller|DFF_1|int_q~q\ & \uart_block|T|controller|DFF_0|int_q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \uart_block|T|controller|DFF_1|int_q~q\,
	datad => \uart_block|T|controller|DFF_0|int_q~q\,
	combout => \uart_block|T|controller|loadTDR~0_combout\);

-- Location: FF_X111_Y50_N7
\uart_block|T|TDR|reg:1:biti|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \uart_block|baudrate|divby8|int_clk~clkctrl_outclk\,
	d => \mux|o[1]~3_combout\,
	clrn => \ALT_INV_GReset~inputclkctrl_outclk\,
	ena => \uart_block|T|controller|loadTDR~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_block|T|TDR|reg:1:biti|int_q~q\);

-- Location: LCCOMB_X111_Y50_N18
\mux|o[2]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \mux|o[2]~4_combout\ = (\uart_block|counter|reg|reg:2:biti|int_q~q\ & ((\uart_block|counter|reg|reg:0:biti|int_q~q\) # ((!\lab3|controller|dFFy0|int_q~q\ & \lab3|controller|dFFy1|int_q~q\)))) # (!\uart_block|counter|reg|reg:2:biti|int_q~q\ & 
-- (((!\lab3|controller|dFFy0|int_q~q\ & !\lab3|controller|dFFy1|int_q~q\)) # (!\uart_block|counter|reg|reg:0:biti|int_q~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010011110110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_block|counter|reg|reg:2:biti|int_q~q\,
	datab => \lab3|controller|dFFy0|int_q~q\,
	datac => \uart_block|counter|reg|reg:0:biti|int_q~q\,
	datad => \lab3|controller|dFFy1|int_q~q\,
	combout => \mux|o[2]~4_combout\);

-- Location: LCCOMB_X111_Y50_N20
\mux|o[2]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \mux|o[2]~5_combout\ = (\uart_block|counter|reg|reg:1:biti|int_q~q\ & (!\uart_block|counter|reg|reg:0:biti|int_q~q\ & (!\uart_block|counter|reg|reg:2:biti|int_q~q\))) # (!\uart_block|counter|reg|reg:1:biti|int_q~q\ & (((\mux|o[2]~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101011100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_block|counter|reg|reg:1:biti|int_q~q\,
	datab => \uart_block|counter|reg|reg:0:biti|int_q~q\,
	datac => \uart_block|counter|reg|reg:2:biti|int_q~q\,
	datad => \mux|o[2]~4_combout\,
	combout => \mux|o[2]~5_combout\);

-- Location: FF_X111_Y50_N21
\uart_block|T|TDR|reg:2:biti|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \uart_block|baudrate|divby8|int_clk~clkctrl_outclk\,
	d => \mux|o[2]~5_combout\,
	clrn => \ALT_INV_GReset~inputclkctrl_outclk\,
	ena => \uart_block|T|controller|loadTDR~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_block|T|TDR|reg:2:biti|int_q~q\);

-- Location: LCCOMB_X110_Y50_N26
\mux|o[3]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \mux|o[3]~6_combout\ = (\uart_block|counter|reg|reg:0:biti|int_q~q\ & (((\uart_block|counter|reg|reg:1:biti|int_q~q\)))) # (!\uart_block|counter|reg|reg:0:biti|int_q~q\ & (\lab3|controller|dFFy0|int_q~q\ & (!\uart_block|counter|reg|reg:1:biti|int_q~q\ & 
-- \lab3|controller|dFFy1|int_q~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_block|counter|reg|reg:0:biti|int_q~q\,
	datab => \lab3|controller|dFFy0|int_q~q\,
	datac => \uart_block|counter|reg|reg:1:biti|int_q~q\,
	datad => \lab3|controller|dFFy1|int_q~q\,
	combout => \mux|o[3]~6_combout\);

-- Location: LCCOMB_X110_Y50_N4
\mux|o[3]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \mux|o[3]~7_combout\ = (\uart_block|counter|reg|reg:0:biti|int_q~q\ & (!\mux|o[3]~6_combout\ & ((\uart_block|counter|reg|reg:2:biti|int_q~q\) # (\lab3|controller|B~0_combout\)))) # (!\uart_block|counter|reg|reg:0:biti|int_q~q\ & (((\mux|o[3]~6_combout\)) 
-- # (!\uart_block|counter|reg|reg:2:biti|int_q~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101101011001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_block|counter|reg|reg:0:biti|int_q~q\,
	datab => \uart_block|counter|reg|reg:2:biti|int_q~q\,
	datac => \mux|o[3]~6_combout\,
	datad => \lab3|controller|B~0_combout\,
	combout => \mux|o[3]~7_combout\);

-- Location: FF_X110_Y50_N5
\uart_block|T|TDR|reg:3:biti|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \uart_block|baudrate|divby8|int_clk~clkctrl_outclk\,
	d => \mux|o[3]~7_combout\,
	clrn => \ALT_INV_GReset~inputclkctrl_outclk\,
	ena => \uart_block|T|controller|loadTDR~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_block|T|TDR|reg:3:biti|int_q~q\);

-- Location: LCCOMB_X112_Y50_N30
\mux|o[6]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \mux|o[6]~11_combout\ = ((!\uart_block|counter|reg|reg:0:biti|int_q~q\ & !\uart_block|counter|reg|reg:1:biti|int_q~q\)) # (!\uart_block|counter|reg|reg:2:biti|int_q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \uart_block|counter|reg|reg:0:biti|int_q~q\,
	datac => \uart_block|counter|reg|reg:1:biti|int_q~q\,
	datad => \uart_block|counter|reg|reg:2:biti|int_q~q\,
	combout => \mux|o[6]~11_combout\);

-- Location: FF_X111_Y50_N15
\uart_block|T|TDR|reg:6:biti|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \uart_block|baudrate|divby8|int_clk~clkctrl_outclk\,
	asdata => \mux|o[6]~11_combout\,
	clrn => \ALT_INV_GReset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \uart_block|T|controller|loadTDR~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_block|T|TDR|reg:6:biti|int_q~q\);

-- Location: LCCOMB_X112_Y50_N22
\uart_block|T|TSR|muxes:6:muxi|o~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|T|TSR|muxes:6:muxi|o~0_combout\ = (\uart_block|T|TDR|reg:6:biti|int_q~q\ & ((!\uart_block|T|controller|DFF_0|int_q~q\) # (!\uart_block|T|controller|DFF_1|int_q~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \uart_block|T|controller|DFF_1|int_q~q\,
	datac => \uart_block|T|controller|DFF_0|int_q~q\,
	datad => \uart_block|T|TDR|reg:6:biti|int_q~q\,
	combout => \uart_block|T|TSR|muxes:6:muxi|o~0_combout\);

-- Location: FF_X112_Y50_N23
\uart_block|T|TSR|dffs:6:biti|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \uart_block|baudrate|divby8|int_clk~clkctrl_outclk\,
	d => \uart_block|T|TSR|muxes:6:muxi|o~0_combout\,
	clrn => \ALT_INV_GReset~inputclkctrl_outclk\,
	ena => \uart_block|T|controller|DFF_1|int_q~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_block|T|TSR|dffs:6:biti|int_q~q\);

-- Location: LCCOMB_X112_Y50_N20
\mux|o[5]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \mux|o[5]~10_combout\ = (!\uart_block|counter|reg|reg:1:biti|int_q~q\ & (\uart_block|counter|reg|reg:2:biti|int_q~q\ $ (\uart_block|counter|reg|reg:0:biti|int_q~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \uart_block|counter|reg|reg:2:biti|int_q~q\,
	datac => \uart_block|counter|reg|reg:0:biti|int_q~q\,
	datad => \uart_block|counter|reg|reg:1:biti|int_q~q\,
	combout => \mux|o[5]~10_combout\);

-- Location: FF_X111_Y50_N31
\uart_block|T|TDR|reg:5:biti|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \uart_block|baudrate|divby8|int_clk~clkctrl_outclk\,
	asdata => \mux|o[5]~10_combout\,
	clrn => \ALT_INV_GReset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \uart_block|T|controller|loadTDR~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_block|T|TDR|reg:5:biti|int_q~q\);

-- Location: LCCOMB_X112_Y50_N24
\uart_block|T|TSR|muxes:5:muxi|o~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|T|TSR|muxes:5:muxi|o~0_combout\ = (\uart_block|T|controller|DFF_0|int_q~q\ & ((\uart_block|T|controller|DFF_1|int_q~q\ & (\uart_block|T|TSR|dffs:6:biti|int_q~q\)) # (!\uart_block|T|controller|DFF_1|int_q~q\ & 
-- ((\uart_block|T|TDR|reg:5:biti|int_q~q\))))) # (!\uart_block|T|controller|DFF_0|int_q~q\ & (((\uart_block|T|TDR|reg:5:biti|int_q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_block|T|controller|DFF_0|int_q~q\,
	datab => \uart_block|T|controller|DFF_1|int_q~q\,
	datac => \uart_block|T|TSR|dffs:6:biti|int_q~q\,
	datad => \uart_block|T|TDR|reg:5:biti|int_q~q\,
	combout => \uart_block|T|TSR|muxes:5:muxi|o~0_combout\);

-- Location: FF_X112_Y50_N25
\uart_block|T|TSR|dffs:5:biti|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \uart_block|baudrate|divby8|int_clk~clkctrl_outclk\,
	d => \uart_block|T|TSR|muxes:5:muxi|o~0_combout\,
	clrn => \ALT_INV_GReset~inputclkctrl_outclk\,
	ena => \uart_block|T|controller|DFF_1|int_q~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_block|T|TSR|dffs:5:biti|int_q~q\);

-- Location: LCCOMB_X111_Y50_N2
\mux|o[4]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \mux|o[4]~8_combout\ = (\uart_block|counter|reg|reg:1:biti|int_q~q\) # ((\uart_block|counter|reg|reg:0:biti|int_q~q\ & ((\lab3|controller|dFFy0|int_q~q\) # (\lab3|controller|dFFy1|int_q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_block|counter|reg|reg:1:biti|int_q~q\,
	datab => \lab3|controller|dFFy0|int_q~q\,
	datac => \uart_block|counter|reg|reg:0:biti|int_q~q\,
	datad => \lab3|controller|dFFy1|int_q~q\,
	combout => \mux|o[4]~8_combout\);

-- Location: LCCOMB_X111_Y50_N16
\mux|o[4]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \mux|o[4]~9_combout\ = (\mux|o[4]~1_combout\ & ((\lab3|controller|B~2_combout\) # ((!\uart_block|counter|reg|reg:2:biti|int_q~q\ & \mux|o[4]~8_combout\)))) # (!\mux|o[4]~1_combout\ & (!\uart_block|counter|reg|reg:2:biti|int_q~q\ & 
-- ((\mux|o[4]~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mux|o[4]~1_combout\,
	datab => \uart_block|counter|reg|reg:2:biti|int_q~q\,
	datac => \lab3|controller|B~2_combout\,
	datad => \mux|o[4]~8_combout\,
	combout => \mux|o[4]~9_combout\);

-- Location: FF_X111_Y50_N17
\uart_block|T|TDR|reg:4:biti|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \uart_block|baudrate|divby8|int_clk~clkctrl_outclk\,
	d => \mux|o[4]~9_combout\,
	clrn => \ALT_INV_GReset~inputclkctrl_outclk\,
	ena => \uart_block|T|controller|loadTDR~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_block|T|TDR|reg:4:biti|int_q~q\);

-- Location: LCCOMB_X112_Y50_N18
\uart_block|T|TSR|muxes:4:muxi|o~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|T|TSR|muxes:4:muxi|o~0_combout\ = (\uart_block|T|controller|DFF_1|int_q~q\ & ((\uart_block|T|controller|DFF_0|int_q~q\ & (\uart_block|T|TSR|dffs:5:biti|int_q~q\)) # (!\uart_block|T|controller|DFF_0|int_q~q\ & 
-- ((\uart_block|T|TDR|reg:4:biti|int_q~q\))))) # (!\uart_block|T|controller|DFF_1|int_q~q\ & (((\uart_block|T|TDR|reg:4:biti|int_q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_block|T|TSR|dffs:5:biti|int_q~q\,
	datab => \uart_block|T|controller|DFF_1|int_q~q\,
	datac => \uart_block|T|TDR|reg:4:biti|int_q~q\,
	datad => \uart_block|T|controller|DFF_0|int_q~q\,
	combout => \uart_block|T|TSR|muxes:4:muxi|o~0_combout\);

-- Location: FF_X112_Y50_N19
\uart_block|T|TSR|dffs:4:biti|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \uart_block|baudrate|divby8|int_clk~clkctrl_outclk\,
	d => \uart_block|T|TSR|muxes:4:muxi|o~0_combout\,
	clrn => \ALT_INV_GReset~inputclkctrl_outclk\,
	ena => \uart_block|T|controller|DFF_1|int_q~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_block|T|TSR|dffs:4:biti|int_q~q\);

-- Location: LCCOMB_X112_Y50_N2
\uart_block|T|TSR|muxes:3:muxi|o~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|T|TSR|muxes:3:muxi|o~0_combout\ = (\uart_block|T|controller|DFF_0|int_q~q\ & ((\uart_block|T|controller|DFF_1|int_q~q\ & ((\uart_block|T|TSR|dffs:4:biti|int_q~q\))) # (!\uart_block|T|controller|DFF_1|int_q~q\ & 
-- (\uart_block|T|TDR|reg:3:biti|int_q~q\)))) # (!\uart_block|T|controller|DFF_0|int_q~q\ & (((\uart_block|T|TDR|reg:3:biti|int_q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_block|T|controller|DFF_0|int_q~q\,
	datab => \uart_block|T|controller|DFF_1|int_q~q\,
	datac => \uart_block|T|TDR|reg:3:biti|int_q~q\,
	datad => \uart_block|T|TSR|dffs:4:biti|int_q~q\,
	combout => \uart_block|T|TSR|muxes:3:muxi|o~0_combout\);

-- Location: FF_X112_Y50_N3
\uart_block|T|TSR|dffs:3:biti|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \uart_block|baudrate|divby8|int_clk~clkctrl_outclk\,
	d => \uart_block|T|TSR|muxes:3:muxi|o~0_combout\,
	clrn => \ALT_INV_GReset~inputclkctrl_outclk\,
	ena => \uart_block|T|controller|DFF_1|int_q~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_block|T|TSR|dffs:3:biti|int_q~q\);

-- Location: LCCOMB_X112_Y50_N10
\uart_block|T|TSR|muxes:2:muxi|o~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|T|TSR|muxes:2:muxi|o~0_combout\ = (\uart_block|T|controller|DFF_0|int_q~q\ & ((\uart_block|T|controller|DFF_1|int_q~q\ & ((\uart_block|T|TSR|dffs:3:biti|int_q~q\))) # (!\uart_block|T|controller|DFF_1|int_q~q\ & 
-- (\uart_block|T|TDR|reg:2:biti|int_q~q\)))) # (!\uart_block|T|controller|DFF_0|int_q~q\ & (\uart_block|T|TDR|reg:2:biti|int_q~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_block|T|controller|DFF_0|int_q~q\,
	datab => \uart_block|T|TDR|reg:2:biti|int_q~q\,
	datac => \uart_block|T|controller|DFF_1|int_q~q\,
	datad => \uart_block|T|TSR|dffs:3:biti|int_q~q\,
	combout => \uart_block|T|TSR|muxes:2:muxi|o~0_combout\);

-- Location: FF_X112_Y50_N11
\uart_block|T|TSR|dffs:2:biti|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \uart_block|baudrate|divby8|int_clk~clkctrl_outclk\,
	d => \uart_block|T|TSR|muxes:2:muxi|o~0_combout\,
	clrn => \ALT_INV_GReset~inputclkctrl_outclk\,
	ena => \uart_block|T|controller|DFF_1|int_q~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_block|T|TSR|dffs:2:biti|int_q~q\);

-- Location: LCCOMB_X112_Y50_N12
\uart_block|T|TSR|muxes:1:muxi|o~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|T|TSR|muxes:1:muxi|o~0_combout\ = (\uart_block|T|controller|DFF_0|int_q~q\ & ((\uart_block|T|controller|DFF_1|int_q~q\ & ((\uart_block|T|TSR|dffs:2:biti|int_q~q\))) # (!\uart_block|T|controller|DFF_1|int_q~q\ & 
-- (\uart_block|T|TDR|reg:1:biti|int_q~q\)))) # (!\uart_block|T|controller|DFF_0|int_q~q\ & (\uart_block|T|TDR|reg:1:biti|int_q~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_block|T|controller|DFF_0|int_q~q\,
	datab => \uart_block|T|TDR|reg:1:biti|int_q~q\,
	datac => \uart_block|T|controller|DFF_1|int_q~q\,
	datad => \uart_block|T|TSR|dffs:2:biti|int_q~q\,
	combout => \uart_block|T|TSR|muxes:1:muxi|o~0_combout\);

-- Location: FF_X112_Y50_N13
\uart_block|T|TSR|dffs:1:biti|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \uart_block|baudrate|divby8|int_clk~clkctrl_outclk\,
	d => \uart_block|T|TSR|muxes:1:muxi|o~0_combout\,
	clrn => \ALT_INV_GReset~inputclkctrl_outclk\,
	ena => \uart_block|T|controller|DFF_1|int_q~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_block|T|TSR|dffs:1:biti|int_q~q\);

-- Location: LCCOMB_X111_Y50_N12
\mux|o[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \mux|o[0]~0_combout\ = (\uart_block|counter|reg|reg:1:biti|int_q~q\ & (((!\uart_block|counter|reg|reg:2:biti|int_q~q\)))) # (!\uart_block|counter|reg|reg:1:biti|int_q~q\ & ((\uart_block|counter|reg|reg:0:biti|int_q~q\ & 
-- ((\uart_block|counter|reg|reg:2:biti|int_q~q\) # (!\lab3|controller|dFFy1|int_q~q\))) # (!\uart_block|counter|reg|reg:0:biti|int_q~q\ & ((\lab3|controller|dFFy1|int_q~q\) # (!\uart_block|counter|reg|reg:2:biti|int_q~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101101001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_block|counter|reg|reg:1:biti|int_q~q\,
	datab => \uart_block|counter|reg|reg:0:biti|int_q~q\,
	datac => \uart_block|counter|reg|reg:2:biti|int_q~q\,
	datad => \lab3|controller|dFFy1|int_q~q\,
	combout => \mux|o[0]~0_combout\);

-- Location: FF_X111_Y50_N13
\uart_block|T|TDR|reg:0:biti|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \uart_block|baudrate|divby8|int_clk~clkctrl_outclk\,
	d => \mux|o[0]~0_combout\,
	clrn => \ALT_INV_GReset~inputclkctrl_outclk\,
	ena => \uart_block|T|controller|loadTDR~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_block|T|TDR|reg:0:biti|int_q~q\);

-- Location: LCCOMB_X112_Y50_N4
\uart_block|T|TSR|mux0|o~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|T|TSR|mux0|o~0_combout\ = (\uart_block|T|controller|DFF_0|int_q~q\ & ((\uart_block|T|controller|DFF_1|int_q~q\ & (\uart_block|T|TSR|dffs:1:biti|int_q~q\)) # (!\uart_block|T|controller|DFF_1|int_q~q\ & 
-- ((\uart_block|T|TDR|reg:0:biti|int_q~q\))))) # (!\uart_block|T|controller|DFF_0|int_q~q\ & (((\uart_block|T|TDR|reg:0:biti|int_q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_block|T|controller|DFF_0|int_q~q\,
	datab => \uart_block|T|controller|DFF_1|int_q~q\,
	datac => \uart_block|T|TSR|dffs:1:biti|int_q~q\,
	datad => \uart_block|T|TDR|reg:0:biti|int_q~q\,
	combout => \uart_block|T|TSR|mux0|o~0_combout\);

-- Location: FF_X112_Y50_N5
\uart_block|T|TSR|dffs:0:biti|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \uart_block|baudrate|divby8|int_clk~clkctrl_outclk\,
	d => \uart_block|T|TSR|mux0|o~0_combout\,
	clrn => \ALT_INV_GReset~inputclkctrl_outclk\,
	ena => \uart_block|T|controller|DFF_1|int_q~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_block|T|TSR|dffs:0:biti|int_q~q\);

-- Location: LCCOMB_X112_Y50_N26
\uart_block|T|output_mux|o[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \uart_block|T|output_mux|o[0]~0_combout\ = ((\uart_block|T|controller|DFF_0|int_q~q\ & \uart_block|T|TSR|dffs:0:biti|int_q~q\)) # (!\uart_block|T|controller|DFF_1|int_q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \uart_block|T|controller|DFF_1|int_q~q\,
	datac => \uart_block|T|controller|DFF_0|int_q~q\,
	datad => \uart_block|T|TSR|dffs:0:biti|int_q~q\,
	combout => \uart_block|T|output_mux|o[0]~0_combout\);

-- Location: IOIBUF_X56_Y0_N22
\MSC[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_MSC(0),
	o => \MSC[0]~input_o\);

-- Location: IOIBUF_X96_Y0_N22
\MSC[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_MSC(1),
	o => \MSC[1]~input_o\);

-- Location: IOIBUF_X45_Y73_N1
\MSC[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_MSC(2),
	o => \MSC[2]~input_o\);

-- Location: IOIBUF_X115_Y27_N8
\MSC[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_MSC(3),
	o => \MSC[3]~input_o\);

-- Location: IOIBUF_X0_Y7_N8
\RxD~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_RxD,
	o => \RxD~input_o\);

ww_MSTL(0) <= \MSTL[0]~output_o\;

ww_MSTL(1) <= \MSTL[1]~output_o\;

ww_MSTL(2) <= \MSTL[2]~output_o\;

ww_SSTL(0) <= \SSTL[0]~output_o\;

ww_SSTL(1) <= \SSTL[1]~output_o\;

ww_SSTL(2) <= \SSTL[2]~output_o\;

ww_TxD <= \TxD~output_o\;
END structure;


