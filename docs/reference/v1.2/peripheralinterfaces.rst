Peripheral Interfaces
#####################

FPGA_SPI pins, schematic signal names, FPGA interconnections and I/O standards/levels are shown in Table 13.

.. list-table:: Table 13. FPGA_SPI interface pins
   :header-rows: 1

   * - Schematic signal name
     - FPGA pin
     - I/O standard
     - Comment
   * - FPGA_SPI_SCLK
     - W14
     - 3.3 V
     - Serial Clock (FPGA output)
   * - FPGA_SPI_MOSI
     - W16
     - 3.3 V
     - Data (FPGA output)
   * - FPGA_SPI_MISO
     - W15
     - 3.3 V
     - Data (FPGA input)
   * - FPGA_SPI_LMS_SS
     - W13
     - 3.3 V
     - LMS7002M (IC1) SPI slave select (FPGA output)

FPGA_CFG_SPI pins, schematic signal names, FPGA interconnections and I/O standards are shown in Table 14.

.. list-table:: Table 14. FPGA_CFG_SPI interface pins
   :header-rows: 1

   * - Schematic signal name
     - FPGA pin
     - I/O standard
     - Comment
   * - FPGA_CFG_CCLK
     - C11
     - 3.3 V
     - Serial Clock (FPGA output)
   * - FPGA_CFG_CS
     - K19
     - 3.3 V
     - IC18 SPI slave select (FPGA output)
   * - FPGA_CFG_D00
     - D18
     - 3.3 V
     - 
   * - FPGA_CFG_D01
     - D19
     - 3.3 V
     - 
   * - FPGA_CFG_D02
     - G18
     - 3.3 V
     - 
   * - FPGA_CFG_D03
     - F18
     - 3.3 V
     - 

FPGA_I2C1 (temperature sensor, EEPROM, CLK DAC, switching regulator) and FPGA_I2C2 (switching regulator) interface slave devices and related information are given in Table 15.

.. table:: Table 15. FPGA_I2C1 and FPGA_I2C2 interface pins

  +----------------------+---------------------+--------------+------------------+------------------+----------------+
  | **I²C slave device** | **Slave device**    | **Interface**| **I²C address**  | **I/O standard** | **Comment**    |
  +======================+=====================+==============+==================+==================+================+
  | IC9                  | Temperature sensor  | FPGA_I2C1    | 1 0 0 1 0 1 1 RW | 3.3 V            | TMP1075NDRLR   |
  +----------------------+---------------------+              +------------------+------------------+----------------+
  | IC13                 | EEPROM              |              | 1 0 1 0 0 0 0 RW | 3.3 V            | M24128 (NF)    |
  +----------------------+---------------------+              +------------------+------------------+----------------+
  | IC17                 | CLK DAC             |              | 1 0 0 1 1 0 0 RW | 3.3 V            | AD5693RACPZ    |
  +----------------------+---------------------+              +------------------+------------------+----------------+
  | IC22                 | Switching regulator |              | 1 1 0 0 0 0 0 RW | 3.3 V            | LP8758A1E0YFFR |
  +----------------------+---------------------+--------------+------------------+------------------+----------------+
  | IC31                 | Switching regulator | FPGA_I2C2    | 1 1 0 0 0 0 0 RW | 3.3 V            | LP8758A1E0YFFR |
  +----------------------+---------------------+--------------+------------------+------------------+----------------+