Flashing
########

From time to time it may be necessary to reprogram the FPGA configuration FLASH memory on the LimeSDR XTRX board. This may be required when upgrading to a newer gateware version, or in case of corrupted FLASH memory.

It should usually be possible to program the LimeSDR XTRX board using software only, with the device connected via the PCIe interface. However, in case of corrupted FLASH memory or other issues, JTAG programming may be required.

To start with download a `pre-compiled programming file`_ (.bin). Then proceed to use the pure software programming method described below, unless it has been determined that JTAG programming is necessary.

Software Programming
********************

This section describes how to program the FPGA configuration FLASH memory on the LimeSDR XTRX board using Lime software.

Software
========

The :external+suiteng:ref:`Lime Suite NG software <index:introduction>` is required for programming the FPGA configuration FLASH memory.

Programming Modes
=================

Lime Suite NG provides three modes of FPGA flash memory writing:

* **FPGA/user-image**. Writes an image at the user image offset in configuration flash.
* **FPGA/gold-image**. Writes an image at the bottom of the configuration flash.
* **FPGA/FLASH**. In gateware versions 1.13 and newer, this functions like FPGA/user-image, whereas in gateware versions 1.12 and older this functions like FPGA/gold-image.

.. note::
   Options FPGA/user-image and FPGA/gold-image are not supported in gateware versions 1.12 and older.

Programming via the GUI
=======================

The programming options can be accessed in the :code:`limeGUI` application under Modules->Programming.

Illustrations of the three modes can be found below. 

To program, select the image .bin file you wish to use by pressing Open and initiate programming by pressing Program.

.. figure:: /images/FPGA_USER.png
  :width: 600

  Figure 4: FPGA/user-image mode in GUI

.. figure:: /images/FPGA_GOLD.png
  :width: 600

  Figure 5: FPGA/gold-image mode in GUI

.. figure:: /images/FPGA_FLASH.png
  :width: 600

  Figure 6: FPGA/FLASH mode in GUI


Programming via the CLI
=======================

Programming can also be achived using the CLI application :code:`limeFLASH` that is built alongside limeGUI.

The relevant options are (path/to/image.bin should be replaced by the actual path to your chosen .bin file):

..  code-block:: shell
    :caption: Programming in FPGA/user-image mode

    limeFlash --device XTRX --target FPGA/user-image path/to/image.bin

..  code-block:: shell
    :caption: Programming in FPGA/gold-image mode

    limeFlash --device XTRX --target FPGA/gold-image path/to/image.bin

..  code-block:: shell
    :caption: Programming in FPGA/FLASH mode

    limeFlash --device XTRX --target FPGA/FLASH path/to/image.bin

.. _pre-compiled programming file: https://github.com/myriadrf/LimeSDR-XTRX_GW/blob/master/bitstream/combined_flash_programming_file.bin






