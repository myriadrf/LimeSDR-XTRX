Clock Distribution
##################

Clock distribution is as shown in Figure 7.

.. figure:: /images/LimeSDR-XTRX_v1.3_diagrams_clock.png
  :width: 600

  Figure 7. LimeSDR XTRX v1.3 board clock distribution block diagram

The LimeSDR XTRX board features an onboard 26.00 MHz VCTCXO as the reference clock for the LMS7002M RF transceiver and FPGA PLLs.

Rakon E6982LF 26.00 MHz voltage controlled temperature compensated crystal oscillator (VCTCXO) is the clock source for the board. VCTCXO frequency may be tuned using a 16-bit DAC (IC17). Main VCTCXO parameters are listed in Table 7.

.. list-table:: Table 7. Rakon E6982LF VCTCXO main parameters
   :header-rows: 1

   * - Frequency parameter
     - Value
   * - Calibration (25 °C ± 1 °C)
     - ± 1 ppm max
   * - Stability (-40 to 85 °C)
     - ± 0.2 ppm max
   * - Long-term stability (1 year, 3 years)
     - ± 1 ppm max, ± 2 ppm max
   * - Control voltage range
     - 0.5 V – 2.8 V
   * - Frequency tuning
     - ± 3 ppm
   * - Slope
     - +4 ppm/V

Analogue switch IC15 selects the input of clock buffer IC8 (LMK00105): the onboard VCTCXO XO1 clock (CLK_XO) or an external clock (CLK_IN) from U.FL connector X7 or the mPCIe connector (X10). The clock buffer distributes the reference clock to the RF transceiver and the FPGA. Buffered clock outputs LMK_CLKOUT3 and LMK_CLKOUT4 can also be fed to other boards through U.FL connector X7 and the mPCIe connector (X10).

The board clock lines and other related signals/information are listed in Table 8.

.. list-table:: Table 8. LimeSDR XTRX main clock lines
   :header-rows: 1

   * - Schematic signal name
     - Source
     - Destination
     - I/O standard
   * - CLK_XO
     - (VC)TCXO (XO1)
     - Analogue switch (IC15)
     - Clipped sinewave
   * - CLK_IN
     - CLK_EXT or PCIE_CLK_IN
     - Analogue switch (IC15)
     - 3.3 V
   * - CLK_EXT
     - U.FL connector
     - CLK_IN
     - 3.3 V
   * - PCIE_CLK_IN
     - mPCIe connector
     - CLK_IN
     - 3.3 V
   * - LMS_TxPLL_CLK
     - Clock buffer (IC8)
     - RF transceiver
     - 1.8 V
   * - LMS_RxPLL_CLK
     - Clock buffer (IC8)
     - RF transceiver
     - 1.8 V
   * - FPGA_CLK
     - Clock buffer (IC8)
     - FPGA
     - 3.3 V
   * - LMK_CLKOUT3
     - Clock buffer (IC8)
     - External
     - 3.3 V
   * - LMK_CLKOUT4
     - Clock buffer (IC8)
     - External
     - 3.3 V
   * - LMS_MCLK1
     - RF transceiver
     - FPGA
     - 3.3 V
   * - LMS_FCLK1
     - FPGA
     - RF transceiver
     - 3.3 V
   * - LMS_MCLK2
     - RF transceiver
     - FPGA
     - 3.3 V
   * - LMS_FCLK2
     - FPGA
     - RF transceiver
     - 3.3 V
   * - PCIE_REF_CLK_P/N
     - PCIe
     - FPGA
     - Differential (HCSL)
   * - 1PPSO_GPIO2(1P)
     - FPGA
     - mPCIe
     - 3.3 V
   * - 1PPSI_GPIO1(1N)
     - External
     - FPGA
     - 3.3 V
   * - 1PPS_IN
     - External
     - FPGA
     - 3.3 V
   * - GNSS_1PPS
     - GNSS
     - FPGA
     - 3.3 V