FPGA
####

LimeSDR XTRX board features a Xilinx Artix-7 FPGA XC7A50T-2CPG236I (IC7). The FPGA connects the host (via the Mini PCIe connector) to the LMS7002M RF transceiver, and also controls the RF network, clock network, GNSS receiver, SIM card interface, USB transceiver and peripheral devices. FPGA interfaces are listed in Table 2.

.. list-table:: Table 2. FPGA interfaces
   :header-rows: 1

   * - Interface
     - Connected to
     - Details
   * - PCIe Gen 2 x2
     - Mini PCIe connector (X10)
     - :doc:`mpcie`
   * - LimeLight, SPI
     - LMS7002M RF transceiver (IC1)
     - :doc:`digital`
   * - Quad SPI
     - Configuration flash (IC18)
     - `Configuration`_
   * - I\ :sup:`2`\ C
     - Sensors, EEPROM, DAC, regulators
     - :doc:`peripheralinterfaces`
   * - USB ULPI
     - USB transceiver (IC19)
     - :doc:`usb`
   * - RF switch control
     - RF switches
     - :doc:`rfcontrol`
   * - Clock, 1PPS
     - Clock network
     - :doc:`clock`
   * - UART, control
     - GNSS receiver (IC11), SIM card interface (IC16)
     - :doc:`overview`
   * - GPIO, LEDs
     - X12, LED1, LED2, mPCIe (X10)
     - :doc:`gpio`, :doc:`leds`
   * - JTAG
     - X9 (not fitted)
     - :doc:`jtag`

All FPGA I/O banks (0, 14, 16, 34 and 35) are powered from VCC3P3, so all FPGA user I/O use 3.3 V levels. The GTP transceiver bank 216 is powered from VCC1P0_MGTAVCC and VCC1P2_MGTAVTT.

Configuration
=============

The FPGA is configured in Master SPI mode (M[2:0] = 001) from the 256 Mb quad SPI configuration flash IC18 (MX25L25645GZ2I-08G). The configuration bank voltage select CFGBVS is tied to VCC3P3, and PUDC_B is tied to GND, so internal pull-ups are enabled on I/O pins during configuration.

The configuration flash holds the gold (fallback) and user gateware images. Its interface pins are listed in :doc:`peripheralinterfaces`. For flash programming, see :doc:`/user/flashing`.

Configuration control signals:

* FPGA_PRG_B (PROGRAM_B, V10) – pulled up to VCC3P3 by R43 (4.7 k\ |Omega|). Can be pulled low via test point TP3 (RST) to restart FPGA configuration.
* DONE (U12) – pulled up to VCC3P3 by R44 (330 |Omega|). Goes high when configuration is complete.
* INIT_B (U11) – pulled up to VCC3P3 by R45 (4.7 k\ |Omega|).

The FPGA can also be configured and debugged via JTAG connector X9 (not fitted by default), see :doc:`jtag`.

Analogue Monitoring
===================

The FPGA XADC analogue input VP/VN (A12/B13) is connected to the external supply VCC_EXT (via R46) and to the LMS7002M analogue test output LMS_TSTAO (via R47), with R48 to ground. VREFP and VREFN are tied to ground, so the XADC uses its internal reference.

Version Straps
==============

Board hardware and BOM versions are set by straps connected to FPGA inputs, so they can be read by the gateware. Unconnected inputs are read as 1 using the FPGA internal pull-up. Version straps are listed in Table 3.

.. list-table:: Table 3. FPGA version straps
   :header-rows: 1

   * - Schematic signal name
     - FPGA pin
     - Connection
     - Value
   * - HW_VER0
     - V13
     - GND
     - 0
   * - HW_VER1
     - P18
     - Not connected
     - 1
   * - HW_VER2
     - K18
     - GND
     - 0
   * - BOM_VER0
     - J18
     - GND via R49 (0 |Omega|)
     - 0
   * - BOM_VER1
     - T18
     - GND via R50 (0 |Omega|)
     - 0
   * - BOM_VER2
     - V14
     - GND via R51 (0 |Omega|)
     - 0

On LimeSDR XTRX v1.2, HW_VER = 2 (010) and BOM_VER = 0 (000).
