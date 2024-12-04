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

-- DATE "12/03/2024 21:44:55"

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

ENTITY 	transmitter IS
    PORT (
	BClk : IN std_logic;
	GReset : IN std_logic;
	Tx_start : IN std_logic;
	Data : IN std_logic_vector(7 DOWNTO 0);
	TxD : OUT std_logic;
	TDRE : OUT std_logic
	);
END transmitter;

-- Design Ports Information
-- TxD	=>  Location: PIN_E4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- TDRE	=>  Location: PIN_D5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- BClk	=>  Location: PIN_J1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- GReset	=>  Location: PIN_Y2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Tx_start	=>  Location: PIN_C6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data[0]	=>  Location: PIN_A3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data[1]	=>  Location: PIN_B3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data[2]	=>  Location: PIN_D4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data[3]	=>  Location: PIN_C5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data[4]	=>  Location: PIN_C4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data[5]	=>  Location: PIN_C3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data[6]	=>  Location: PIN_E5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data[7]	=>  Location: PIN_B4,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF transmitter IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_BClk : std_logic;
SIGNAL ww_GReset : std_logic;
SIGNAL ww_Tx_start : std_logic;
SIGNAL ww_Data : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_TxD : std_logic;
SIGNAL ww_TDRE : std_logic;
SIGNAL \GReset~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \BClk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \TxD~output_o\ : std_logic;
SIGNAL \TDRE~output_o\ : std_logic;
SIGNAL \BClk~input_o\ : std_logic;
SIGNAL \BClk~inputclkctrl_outclk\ : std_logic;
SIGNAL \counter|reg|reg:0:biti|int_q~0_combout\ : std_logic;
SIGNAL \controller|TDRE~combout\ : std_logic;
SIGNAL \counter|reg|reg:0:biti|int_q~q\ : std_logic;
SIGNAL \counter|reg|reg:1:biti|int_q~0_combout\ : std_logic;
SIGNAL \counter|reg|reg:1:biti|int_q~q\ : std_logic;
SIGNAL \Tx_start~input_o\ : std_logic;
SIGNAL \counter|reg|reg:2:biti|int_q~0_combout\ : std_logic;
SIGNAL \counter|reg|reg:2:biti|int_q~1_combout\ : std_logic;
SIGNAL \counter|reg|reg:2:biti|int_q~q\ : std_logic;
SIGNAL \controller|w~0_combout\ : std_logic;
SIGNAL \controller|d0~0_combout\ : std_logic;
SIGNAL \GReset~input_o\ : std_logic;
SIGNAL \GReset~inputclkctrl_outclk\ : std_logic;
SIGNAL \controller|DFF_0|int_q~q\ : std_logic;
SIGNAL \controller|DFF_1|int_q~0_combout\ : std_logic;
SIGNAL \controller|DFF_1|int_q~q\ : std_logic;
SIGNAL \Data[6]~input_o\ : std_logic;
SIGNAL \controller|loadTDR~0_combout\ : std_logic;
SIGNAL \TDR|reg:6:biti|int_q~q\ : std_logic;
SIGNAL \Data[7]~input_o\ : std_logic;
SIGNAL \TDR|reg:7:biti|int_q~feeder_combout\ : std_logic;
SIGNAL \TDR|reg:7:biti|int_q~q\ : std_logic;
SIGNAL \TSR|muxn_1|o~0_combout\ : std_logic;
SIGNAL \TSR|dffs:7:biti|int_q~q\ : std_logic;
SIGNAL \TSR|muxes:6:muxi|o~0_combout\ : std_logic;
SIGNAL \TSR|dffs:6:biti|int_q~q\ : std_logic;
SIGNAL \Data[5]~input_o\ : std_logic;
SIGNAL \TDR|reg:5:biti|int_q~feeder_combout\ : std_logic;
SIGNAL \TDR|reg:5:biti|int_q~q\ : std_logic;
SIGNAL \TSR|muxes:5:muxi|o~0_combout\ : std_logic;
SIGNAL \TSR|dffs:5:biti|int_q~q\ : std_logic;
SIGNAL \Data[4]~input_o\ : std_logic;
SIGNAL \TDR|reg:4:biti|int_q~feeder_combout\ : std_logic;
SIGNAL \TDR|reg:4:biti|int_q~q\ : std_logic;
SIGNAL \TSR|muxes:4:muxi|o~0_combout\ : std_logic;
SIGNAL \TSR|dffs:4:biti|int_q~q\ : std_logic;
SIGNAL \Data[3]~input_o\ : std_logic;
SIGNAL \TDR|reg:3:biti|int_q~feeder_combout\ : std_logic;
SIGNAL \TDR|reg:3:biti|int_q~q\ : std_logic;
SIGNAL \TSR|muxes:3:muxi|o~0_combout\ : std_logic;
SIGNAL \TSR|dffs:3:biti|int_q~q\ : std_logic;
SIGNAL \Data[2]~input_o\ : std_logic;
SIGNAL \TDR|reg:2:biti|int_q~feeder_combout\ : std_logic;
SIGNAL \TDR|reg:2:biti|int_q~q\ : std_logic;
SIGNAL \TSR|muxes:2:muxi|o~0_combout\ : std_logic;
SIGNAL \TSR|dffs:2:biti|int_q~q\ : std_logic;
SIGNAL \Data[1]~input_o\ : std_logic;
SIGNAL \TDR|reg:1:biti|int_q~q\ : std_logic;
SIGNAL \TSR|muxes:1:muxi|o~0_combout\ : std_logic;
SIGNAL \TSR|dffs:1:biti|int_q~q\ : std_logic;
SIGNAL \Data[0]~input_o\ : std_logic;
SIGNAL \TDR|reg:0:biti|int_q~q\ : std_logic;
SIGNAL \TSR|mux0|o~0_combout\ : std_logic;
SIGNAL \TSR|dffs:0:biti|int_q~q\ : std_logic;
SIGNAL \output_mux|o[0]~0_combout\ : std_logic;
SIGNAL \ALT_INV_GReset~inputclkctrl_outclk\ : std_logic;
SIGNAL \controller|ALT_INV_TDRE~combout\ : std_logic;

