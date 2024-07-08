Software programming
====================

This section describes how to program the Xilinx xc7a50 FPGA configuration FLASH memory used on the **LimeSDR-XTRX v1.2** board with Lime software.

Software used
--------------

Instructions provided herein are written with software in `LimesuiteNG repository <https://github.com/myriadrf/LimeSuiteNG.git>`__  in mind.

Programming modes
-----------------

LimeSuiteNG provides three modes of FPGA flash memory writing:

- FPGA/user-image - writes an image at the user image offset in configuration flash.
- FPGA/gold-image - writes an image at the bottom of the configuration flash.
- FPGA/FLASH - in gateware versions 1.13 and newer, this functions like FPGA/user-image, in gateware versions 1.12 and older this functions like FPGA/gold-image.

Note: options FPGA/user-image and FPGA/gold-image are not supported in gateware versions 1.12 and older.

Programming using GUI
-------------------------

Programming options can be accessed in the limeGUI application under Modules->Programming.
Illustrations of the modes can be found below. To program in selected mode, select the image .bin file you wish to use by
pressing Open and start programming by pressing Program.

.. figure:: images/FPGA_USER.png
  :width: 600

  Figure 1: FPGA/user-image mode in GUI


.. figure:: images/FPGA_GOLD.png
  :width: 600

  Figure 2: FPGA/gold-image mode in GUI

.. figure:: images/FPGA_FLASH.png
  :width: 600

  Figure 3: FPGA/FLASH mode in GUI


Programming via CLI
-------------------

Programming can also be done using the CLI application limeFLASH that is built alongside limeGUI.
The relevant options are (path/to/image.bin should be replaced by the actual path to your chosen .bin file):

..  code-block:: shell
    :caption: programming in FPGA/user-image mode

    limeFlash --device XTRX --target FPGA/user-image path/to/image.bin

..  code-block:: shell
    :caption: programming in FPGA/gold-image mode

    limeFlash --device XTRX --target FPGA/gold-image path/to/image.bin

..  code-block:: shell
    :caption: programming in FPGA/FLASH mode

    limeFlash --device XTRX --target FPGA/FLASH path/to/image.bin
