Developer Resources
###################

Current
*******

Please refer to the following projects for the PCB design and manufacturing files, FPGA gateware, and host software for LimeSDR XTRX:

* `Hardware Design`_ (Altium project and Gerbers etc.)
* :external+sdrgw:ref:`LimeSDR Gateware <index:introduction>` (common FPGA gateware and MCU firmware) 
* :external+suiteng:ref:`Lime Suite NG <index:introduction>` (host driver, plug-ins and engineering GUI)

Legacy
******

Links to legacy codebases are included here for historical reference only, since there may be users with older hardware or custom gateware or software that depends on them.

.. warning::
   These codebases are no longer actively maintained and may not work with current hardware or software versions. Use at your own risk. 
   
   Please do not contact Lime Microsystems for support regarding these projects.

LimeSDR XTRX
============

* `LimeSDR XTRX Gateware`_ (legacy, board-specific implementation)

Fairwaves XTRX
==============

These projects were developed by Fairwaves for their earlier XTRX board.

* `FPGA image source code`_
* `Linux PCIe driver`_
* `libxtrx`_ (high level API)
* `libxtrxll`_ (low level API)
* `libxtrxdsp`_ (DSP specific functions for XTRX and SDR in general)

.. warning::
   Do not attempt to use these projects with LimeSDR XTRX hardware!


.. _Hardware Design: https://github.com/myriadrf/LimeSDR-XTRX 
.. _LimeSDR XTRX Gateware: https://github.com/myriadrf/LimeSDR-XTRX_GW
.. _FPGA image source code: https://github.com/myriadrf/xtrx-fpga-source
.. _Linux PCIe driver: https://github.com/myriadrf/xtrx_linux_pcie_drv
.. _libxtrx: https://github.com/myriadrf/libxtrx
.. _libxtrxll: https://github.com/myriadrf/libxtrxll
.. _libxtrxdsp: https://github.com/myriadrf/libxtrxdsp