BEGIN

ww_BClk <= BClk;
ww_GReset <= GReset;
ww_Tx_start <= Tx_start;
ww_Data <= Data;
TxD <= ww_TxD;
TDRE <= ww_TDRE;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\GReset~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \GReset~input_o\);

\BClk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \BClk~input_o\);
\ALT_INV_GReset~inputclkctrl_outclk\ <= NOT \GReset~inputclkctrl_outclk\;
\controller|ALT_INV_TDRE~combout\ <= NOT \controller|TDRE~combout\;

-- Location: IOOBUF_X1_Y73_N9
\TxD~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \output_mux|o[0]~0_combout\,
	devoe => ww_devoe,
	o => \TxD~output_o\);

-- Location: IOOBUF_X3_Y73_N2
\TDRE~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \controller|TDRE~combout\,
	devoe => ww_devoe,
	o => \TDRE~output_o\);

-- Location: IOIBUF_X0_Y36_N8
\BClk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_BClk,
	o => \BClk~input_o\);

-- Location: CLKCTRL_G2
\BClk~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \BClk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \BClk~inputclkctrl_outclk\);

-- Location: LCCOMB_X4_Y72_N20
\counter|reg|reg:0:biti|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter|reg|reg:0:biti|int_q~0_combout\ = \counter|reg|reg:0:biti|int_q~q\ $ (((\controller|DFF_1|int_q~q\ & \controller|DFF_0|int_q~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \controller|DFF_1|int_q~q\,
	datac => \counter|reg|reg:0:biti|int_q~q\,
	datad => \controller|DFF_0|int_q~q\,
	combout => \counter|reg|reg:0:biti|int_q~0_combout\);

-- Location: LCCOMB_X4_Y72_N0
\controller|TDRE\ : cycloneive_lcell_comb
-- Equation(s):
-- \controller|TDRE~combout\ = (!\controller|DFF_0|int_q~q\ & !\controller|DFF_1|int_q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \controller|DFF_0|int_q~q\,
	datad => \controller|DFF_1|int_q~q\,
	combout => \controller|TDRE~combout\);

-- Location: FF_X4_Y72_N21
\counter|reg|reg:0:biti|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \BClk~inputclkctrl_outclk\,
	d => \counter|reg|reg:0:biti|int_q~0_combout\,
	clrn => \controller|ALT_INV_TDRE~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter|reg|reg:0:biti|int_q~q\);

-- Location: LCCOMB_X4_Y72_N26
\counter|reg|reg:1:biti|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter|reg|reg:1:biti|int_q~0_combout\ = \counter|reg|reg:1:biti|int_q~q\ $ (((\controller|DFF_1|int_q~q\ & (\counter|reg|reg:0:biti|int_q~q\ & \controller|DFF_0|int_q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \controller|DFF_1|int_q~q\,
	datab => \counter|reg|reg:0:biti|int_q~q\,
	datac => \counter|reg|reg:1:biti|int_q~q\,
	datad => \controller|DFF_0|int_q~q\,
	combout => \counter|reg|reg:1:biti|int_q~0_combout\);

-- Location: FF_X4_Y72_N27
\counter|reg|reg:1:biti|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \BClk~inputclkctrl_outclk\,
	d => \counter|reg|reg:1:biti|int_q~0_combout\,
	clrn => \controller|ALT_INV_TDRE~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter|reg|reg:1:biti|int_q~q\);

-- Location: IOIBUF_X5_Y73_N22
\Tx_start~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Tx_start,
	o => \Tx_start~input_o\);

-- Location: LCCOMB_X4_Y72_N30
\counter|reg|reg:2:biti|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter|reg|reg:2:biti|int_q~0_combout\ = (\counter|reg|reg:1:biti|int_q~q\ & (\controller|DFF_0|int_q~q\ & (\counter|reg|reg:0:biti|int_q~q\ & \controller|DFF_1|int_q~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \counter|reg|reg:1:biti|int_q~q\,
	datab => \controller|DFF_0|int_q~q\,
	datac => \counter|reg|reg:0:biti|int_q~q\,
	datad => \controller|DFF_1|int_q~q\,
	combout => \counter|reg|reg:2:biti|int_q~0_combout\);

-- Location: LCCOMB_X4_Y72_N12
\counter|reg|reg:2:biti|int_q~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter|reg|reg:2:biti|int_q~1_combout\ = \counter|reg|reg:2:biti|int_q~0_combout\ $ (\counter|reg|reg:2:biti|int_q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \counter|reg|reg:2:biti|int_q~0_combout\,
	datac => \counter|reg|reg:2:biti|int_q~q\,
	combout => \counter|reg|reg:2:biti|int_q~1_combout\);

-- Location: FF_X4_Y72_N13
\counter|reg|reg:2:biti|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \BClk~inputclkctrl_outclk\,
	d => \counter|reg|reg:2:biti|int_q~1_combout\,
	clrn => \controller|ALT_INV_TDRE~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter|reg|reg:2:biti|int_q~q\);

-- Location: LCCOMB_X4_Y72_N10
\controller|w~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \controller|w~0_combout\ = (\Tx_start~input_o\) # ((\counter|reg|reg:1:biti|int_q~q\ & (\counter|reg|reg:0:biti|int_q~q\ & \counter|reg|reg:2:biti|int_q~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \counter|reg|reg:1:biti|int_q~q\,
	datab => \Tx_start~input_o\,
	datac => \counter|reg|reg:0:biti|int_q~q\,
	datad => \counter|reg|reg:2:biti|int_q~q\,
	combout => \controller|w~0_combout\);

-- Location: LCCOMB_X4_Y72_N4
\controller|d0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \controller|d0~0_combout\ = (\controller|w~0_combout\ & ((!\controller|DFF_0|int_q~q\))) # (!\controller|w~0_combout\ & (\controller|DFF_1|int_q~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \controller|DFF_1|int_q~q\,
	datac => \controller|DFF_0|int_q~q\,
	datad => \controller|w~0_combout\,
	combout => \controller|d0~0_combout\);

-- Location: IOIBUF_X0_Y36_N15
\GReset~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_GReset,
	o => \GReset~input_o\);

