Hardware Setup
##############

Host Interface
**************

LimeSDR XTRX should be plugged into a full size Mini PCIe slot on the host device. 

The host must provide a PCIe Gen2 x1 or x2 interface, and supply power via the Mini PCIe connector.

.. note::
   Most COTS equipment with Mini PCIe slots provide only a single PCIe lane (x1), which will result in slightly reduced bandwidth. 
   
   A custom baseboard or adapter is required to use both PCIe lanes (x2), but PCIe x1 operation is sufficient for most use cases.

.. note::
   The USB2.0 interface is for board programming only and this must not be connected at the same time as the Mini PCIe interface!

Cooling
*******

Depending on the application, host system and ambient temperature, additional cooling may be required to ensure reliable operation of the LimeSDR XTRX board. This may be in the form of airflow through the host system, or a dedicated heatsink fitted to the board.

The LimeFEA mPCIe adapter boards provide an integrated heatsink in the form of a large copper ground plane plus thermal pad.

.. note::
   In the event of errors, instability or reduced performance, check the board temperature to ensure that it is within the specified operating range.

RF Connections
**************

.. figure:: /images/LimeSDR-XTRX_v1.3_components_top.png
  :width: 600
  
  Figure 3: LimeSDR XTRX v1.3 board top with RF connector positions

.. list-table:: Table 1. RF Connectors
   :header-rows: 1
   :stub-columns: 1

   * - Connector
     - Type
     - Frequency Range
     - Function
   * - TX1 (X1)
     - U.FL
     - 30 MHz - 3.8 GHz
     - High/Low band TX output, Channel 1
   * - TX2 (X3)
     - U.FL
     - 30 MHz - 3.8 GHz
     - High/Low band TX output, Channel 2
   * - RX1 (X2)
     - U.FL
     - 30 MHz - 3.8 GHz
     - RX input, Channel 1 (H/W/L selectable)
   * - RX2 (X4)
     - U.FL
     - 30 MHz - 3.8 GHz 
     - RX input, Channel 2 (H/W/L selectable)

.. warning::
   Care should be taken when connecting external RF signals to the RX inputs, to ensure that the maximum safe input power of +10 dBm is not exceeded, as this may cause permanent damage to the device.

