Clock Distribution
##################

The LimeSDR XTRX board clock distribution block diagram is shown in Figure 7.

.. figure:: /images/LimeSDR-XTRX_v1.2_diagrams_clock.png
  :width: 600

  Figure 7. LimeSDR XTRX v1.2 board clock distribution block diagram

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

The analogue switch selects the clock source for the RF transceiver and FPGA: the onboard VCTCXO clock XO1 (CLK_XO) or external U.FL (X7)/mPCIe (X10) sources (CLK_IN_BUFF). The buffered VCTCXO clock (CLK_OUT) can also be fed to other boards using the U.FL (X7)/mPCIe (X10) connectors.

The board clock lines and other related signals/information are listed in Table 8. VCCIO_CLK voltage can be selected between 1.8 V and 3.3 V (default).

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
   * - CLK_IN_BUFF
     - CLK_IN
     - Analogue switch (IC15)
     - 1.8 V
   * - CLK_IN
     - CLK or mPCIe pin 19
     - Level converter
     - VCCIO_CLK
   * - CLK_OUT
     - Analogue switch (IC15)
     - External
     - VCCIO_CLK
   * - LMS_TX_CLK
     - Analogue switch (IC15)
     - RF transceiver
     - 1.8 V
   * - FPGA_CLK
     - Analogue switch (IC15)
     - FPGA
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
   * - USB_CLK
     - USB transceiver
     - FPGA
     - 3.3 V
   * - USB_26M
     - FPGA
     - USB transceiver
     - 3.3 V