-- Location: CLKCTRL_G4
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

-- Location: FF_X4_Y72_N5
\controller|DFF_0|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \BClk~inputclkctrl_outclk\,
	d => \controller|d0~0_combout\,
	clrn => \ALT_INV_GReset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \controller|DFF_0|int_q~q\);

-- Location: LCCOMB_X4_Y72_N6
\controller|DFF_1|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \controller|DFF_1|int_q~0_combout\ = (\controller|DFF_0|int_q~q\ & ((!\controller|w~0_combout\) # (!\controller|DFF_1|int_q~q\))) # (!\controller|DFF_0|int_q~q\ & (\controller|DFF_1|int_q~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \controller|DFF_0|int_q~q\,
	datac => \controller|DFF_1|int_q~q\,
	datad => \controller|w~0_combout\,
	combout => \controller|DFF_1|int_q~0_combout\);

-- Location: FF_X4_Y72_N7
\controller|DFF_1|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \BClk~inputclkctrl_outclk\,
	d => \controller|DFF_1|int_q~0_combout\,
	clrn => \ALT_INV_GReset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \controller|DFF_1|int_q~q\);

-- Location: IOIBUF_X1_Y73_N15
\Data[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data(6),
	o => \Data[6]~input_o\);

-- Location: LCCOMB_X4_Y72_N18
\controller|loadTDR~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \controller|loadTDR~0_combout\ = (\controller|DFF_0|int_q~q\ & !\controller|DFF_1|int_q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \controller|DFF_0|int_q~q\,
	datad => \controller|DFF_1|int_q~q\,
	combout => \controller|loadTDR~0_combout\);

