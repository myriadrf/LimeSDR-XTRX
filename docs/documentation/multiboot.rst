Multiboot
=========

`LimeSDR-XTRX gateware <https://github.com/myriadrf/LimeSDR-XTRX_GW.git>`__ from version 1.13 onwards is designed with multiboot functionality in mind.
This section of documentation describes the process of multiboot and the functions of different precompiled bitstream images provided in the gateware repository.

Multiboot procedure
--------------------

Multiboot on the LimeSDR-XTRX works by placing a **gold** image at the bottom of the flash memory, so that it is the first image to boot.
The header of the **gold** image contains instructions for multiboot operation and the address of the **user** image that is
supposed to be used. FPGA, after reading the instructions in the **gold** image header does not load the rest of the image
and instead proceeds to attempt to boot from the **user** image address provided. In case of failure, FPGA returns to the **gold**
image and boots from it, enabling JTAG-less recovery in case of a faulty **user** image. This process is summarised in the
figure below.

.. figure:: images/BootChart.svg
   :width: 600

   Figure 1: Multiboot procedure flowchart

Images provided
----------------

The associated `LimeSDR-XTRX_GW repository <https://github.com/myriadrf/LimeSDR-XTRX_GW.git>`__ provides the following prebuilt
gateware images:


* **user_flash_programming_file** - up-to-date gateware intended for regular use, referred to as **user** image
* **gold_flash_programming_file** - fallback image, should not be used under normal circumstances, referred to as **gold** image
* **combined_flash_programming_file** - an image combining both **user** and **gold** images, should be written to the **gold** image address

**Note!** **Gold** image can be recognized by its GW revision number (57005.57005) and LED blink pattern (both LEDs blink slowly and synchronously)

Choosing the right image
------------------------

If your GW version is v1.13 or higher, your board should already have the gold image written into the flash memory. In that case **user_flash_programming_file.bin** should be used.

If your GW version is v1.12 or lower, use **combined_flash_programming_file.bin** to update your GW and add multiboot functionality.

Notes
------

* If after updating from GW >v1.13 to a different version the gw version reported in LimeSuite does not change after a board power cycle, it is likely that your **gold** image was overwritten by **user** image. In this case you should write **gold_flash_programming_file.bin** or **combined_flash_programming_file.bin** using the gold image write function in software.
* Loading **gold** image when **user** image loading fails takes more time than successfully loading **user** image. For this reason, in fallback mode, your OS may have issues recognizing the board. Entering the UEFI/BIOS settings while booting up and exiting may alleviate this. Powering the board via USB is also known to help.
* If for some reason you do not wish to use multiboot functionality, you can program your board using the **gold_image** programming function in software and the **user_flash_programming_file.bin** file.