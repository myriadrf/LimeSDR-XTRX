JTAG
####

To debug FPGA design, flash bitstream to FPGA and/or Flash memory JTAG X9 connector is used. It is located on the PCB bottom side and is compatible with Molex 788641001 connector. JTAG connector pins, schematic signal names, FPGA interconnections and I/O standards are listed in Table 14.

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
     - 3.3V
     - Test Data Out
   * - 2
     - TDI
     - W10
     - 3.3V
     - Test Data In
   * - 3
     - TMS
     - W9
     - 3.3V
     - Test Mode Select
   * - 4
     - VCC3P3
     - 
     - 
     - Power (3.3V)
   * - 5
     - TCK
     - C8
     - 3.3V
     - Test Clock
   * - 6
     - GND
     - 
     - 
     - Ground