-- Location: FF_X4_Y72_N9
\TDR|reg:6:biti|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \BClk~inputclkctrl_outclk\,
	asdata => \Data[6]~input_o\,
	clrn => \ALT_INV_GReset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \controller|loadTDR~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TDR|reg:6:biti|int_q~q\);

-- Location: IOIBUF_X7_Y73_N22
\Data[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data(7),
	o => \Data[7]~input_o\);

-- Location: LCCOMB_X4_Y72_N14
\TDR|reg:7:biti|int_q~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \TDR|reg:7:biti|int_q~feeder_combout\ = \Data[7]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Data[7]~input_o\,
	combout => \TDR|reg:7:biti|int_q~feeder_combout\);

-- Location: FF_X4_Y72_N15
\TDR|reg:7:biti|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \BClk~inputclkctrl_outclk\,
	d => \TDR|reg:7:biti|int_q~feeder_combout\,
	clrn => \ALT_INV_GReset~inputclkctrl_outclk\,
	ena => \controller|loadTDR~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TDR|reg:7:biti|int_q~q\);

-- Location: LCCOMB_X3_Y72_N24
\TSR|muxn_1|o~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \TSR|muxn_1|o~0_combout\ = (\TDR|reg:7:biti|int_q~q\) # ((\controller|DFF_0|int_q~q\ & \controller|DFF_1|int_q~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \controller|DFF_0|int_q~q\,
	datab => \TDR|reg:7:biti|int_q~q\,
	datad => \controller|DFF_1|int_q~q\,
	combout => \TSR|muxn_1|o~0_combout\);

-- Location: FF_X3_Y72_N25
\TSR|dffs:7:biti|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \BClk~inputclkctrl_outclk\,
	d => \TSR|muxn_1|o~0_combout\,
	clrn => \ALT_INV_GReset~inputclkctrl_outclk\,
	ena => \controller|DFF_1|int_q~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TSR|dffs:7:biti|int_q~q\);

