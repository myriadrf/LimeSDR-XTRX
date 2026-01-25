Reference Clock
###############

The LimeSDR XTRX clock system is based on a high stability 26 MHz VCTCXO (Voltage Controlled Temperature Compensated Crystal Oscillator) which can be tuned via an external 1PPS reference signal or GPSDO function. 

The board provides both reference clock input and output connectors, as well as 1PPS input and output via the Mini PCIe connector.

.. list-table:: Table 2. Clock Functions
   :header-rows: 1
   :stub-columns: 1

   * - Function
     - Specification
     - Notes
   * - On-board Oscillator
     - 26 MHz VCTCXO
     - Rakon E6982LF, ±0.2 ppm stability
   * - External Clock Input
     - U.FL (X7) or mPCIe pin 19
     - 10-52 MHz, 1.8V or 3.3V
   * - Clock Output
     - U.FL or mPCIe pin 30
     - 1.8V or 3.3V CMOS
   * - 1PPS Input
     - mPCIe pin 3 (COEX1)
     - 3.3V CMOS
   * - 1PPS Output
     - mPCIe pin 5 (COEX2)
     - 3.3V CMOS

.. warning::
   When using external clock references, ensure signal levels and frequencies match specifications. 
   
   Improper clock signals may cause unstable operation and potential damage to the device.

