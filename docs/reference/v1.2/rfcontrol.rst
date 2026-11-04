RF Network
##########

The RF network contains matching networks, RF switches and U.FL connectors (X1, X3 - TX and X2, X4 - RX), as shown in Figure 6.

.. figure:: /images/LimeSDR-XTRX_v1.2_diagrams_RFFE.png
  :width: 600

  Figure 6. LimeSDR XTRX v1.2 RF diagram

Frequency Range
===============

Each LMS7002M RF transceiver TX and RX port is connected to a dedicated RF path, and the appropriate path should be selected according to the operating frequency. On the receive side, the low-band path (RX_L) is recommended for frequencies below 1.5 GHz, the high-band path (RX_H) for frequencies of 2.2 GHz and above, and the wideband path (RX_W) for frequencies in between. On the transmit side, the TX1_2 and TX2_2 paths are recommended for frequencies below 2.6 GHz and the TX1_1 and TX2_1 paths for frequencies of 2.6 GHz and above. The recommended frequency ranges for all ports are summarised in Table 3.

.. note::
   The recommended frequency ranges are approximate values that cover most use cases, not hard limits of the RF paths. The optimum path may vary depending on other factors, such as the antenna and RF front-end parameters.

.. list-table:: Table 3. LMS7002M RF transceiver ports and recommended frequency ranges
   :header-rows: 1

   * - RF transceiver port
     - Recommended frequency range
   * - TX1_1, TX2_1
     - 2.6 GHz and above
   * - TX1_2, TX2_2
     - Below 2.6 GHz
   * - RX1_H, RX2_H
     - 2.2 GHz and above
   * - RX1_W, RX2_W
     - 1.5 GHz to 2.2 GHz
   * - RX1_L, RX2_L
     - Below 1.5 GHz

Control
=======

The on-board RF switches are controlled by 2.4 V logic signals, derived by resistor dividers from FPGA 3.3 V outputs (TX_SW, RX_SW2, RX_SW3) to the switch control pins (TX_SW_DIV, RX_SW2_DIV, RX_SW3_DIV). RF network control signals are described in Table 4.

.. table:: Table 4. RF network control signals

  +-----------------------------+---------------------------+------------------+--------------+-----------------------------------------------------------+
  | **Component**               | **Schematic signal name** | **I/O standard** | **FPGA pin** | **Description**                                           |
  +=============================+===========================+==================+==============+===========================================================+
  | SKY13330-397LF(IC5 and IC6) | TX_SW/TX_SW_DIV           | 3.3V             | P1           | FPGA 3.3V logic level signal divided to 2.4V logic level. |
  +-----------------------------+---------------------------+------------------+--------------+-----------------------------------------------------------+
  | SKY13414-485LF(IC3 and IC4) | RX_SW2/RX_SW2_DIV         | 3.3V             | J3           | FPGA 3.3V logic level signal divided to 2.4V logic level. |
  +                             +---------------------------+------------------+--------------+-----------------------------------------------------------+
  |                             | RX_SW3/RX_SW3_DIV         | 3.3V             | K3           | FPGA 3.3V logic level signal divided to 2.4V logic level. |
  +-----------------------------+---------------------------+------------------+--------------+-----------------------------------------------------------+