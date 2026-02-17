USB 2.0 Controller
##################

LimeSDR XTRX may be powered and programmed via USB 2.0, by connecting it to a Micro-B port or Mini PCIe connector.

.. note::
    Data transfer via USB 2.0 interface requires custom gateware.

USB 2.0 is implemented using `Microchip USB3333E-GL`_ transceiver. The controller signals description are shown below:

* USB_D[7:0] – 8-bit data interface is connected to FPGA.
* USB_NRST, USB_NXT, USB_DIR, USB_STP – interface control signals.
* USB_CLK – interface clock. Clock from transceiver is fed to XILINX FPGA.
* USB_26M – interface clock. Clock from FPGA is fed to Lime transceiver.

USB 2.0 controller pins, schematic signal names, FPGA interconnections and I/O standard are described in Table 9.

.. list-table:: Table 9. USB 2.0 controller interface
   :header-rows: 1
   :stub-columns: 1

   * - Chip pin (IC19)
     - Chip reference (IC19)
     - Schematic signal name
     - FPGA pin
     - I/O standard
   * - C2
     - RESETB
     - USB_NRST
     - M18
     - 3.3V
   * - E3
     - DAT7
     - USB_D7
     - C15
     - 3.3V
   * - E4
     - DAT6
     - USB_D6
     - A14
     - 3.3V
   * - E5
     - DAT5
     - USB_D5
     - A15
     - 3.3V
   * - D4
     - DAT4
     - USB_D4
     - B15
     - 3.3V
   * - D5
     - DAT3
     - USB_D3
     - A16
     - 3.3V
   * - C4
     - DAT2
     - USB_D2
     - B16
     - 3.3V
   * - C5
     - DAT1
     - USB_D1
     - A17
     - 3.3V
   * - B4
     - DAT0
     - USB_D0
     - B17
     - 3.3V
   * - A3
     - STP
     - USB_STP
     - C17
     - 3.3V
   * - B5
     - NXT
     - USB_NXT
     - A18
     - 3.3V
   * - A4
     - DIR
     - USB_DIR
     - B18
     - 3.3V
   * - A5
     - CLKOUT
     - USB_CLK
     - C16
     - 3.3V
   * - A2
     - REFCLK
     - USB_26M
     - E19
     - 3.3V