RF Transceiver Digital
######################

The `LMS7002M`_ digital interface and control signals are described below.

Digital Interface
*****************

LMS7002M uses data buses LMS_DIQ1_D[11:0] and LMS_DIQ2_D[11:0], LMS_EN_IQSEL1 and LMS_EN_IQSEL2, LMS_FCLK1 and LMS_FCLK2, LMS_MCLK1 and LMS_MCLK2 signals to transfer data to/from the Xilinx FPGA. Indices 1 and 2 indicate transceiver digital data PORT-1 or PORT-2. Any of these ports can be used to transmit or receive digital IQ data.

By default, PORT-1 is selected as the transmitter port and PORT-2 as the receiver port. FCLK# is the input clock and MCLK# is the output clock for the LMS7002M transceiver. TXNRX signals are used to indicate port direction. Please refer to `LMS7002M transceiver datasheet`_ pages 12–13 for the LMS7002M interface timing.

Control
*******

These signals are used for the following functions within the LMS7002M RFIC:

* LMS_RXEN, LMS_TXEN – receiver and transmitter enable/disable signals connected to FPGA Bank 14 (3.3 V).
* LMS_RESET – LMS7002M reset is connected to FPGA Bank 14 (3.3 V).
* SPI Interface: LMS7002M transceiver is configured via a 4-wire SPI interface: FPGA_SPI_SCLK, FPGA_SPI_MOSI, FPGA_SPI_MISO, FPGA_SPI_LMS_SS. The SPI interface is connected to FPGA Bank 14 (3.3 V).
* LMS I\ :sup:`2`\ C Interface: can be used for LMS EEPROM content modification or debug purposes. The signals LMS_I2C_SCL and LMS_I2C_SDA are connected to EEPROM IC2.

LMS7002M Pins
*************

.. list-table:: Table 2. LMS7002M RF transceiver digital interface pins
   :header-rows: 1
   :stub-columns: 1

   * - Chip pin (IC1)
     - Chip reference (IC1)
     - Schematic signal name
     - FPGA pin
     - FPGA I/O standard
     - Description
   * - E5
     - xoscin_tx
     - LMS_TxPLL_CLK
     - 
     - 
     - Connected to reference clock
   * - AB34
     - MCLK1
     - LMS_MCLK1
     - L17
     - 3.3 V
     - 
   * - AA33
     - FCLK1
     - LMS_FCLK1
     - G19
     - 3.3 V
     - 
   * - V32
     - TXNRX1
     - LMS_TXNRX1
     - V15
     - 3.3 V
     - 
   * - U29
     - TXEN
     - LMS_TXEN
     - W19
     - 3.3 V
     - 
   * - Y32
     - ENABLE_IQSEL1
     - LMS_EN_IQSEL1
     - P19
     - 3.3 V
     - 
   * - AG31
     - DIQ1_D0
     - LMS_DIQ1_D0
     - J17
     - 3.3 V
     - 
   * - AF30
     - DIQ1_D1
     - LMS_DIQ1_D1
     - H17
     - 3.3 V
     - 
   * - AF34
     - DIQ1_D2
     - LMS_DIQ1_D2
     - H19
     - 3.3 V
     - 
   * - AE31
     - DIQ1_D3
     - LMS_DIQ1_D3
     - K17
     - 3.3 V
     - 
   * - AD30
     - DIQ1_D4
     - LMS_DIQ1_D4
     - G17
     - 3.3 V
     - 
   * - AC29
     - DIQ1_D5
     - LMS_DIQ1_D5
     - V16
     - 3.3 V
     - 
   * - AE33
     - DIQ1_D6
     - LMS_DIQ1_D6
     - J19
     - 3.3 V
     - 
   * - AD32
     - DIQ1_D7
     - LMS_DIQ1_D7
     - M19
     - 3.3 V
     - 
   * - AC31
     - DIQ1_D8
     - LMS_DIQ1_D8
     - P17
     - 3.3 V
     - 
   * - AC33
     - DIQ1_D9
     - LMS_DIQ1_D9
     - N19
     - 3.3 V
     - 
   * - AB30
     - DIQ1_D10
     - LMS_DIQ1_D10
     - U17
     - 3.3 V
     - 
   * - AB32
     - DIQ1_D11
     - LMS_DIQ1_D11
     - U16
     - 3.3 V
     - 
   * - AM24
     - xoscin_rx
     - LMS_RxPLL_CLK
     - 
     - 
     - Connected to reference clock
   * - P34
     - MCLK2
     - LMS_MCLK2
     - W5
     - 3.3 V
     - 
   * - R29
     - FCLK2
     - LMS_FCLK2
     - W6
     - 3.3 V
     - 
   * - U31
     - TXNRX2
     - LMS_TXNRX2
     - U5
     - 3.3 V
     - 
   * - V34
     - RXEN
     - LMS_RXEN
     - W18
     - 3.3 V
     - 
   * - R33
     - ENABLE_IQSEL2
     - LMS_EN_IQSEL2
     - W7
     - 3.3 V
     - 
   * - H30
     - DIQ2_D0
     - LMS_DIQ2_D0
     - W2
     - 3.3 V
     - 
   * - J31
     - DIQ2_D1
     - LMS_DIQ2_D1
     - U2
     - 3.3 V
     - 
   * - K30
     - DIQ2_D2
     - LMS_DIQ2_D2
     - U3
     - 3.3 V
     - 
   * - K32
     - DIQ2_D3
     - LMS_DIQ2_D3
     - V3
     - 3.3 V
     - 
   * - L31
     - DIQ2_D4
     - LMS_DIQ2_D4
     - V4
     - 3.3 V
     - 
   * - K34
     - DIQ2_D5
     - LMS_DIQ2_D5
     - V2
     - 3.3 V
     - 
   * - M30
     - DIQ2_D6
     - LMS_DIQ2_D6
     - V5
     - 3.3 V
     - 
   * - M32
     - DIQ2_D7
     - LMS_DIQ2_D7
     - W4
     - 3.3 V
     - 
   * - N31
     - DIQ2_D8
     - LMS_DIQ2_D8
     - V8
     - 3.3 V
     - 
   * - N33
     - DIQ2_D9
     - LMS_DIQ2_D9
     - U4
     - 3.3 V
     - 
   * - P30
     - DIQ2_D10
     - LMS_DIQ2_D10
     - U8
     - 3.3 V
     - 
   * - P32
     - DIQ2_D11
     - LMS_DIQ2_D11
     - U7
     - 3.3 V
     - 
   * - U33
     - CORE_LDO_EN
     - LMS_CORE_LDO_EN
     - W17
     - 3.3 V
     - 
   * - E27
     - RESET
     - LMS_RESET
     - U19
     - 3.3 V
     - 
   * - D28
     - SEN
     - FPGA_SPI_LMS_SS
     - W13
     - 3.3 V
     - SPI interface
   * - C29
     - SCLK
     - FPGA_SPI_SCLK
     - W14
     - 3.3 V
     - SPI interface
   * - F30
     - SDIO
     - FPGA_SPI_MOSI
     - W16
     - 3.3 V
     - SPI interface
   * - F28
     - SDO
     - FPGA_SPI_MISO
     - W15
     - 3.3 V
     - SPI interface
   * - D26
     - SDA
     - LMS_I2C_SDA
     - 
     - 
     - Connected to EEPROM
   * - C27
     - SCL
     - LMS_I2C_SCL
     - 
     - 
     - Connected to EEPROM