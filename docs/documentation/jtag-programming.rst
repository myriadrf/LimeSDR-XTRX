JTAG programming (Vivado)
=========================

This section describes how to program the Xilinx xc7a50 FPGA configuration FLASH memory used on the **LimeSDR-XTRX v1.2** board with JTAG interface and Vivado software.

Used software and hardware
--------------------------

For Xilinx xc7a50 FPGA JTAG programming full Vivado design software or standalone programmer from Vivado Lab solutions can be used. It is recomended to use Vivado Lab Solutions if only programming is needed.


List of used software is given in Table 1.

.. table:: Table 1. Required software and tools

  +------------------------------------------------------------------------------------------------------------------------------------------------+-------------------------------+------------------------------------------------------------------------------------+
  | **Tool**                                                                                                                                       | **Version**                   | **Comment**                                                                        |
  +================================================================================================================================================+===============================+====================================================================================+
  | `Vivado Lab Solutions - 2024.1 <https://www.xilinx.com/support/download.html>`__                                                               | 2024.1                        | Standalone programing software for Windows OS. Also available for Linux OS.        |
  +------------------------------------------------------------------------------------------------------------------------------------------------+-------------------------------+------------------------------------------------------------------------------------+
  | `Vivado Edition - 2024.1 <https://www.xilinx.com/support/download.html>`__                                                                     | 2024.1                        | (Optional) FPGA design and programming software. Standart Edition Free can be used |
  +------------------------------------------------------------------------------------------------------------------------------------------------+-------------------------------+------------------------------------------------------------------------------------+


List of required hardware is given in Table 2.

.. table:: Table 2. Required hardware

  +------------------------------------------------------------------------------------------------------------------------------------------------+-------------------------------+------------------------------------------------------------------------------------+
  | **Hardware**                                                                                                                                   | **Version**                   | **Comment**                                                                        |
  +================================================================================================================================================+===============================+====================================================================================+
  | `PCIe x2 + RF frontend adapter <https://www.crowdsupply.com/lime-micro/limefea-mpcie-carrier-board>`_                                          |                               | Mini PCIe to PCIe adapter with JTAG connector pins                                 |
  +------------------------------------------------------------------------------------------------------------------------------------------------+-------------------------------+------------------------------------------------------------------------------------+

List of tested JTAG programming cables is given in Table 3.

.. table:: Table 3. Tested JTAG programming cables

  +------------------------------------------------------------------------------------------------------------------------------------------------+-------------------------------+------------------------------------------------------------------------------------+
  | **Hardware**                                                                                                                                   | **Version**                   | **Comment**                                                                        |
  +================================================================================================================================================+===============================+====================================================================================+
  | `Xilinx Platform Cable USB II <https://www.xilinx.com/products/boards-and-kits/hw-usb-ii-g.html>`__                                            |                               | Original JTAG programming cable from Xilinx                                        |
  +------------------------------------------------------------------------------------------------------------------------------------------------+-------------------------------+------------------------------------------------------------------------------------+
  | `Waveshare Platform Cable USB <https://www.waveshare.com/platform-cable-usb.htm>`__                                                            |                               | Compatible JTAG programming cable for Xilinx devices from Waveshare                |
  +------------------------------------------------------------------------------------------------------------------------------------------------+-------------------------------+------------------------------------------------------------------------------------+


Connecting LimeSDR-XTRX v1.2 board to JTAG adapter
-------------------------------------------------------

JTAG pins of LimeSDR-XTRX v1.2 can be accessed only trough pogo connector. RF front end adapter is needed to connect to JTAG pins. For demonstration purposes Waveshare Platform Cable will be used. 

* Instert LimeSDR-XTRX  v1.2 into RF frontend adapter mini PCIe slot
* Connect JTAG jumper cables as shown in Table 4 between JTAG adapter and RF front end adapter JTAG header.
* Select power source jumper (USB or PCIe see figure 1) 
* Connect USB cable to Waveshare Platform Cable
* Connect micro USB cable to RF frontend adapter if you selected USB power source in previuos setup (skip this step if you selected PCIe power source).
* Insert RF frontend adapter into PCIe slot and power up PC (skip this step if you selected USB power source).

 

.. table:: Table 4. LimeSDR Mini board and Waveshare Platform Cable USB connections

  +------------------------------------+------------------------------------+
  | **Waveshare Platform Cable USB**   | **PCIe x2 + RF frontend adapter**  |
  +====================================+====================================+
  | TMS                                | TMS                                |
  +------------------------------------+------------------------------------+
  | TDI                                | TDI                                |
  +------------------------------------+------------------------------------+
  | TDO                                | TDO                                |
  +------------------------------------+------------------------------------+
  | TCK                                | TCK                                |
  +------------------------------------+------------------------------------+
  | GND                                | GND                                |
  +------------------------------------+------------------------------------+
  | VCC                                | VIO                                |
  +------------------------------------+------------------------------------+


