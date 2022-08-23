##-----------------------------------------------------------------------------
##
## (c) Copyright 2016 Fairwaves, Inc. All rights reserved.
##
## This file contains confidential and proprietary information
## of Fairwaves, Inc. and is protected under U.S. and
## international copyright and other intellectual property
## laws.
##
## CRITICAL APPLICATIONS
## Fairwaves products are not designed or intended to be fail-
## safe, or for use in any application requiring fail-safe
## performance, such as life-support or safety devices or
## systems, Class III medical devices, nuclear facilities,
## applications related to the deployment of airbags, or any
## other applications that could lead to death, personal
## injury, or severe property or environmental damage
## (individually and collectively, "Critical
## Applications"). Customer assumes the sole risk and
## liability of any use of Fairwaves products in Critical
## Applications, subject only to applicable laws and
## regulations governing limitations on product liability.
##
## THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
## PART OF THIS FILE AT ALL TIMES.
##
##-----------------------------------------------------------------------------
## Project    : XTRXr2 SDR transceiver board based on Artix-7 with 1x/2x PCI Express
## File       : XTRXr2_ucf.xdc
## Version    : 1.0
#
################################################################################################
# User Configuration
# Link Width   - x2
# Link Speed   - gen2
# Family       - artix7
# Part         - xc7a35t
# Package      - cpg236
# Speed grade  - -2
# PCIe Block   - X0Y0
################################################################################################
#
################################################################################################
# User Time Names / User Time Groups / Time Specs
################################################################################################

################################################################################################
# User Physical Constraints
################################################################################################

