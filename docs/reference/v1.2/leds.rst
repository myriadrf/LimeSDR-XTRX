LEDs
####

LimeSDR XTRX board comes with two green indicator LEDs. These LEDs are soldered on the top of the board near the USB Micro-B connector. 

.. figure:: /images/LimeSDR-XTRX_v1.3_components_LEDs.png
  :width: 600
  
  Figure 8. LimeSDR XTRX indication LEDs (top)

LEDs are connected to FPGA, hence their function may be programmed according to the user requirements. Default LED configuration and description are shown in Table 10.

.. table:: Table 10. Default LEDs configuration

  +---------------------+--------------------+-----------------+--------------+-----------------------+
  | **Board Reference** | **Schematic name** | **Board label** | **FPGA pin** | **Description**       |
  +=====================+====================+=================+==============+=======================+
  | LED1                | FPGA_LED1          | LED1            | N18          | User defined          |
  +---------------------+--------------------+-----------------+--------------+-----------------------+
  | LED2                | FPGA_LED2          | LED2            | V19          | User defined          |
  +---------------------+--------------------+-----------------+--------------+-----------------------+