-- Location: LCCOMB_X3_Y72_N10
\TSR|muxes:6:muxi|o~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \TSR|muxes:6:muxi|o~0_combout\ = (\controller|DFF_1|int_q~q\ & ((\controller|DFF_0|int_q~q\ & ((\TSR|dffs:7:biti|int_q~q\))) # (!\controller|DFF_0|int_q~q\ & (\TDR|reg:6:biti|int_q~q\)))) # (!\controller|DFF_1|int_q~q\ & (\TDR|reg:6:biti|int_q~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \controller|DFF_1|int_q~q\,
	datab => \TDR|reg:6:biti|int_q~q\,
	datac => \controller|DFF_0|int_q~q\,
	datad => \TSR|dffs:7:biti|int_q~q\,
	combout => \TSR|muxes:6:muxi|o~0_combout\);

-- Location: FF_X3_Y72_N11
\TSR|dffs:6:biti|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \BClk~inputclkctrl_outclk\,
	d => \TSR|muxes:6:muxi|o~0_combout\,
	clrn => \ALT_INV_GReset~inputclkctrl_outclk\,
	ena => \controller|DFF_1|int_q~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TSR|dffs:6:biti|int_q~q\);

-- Location: IOIBUF_X1_Y73_N22
\Data[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data(5),
	o => \Data[5]~input_o\);

-- Location: LCCOMB_X4_Y72_N22
\TDR|reg:5:biti|int_q~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \TDR|reg:5:biti|int_q~feeder_combout\ = \Data[5]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Data[5]~input_o\,
	combout => \TDR|reg:5:biti|int_q~feeder_combout\);

-- Location: FF_X4_Y72_N23
\TDR|reg:5:biti|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \BClk~inputclkctrl_outclk\,
	d => \TDR|reg:5:biti|int_q~feeder_combout\,
	clrn => \ALT_INV_GReset~inputclkctrl_outclk\,
	ena => \controller|loadTDR~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TDR|reg:5:biti|int_q~q\);

-- Location: LCCOMB_X3_Y72_N28
\TSR|muxes:5:muxi|o~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \TSR|muxes:5:muxi|o~0_combout\ = (\controller|DFF_0|int_q~q\ & ((\controller|DFF_1|int_q~q\ & (\TSR|dffs:6:biti|int_q~q\)) # (!\controller|DFF_1|int_q~q\ & ((\TDR|reg:5:biti|int_q~q\))))) # (!\controller|DFF_0|int_q~q\ & (((\TDR|reg:5:biti|int_q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TSR|dffs:6:biti|int_q~q\,
	datab => \TDR|reg:5:biti|int_q~q\,
	datac => \controller|DFF_0|int_q~q\,
	datad => \controller|DFF_1|int_q~q\,
	combout => \TSR|muxes:5:muxi|o~0_combout\);

-- Location: FF_X3_Y72_N29
\TSR|dffs:5:biti|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \BClk~inputclkctrl_outclk\,
	d => \TSR|muxes:5:muxi|o~0_combout\,
	clrn => \ALT_INV_GReset~inputclkctrl_outclk\,
	ena => \controller|DFF_1|int_q~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TSR|dffs:5:biti|int_q~q\);

-- Location: IOIBUF_X3_Y73_N22
\Data[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data(4),
	o => \Data[4]~input_o\);

-- Location: LCCOMB_X4_Y72_N28
\TDR|reg:4:biti|int_q~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \TDR|reg:4:biti|int_q~feeder_combout\ = \Data[4]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Data[4]~input_o\,
	combout => \TDR|reg:4:biti|int_q~feeder_combout\);

-- Location: FF_X4_Y72_N29
\TDR|reg:4:biti|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \BClk~inputclkctrl_outclk\,
	d => \TDR|reg:4:biti|int_q~feeder_combout\,
	clrn => \ALT_INV_GReset~inputclkctrl_outclk\,
	ena => \controller|loadTDR~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TDR|reg:4:biti|int_q~q\);

-- Location: LCCOMB_X3_Y72_N22
\TSR|muxes:4:muxi|o~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \TSR|muxes:4:muxi|o~0_combout\ = (\controller|DFF_1|int_q~q\ & ((\controller|DFF_0|int_q~q\ & (\TSR|dffs:5:biti|int_q~q\)) # (!\controller|DFF_0|int_q~q\ & ((\TDR|reg:4:biti|int_q~q\))))) # (!\controller|DFF_1|int_q~q\ & (((\TDR|reg:4:biti|int_q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \controller|DFF_1|int_q~q\,
	datab => \TSR|dffs:5:biti|int_q~q\,
	datac => \controller|DFF_0|int_q~q\,
	datad => \TDR|reg:4:biti|int_q~q\,
	combout => \TSR|muxes:4:muxi|o~0_combout\);

-- Location: FF_X3_Y72_N23
\TSR|dffs:4:biti|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \BClk~inputclkctrl_outclk\,
	d => \TSR|muxes:4:muxi|o~0_combout\,
	clrn => \ALT_INV_GReset~inputclkctrl_outclk\,
	ena => \controller|DFF_1|int_q~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TSR|dffs:4:biti|int_q~q\);