set_property BITSTREAM.CONFIG.UNUSEDPIN Pulldown [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
set_property BITSTREAM.CONFIG.EXTMASTERCCLK_EN Disable [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 66 [current_design]
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property BITSTREAM.CONFIG.SPI_FALL_EDGE YES [current_design]
set_property BITSTREAM.config.SPI_opcode 0x6B [current_design ]
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]

################################################################################################
# Physical Constraints
################################################################################################
#
# SYS clock 100 MHz (input) signal. The sys_clk_p and sys_clk_n
# signals are the PCI Express reference clock. Virtex-7 GT
# Transceiver architecture requires the use of a dedicated clock
# resources (FPGA input pins) associated with each GT Transceiver.
# To use these pins an IBUFDS primitive (refclk_ibuf) is
# instantiated in user's design.
# Please refer to the Virtex-7 GT Transceiver User Guide
# (UG) for guidelines regarding clock resource selection.
#

#set_property LOC IBUFDS_GTE2_X0Y2 [get_cells refclk_ibuf]
#set_property LOC IBUFDS_GTE2_X0Y2 [get_cells refclk_ibuf]
set_false_path -from [get_ports sys_rst_n]

################################################################################################
# Timing Constraints
################################################################################################
#

create_clock -name usb_phy_clk -period 16 [get_ports usb_clk]


create_clock -name cfg_mclk -period 12  [get_nets cfg_mclk]
create_clock -name sys_clk -period 10   [get_ports sys_clk_p]

create_clock -name clk_vctcxo -period 20 [get_ports fpga_clk_vctcxo]


set_clock_groups -asynchronous -group [get_clocks -include_generated_clocks usb_phy_clk]
set_clock_groups -asynchronous -group [get_clocks -include_generated_clocks sys_clk]
set_clock_groups -asynchronous -group [get_clocks -include_generated_clocks clk_vctcxo]

set_property LOC MMCME2_ADV_X1Y1 [get_cells xlnx_pci_clocking/mmcm_i]

set_false_path -to [get_pins {xlnx_pci_clocking/pclk_i1_bufgctrl.pclk_i1/S0}]
set_false_path -to [get_pins {xlnx_pci_clocking/pclk_i1_bufgctrl.pclk_i1/S1}]
#
#
create_generated_clock -name clk_125mhz_x0y0 [get_pins xlnx_pci_clocking/mmcm_i/CLKOUT0]
create_generated_clock -name clk_250mhz_x0y0 [get_pins xlnx_pci_clocking/mmcm_i/CLKOUT1]
create_generated_clock -name clk_31mhz_x0y0 [get_pins xlnx_pci_clocking/mmcm_i/CLKOUT4]

create_generated_clock -name clk_125mhz_mux_x0y0 \
                        -source [get_pins xlnx_pci_clocking/pclk_i1_bufgctrl.pclk_i1/I0] \
                        -divide_by 1 \
                        [get_pins xlnx_pci_clocking/pclk_i1_bufgctrl.pclk_i1/O]
#
create_generated_clock -name clk_250mhz_mux_x0y0 \
                        -source [get_pins xlnx_pci_clocking/pclk_i1_bufgctrl.pclk_i1/I1] \
                        -divide_by 1 -add -master_clock [get_clocks -of [get_pins xlnx_pci_clocking/pclk_i1_bufgctrl.pclk_i1/I1]] \
                        [get_pins xlnx_pci_clocking/pclk_i1_bufgctrl.pclk_i1/O]
#
set_clock_groups -name pcieclkmux -physically_exclusive -group clk_125mhz_mux_x0y0 -group clk_250mhz_mux_x0y0



create_generated_clock -name clk_userclk_mux \
                        -source [get_pins userclk_c_bufg/I0] \
                        -divide_by 1 \
                        [get_pins userclk_c_bufg/O]
#
create_generated_clock -name clk_cfgmclk_mux \
                        -source [get_pins userclk_c_bufg/I1] \
                        -divide_by 1 -add -master_clock [get_clocks -of [get_pins userclk_c_bufg/I1]] \
                        [get_pins userclk_c_bufg/O]
#
set_clock_groups -name userclkmux -physically_exclusive -group clk_userclk_mux -group clk_cfgmclk_mux


set_false_path -from [get_clocks -of [get_pins userclk_c_bufg/I0]] -to [get_clocks -of [get_pins userclk_c_bufg/I1]]
set_false_path -from [get_clocks -of [get_pins userclk_c_bufg/I1]] -to [get_clocks -of [get_pins userclk_c_bufg/I0]]

set_false_path -from [get_clocks -of [get_pins userclk_c_bufg/I0]] -to [get_clocks clk_cfgmclk_mux]
set_false_path -from [get_clocks clk_cfgmclk_mux] -to [get_clocks -of [get_pins userclk_c_bufg/I0]]

#set_false_path -from [get_clocks -of [get_pins userclk_c_bufg/I1]] -to [get_clocks -of [get_pins userclk_c_bufg/O]]

#set_false_path -from [get_clocks clk_cfgmclk_mux] -to [get_clocks clk_31mhz_x0y0]
#set_false_path -from [get_clocks clk_31mhz_x0y0] -to [get_clocks clk_cfgmclk_mux]



create_clock -name rx_mclk_in -period 2.5 [get_ports lms_o_mclk2]
create_clock -name tx_mclk_in -period 2.5 [get_ports lms_o_mclk1]


# LML Port 1
set_property LOC OUT_FIFO_X0Y0   [get_cells lml_tx/tx_fifo.out_fifo]
set_property LOC IN_FIFO_X0Y0    [get_cells lml_tx/rx_fifo.in_fifo]
set_property LOC MMCME2_ADV_X0Y0 [get_cells lml_tx/mmcm_gen.mmcme2]

create_generated_clock -name tx_fclk      -source [get_pins lml_tx/mmcm_gen.mmcme2/CLKIN1] [get_pins lml_tx/mmcm_gen.mmcme2/CLKOUT0]
create_generated_clock -name tx_int_clk   -source [get_pins lml_tx/mmcm_gen.mmcme2/CLKIN1] [get_pins lml_tx/mmcm_gen.mmcme2/CLKOUT1]
create_generated_clock -name tx_data_clk  -source [get_pins lml_tx/mmcm_gen.mmcme2/CLKIN1] [get_pins lml_tx/mmcm_gen.mmcme2/CLKOUT4]

set_false_path -from [get_clocks tx_data_clk] -to [get_clocks tx_int_clk]
set_false_path -from [get_clocks tx_int_clk] -to [get_clocks tx_data_clk]

set_false_path -from [get_clocks tx_data_clk] -to [get_clocks phy_fclk_clk_div_1]
set_false_path -from [get_clocks tx_data_clk] -to [get_clocks phy_fclk_clk_div]

set_false_path -from [get_clocks -of_objects [get_pins lml_tx/tx_fifo.out_fifo/WRCLK]] -to [get_clocks -of_objects [get_nets lml_tx/phy_tx_data_clk_div]]


# LML Port 2
set_property LOC OUT_FIFO_X1Y1   [get_cells lml_rx/tx_fifo.out_fifo]
set_property LOC IN_FIFO_X1Y1    [get_cells lml_rx/rx_fifo.in_fifo]
set_property LOC MMCME2_ADV_X1Y0 [get_cells lml_rx/mmcm_gen.mmcme2]

create_generated_clock -name rx_fclk      -source [get_pins lml_rx/mmcm_gen.mmcme2/CLKIN1] [get_pins lml_rx/mmcm_gen.mmcme2/CLKOUT0]
create_generated_clock -name rx_int_clk   -source [get_pins lml_rx/mmcm_gen.mmcme2/CLKIN1] [get_pins lml_rx/mmcm_gen.mmcme2/CLKOUT1]
create_generated_clock -name rx_data_clk  -source [get_pins lml_rx/mmcm_gen.mmcme2/CLKIN1] [get_pins lml_rx/mmcm_gen.mmcme2/CLKOUT4]

set_false_path -from [get_clocks rx_data_clk] -to [get_clocks rx_int_clk]
set_false_path -from [get_clocks rx_int_clk] -to [get_clocks rx_data_clk]

set_false_path -from [get_clocks -of_objects [get_pins lml_rx/rx_fifo.in_fifo/RDCLK]] -to [get_clocks rx_mclk_in]

set_false_path -from [get_clocks rx_ref_clk_p1] -to [get_clocks rx_mclk_in]

set_clock_groups -asynchronous -group [get_clocks -include_generated_clocks rx_mclk_in]
set_clock_groups -asynchronous -group [get_clocks -include_generated_clocks tx_mclk_in]

set_false_path -from [get_clocks rx_data_clk] -to [get_clocks phy_fclk_clk_div]

#set_clock_groups -physically_exclusive -group [get_clocks -of_objects [get_pins app/tx_clk_gen/mmcme2/CLKIN1]] -group [get_clocks -of_objects [get_pins app/tx_clk_gen/mmcme2/CLKIN2]]
#
#create_generated_clock -name tx_fclk      -source [get_pins app/tx_clk_gen/mmcme2/CLKIN1] [get_pins app/tx_clk_gen/mmcme2/CLKOUT0]
#create_generated_clock -name tx_fclk_fwd  -source [get_pins app/tx_clk_gen/mmcme2/CLKIN1] [get_pins app/tx_clk_gen/mmcme2/CLKOUT1]
#create_generated_clock -name tx_fclk_div  -source [get_pins app/tx_clk_gen/mmcme2/CLKIN1] [get_pins app/tx_clk_gen/mmcme2/CLKOUT2]
#create_generated_clock -name tx_fclk_fdiv -source [get_pins app/tx_clk_gen/mmcme2/CLKIN1] [get_pins app/tx_clk_gen/mmcme2/CLKOUT2B]
#
#create_generated_clock -name tx_fclk2      -source [get_pins app/tx_clk_gen/mmcme2/CLKIN2] [get_pins app/tx_clk_gen/mmcme2/CLKOUT0]
#create_generated_clock -name tx_fclk_fwd2  -source [get_pins app/tx_clk_gen/mmcme2/CLKIN2] [get_pins app/tx_clk_gen/mmcme2/CLKOUT1]
#create_generated_clock -name tx_fclk_div2  -source [get_pins app/tx_clk_gen/mmcme2/CLKIN2] [get_pins app/tx_clk_gen/mmcme2/CLKOUT2]
#create_generated_clock -name tx_fclk_fdiv2 -source [get_pins app/tx_clk_gen/mmcme2/CLKIN2] [get_pins app/tx_clk_gen/mmcme2/CLKOUT2B]
#
#create_generated_clock -name rx_mclk_gen  -source [get_pins app/tx_clk_gen/mmcme2/CLKIN1] [get_pins app/tx_clk_gen/mmcme2/CLKOUT3]
#create_generated_clock -name rx_mclk_gen2 -source [get_pins app/tx_clk_gen/mmcme2/CLKIN2] [get_pins app/tx_clk_gen/mmcme2/CLKOUT3]
#
#
#create_generated_clock -name rx_clk_div_mmcm \
#                        -source [get_pins lms7_rx_clk_bufg/I1] \
#                        -divide_by 1 \
#                        [get_pins lms7_rx_clk_bufg/O]
#create_generated_clock -name rx_clk_div_mclk \
#                        -source [get_pins lms7_rx_clk_bufg/I0] \
#                        -divide_by 1 -add -master_clock [get_clocks -of [get_pins lms7_rx_clk_bufg/I0]] \
#                        [get_pins lms7_rx_clk_bufg/O]
#set_clock_groups -name rx_clk_div -physically_exclusive -group rx_clk_div_mclk -group rx_clk_div_mmcm
#
#
#set_property LOC IN_FIFO_X1Y0 [get_cells in_rx_fifo]
#
#
#set_false_path -from [get_clocks -of_objects [get_nets user_clk]] -to [get_clocks rx_clk_div_mclk]
#set_false_path -from [get_clocks rx_clk_div_mclk] -to [get_clocks -of_objects [get_nets user_clk]]
#
#set_false_path -from [get_clocks -of_objects [get_nets user_clk]] -to [get_clocks rx_clk_div_mmcm]
#set_false_path -from [get_clocks rx_clk_div_mmcm] -to [get_clocks -of_objects [get_nets user_clk]]
#
#
#set_clock_groups -physically_exclusive -group tx_fclk -group tx_fclk2
#set_clock_groups -physically_exclusive -group tx_fclk_fwd -group tx_fclk_fwd2
#set_clock_groups -physically_exclusive -group tx_fclk_div -group tx_fclk_div2
#set_clock_groups -physically_exclusive -group tx_fclk_fdiv -group tx_fclk_fdiv2


#set_clock_groups -name rx_mclk -physically_exclusive -group rx_mclk_in -group rx_mclk_gen -group rx_mclk_gen2

#set_input_delay -clock [get_clocks rx_mclk_in] -max 1.0 [get_ports {lms_diq2[*]}]
#set_input_delay -clock [get_clocks rx_mclk_in] -max 1.0 [get_ports {lms_diq2[*]}] -clock_fall -add_delay
#set_input_delay -clock [get_clocks rx_mclk_in] -min 0.2 [get_ports {lms_diq2[*]}]
#set_input_delay -clock [get_clocks rx_mclk_in] -min 0.2 [get_ports {lms_diq2[*]}] -clock_fall -add_delay


#set_output_delay -clock tx_fclk_fwd_out -max 1.0 [get_ports lms_diq1[*]]
#set_output_delay -clock tx_fclk_fwd_out -max 1.0 [get_ports lms_diq1[*]] -clock_fall -add_delay
#set_output_delay -clock tx_fclk_fwd_out -min 0.2 [get_ports lms_diq1[*]]
#set_output_delay -clock tx_fclk_fwd_out -min 0.2 [get_ports lms_diq1[*]] -clock_fall -add_delay

#set_max_delay -from [get_pins FD1/C] -to [get_pins FD2/D] 5

set_false_path -from [get_clocks -of_objects [get_nets user_clk]] -to [get_clocks usb_phy_clk]
set_false_path -from [get_clocks usb_phy_clk] -to [get_clocks -of_objects [get_nets user_clk]]

set_false_path -from [get_clocks -of_objects [get_nets user_clk]] -to [get_clocks cfg_mclk]
set_false_path -from [get_clocks cfg_mclk] -to [get_clocks -of_objects [get_nets user_clk]]


#set_false_path -from [get_clocks -of_objects [get_nets user_clk]] -to [get_clocks tx_fclk]
#set_false_path -from [get_clocks -of_objects [get_nets user_clk]] -to [get_clocks tx_fclk_div]
#set_false_path -from [get_clocks tx_fclk    ] -to [get_clocks -of_objects [get_nets user_clk]]
#set_false_path -from [get_clocks tx_fclk_div] -to [get_clocks -of_objects [get_nets user_clk]]
#set_false_path -from [get_clocks -of_objects [get_nets user_clk]] -to [get_clocks tx_fclk2]
#set_false_path -from [get_clocks -of_objects [get_nets user_clk]] -to [get_clocks tx_fclk_div2]
#set_false_path -from [get_clocks tx_fclk2    ] -to [get_clocks -of_objects [get_nets user_clk]]
#set_false_path -from [get_clocks tx_fclk_div2] -to [get_clocks -of_objects [get_nets user_clk]]


set_false_path -from [get_clocks -of_objects [get_nets user_clk]] -to [get_clocks tx_mclk_in]
set_false_path -from [get_clocks tx_mclk_in] -to [get_clocks -of_objects [get_nets user_clk]]

set_false_path -from [get_clocks -of_objects [get_nets user_clk]] -to [get_clocks rx_mclk_in]
set_false_path -from [get_clocks rx_mclk_in] -to [get_clocks -of_objects [get_nets user_clk]]

#set_false_path -from [get_clocks -of_objects [get_nets user_clk]] -to [get_clocks rx_mclk]
#set_false_path -from [get_clocks -of_objects [get_nets user_clk]] -to [get_clocks rx_mclk_gen]
#set_false_path -from [get_clocks -of_objects [get_nets user_clk]] -to [get_clocks rx_mclk_gen2]

#set_false_path -from [get_clocks rx_mclk]     -to [get_clocks -of_objects [get_nets user_clk]]
#set_false_path -from [get_clocks rx_mclk_gen]  -to [get_clocks -of_objects [get_nets user_clk]]
#set_false_path -from [get_clocks rx_mclk_gen2] -to [get_clocks -of_objects [get_nets user_clk]]

set_false_path -from [get_clocks -of_objects [get_nets user_clk]] -to [get_clocks clk_vctcxo]
set_false_path -from [get_clocks clk_vctcxo] -to [get_clocks -of_objects [get_nets user_clk]]



#create_generated_clock -name flash_cclk -add -master_clock [get_clocks -of_objects [get_nets user_clk]]  -source [get_pins clk_div_reg__0/C]  -divide_by 2 [get_pins clk_div_reg__0/Q]
#create_generated_clock -name flash_cclk -add -master_clock [get_clocks -of_objects [get_nets user_clk]]  -source [get_pins clk_div_reg[1]/C]  -divide_by 4 [get_pins clk_div_reg[1]/Q]
#set_false_path -from [get_clocks flash_cclk] -to [get_clocks -of_objects [get_nets user_clk]]
#set_false_path -from [get_clocks -of_objects [get_nets user_clk]] -to [get_clocks flash_cclk]

set_false_path -from [get_clocks -of_objects [get_nets user_clk]] -to [get_clocks clk_31mhz_x0y0]
set_false_path -from [get_clocks clk_31mhz_x0y0] -to [get_clocks -of_objects [get_nets user_clk]]



# see AR# 63174
create_generated_clock -name cclk -source [get_pins STARTUPE2_inst/USRCCLKO] -combinational [get_pins STARTUPE2_inst/USRCCLKO]
set_clock_latency -min 0.5 [get_clocks cclk]
set_clock_latency -max 6.7 [get_clocks cclk]

set_input_delay -max 6   -clock [get_clocks cclk] -clock_fall [get_ports {flash_d[*]}]
set_input_delay -min 1.5 -clock [get_clocks cclk] -clock_fall [get_ports {flash_d[*]}]

set_output_delay -max  1.75  -clock [get_clocks cclk]  [get_ports {flash_d[*]}]
set_output_delay -min -2.3   -clock [get_clocks cclk]  [get_ports {flash_d[*]}]

set_output_delay -max  3.375 -clock [get_clocks cclk]  [get_ports flash_fcs_b]
set_output_delay -min -3.375 -clock [get_clocks cclk]  [get_ports flash_fcs_b]


#create_generated_clock -name clk_sim -add -master_clock [get_clocks -of_objects [get_nets user_clk]]  -source [get_pins app/ul_uart_smartcard/sim_clk_reg_reg/C]  -divide_by 78 [get_pins app/ul_uart_smartcard/sim_clk_reg_reg/Q]

create_generated_clock -name clk_sim1 -add -master_clock [get_clocks clk_userclk_mux]  -source [get_pins app/ul_uart_smartcard/sim_clk_div_reg_reg[3]/C]  -divide_by 16 [get_pins app/ul_uart_smartcard/sim_clk_div_reg_reg[3]/Q]
create_generated_clock -name clk_sim2 -add -master_clock [get_clocks clk_cfgmclk_mux]  -source [get_pins app/ul_uart_smartcard/sim_clk_div_reg_reg[3]/C]  -divide_by 16 [get_pins app/ul_uart_smartcard/sim_clk_div_reg_reg[3]/Q]
set_clock_groups -physically_exclusive -group [get_clocks clk_sim1] -group [get_clocks clk_sim2]

set_false_path -from [get_clocks clk_userclk_mux] -to [get_clocks clk_sim2]
set_false_path -from [get_clocks clk_sim2] -to [get_clocks clk_userclk_mux]
set_false_path -from [get_clocks clk_cfgmclk_mux] -to [get_clocks clk_sim1]
set_false_path -from [get_clocks clk_sim1] -to [get_clocks clk_cfgmclk_mux]


#set_false_path -from [get_pins app/pcie_tx_chain_ex/fifo_reset_mclk2_reg/C] -to [get_pins oserdese2_lms_clk_tx/RST]


#set_multicycle_path -from [get_pins app/tc_queue/readcmd_rd_addr_reg[1]/C] -to [get_pins app/tc_queue/ts_went_off_reg_reg/D] 1

###########################################################
# IO types
###########################################################

set VIO_CMOS_TYPE        LVCMOS25
set VIO_CMOS_LML_DRIVE   8

set VIO_LML1_TYPE        LVCMOS25
set VIO_LML2_TYPE        LVCMOS25
# HSTL_II_18

###########################################################
# PCIexpress (3.3V) Pinout and Related I/O Constraints
###########################################################

# system reset PCI_PERST#
set_property IOSTANDARD  $VIO_CMOS_TYPE [get_ports sys_rst_n]
set_property PULLUP      true           [get_ports sys_rst_n]
set_property PACKAGE_PIN T3             [get_ports sys_rst_n]

# PCI_REF_CLK
set_property PACKAGE_PIN A8 [get_ports sys_clk_n]
set_property PACKAGE_PIN B8 [get_ports sys_clk_p]


##########################################################
# USB PHY (1.8-3.3V) (BANK 16)
##########################################################
set_property IOSTANDARD $VIO_CMOS_TYPE [get_ports {usb_d[*] usb_clk usb_dir usb_stp usb_nxt}]

set_property PACKAGE_PIN A14 [get_ports usb_d[6]]
set_property PACKAGE_PIN A15 [get_ports usb_d[5]]
set_property PACKAGE_PIN C15 [get_ports usb_d[7]]
set_property PACKAGE_PIN B15 [get_ports usb_d[4]]
set_property PACKAGE_PIN A16 [get_ports usb_d[3]]
set_property PACKAGE_PIN A17 [get_ports usb_d[1]]
set_property PACKAGE_PIN C16 [get_ports usb_clk]
set_property PACKAGE_PIN B16 [get_ports usb_d[2]]
set_property PACKAGE_PIN C17 [get_ports usb_stp]
set_property PACKAGE_PIN B17 [get_ports usb_d[0]]
set_property PACKAGE_PIN B18 [get_ports usb_dir]
set_property PACKAGE_PIN A18 [get_ports usb_nxt]

# (BANK14)
set_property IOSTANDARD $VIO_CMOS_TYPE [get_ports usb_nrst]
set_property IOSTANDARD $VIO_CMOS_TYPE [get_ports usb_26m]

set_property PACKAGE_PIN M18 [get_ports usb_nrst]
set_property PACKAGE_PIN E19 [get_ports usb_26m]

set_property PULLUP   true [get_ports usb_stp]
set_property PULLDOWN true [get_ports usb_nrst]


##########################################################
# LED Outputs (3.3V) Status Indicators.  (BANK35)
##########################################################
set_property IOSTANDARD LVCMOS33 [get_ports led_wlan_n]
set_property IOSTANDARD LVCMOS33 [get_ports led_wwan_n]
set_property IOSTANDARD LVCMOS33 [get_ports led_wpan_n]

set_property PACKAGE_PIN M2 [get_ports led_wlan_n]
set_property PACKAGE_PIN G3 [get_ports led_wwan_n]
set_property PACKAGE_PIN G2 [get_ports led_wpan_n]

##########################################################
# GPS module (BANK35)
##########################################################
set_property IOSTANDARD LVCMOS33 [get_ports gps_pps]
set_property IOSTANDARD LVCMOS33 [get_ports gps_txd]
set_property IOSTANDARD LVCMOS33 [get_ports gps_rxd]

set_property PULLDOWN true [get_ports gps_pps]
set_property PULLUP   true [get_ports gps_txd]
set_property PULLUP   true [get_ports gps_rxd]

set_property PACKAGE_PIN P3 [get_ports gps_pps]
set_property PACKAGE_PIN N2 [get_ports gps_txd]
set_property PACKAGE_PIN L1 [get_ports gps_rxd]


##########################################################
# GPIO
##########################################################
# gpio1 - 1pps_i (sync in)
# gpio2 - 1pps_o (sync out)
# gpio3 - TDD_P
# gpio4 - TDD_N
# gpio5 - LED_WWAN
# gpio6 - LED_WLAN
# gpio7 - LED_WPAN
# gpio8 - general (smb_data)
# gpio9 - G9_P
# gpio10 - G9_N
# gpio11 - G11_P
# gpio12 - G11_N

set_property IOSTANDARD LVCMOS33 [get_ports gpio_1]
set_property IOSTANDARD LVCMOS33 [get_ports gpio_2]
set_property IOSTANDARD LVCMOS33 [get_ports gpio_3]
set_property IOSTANDARD LVCMOS33 [get_ports gpio_4]
# TODO LEDs
set_property IOSTANDARD LVCMOS33 [get_ports gpio_8]
set_property IOSTANDARD LVCMOS33 [get_ports gpio_9]
set_property IOSTANDARD LVCMOS33 [get_ports gpio_10]
set_property IOSTANDARD LVCMOS33 [get_ports gpio_11]
set_property IOSTANDARD LVCMOS33 [get_ports gpio_12]


set_property PACKAGE_PIN M3 [get_ports gpio_1]
set_property PACKAGE_PIN L3 [get_ports gpio_2]
set_property PACKAGE_PIN H2 [get_ports gpio_3]
set_property PACKAGE_PIN J2 [get_ports gpio_4]

set_property PACKAGE_PIN N3 [get_ports gpio_8]
set_property PACKAGE_PIN H1 [get_ports gpio_9]
set_property PACKAGE_PIN J1 [get_ports gpio_10]
set_property PACKAGE_PIN K2 [get_ports gpio_11]
set_property PACKAGE_PIN L2 [get_ports gpio_12]


##########################################################
# SKY13330 & SKY13384 switches (3.3V devided to 2.5V)
##########################################################
set_property IOSTANDARD LVCMOS33 [get_ports tx_switch]
set_property IOSTANDARD LVCMOS33 [get_ports rx_switch_1]
set_property IOSTANDARD LVCMOS33 [get_ports rx_switch_2]

set_property PACKAGE_PIN P1 [get_ports tx_switch]
set_property PACKAGE_PIN K3 [get_ports rx_switch_1]
set_property PACKAGE_PIN J3 [get_ports rx_switch_2]

set_property PULLUP true [get_ports tx_switch]
set_property PULLUP true [get_ports rx_switch_1]
set_property PULLUP true [get_ports rx_switch_2]

##########################################################
# BANK35 I2C BUS #1 (3.3V)
##########################################################
set_property IOSTANDARD LVCMOS33 [get_ports i2c1_sda]
set_property IOSTANDARD LVCMOS33 [get_ports i2c1_scl]

set_property PULLUP true [get_ports i2c1_sda]
set_property PULLUP true [get_ports i2c1_scl]

set_property PACKAGE_PIN N1 [get_ports i2c1_sda]
set_property PACKAGE_PIN M1 [get_ports i2c1_scl]


##########################################################
# FPGA FLASH N25Q256 (1.8-3.3V) BANK14
##########################################################
set_property IOSTANDARD $VIO_CMOS_TYPE [get_ports {flash_d[*]}]
set_property IOSTANDARD $VIO_CMOS_TYPE [get_ports flash_fcs_b]

set_property PACKAGE_PIN D18 [get_ports flash_d[0]]
set_property PACKAGE_PIN D19 [get_ports flash_d[1]]
set_property PACKAGE_PIN G18 [get_ports flash_d[2]]
set_property PACKAGE_PIN F18 [get_ports flash_d[3]]
set_property PACKAGE_PIN K19 [get_ports flash_fcs_b]

# AUX signals
set_property IOSTANDARD $VIO_CMOS_TYPE [get_ports fpga_clk_vctcxo]
set_property IOSTANDARD $VIO_CMOS_TYPE [get_ports boot_safe]
set_property IOSTANDARD $VIO_CMOS_TYPE [get_ports en_bpvio_n]
set_property IOSTANDARD $VIO_CMOS_TYPE [get_ports en_bp3v3_n]
set_property IOSTANDARD $VIO_CMOS_TYPE [get_ports en_tcxo]
set_property IOSTANDARD $VIO_CMOS_TYPE [get_ports ext_clk]
set_property IOSTANDARD $VIO_CMOS_TYPE [get_ports led_2]
set_property IOSTANDARD $VIO_CMOS_TYPE [get_ports option]


set_property PACKAGE_PIN N17 [get_ports fpga_clk_vctcxo]
set_property PACKAGE_PIN D17 [get_ports boot_safe]
set_property PACKAGE_PIN T17 [get_ports en_bpvio_n]
set_property PACKAGE_PIN L18 [get_ports en_bp3v3_n]
set_property PACKAGE_PIN R19 [get_ports en_tcxo]
set_property PACKAGE_PIN V17 [get_ports ext_clk]
set_property PACKAGE_PIN N18 [get_ports led_2]
set_property PACKAGE_PIN V14 [get_ports option]


set_property PULLDOWN true [get_ports fpga_clk_vctcxo]
set_property PULLUP   true [get_ports boot_safe]
set_property PULLDOWN true [get_ports en_bpvio_n]
set_property PULLDOWN true [get_ports en_bp3v3_n]
set_property PULLUP   true [get_ports en_tcxo]
set_property PULLDOWN true [get_ports ext_clk]



# I2C BUS #2
set_property IOSTANDARD $VIO_CMOS_TYPE [get_ports i2c2_sda]
set_property IOSTANDARD $VIO_CMOS_TYPE [get_ports i2c2_scl]

set_property PACKAGE_PIN U15 [get_ports i2c2_sda]
set_property PACKAGE_PIN U14 [get_ports i2c2_scl]

set_property PULLUP true [get_ports i2c2_sda]
set_property PULLUP true [get_ports i2c2_scl]


# SIM card (1.8V) BANK 34
set_property IOSTANDARD $VIO_CMOS_TYPE [get_ports sim_mode]
set_property IOSTANDARD $VIO_CMOS_TYPE [get_ports sim_enable]
set_property IOSTANDARD $VIO_CMOS_TYPE [get_ports sim_clk]
set_property IOSTANDARD $VIO_CMOS_TYPE [get_ports sim_reset]
set_property IOSTANDARD $VIO_CMOS_TYPE [get_ports sim_data]

set_property PACKAGE_PIN R3 [get_ports sim_mode]
set_property PACKAGE_PIN U1 [get_ports sim_enable]
set_property PACKAGE_PIN T1 [get_ports sim_clk]
set_property PACKAGE_PIN R2 [get_ports sim_reset]
set_property PACKAGE_PIN T2 [get_ports sim_data]

######################################################
# LMS7002M Pinout
######################################################
set_property PACKAGE_PIN W13 [get_ports lms_i_saen]
set_property PACKAGE_PIN W16 [get_ports lms_io_sdio]
set_property PACKAGE_PIN W15 [get_ports lms_o_sdo]
set_property PACKAGE_PIN W14 [get_ports lms_i_sclk]
set_property PACKAGE_PIN U19 [get_ports lms_i_reset]
set_property PACKAGE_PIN W17 [get_ports lms_i_gpwrdwn]
set_property PACKAGE_PIN W18 [get_ports lms_i_rxen]
set_property PACKAGE_PIN W19 [get_ports lms_i_txen]
#
# DIQ2 BANK34
#
set_property PACKAGE_PIN W2 [get_ports lms_diq2[0]]
set_property PACKAGE_PIN U2 [get_ports lms_diq2[1]]
set_property PACKAGE_PIN V3 [get_ports lms_diq2[2]]
set_property PACKAGE_PIN V4 [get_ports lms_diq2[3]]
set_property PACKAGE_PIN V5 [get_ports lms_diq2[4]]
set_property PACKAGE_PIN W7 [get_ports lms_diq2[5]]
set_property PACKAGE_PIN V2 [get_ports lms_diq2[6]]
set_property PACKAGE_PIN W4 [get_ports lms_diq2[7]]
set_property PACKAGE_PIN U5 [get_ports lms_diq2[8]]
set_property PACKAGE_PIN V8 [get_ports lms_diq2[9]]
set_property PACKAGE_PIN U7 [get_ports lms_diq2[10]]
set_property PACKAGE_PIN U8 [get_ports lms_diq2[11]]
set_property PACKAGE_PIN U4 [get_ports lms_i_txnrx2]
set_property PACKAGE_PIN U3 [get_ports lms_io_iqsel2]
set_property PACKAGE_PIN W5 [get_ports lms_o_mclk2]
set_property PACKAGE_PIN W6 [get_ports lms_i_fclk2]
#
# DIQ1 BANK14
#
set_property PACKAGE_PIN J19 [get_ports lms_diq1[0]]
set_property PACKAGE_PIN H17 [get_ports lms_diq1[1]]
set_property PACKAGE_PIN G17 [get_ports lms_diq1[2]]
set_property PACKAGE_PIN K17 [get_ports lms_diq1[3]]
set_property PACKAGE_PIN H19 [get_ports lms_diq1[4]]
set_property PACKAGE_PIN U16 [get_ports lms_diq1[5]]
set_property PACKAGE_PIN J17 [get_ports lms_diq1[6]]
set_property PACKAGE_PIN P19 [get_ports lms_diq1[7]]
set_property PACKAGE_PIN U17 [get_ports lms_diq1[8]]
set_property PACKAGE_PIN N19 [get_ports lms_diq1[9]]
set_property PACKAGE_PIN V15 [get_ports lms_diq1[10]]
set_property PACKAGE_PIN V16 [get_ports lms_diq1[11]]
set_property PACKAGE_PIN M19 [get_ports lms_i_txnrx1]
set_property PACKAGE_PIN P17 [get_ports lms_io_iqsel1]
set_property PACKAGE_PIN L17 [get_ports lms_o_mclk1]
set_property PACKAGE_PIN G19 [get_ports lms_i_fclk1]


## LMS constrains

# LMS SPI & reset logic
set_property IOSTANDARD $VIO_CMOS_TYPE [get_ports {lms_i_saen lms_io_sdio lms_o_sdo lms_i_sclk}]
set_property IOSTANDARD $VIO_CMOS_TYPE [get_ports {lms_i_reset lms_i_gpwrdwn}]
set_property IOSTANDARD $VIO_CMOS_TYPE [get_ports {lms_i_rxen lms_i_txen}]
set_property PULLDOWN   true           [get_ports {lms_io_sdio lms_o_sdo}]

# LML Port 1
set_property IOSTANDARD $VIO_LML1_TYPE     [get_ports {lms_i_fclk1}]
set_property IOSTANDARD $VIO_LML1_TYPE     [get_ports {lms_diq1[*] lms_i_txnrx1 lms_io_iqsel1 lms_o_mclk1}]
#set_property IOSTANDARD HSTL_I_18          [get_ports {lms_diq1[*] lms_i_txnrx1 lms_io_iqsel1 lms_o_mclk1}]

# 'if' isn't supported, so edit it manually:
#if { $VIO_LML1_TYPE == "HSTL_II_18"} {
    #set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {lms_diq1[*] lms_i_fclk1 lms_io_iqsel1}]
    #set_property INTERNAL_VREF 0.9         [get_iobanks 14]
#} else {
    set_property SLEW  FAST                [get_ports {lms_i_fclk1}]
    set_property DRIVE $VIO_CMOS_LML_DRIVE [get_ports {lms_i_fclk1}]
    set_property SLEW  FAST                [get_ports {lms_diq1[*] lms_i_fclk1 lms_io_iqsel1}]
    set_property DRIVE $VIO_CMOS_LML_DRIVE [get_ports {lms_diq1[*] lms_i_fclk1 lms_io_iqsel1}]
#}

# LML Port 2
set_property IOSTANDARD $VIO_LML2_TYPE     [get_ports {lms_diq2[*] lms_i_txnrx2 lms_io_iqsel2 lms_o_mclk2 lms_i_fclk2}]
#if { $VIO_LML2_TYPE == "HSTL_II_18"} {
    #set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {lms_diq2[*] lms_i_fclk2 lms_io_iqsel1}]
    #set_property INTERNAL_VREF 0.9         [get_iobanks 34]
#} else {
    set_property SLEW  FAST                [get_ports {lms_diq2[*] lms_i_fclk2 lms_io_iqsel2}]
    set_property DRIVE $VIO_CMOS_LML_DRIVE [get_ports {lms_diq2[*] lms_i_fclk2 lms_io_iqsel2}]
#}

