mPCIe Connector
###############

LimeSDR XTRX communicates with the host system via the Mini PCIe connector.

The mPCIe connector pinout and signals according to the specification is given in Table 16.

.. list-table:: Table 16. Mini PCIe x1 edge connector pinout
   :header-rows: 1
   :stub-columns: 1
   :widths: 5 25 30 40

   * - Pin
     - Mini PCIe x1 Specification
     - LimeSDR XTRX schematic signal name
     - Description
   * - 1
     - Wake#
     - NC
     - Not connected
   * - 2
     - 3.3 Vaux
     - VCC3P3_MPCIE
     - Main power input 3.3V (VCC3P3_MPCIE)
   * - 3
     - COEX1
     - 1PPSI_GPIO1(1N)
     - External 1PPS input or GPIO1 or GPIO1N, CMOS 3.3 V
   * - 4
     - GND
     - GND
     - Ground
   * - 5
     - COEX2
     - 1PPSO_GPIO2(1P)
     - GPS 1PPS output or GPIO2 or GPIO1P, CMOS 3.3 V
   * - 6
     - GND
     - NC
     - Not connected
   * - 7
     - CLKREQ#
     - CLK_REQUEST#
     - Tied to GND through resistor 330 Ohm
   * - 8
     - UIM PWR
     - UIM_VCC
     - User Identity Module interface power 1.8 V or 3 V
   * - 9
     - GND
     - GND
     - Ground
   * - 10
     - UIM_DATA
     - UIM_DIO
     - User Identity Module interface data 1.8 V or 3 V
   * - 11
     - REFCLK-
     - PCI_REF_CLK_N
     - PCI Express reference clock differential pair negative signal
   * - 12
     - UIM_CLK
     - UIM_CLK
     - User Identity Module interface clock 1.8 V or 3 V
   * - 13
     - REFCLK+
     - PCI_REF_CLK_P
     - PCI Express reference clock differential pair positive signal
   * - 14
     - UIM_RESET
     - UIM_RST
     - User Identity Module interface reset 1.8 V or 3 V
   * - 15
     - GND
     - GND
     - Ground
   * - 16
     - UIM_VPP
     - NC
     - Not connected
   * - 17
     - Reserved
     - TDD_GPIO3_N
     - TDD TX Enable output or GPIO3N or GPIO4, CMOS 3.3 V
   * - 18
     - GND
     - GND
     - Ground
   * - 19
     - Reserved
     - CLK_IN
     - External clock input 3.3 V
   * - 20
     - W_DISABLE#
     - TDD_GPIO3_P
     - GPIO3P or GPIO3 (pair of TDD TX Enable), CMOS 3.3 V
   * - 21
     - GND
     - GND
     - Ground
   * - 22
     - PERST#
     - PCIE_PERST#
     - PCI Express interface reset
   * - 23
     - PERn0
     - PCI_TX0_N
     - PCI Express output differential pair negative signal
   * - 24
     - 3.3Vaux
     - NC
     - Not connected
   * - 25
     - PERp0
     - PCI_TX0_P
     - PCI Express output differential pair positive signal
   * - 26
     - GND
     - GND
     - Ground
   * - 27
     - GND
     - GND
     - Ground
   * - 28
     - 1.5Volt
     - NC
     - Not connected
   * - 29
     - GND
     - GND
     - Ground
   * - 30
     - SMB CLK
     - SMB_CLK
     - Clock output (CLK_OUT)
   * - 31
     - PETn0
     - PCI_RX0_N
     - PCI Express input differential pair negative signal
   * - 32
     - SMB Data
     - SMB_DATA
     - GPIO8
   * - 33
     - PETp0
     - PCI_RX0_P
     - PCI Express input differential pair positive signal
   * - 34
     - GND
     - GND
     - Ground
   * - 35
     - GND
     - GND
     - Ground
   * - 36
     - USB_D-
     - USB_D_N
     - USB 2.0 data differential pair negative signal
   * - 37
     - GND
     - GND
     - Jumper to GND, connected by default
   * - 38
     - USB_D+
     - USB_D_P
     - USB 2.0 data differential pair positive signal
   * - 39
     - 3.3Vaux
     - PCI_TX1_N
     - PCI Express output differential pair negative signal
   * - 40
     - GND
     - GND
     - Ground
   * - 41
     - 3.3Vaux
     - PCI_TX1_P
     - PCI Express output differential pair positive signal
   * - 42
     - LED_WWAN#
     - LED_WWAN#_GPIO5
     - Output for LED WWAN (negative) or GPIO5, 3.3 V
   * - 43
     - GND
     - GND
     - Jumper to GND, connected by default
   * - 44
     - LED_WLAN#
     - LED_WLAN#_GPIO6
     - Jumper to GND, connected by default
   * - 45
     - Reserved
     - PCIE_RESERVED
     - Connected to FPGA (V7)
   * - 46
     - LED_WPAN#
     - LED_WPAN#_GPIO7
     - Output for LED WPAN (negative) or GPIO7, 3.3 V
   * - 47
     - Reserved
     - PCI_RX1_N
     - PCI Express input differential pair negative signal
   * - 48
     - 1.5Volt
     - NC
     - Not connected
   * - 49
     - Reserved
     - PCI_RX1_P
     - PCI Express input differential pair positive signal
   * - 50
     - GND
     - GND
     - Ground
   * - 51
     - Reserved
     - PCIE_W_DISABLE2#
     - Connected to FPGA (W3)
   * - 52
     - 3.3Vaux
     - VCC3P3_MPCIE
     - Main power input 3.3V (VCC3P3_MPCIE)