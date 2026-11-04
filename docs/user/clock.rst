Reference Clock
###############

The LimeSDR XTRX clock system is based on a high stability 26 MHz VCTCXO (Voltage Controlled Temperature Compensated Crystal Oscillator) which can be tuned via an external 1PPS reference signal or GPSDO function. 

The board provides reference clock and 1PPS input and output via Mini PCIe connector, as well as dedicated U.FL connectors for reference clock input/output (X7) and 1PPS input (X6).

.. list-table:: Table 3. Clock Functions
   :header-rows: 1
   :stub-columns: 1

   * - Function
     - Specification
     - Notes
   * - On-board Oscillator
     - 26 MHz VCTCXO
     - Rakon E6982LF, ±0.2 ppm stability
   * - External Clock Input
     - mPCIe pin 19 or U.FL (X7)
     - 10-52 MHz, 1.8V - 3.3V
   * - Clock Output
     - mPCIe pin 30 or U.FL (X7)
     - 3.3V CMOS
   * - 1PPS Input
     - mPCIe pin 3 or U.FL (X6)
     - 3.3V CMOS
   * - 1PPS Output
     - mPCIe pin 5
     - 3.3V CMOS

.. note::
   By default, U.FL connector X7 is an external clock input. To use it as a clock output, remove R57 and fit R56 (0 |Omega|) on v1.2 boards, or remove R155 and fit R156 (0 |Omega|) on v1.3 boards.

.. warning::
   When using external clock references, ensure signal levels and frequencies match specifications. 
   
   Improper clock signals may cause unstable operation and potential damage to the device.