.. figure:: images/jtag_programming_1.jpg
  :width: 600

  Figure 1: Connecting Waveshare Platform Cable


.. figure:: images/jtag_programming_2.jpg
  :width: 600

  Figure 2: Waveshare Platform Cable JTAG pins

.. figure:: images/jtag_programming_3.jpg
  :width: 600

  Figure 3: RF frontend adapter JTAG pins


FLASH memory programming using Vivado or Vivado Lab Edition 
-----------------------------------------------------------

* Make sure you have a JTAG programmer connected to the LimeSDR-XTRX's JTAG pins via a PCIe adapter as described in sections above
* Open Vivado or Vivado Lab Edition
* Open Hardware manager
* Click Tools -> Auto connect
* An FPGA device should be detected. Right click on it and select "Add configuration memory device"
* Select "mx25l25673g-spi-x1_x2_x4"
* Right click on the newly added memory device and choose "Program configuration memory device"
* Select configuration .bin file and click OK. Precompiled programming file for **LimeSDR-XTRX v1.2** version can be found `here <https://github.com/myriadrf/LimeSDR-XTRX_GW/blob/master/bitstream/combined_flash_programming_file.bin>`__
* When programming is done LimeSDR-XTRX v1.2 has to be powered down to load new gateware from FLASH memory

JTAG programming (openFPGALoader)
=================================

this section describes how to program the Xilinx xc7a50 FPGA configuration FLASH memory used on the **LimeSDR-XTRX v1.2** board with JTAG interface and openFGPALoader software.

Used software and hardware
--------------------------


List of used software is given in Table 6.

.. table:: Table 6. Required software and tools

  +------------------------------------------------------------------------------+-------------------------------+---------------------------------------------------+
  | **Tool**                                                                     | **Version**                   | **Comment**                                       |
  +==============================================================================+===============================+===================================================+
  | `openFPGALoader - v0.13.1 <https://github.com/trabucayre/openFPGALoader>`__  | v0.13.1                       | Universal utility for programming FPGAs           |
  +------------------------------------------------------------------------------+-------------------------------+---------------------------------------------------+


List of required hardware is given in Table 7.

.. table:: Table 7. Required hardware

  +------------------------------------------------------------------------------------------------------------------------------------------------+-------------------------------+------------------------------------------------------------------------------------+
  | **Hardware**                                                                                                                                   | **Version**                   | **Comment**                                                                        |
  +================================================================================================================================================+===============================+====================================================================================+
  | `PCIe x2 + RF frontend adapter <https://www.crowdsupply.com/lime-micro/limefea-mpcie-carrier-board>`_                                          |                               | Mini PCIe to PCIe adapter with JTAG connector pins                                 |
  +------------------------------------------------------------------------------------------------------------------------------------------------+-------------------------------+------------------------------------------------------------------------------------+

List of tested JTAG programming cables is given in Table 8.

.. table:: Table 8. Tested JTAG programming cables

  +------------------------------------------------------------------------------------------------------------------------------------------------+-------------------------------+------------------------------------------------------------------------------------+
  | **Hardware**                                                                                                                                   | **Version**                   | **Comment**                                                                        |
  +================================================================================================================================================+===============================+====================================================================================+
  | `FT2232H Mini Module <https://ftdichip.com/products/ft2232h-mini-module/>`__                                                                   |                               | Original JTAG programming cable from Xilinx                                        |
  +------------------------------------------------------------------------------------------------------------------------------------------------+-------------------------------+------------------------------------------------------------------------------------+


FT2232H Mini Module JTAG adapter
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

* Instert LimeSDR-XTRX  v1.2 into RF frontend adapter mini PCIe slot
* Connect JTAG jumper cables as shown in Table 9 between JTAG adapter and RF front end adapter JTAG header.
* Select power source jumper (USB or PCIe see figure 1) 
* Connect USB cable to FT2232H Mini Module
* Connect micro USB cable to RF frontend adapter if you selected USB power source in previuos setup (skip this step if you selected PCIe power source).
* Insert RF frontend adapter into PCIe slot and power up PC (skip this step if you selected USB power source).


.. table:: Table 9. LimeSDR Mini board and FT2232H Mini module connections

  +------------------------------------+------------------------------------+
  | **FT2232H Mini Module**            | **PCIe x2 + RF frontend adapter**  |
  +====================================+====================================+
  | CN2-12 (AD3)                       | TMS                                |
  +------------------------------------+------------------------------------+
  | CN2-10 (AD1)                       | TDI                                |
  +------------------------------------+------------------------------------+
  | CN2-9 (AD2)                        | TDO                                |
  +------------------------------------+------------------------------------+
  | CN2-7 (AD0)                        | TCK                                |
  +------------------------------------+------------------------------------+
  | CN2-2 (GND)                        | GND                                |
  +------------------------------------+------------------------------------+
  | CN2-11 (VIO)                       | VIO                                |
  +------------------------------------+------------------------------------+