-- Location: IOIBUF_X3_Y73_N8
\Data[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data(3),
	o => \Data[3]~input_o\);

-- Location: LCCOMB_X4_Y72_N2
\TDR|reg:3:biti|int_q~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \TDR|reg:3:biti|int_q~feeder_combout\ = \Data[3]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Data[3]~input_o\,
	combout => \TDR|reg:3:biti|int_q~feeder_combout\);

-- Location: FF_X4_Y72_N3
\TDR|reg:3:biti|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \BClk~inputclkctrl_outclk\,
	d => \TDR|reg:3:biti|int_q~feeder_combout\,
	clrn => \ALT_INV_GReset~inputclkctrl_outclk\,
	ena => \controller|loadTDR~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TDR|reg:3:biti|int_q~q\);

-- Location: LCCOMB_X3_Y72_N0
\TSR|muxes:3:muxi|o~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \TSR|muxes:3:muxi|o~0_combout\ = (\controller|DFF_1|int_q~q\ & ((\controller|DFF_0|int_q~q\ & (\TSR|dffs:4:biti|int_q~q\)) # (!\controller|DFF_0|int_q~q\ & ((\TDR|reg:3:biti|int_q~q\))))) # (!\controller|DFF_1|int_q~q\ & (((\TDR|reg:3:biti|int_q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \controller|DFF_1|int_q~q\,
	datab => \controller|DFF_0|int_q~q\,
	datac => \TSR|dffs:4:biti|int_q~q\,
	datad => \TDR|reg:3:biti|int_q~q\,
	combout => \TSR|muxes:3:muxi|o~0_combout\);

-- Location: FF_X3_Y72_N1
\TSR|dffs:3:biti|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \BClk~inputclkctrl_outclk\,
	d => \TSR|muxes:3:muxi|o~0_combout\,
	clrn => \ALT_INV_GReset~inputclkctrl_outclk\,
	ena => \controller|DFF_1|int_q~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TSR|dffs:3:biti|int_q~q\);

-- Location: IOIBUF_X1_Y73_N1
\Data[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data(2),
	o => \Data[2]~input_o\);

-- Location: LCCOMB_X4_Y72_N24
\TDR|reg:2:biti|int_q~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \TDR|reg:2:biti|int_q~feeder_combout\ = \Data[2]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Data[2]~input_o\,
	combout => \TDR|reg:2:biti|int_q~feeder_combout\);

-- Location: FF_X4_Y72_N25
\TDR|reg:2:biti|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \BClk~inputclkctrl_outclk\,
	d => \TDR|reg:2:biti|int_q~feeder_combout\,
	clrn => \ALT_INV_GReset~inputclkctrl_outclk\,
	ena => \controller|loadTDR~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TDR|reg:2:biti|int_q~q\);

-- Location: LCCOMB_X3_Y72_N2
\TSR|muxes:2:muxi|o~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \TSR|muxes:2:muxi|o~0_combout\ = (\controller|DFF_1|int_q~q\ & ((\controller|DFF_0|int_q~q\ & (\TSR|dffs:3:biti|int_q~q\)) # (!\controller|DFF_0|int_q~q\ & ((\TDR|reg:2:biti|int_q~q\))))) # (!\controller|DFF_1|int_q~q\ & (((\TDR|reg:2:biti|int_q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \controller|DFF_1|int_q~q\,
	datab => \TSR|dffs:3:biti|int_q~q\,
	datac => \controller|DFF_0|int_q~q\,
	datad => \TDR|reg:2:biti|int_q~q\,
	combout => \TSR|muxes:2:muxi|o~0_combout\);

-- Location: FF_X3_Y72_N3
\TSR|dffs:2:biti|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \BClk~inputclkctrl_outclk\,
	d => \TSR|muxes:2:muxi|o~0_combout\,
	clrn => \ALT_INV_GReset~inputclkctrl_outclk\,
	ena => \controller|DFF_1|int_q~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TSR|dffs:2:biti|int_q~q\);

