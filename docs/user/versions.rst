Board Versions
##############

There are currently two production versions of the LimeSDR XTRX board: v1.2 and v1.3. 

v1.2 and v1.3 boards are supported by the same software. New hardware features added in each board version are listed in Table 1. For a full list of changes, see the :doc:`/reference/changelog`.

.. list-table:: Table 1. New features in each board version
   :header-rows: 1
   :stub-columns: 1

   * - Version
     - New features
   * - v1.3
     - Dedicated clock buffer (LMK00105) for improved reference clock distribution.

       Separate reference clocks for the LMS7002M TX and RX PLLs.

       Option to supply the 3.3 V and clock power rails directly from an external supply, bypassing the switching regulators.
   * - v1.2
     - First production version.

.. figure:: /images/LimeSDR-XTRX_v1.3_3D_top.png
  :width: 600

  Figure 1. LimeSDR XTRX v1.3 board top view

.. figure:: /images/LimeSDR-XTRX_v1.2_3D_top.png
  :width: 600

  Figure 2. LimeSDR XTRX v1.2 board top view