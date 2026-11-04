JTAG
####

JTAG connector X9 is used to debug the FPGA design and to load the bitstream into the FPGA and/or flash memory. It is located on the PCB bottom side and is compatible with the Molex 788641001 connector. X9 is not fitted by default, so a compatible connector must be soldered to use it. JTAG connector pins, schematic signal names, FPGA interconnections and I/O standards are listed in Table 14.

.. list-table:: Table 14. JTAG connector X9 pins
   :header-rows: 1
   :stub-columns: 1

   * - Connector pin
     - Schematic signal name
     - FPGA pin
     - I/O standard
     - Comment
   * - 1
     - TDO
     - W8
     - 3.3 V
     - Test Data Out
   * - 2
     - TDI
     - W10
     - 3.3 V
     - Test Data In
   * - 3
     - TMS
     - W9
     - 3.3 V
     - Test Mode Select
   * - 4
     - VCC3P3
     - 
     - 
     - Power (3.3 V)
   * - 5
     - TCK
     - C8
     - 3.3 V
     - Test Clock
   * - 6
     - GND
     - 
     - 
     - Ground