-- Location: IOIBUF_X5_Y73_N1
\Data[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data(1),
	o => \Data[1]~input_o\);

-- Location: FF_X4_Y72_N17
\TDR|reg:1:biti|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \BClk~inputclkctrl_outclk\,
	asdata => \Data[1]~input_o\,
	clrn => \ALT_INV_GReset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \controller|loadTDR~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TDR|reg:1:biti|int_q~q\);

-- Location: LCCOMB_X3_Y72_N12
\TSR|muxes:1:muxi|o~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \TSR|muxes:1:muxi|o~0_combout\ = (\controller|DFF_1|int_q~q\ & ((\controller|DFF_0|int_q~q\ & (\TSR|dffs:2:biti|int_q~q\)) # (!\controller|DFF_0|int_q~q\ & ((\TDR|reg:1:biti|int_q~q\))))) # (!\controller|DFF_1|int_q~q\ & (((\TDR|reg:1:biti|int_q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \controller|DFF_1|int_q~q\,
	datab => \TSR|dffs:2:biti|int_q~q\,
	datac => \controller|DFF_0|int_q~q\,
	datad => \TDR|reg:1:biti|int_q~q\,
	combout => \TSR|muxes:1:muxi|o~0_combout\);

-- Location: FF_X3_Y72_N13
\TSR|dffs:1:biti|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \BClk~inputclkctrl_outclk\,
	d => \TSR|muxes:1:muxi|o~0_combout\,
	clrn => \ALT_INV_GReset~inputclkctrl_outclk\,
	ena => \controller|DFF_1|int_q~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TSR|dffs:1:biti|int_q~q\);

-- Location: IOIBUF_X5_Y73_N8
\Data[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data(0),
	o => \Data[0]~input_o\);

-- Location: FF_X4_Y72_N19
\TDR|reg:0:biti|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \BClk~inputclkctrl_outclk\,
	asdata => \Data[0]~input_o\,
	clrn => \ALT_INV_GReset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \controller|loadTDR~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TDR|reg:0:biti|int_q~q\);

-- Location: LCCOMB_X3_Y72_N20
\TSR|mux0|o~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \TSR|mux0|o~0_combout\ = (\controller|DFF_0|int_q~q\ & ((\controller|DFF_1|int_q~q\ & (\TSR|dffs:1:biti|int_q~q\)) # (!\controller|DFF_1|int_q~q\ & ((\TDR|reg:0:biti|int_q~q\))))) # (!\controller|DFF_0|int_q~q\ & (((\TDR|reg:0:biti|int_q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TSR|dffs:1:biti|int_q~q\,
	datab => \controller|DFF_0|int_q~q\,
	datac => \TDR|reg:0:biti|int_q~q\,
	datad => \controller|DFF_1|int_q~q\,
	combout => \TSR|mux0|o~0_combout\);

-- Location: FF_X3_Y72_N21
\TSR|dffs:0:biti|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \BClk~inputclkctrl_outclk\,
	d => \TSR|mux0|o~0_combout\,
	clrn => \ALT_INV_GReset~inputclkctrl_outclk\,
	ena => \controller|DFF_1|int_q~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TSR|dffs:0:biti|int_q~q\);

-- Location: LCCOMB_X3_Y72_N6
\output_mux|o[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \output_mux|o[0]~0_combout\ = ((\controller|DFF_0|int_q~q\ & \TSR|dffs:0:biti|int_q~q\)) # (!\controller|DFF_1|int_q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \controller|DFF_1|int_q~q\,
	datac => \controller|DFF_0|int_q~q\,
	datad => \TSR|dffs:0:biti|int_q~q\,
	combout => \output_mux|o[0]~0_combout\);

ww_TxD <= \TxD~output_o\;

ww_TDRE <= \TDRE~output_o\;
END structure;


