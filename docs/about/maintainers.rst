Project Maintenance
===================

Trusted Firmware-A (TF-A) is an open governance community project. All
contributions are reviewed and merged by the community members listed below.

For more details on the roles of `maintainers`, `code owners` and general
information about code reviews in TF-A project, please refer to the :ref:`Code
Review Guidelines`.

.. |M| replace:: **Mail**
.. |G| replace:: **GitHub ID**
.. |F| replace:: **Files**

.. _maintainers:

Maintainers
-----------

.. note::
   If you wish to become a maintainer for TF-A project, please refer to the
   :ref:`Project Maintenance Processes`.

:|M|: Dan Handley <dan.handley@arm.com>
:|G|: `danh-arm`_
:|M|: Soby Mathew <soby.mathew@arm.com>
:|G|: `soby-mathew`_
:|M|: Sandrine Bailleux <sandrine.bailleux@arm.com>
:|G|: `sandrine-bailleux-arm`_
:|M|: Alexei Fedorov <Alexei.Fedorov@arm.com>
:|G|: `AlexeiFedorov`_
:|M|: Manish Pandey <manish.pandey2@arm.com>
:|G|: `manish-pandey-arm`_
:|M|: Mark Dykes <mark.dykes@arm.com>
:|G|: `mardyk01`_
:|M|: Olivier Deprez <olivier.deprez@arm.com>
:|G|: `odeprez`_
:|M|: Bipin Ravi <bipin.ravi@arm.com>
:|G|: `bipinravi-arm`_
:|M|: Joanna Farley <joanna.farley@arm.com>
:|G|: `joannafarley-arm`_
:|M|: Julius Werner <jwerner@chromium.org>
:|G|: `jwerner-chromium`_
:|M|: Varun Wadekar <vwadekar@nvidia.com>
:|G|: `vwadekar`_
:|M|: Andre Przywara <andre.przywara@arm.com>
:|G|: `Andre-ARM`_
:|M|: Lauren Wehrmeister <Lauren.Wehrmeister@arm.com>
:|G|: `laurenw-arm`_
:|M|: Madhukar Pappireddy <Madhukar.Pappireddy@arm.com>
:|G|: `madhukar-Arm`_
:|M|: Raghu Krishnamurthy <raghuoss@raghushome.com>
:|G|: `raghuncstate`_
:|M|: Manish Badarkhe <manish.badarkhe@arm.com>
:|G|: `ManishVB-Arm`_
:|M|: Yann Gautier <yann.gautier@st.com>
:|G|: `Yann-lms`_
:|M|: Govindraj Raja <govindraj.raja@arm.com>
:|G|: `govindraj-arm`_

.. _lts maintainers:

LTS Maintainers
---------------

:|M|: Bipin Ravi <bipin.ravi@arm.com>
:|G|: `bipinravi-arm`_
:|M|: Joanna Farley <joanna.farley@arm.com>
:|G|: `joannafarley-arm`_
:|M|: Jidong Sun <jidong@google.com>
:|G|: `jidongsun`_
:|M|: Varun Wadekar <vwadekar@nvidia.com>
:|G|: `vwadekar`_
:|M|: Yann Gautier <yann.gautier@st.com>
:|G|: `Yann-lms`_
:|M|: Govindraj Raja <govindraj.raja@arm.com>
:|G|: `govindraj-arm`_

.. _code owners:

Code owners
-----------

Common Code
~~~~~~~~~~~

Armv7-A architecture port
^^^^^^^^^^^^^^^^^^^^^^^^^
:|M|: Etienne Carriere <etienne.carriere@linaro.org>
:|G|: `etienne-lms`_

Build Definitions for CMake Build System
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
:|M|: Chris Kay <chris.kay@arm.com>
:|G|: `CJKay`_
:|F|: /

Software Delegated Exception Interface (SDEI)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
:|M|: Jayanth Dodderi Chidanand <jayanthdodderi.chidanand@arm.com>
:|G|: `jayanthchidanand-arm`_
:|M|: Manish Pandey <manish.pandey2@arm.com>
:|G|: `manish-pandey-arm`_
:|F|: services/std_svc/sdei/

Trusted Boot
^^^^^^^^^^^^
:|M|: Sandrine Bailleux <sandrine.bailleux@arm.com>
:|G|: `sandrine-bailleux-arm`_
:|M|: Manish Badarkhe <manish.badarkhe@arm.com>
:|G|: `ManishVB-Arm`_
:|M|: Lauren Wehrmeister <Lauren.Wehrmeister@arm.com>
:|G|: `laurenw-arm`_
:|F|: drivers/auth/

Secure Partition Manager Core (EL3 FF-A SPMC)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
:|M|: Marc Bonnici <marc.bonnici@arm.com>
:|G|: `marcbonnici`_
:|F|: services/std_svc/spm/el3_spmc/\*
:|F|: include/services/el3_spmc\_\*
:|F|: include/services/spmc_svc.h

Secure Partition Manager Dispatcher (SPMD)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
:|M|: Olivier Deprez <olivier.deprez@arm.com>
:|G|: `odeprez`_
:|M|: Joao Alves <Joao.Alves@arm.com>
:|G|: `J-Alves`_
:|M|: Madhukar Pappireddy <Madhukar.Pappireddy@arm.com>
:|G|: `madhukar-Arm`_
:|F|: services/std_svc/spmd/\*
:|F|: plat/common/plat_spmd_manifest.c
:|F|: include/services/ffa_svc.h
:|F|: include/services/el3_spmd_logical_sp.h
:|F|: include/services/spmd_svc.h

Exception Handling Framework (EHF)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
:|M|: Jayanth Dodderi Chidanand <jayanthdodderi.chidanand@arm.com>
:|G|: `jayanthchidanand-arm`_
:|M|: Manish Pandey <manish.pandey2@arm.com>
:|G|: `manish-pandey-arm`_
:|F|: bl31/ehf.c

Runtime Exceptions and Interrupt Management
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
:|M|: Manish Pandey <manish.pandey2@arm.com>
:|G|: `manish-pandey-arm`_
:|M|: Madhukar Pappireddy <Madhukar.Pappireddy@arm.com>
:|G|: `madhukar-Arm`_
:|F|: bl31/aarch64/
:|F|: bl31/interrupt_mgmt.c
:|F|: include/bl31/interrupt_mgmt.h

Realm Management Monitor Dispatcher (RMMD)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
:|M|: Javier Almansa Sobrino <javier.almansasobrino@arm.com>
:|G|: `javieralso-arm`_
:|M|: Alexei Fedorov <Alexei.Fedorov@arm.com>
:|G|: `AlexeiFedorov`_
:|F|: services/std_svc/rmmd/\*
:|F|: include/services/rmmd_svc.h
:|F|: include/services/rmm_core_manifest.h

Realm Management Extension (RME)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
:|M|: Javier Almansa Sobrino <javier.almansasobrino@arm.com>
:|G|: `javieralso-arm`_
:|M|: Alexei Fedorov <Alexei.Fedorov@arm.com>
:|G|: `AlexeiFedorov`_

Drivers, Libraries and Framework Code
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Console API framework
^^^^^^^^^^^^^^^^^^^^^
:|M|: Julius Werner <jwerner@chromium.org>
:|G|: `jwerner-chromium`_
:|F|: drivers/console/
:|F|: include/drivers/console.h
:|F|: plat/common/aarch64/crash_console_helpers.S

coreboot support libraries
^^^^^^^^^^^^^^^^^^^^^^^^^^
:|M|: Julius Werner <jwerner@chromium.org>
:|G|: `jwerner-chromium`_
:|F|: drivers/coreboot/
:|F|: include/drivers/coreboot/
:|F|: include/lib/coreboot.h
:|F|: lib/coreboot/

eMMC/UFS drivers
^^^^^^^^^^^^^^^^
:|M|: Haojian Zhuang <haojian.zhuang@linaro.org>
:|G|: `hzhuang1`_
:|F|: drivers/partition/
:|F|: drivers/synopsys/emmc/
:|F|: drivers/synopsys/ufs/
:|F|: drivers/ufs/
:|F|: include/drivers/dw_ufs.h
:|F|: include/drivers/ufs.h
:|F|: include/drivers/synopsys/dw_mmc.h

Arm® Ethos™-N NPU driver
^^^^^^^^^^^^^^^^^^^^^^^^
:|M|: Joshua Slater <joshua.slater@arm.com>
:|G|: `jslater8`_
:|M|: Ştefana Simion <stefana.simion@arm.com>
:|G|: `stefanasimion`_
:|F|: drivers/arm/ethosn/
:|F|: include/drivers/arm/ethosn.h
:|F|: include/drivers/arm/ethosn_cert.h
:|F|: include/drivers/arm/ethosn_fip.h
:|F|: include/drivers/arm/ethosn_oid.h
:|F|: plat/arm/board/juno/juno_ethosn_tzmp1_def.h
:|F|: plat/arm/common/fconf/fconf_ethosn_getter.c
:|F|: include/plat/arm/common/fconf_ethosn_getter.h
:|F|: fdts/juno-ethosn.dtsi

JTAG DCC console driver
^^^^^^^^^^^^^^^^^^^^^^^
:|M|: Michal Simek <michal.simek@amd.com>
:|G|: `michalsimek`_
:|M|: Akshay Belsare <akshay.belsare@amd.com>
:|G|: `Akshay-Belsare`_
:|M|: Maheedhar Sai Bollapalli <maheedharsai.bollapalli@amd.com>
:|G|: `maheedhar-bollapalli`_
:|F|: drivers/arm/dcc/
:|F|: include/drivers/arm/dcc.h

Power State Coordination Interface (PSCI)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
:|M|: Manish Pandey <manish.pandey2@arm.com>
:|G|: `manish-pandey-arm`_
:|M|: Madhukar Pappireddy <Madhukar.Pappireddy@arm.com>
:|G|: `madhukar-Arm`_
:|M|: Lauren Wehrmeister <Lauren.Wehrmeister@arm.com>
:|G|: `laurenw-arm`_
:|M|: Boyan Karatotev <boyan.karatotev@arm.com>
:|G|: `loosper-arm`_
:|F|: lib/psci/
:|F|: include/lib/psci/

DebugFS
^^^^^^^
:|M|: Olivier Deprez <olivier.deprez@arm.com>
:|G|: `odeprez`_
:|F|: lib/debugfs/
:|F|: include/lib/debugfs.h

Firmware Configuration Framework (FCONF)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
:|M|: Madhukar Pappireddy <Madhukar.Pappireddy@arm.com>
:|G|: `madhukar-Arm`_
:|M|: Manish Badarkhe <manish.badarkhe@arm.com>
:|G|: `ManishVB-Arm`_
:|M|: Lauren Wehrmeister <Lauren.Wehrmeister@arm.com>
:|G|: `laurenw-arm`_
:|F|: lib/fconf/
:|F|: plat/arm/common/fconf/
:|F|: include/lib/fconf/
:|F|: include/plat/arm/common/arm_fconf\_\*
:|F|: include/plat/arm/common/fconf\_\*

Performance Measurement Framework (PMF)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
:|M|: Joao Alves <Joao.Alves@arm.com>
:|G|: `J-Alves`_
:|F|: lib/pmf/

Errata Management
^^^^^^^^^^^^^^^^^
:|M|: Bipin Ravi <bipin.ravi@arm.com>
:|G|: `bipinravi-arm`_
:|M|: Lauren Wehrmeister <Lauren.Wehrmeister@arm.com>
:|G|: `laurenw-arm`_

Arm CPU libraries
^^^^^^^^^^^^^^^^^
:|M|: Bipin Ravi <bipin.ravi@arm.com>
:|G|: `bipinravi-arm`_
:|M|: Lauren Wehrmeister <Lauren.Wehrmeister@arm.com>
:|G|: `laurenw-arm`_
:|M|: Boyan Karatotev <boyan.karatotev@arm.com>
:|G|: `loosper-arm`_
:|F|: lib/cpus/
:|F|: include/lib/cpus/

Reliability Availability Serviceabilty (RAS) framework
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
:|M|: Manish Pandey <manish.pandey2@arm.com>
:|G|: `manish-pandey-arm`_
:|M|: Olivier Deprez <olivier.deprez@arm.com>
:|G|: `odeprez`_
:|M|: Boyan Karatotev <boyan.karatotev@arm.com>
:|G|: `loosper-arm`_
:|F|: lib/extensions/ras/

Activity Monitors Unit (AMU) extensions
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
:|M|: Alexei Fedorov <Alexei.Fedorov@arm.com>
:|G|: `AlexeiFedorov`_
:|M|: Chris Kay <chris.kay@arm.com>
:|G|: `CJKay`_
:|M|: Boyan Karatotev <boyan.karatotev@arm.com>
:|G|: `loosper-arm`_
:|F|: lib/extensions/amu/

Memory Partitioning And Monitoring (MPAM) extensions
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
:|M|: Manish Pandey <manish.pandey2@arm.com>
:|G|: `manish-pandey-arm`_
:|M|: Boyan Karatotev <boyan.karatotev@arm.com>
:|G|: `loosper-arm`_
:|F|: lib/extensions/mpam/

Pointer Authentication (PAuth) and Branch Target Identification (BTI) extensions
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
:|M|: Alexei Fedorov <Alexei.Fedorov@arm.com>
:|G|: `AlexeiFedorov`_
:|M|: Boyan Karatotev <boyan.karatotev@arm.com>
:|G|: `loosper-arm`_
:|F|: lib/extensions/pauth/

Statistical Profiling Extension (SPE)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
:|M|: Manish Pandey <manish.pandey2@arm.com>
:|G|: `manish-pandey-arm`_
:|M|: Boyan Karatotev <boyan.karatotev@arm.com>
:|G|: `loosper-arm`_
:|F|: lib/extensions/spe/

Standard C library
^^^^^^^^^^^^^^^^^^
:|M|: Chris Kay <chris.kay@arm.com>
:|G|: `CJKay`_
:|M|: Madhukar Pappireddy <Madhukar.Pappireddy@arm.com>
:|G|: `madhukar-Arm`_
:|F|: lib/libc/

Library At ROM (ROMlib)
^^^^^^^^^^^^^^^^^^^^^^^
:|M|: Madhukar Pappireddy <Madhukar.Pappireddy@arm.com>
:|G|: `madhukar-Arm`_
:|F|: lib/romlib/

Translation tables (``xlat_tables``) library
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
:|M|: Manish Badarkhe <manish.badarkhe@arm.com>
:|G|: `ManishVB-Arm`_
:|M|: Joao Alves <Joao.Alves@arm.com>
:|G|: `J-Alves`_
:|F|: lib/xlat\_tables_\*/

IO abstraction layer
^^^^^^^^^^^^^^^^^^^^
:|M|: Manish Pandey <manish.pandey2@arm.com>
:|G|: `manish-pandey-arm`_
:|M|: Olivier Deprez <olivier.deprez@arm.com>
:|G|: `odeprez`_
:|F|: drivers/io/

GIC driver
^^^^^^^^^^
:|M|: Alexei Fedorov <Alexei.Fedorov@arm.com>
:|G|: `AlexeiFedorov`_
:|M|: Manish Pandey <manish.pandey2@arm.com>
:|G|: `manish-pandey-arm`_
:|M|: Madhukar Pappireddy <Madhukar.Pappireddy@arm.com>
:|G|: `madhukar-Arm`_
:|M|: Olivier Deprez <olivier.deprez@arm.com>
:|G|: `odeprez`_
:|M|: Boyan Karatotev <boyan.karatotev@arm.com>
:|G|: `loosper-arm`_
:|F|: drivers/arm/gic/

Message Handling Unit (MHU) driver
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
:|M|: David Vincze <david.vincze@arm.com>
:|G|: `davidvincze`_
:|F|: include/drivers/arm/mhu.h
:|F|: drivers/arm/mhu

Runtime Security Engine (RSE) comms driver
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
:|M|: David Vincze <david.vincze@arm.com>
:|G|: `davidvincze`_
:|F|: include/drivers/arm/rse_comms.h
:|F|: drivers/arm/rse

Libfdt wrappers
^^^^^^^^^^^^^^^
:|M|: Madhukar Pappireddy <Madhukar.Pappireddy@arm.com>
:|G|: `madhukar-Arm`_
:|M|: Manish Badarkhe <manish.badarkhe@arm.com>
:|G|: `ManishVB-Arm`_
:|F|: common/fdt_wrappers.c

Firmware Encryption Framework
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
:|M|: Sumit Garg <sumit.garg@kernel.org>
:|G|: `b49020`_
:|F|: drivers/io/io_encrypted.c
:|F|: include/drivers/io/io_encrypted.h
:|F|: include/tools_share/firmware_encrypted.h

Measured Boot
^^^^^^^^^^^^^
:|M|: Sandrine Bailleux <sandrine.bailleux@arm.com>
:|G|: `sandrine-bailleux-arm`_
:|M|: Manish Badarkhe <manish.badarkhe@arm.com>
:|G|: `ManishVB-Arm`_
:|M|: Harrison Mutai <harrison.mutai@arm.com>
:|G|: `harrisonmutai-arm`_
:|F|: drivers/measured_boot
:|F|: include/drivers/measured_boot
:|F|: docs/components/measured_boot
:|F|: plat/arm/board/fvp/fvp\*_measured_boot.c

DRTM
^^^^
:|M|: Manish Badarkhe <manish.badarkhe@arm.com>
:|G|: `ManishVB-Arm`_
:|M|: Manish Pandey <manish.pandey2@arm.com>
:|G|: `manish-pandey-arm`_
:|F|: services/std_svc/drtm
:|F|: include/plat/common/plat_drtm.h
:|F|: include/services/drtm_svc.h

PSA Firmware Update
^^^^^^^^^^^^^^^^^^^
:|M|: Manish Badarkhe <manish.badarkhe@arm.com>
:|G|: `ManishVB-Arm`_
:|M|: Sandrine Bailleux <sandrine.bailleux@arm.com>
:|G|: `sandrine-bailleux-arm`_
:|F|: drivers/fwu
:|F|: include/drivers/fwu

Platform Security Architecture (PSA) APIs
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
:|M|: Sandrine Bailleux <sandrine.bailleux@arm.com>
:|G|: `sandrine-bailleux-arm`_
:|M|: Manish Badarkhe <manish.badarkhe@arm.com>
:|G|: `ManishVB-Arm`_
:|F|: include/lib/psa
:|F|: lib/psa

System Control and Management Interface (SCMI) Server
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
:|M|: Etienne Carriere <etienne.carriere@st.com>
:|G|: `etienne-lms`_
:|M|: Peng Fan <peng.fan@nxp.com>
:|G|: `MrVan`_
:|F|: drivers/scmi-msg
:|F|: include/drivers/scmi\*

Max Power Mitigation Mechanism (MPMM)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
:|M|: Chris Kay <chris.kay@arm.com>
:|G|: `CJKay`_
:|F|: include/lib/cpus/aarch64/cpu_macros.S

Granule Protection Tables Library (GPT-RME)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
:|M|: Soby Mathew <soby.mathew@arm.com>
:|G|: `soby-mathew`_
:|M|: Javier Almansa Sobrino <javier.almansasobrino@arm.com>
:|G|: `javieralso-arm`_
:|F|: lib/gpt_rme
:|F|: include/lib/gpt_rme

Firmware Handoff Library (Transfer List)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
:|M|: Raymond Mao <raymond.mao@linaro.org>
:|G|: `raymo200915`_
:|M|: Harrison Mutai <harrison.mutai@arm.com>
:|G|: `harrisonmutai-arm`_
:|F|: lib/transfer_list
:|F|: include/lib/transfer_list.h

Context Management
^^^^^^^^^^^^^^^^^^
:|M|: Jayanth Dodderi Chidanand <jayanthdodderi.chidanand@arm.com>
:|G|: `jayanthchidanand-arm`_
:|M|: Manish Pandey <manish.pandey2@arm.com>
:|G|: `manish-pandey-arm`_
:|M|: Madhukar Pappireddy <Madhukar.Pappireddy@arm.com>
:|G|: `madhukar-Arm`_
:|M|: Boyan Karatotev <boyan.karatotev@arm.com>
:|G|: `loosper-arm`_
:|F|: bl1/aarch32/bl1_context_mgmt.c
:|F|: bl1/aarch64/bl1_context_mgmt.c
:|F|: bl31/bl31_context_mgmt.c
:|F|: lib/el3_runtime/
:|F|: include/lib/el3_runtime/

Runtime Services
^^^^^^^^^^^^^^^^
:|M|: Manish Pandey <manish.pandey2@arm.com>
:|G|: `manish-pandey-arm`_
:|M|: Madhukar Pappireddy <Madhukar.Pappireddy@arm.com>
:|G|: `madhukar-Arm`_
:|F|: services/std_svc/std_svc_setup.c
:|F|: common/runtime_svc.c
:|F|: include/common/runtime_svc.h
:|F|: include/services/arm_arch_svc.h
:|F|: include/services/std_svc.h

Live Firmware Activation Service
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
:|M|: Manish Badarkhe <manish.badarkhe@arm.com>
:|G|: `ManishVB-Arm`_
:|F|: services/std_svc/lfa
:|F|: include/plat/common/plat_lfa.h
:|F|: include/services/lfa_svc.h

Platform Ports
~~~~~~~~~~~~~~

Allwinner ARMv8 platform port
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
:|M|: Andre Przywara <andre.przywara@arm.com>
:|G|: `Andre-ARM`_
:|M|: Samuel Holland <samuel@sholland.org>
:|G|: `smaeul`_
:|F|: docs/plat/allwinner.rst
:|F|: plat/allwinner/
:|F|: drivers/allwinner/

Amlogic Meson S905 (GXBB) platform port
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
:|M|: Andre Przywara <andre.przywara@arm.com>
:|G|: `Andre-ARM`_
:|F|: docs/plat/meson-gxbb.rst
:|F|: drivers/amlogic/
:|F|: plat/amlogic/gxbb/

Amlogic Meson S905x (GXL) platform port
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
:|M|: Remi Pommarel <repk@triplefau.lt>
:|G|: `remi-triplefault`_
:|F|: docs/plat/meson-gxl.rst
:|F|: plat/amlogic/gxl/

Amlogic Meson S905X2 (G12A) platform port
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
:|M|: Carlo Caione <ccaione@baylibre.com>
:|G|: `carlocaione`_
:|F|: docs/plat/meson-g12a.rst
:|F|: plat/amlogic/g12a/

Amlogic Meson A113D (AXG) platform port
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
:|M|: Carlo Caione <ccaione@baylibre.com>
:|G|: `carlocaione`_
:|F|: docs/plat/meson-axg.rst
:|F|: plat/amlogic/axg/

Arm FPGA platform port
^^^^^^^^^^^^^^^^^^^^^^
:|M|: Andre Przywara <andre.przywara@arm.com>
:|G|: `Andre-ARM`_
:|M|: Javier Almansa Sobrino <Javier.AlmansaSobrino@arm.com>
:|G|: `javieralso-arm`_
:|F|: plat/arm/board/arm_fpga

Arm FVP Platform port
^^^^^^^^^^^^^^^^^^^^^
:|M|: Manish Pandey <manish.pandey2@arm.com>
:|G|: `manish-pandey-arm`_
:|M|: Madhukar Pappireddy <Madhukar.Pappireddy@arm.com>
:|G|: `madhukar-Arm`_
:|M|: Harrison Mutai <harrison.mutai@arm.com>
:|G|: `harrisonmutai-arm`_
:|F|: plat/arm/board/fvp

Arm Juno Platform port
^^^^^^^^^^^^^^^^^^^^^^
:|M|: Manish Pandey <manish.pandey2@arm.com>
:|G|: `manish-pandey-arm`_
:|M|: Chris Kay <chris.kay@arm.com>
:|G|: `CJKay`_
:|F|: plat/arm/board/juno

Arm Morello and N1SDP Platform ports
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
:|M|: Anurag Koul <anurag.koul@arm.com>
:|G|: `anukou`_
:|M|: Chandni Cherukuri <chandni.cherukuri@arm.com>
:|G|: `chandnich`_
:|F|: plat/arm/board/morello
:|F|: plat/arm/board/n1sdp

Arm Rich IoT Platform ports
^^^^^^^^^^^^^^^^^^^^^^^^^^^
:|M|: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
:|G|: `abdellatif-elkhlifi`_
:|M|: Hugues Kamba Mpiana <hugues.kambampiana@arm.com>
:|G|: `hugues-kambampiana-arm`_
:|F|: plat/arm/board/corstone700
:|F|: plat/arm/board/a5ds
:|F|: plat/arm/board/corstone1000

Arm Reference Design platform ports
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
:|M|: Thomas Abraham <thomas.abraham@arm.com>
:|G|: `thomas-arm`_
:|M|: Vijayenthiran Subramaniam <vijayenthiran.subramaniam@arm.com>
:|G|: `vijayenthiran-arm`_
:|M|: Rohit Mathew <Rohit.Mathew@arm.com>
:|G|: `rohit-arm`_
:|F|: plat/arm/board/neoverse_rd/common
:|F|: plat/arm/board/neoverse_rd/platform/rdn2/
:|F|: plat/arm/board/neoverse_rd/platform/rdv3/

Arm Total Compute platform port
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
:|M|: Artem Kopotev <artem.kopotev@arm.com>
:|G|: `artkopotev`_
:|M|: Oleksandr Tarhunakov <Oleksandr.Tarhunakov@arm.com>
:|G|: `o-tarhunakov`_
:|F|: plat/arm/board/tc

Arm Automotive RD platform port
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
:|M|: Diego Sueiro <diego.sueiro@arm.com>
:|G|: `diego-sueiro`_
:|M|: Peter Hoyes <peter.hoyes@arm.com>
:|G|: `hoyes`_
:|M|: Divin Raj <divin.raj@arm.com>
:|G|: `divin-raj`_
:|F|: plat/arm/board/automotive_rd

Aspeed platform port
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
:|M|: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
:|G|: `ChiaweiW`_
:|M|: Neal Liu <neal_liu@aspeedtech.com>
:|G|: `Neal-liu`_
:|F|: docs/plat/ast2700.rst
:|F|: plat/aspeed/

HiSilicon HiKey and HiKey960 platform ports
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
:|M|: Haojian Zhuang <haojian.zhuang@linaro.org>
:|G|: `hzhuang1`_
:|F|: docs/plat/hikey.rst
:|F|: docs/plat/hikey960.rst
:|F|: plat/hisilicon/hikey/
:|F|: plat/hisilicon/hikey960/

HiSilicon Poplar platform port
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
:|M|: Shawn Guo <shawn.guo@linaro.org>
:|G|: `shawnguo2`_
:|F|: docs/plat/poplar.rst
:|F|: plat/hisilicon/poplar/

Intel SocFPGA platform ports
^^^^^^^^^^^^^^^^^^^^^^^^^^^^
:|M|: Sieu Mun Tang <sieu.mun.tang@intel.com>
:|G|: `sieumunt`_
:|M|: Benjamin Jit Loon Lim <jit.loon.lim@intel.com>
:|G|: `BenjaminLimJL`_
:|F|: plat/intel/soc/
:|F|: drivers/intel/soc/

MediaTek platform ports
^^^^^^^^^^^^^^^^^^^^^^^
:|M|: Leon Chen <leon.chen@mediatek.com>
:|G|: `leon-chen-mtk`_
:|M|: Jason-CH Chen <jason-ch.chen@mediatek.com>
:|G|: `jason-ch-chen`_
:|M|: Yidi Lin <yidilin@chromium.org>
:|G|: `linyidi`_
:|F|: docs/plat/mt\*.rst
:|F|: plat/mediatek/

Marvell platform ports and SoC drivers
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
:|M|: Jaiprakash Singh <jaiprakashs@marvell.com>
:|G|: `sjaypee208`_
:|F|: docs/plat/marvell/
:|F|: plat/marvell/
:|F|: drivers/marvell/
:|F|: tools/marvell/

Nuvoton npcm845x platform port
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
:|M|: Hila Miranda-Kuzi <hila.miranda.kuzi1@gmail.com>
:|G|: `hilamirandakuzi1`_
:|M|: Margarita Glushkin <rutigl@gmail.com>
:|G|: `rutigl`_
:|M|: Avi Fishman <avi.fishman@nuvoton.com>
:|G|: `avifishman`_
:|F|: docs/plat/npcm845x.rst
:|F|: include/drivers/nuvoton/
:|F|: include/plat/nuvoton/
:|F|: plat/nuvoton/

NVidia platform ports
^^^^^^^^^^^^^^^^^^^^^
:|M|: Varun Wadekar <vwadekar@nvidia.com>
:|G|: `vwadekar`_
:|F|: docs/plat/nvidia-tegra.rst
:|F|: include/lib/cpus/aarch64/denver.h
:|F|: lib/cpus/aarch64/denver.S
:|F|: plat/nvidia/

NXP i.MX 7 WaRP7 platform port and SoC drivers
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
:|M|: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
:|G|: `bryanodonoghue`_
:|M|: Jun Nie <jun.nie@linaro.org>
:|G|: `niej`_
:|F|: docs/plat/warp7.rst
:|F|: plat/imx/common/
:|F|: plat/imx/imx7/
:|F|: drivers/imx/timer/
:|F|: drivers/imx/uart/
:|F|: drivers/imx/usdhc/

NXP i.MX 8 platform port
^^^^^^^^^^^^^^^^^^^^^^^^
:|M|: Peng Fan <peng.fan@nxp.com>
:|G|: `MrVan`_
:|F|: docs/plat/imx8.rst
:|F|: plat/imx/

NXP i.MX8M platform port
^^^^^^^^^^^^^^^^^^^^^^^^
:|M|: Jacky Bai <ping.bai@nxp.com>
:|G|: `JackyBai`_
:|F|: docs/plat/imx8m.rst
:|F|: plat/imx/imx8m/

NXP i.MX8ULP platform port
^^^^^^^^^^^^^^^^^^^^^^^^^^
:|M|: Jacky Bai <ping.bai@nxp.com>
:|G|: `JackyBai`_
:|F|: docs/plat/imx8ulp.rst
:|F|: plat/imx/imx8ulp/

NXP i.MX9 platform port
^^^^^^^^^^^^^^^^^^^^^^^^
:|M|: Jacky Bai <ping.bai@nxp.com>
:|G|: `JackyBai`_
:|F|: docs/plat/imx9.rst
:|F|: plat/imx/imx93/

NXP QorIQ Layerscape common code for platform ports
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
:|M|: Pankaj Gupta <pankaj.gupta@nxp.com>
:|G|: `pangupta`_
:|M|: Jiafei Pan <jiafei.pan@nxp.com>
:|G|: `JiafeiPan`_
:|F|: docs/plat/nxp/
:|F|: plat/nxp/
:|F|: drivers/nxp/
:|F|: tools/nxp/

NXP SoC Part LX2160A and its platform port
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
:|M|: Pankaj Gupta <pankaj.gupta@nxp.com>
:|G|: `pangupta`_
:|F|: plat/nxp/soc-lx2160a
:|F|: plat/nxp/soc-lx2160a/lx2162aqds
:|F|: plat/nxp/soc-lx2160a/lx2160aqds
:|F|: plat/nxp/soc-lx2160a/lx2160ardb

NXP SoC Part LS1028A and its platform port
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
:|M|: Jiafei Pan <jiafei.pan@nxp.com>
:|G|: `JiafeiPan`_
:|F|: plat/nxp/soc-ls1028a
:|F|: plat/nxp/soc-ls1028a/ls1028ardb

NXP SoC Part LS1043A and its platform port
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
:|M|: Jiafei Pan <jiafei.pan@nxp.com>
:|G|: `JiafeiPan`_
:|F|: plat/nxp/soc-ls1043a
:|F|: plat/nxp/soc-ls1043a/ls1043ardb

NXP SoC Part LS1046A and its platform port
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
:|M|: Jiafei Pan <jiafei.pan@nxp.com>
:|G|: `JiafeiPan`_
:|F|: plat/nxp/soc-ls1046a
:|F|: plat/nxp/soc-ls1046a/ls1046ardb
:|F|: plat/nxp/soc-ls1046a/ls1046afrwy
:|F|: plat/nxp/soc-ls1046a/ls1046aqds

NXP SoC Part LS1088A and its platform port
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
:|M|: Jiafei Pan <jiafei.pan@nxp.com>
:|G|: `JiafeiPan`_
:|F|: plat/nxp/soc-ls1088a
:|F|: plat/nxp/soc-ls1088a/ls1088ardb
:|F|: plat/nxp/soc-ls1088a/ls1088aqds

NXP SoC Part S32G274A and its platform port
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
:|M|: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
:|G|: `gprocopciucnxp`_
:|F|: docs/plat/s32g274a.rst
:|F|: drivers/nxp/clk/s32cc
:|F|: drivers/nxp/console/linflex_console.S
:|F|: include/drivers/nxp/console/linflex.h
:|F|: plat/nxp/s32

QEMU platform port
^^^^^^^^^^^^^^^^^^
:|M|: Jens Wiklander <jens.wiklander@linaro.org>
:|G|: `jenswi-linaro`_
:|F|: docs/plat/qemu.rst
:|F|: plat/qemu/

QTI platform port
^^^^^^^^^^^^^^^^^
:|M|: Lachit Patel <lpatel@codeaurora.org>
:|G|: `lachitp`_
:|M|: Sreevyshanavi Kare <skare@codeaurora.org>
:|G|: `sreekare`_
:|M|: Muhammad Arsath K F <quic_mkf@quicinc.com>
:|G|: `quic_mkf`_
:|M|: Saurabh Gorecha <quic_sgorecha@quicinc.com>
:|G|: `quic_sgorecha`_
:|M|: QTI TF Maintainers <qti.trustedfirmware.maintainers@codeaurora.org>
:|F|: docs/plat/qti.rst
:|F|: plat/qti/

QTI MSM8916 platform port
^^^^^^^^^^^^^^^^^^^^^^^^^
:|M|: Stephan Gerhold <stephan@gerhold.net>
:|G|: `stephan-gh`_
:|M|: Nikita Travkin <nikita@trvn.ru>
:|G|: `TravMurav`_
:|F|: docs/plat/qti-msm8916.rst
:|F|: plat/qti/mdm9607/
:|F|: plat/qti/msm8909/
:|F|: plat/qti/msm8916/
:|F|: plat/qti/msm8939/

Raspberry Pi 3 platform port
^^^^^^^^^^^^^^^^^^^^^^^^^^^^
:|M|: Ying-Chun Liu (PaulLiu) <paul.liu@linaro.org>
:|G|: `grandpaul`_
:|F|: docs/plat/rpi3.rst
:|F|: plat/rpi/rpi3/
:|F|: plat/rpi/common/
:|F|: drivers/rpi3/
:|F|: include/drivers/rpi3/

Raspberry Pi 4 platform port
^^^^^^^^^^^^^^^^^^^^^^^^^^^^
:|M|: Andre Przywara <andre.przywara@arm.com>
:|G|: `Andre-ARM`_
:|F|: docs/plat/rpi4.rst
:|F|: plat/rpi/rpi4/
:|F|: plat/rpi/common/
:|F|: drivers/rpi3/
:|F|: include/drivers/rpi3/

Renesas rcar-gen3 platform port
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
:|M|: Marek Vasut <marek.vasut@gmail.com>
:|G|: `marex`_
:|F|: docs/plat/rcar-gen3.rst
:|F|: plat/renesas/common
:|F|: plat/renesas/rcar
:|F|: drivers/renesas/common
:|F|: drivers/renesas/rcar
:|F|: tools/renesas/rcar_layout_create

Renesas RZ/G2 platform port
^^^^^^^^^^^^^^^^^^^^^^^^^^^
:|M|: Biju Das <biju.das.jz@bp.renesas.com>
:|G|: `bijucdas`_
:|M|: Marek Vasut <marek.vasut@gmail.com>
:|G|: `marex`_
:|M|: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
:|G|: `prabhakarlad`_
:|F|: docs/plat/rz-g2.rst
:|F|: plat/renesas/common
:|F|: plat/renesas/rzg
:|F|: drivers/renesas/common
:|F|: drivers/renesas/rzg
:|F|: tools/renesas/rzg_layout_create

RockChip platform port
^^^^^^^^^^^^^^^^^^^^^^
:|M|: Tony Xie <tony.xie@rock-chips.com>
:|G|: `TonyXie06`_
:|G|: `rockchip-linux`_
:|M|: Heiko Stuebner <heiko@sntech.de>
:|G|: `mmind`_
:|F|: plat/rockchip/

STMicroelectronics platform ports
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
:|M|: Yann Gautier <yann.gautier@st.com>
:|G|: `Yann-lms`_
:|M|: Maxime Méré <maxime.mere@foss.st.com>
:|G|: `meremST`_
:|F|: docs/plat/st/*
:|F|: docs/plat/stm32mp1.rst
:|F|: drivers/st/
:|F|: fdts/stm32\*
:|F|: include/drivers/st/
:|F|: include/dt-bindings/\*/stm32\*
:|F|: plat/st/
:|F|: tools/fiptool/plat_fiptool/st/
:|F|: tools/stm32image/

Synquacer platform port
^^^^^^^^^^^^^^^^^^^^^^^
:|M|: Sumit Garg <sumit.garg@kernel.org>
:|G|: `b49020`_
:|M|: Masahisa Kojima <kojima.masahisa@socionext.com>
:|G|: `masahisak`_
:|F|: docs/plat/synquacer.rst
:|F|: plat/socionext/synquacer/

Texas Instruments platform port
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
:|M|: Nishanth Menon <nm@ti.com>
:|G|: `nmenon`_
:|F|: docs/plat/ti-k3.rst
:|F|: plat/ti/

UniPhier platform port
^^^^^^^^^^^^^^^^^^^^^^
:|M|: Orphan
:|F|: docs/plat/socionext-uniphier.rst
:|F|: plat/socionext/uniphier/

AMD-Xilinx platform port
^^^^^^^^^^^^^^^^^^^^^^^^
:|M|: Michal Simek <michal.simek@amd.com>
:|G|: `michalsimek`_
:|M|: Akshay Belsare <akshay.belsare@amd.com>
:|G|: `Akshay-Belsare`_
:|M|: Maheedhar Sai Bollapalli <maheedharsai.bollapalli@amd.com>
:|G|: `maheedhar-bollapalli`_
:|F|: docs/plat/amd\*
:|F|: docs/plat/xilinx\*
:|F|: plat/amd/
:|F|: plat/xilinx/


Secure Payloads and Dispatchers
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

OP-TEE dispatcher
^^^^^^^^^^^^^^^^^
:|M|: Jens Wiklander <jens.wiklander@linaro.org>
:|G|: `jenswi-linaro`_
:|F|: docs/components/spd/optee-dispatcher.rst
:|F|: services/spd/opteed/

TLK
^^^^^^^^^^^^^^^^^^^^^^^^^^
:|M|: Varun Wadekar <vwadekar@nvidia.com>
:|G|: `vwadekar`_
:|F|: docs/components/spd/tlk-dispatcher.rst
:|F|: include/bl32/payloads/tlk.h
:|F|: services/spd/tlkd/

Trusty secure payloads
^^^^^^^^^^^^^^^^^^^^^^^^^^
:|M|: Arve Hjønnevåg <arve@android.com>
:|G|: `arve-android`_
:|M|: Marco Nelissen <marcone@google.com>
:|G|: `marcone`_
:|M|: Varun Wadekar <vwadekar@nvidia.com>
:|G|: `vwadekar`_
:|F|: docs/components/spd/trusty-dispatcher.rst
:|F|: services/spd/trusty/


Test Secure Payload (TSP)
^^^^^^^^^^^^^^^^^^^^^^^^^
:|M|: Manish Badarkhe <manish.badarkhe@arm.com>
:|G|: `ManishVB-Arm`_
:|F|: bl32/tsp/
:|F|: services/spd/tspd/

ProvenCore Secure Payload Dispatcher
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
:|M|: Jérémie Corbier <jeremie.corbier@provenrun.com>
:|G|: `jcorbier`_
:|F|: docs/components/spd/pnc-dispatcher.rst
:|F|: services/spd/pncd/

Tools
~~~~~

Fiptool
^^^^^^^
:|M|: Manish Badarkhe <manish.badarkhe@arm.com>
:|G|: `ManishVB-Arm`_
:|M|: Joao Alves <Joao.Alves@arm.com>
:|G|: `J-Alves`_
:|F|: tools/fiptool/

Cert_create tool
^^^^^^^^^^^^^^^^
:|M|: Sandrine Bailleux <sandrine.bailleux@arm.com>
:|G|: `sandrine-bailleux-arm`_
:|M|: Manish Badarkhe <manish.badarkhe@arm.com>
:|G|: `ManishVB-Arm`_
:|M|: Lauren Wehrmeister <Lauren.Wehrmeister@arm.com>
:|G|: `laurenw-arm`_
:|F|: tools/cert_create/

Encrypt_fw tool
^^^^^^^^^^^^^^^
:|M|: Sumit Garg <sumit.garg@kernel.org>
:|G|: `b49020`_
:|F|: tools/encrypt_fw/

Sptool
^^^^^^
:|M|: Manish Pandey <manish.pandey2@arm.com>
:|G|: `manish-pandey-arm`_
:|M|: Joao Alves <Joao.Alves@arm.com>
:|G|: `J-Alves`_
:|F|: tools/sptool/

Build system
^^^^^^^^^^^^
:|M|: Chris Kay <chris.kay@arm.com>
:|G|: `CJKay`_
:|M|: Manish Pandey <manish.pandey2@arm.com>
:|G|: `manish-pandey-arm`_
:|F|: Makefile
:|F|: make_helpers/

Threat Model
~~~~~~~~~~~~~
:|M|: Sandrine Bailleux <sandrine.bailleux@arm.com>
:|G|: `sandrine-bailleux-arm`_
:|M|: Joanna Farley <joanna.farley@arm.com>
:|G|: `joannafarley-arm`_
:|M|: Raghu Krishnamurthy <raghuoss@raghushome.com>
:|G|: `raghuncstate`_
:|M|: Varun Wadekar <vwadekar@nvidia.com>
:|G|: `vwadekar`_
:|F|: docs/threat_model/

Conventional Changelog Extensions
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
:|M|: Chris Kay <chris.kay@arm.com>
:|G|: `CJKay`_
:|F|: tools/conventional-changelog-tf-a

.. _abdellatif-elkhlifi: https://github.com/abdellatif-elkhlifi
.. _Akshay-Belsare: https://github.com/Akshay-Belsare
.. _AlexeiFedorov: https://github.com/AlexeiFedorov
.. _andersdellien-arm: https://github.com/andersdellien-arm
.. _Andre-ARM: https://github.com/Andre-ARM
.. _Anson-Huang: https://github.com/Anson-Huang
.. _anukou: https://github.com/anukou
.. _arugan02: https://github.com/arugan02
.. _arve-android: https://github.com/arve-android
.. _avifishman: https://github.com/avifishman
.. _b49020: https://github.com/b49020
.. _BenjaminLimJL: https://github.com/BenjaminLimJL
.. _bijucdas: https://github.com/bijucdas
.. _bipinravi-arm: https://github.com/bipinravi-arm
.. _bryanodonoghue: https://github.com/bryanodonoghue
.. _jidongsun: https://github.com/jidongsun
.. _carlocaione: https://github.com/carlocaione
.. _chandnich: https://github.com/chandnich
.. _ChiaweiW: https://github.com/chiaweiw
.. _CJKay: https://github.com/cjkay
.. _danh-arm: https://github.com/danh-arm
.. _davidvincze: https://github.com/davidvincze
.. _diego-sueiro: https://github.com/diego-sueiro
.. _divin-raj: https://github.com/divin-raj
.. _etienne-lms: https://github.com/etienne-lms
.. _glneo: https://github.com/glneo
.. _govindraj-arm: https://github.com/govindraj-arm
.. _gprocopciucnxp: https://github.com/gprocopciucnxp
.. _grandpaul: https://github.com/grandpaul
.. _harrisonmutai-arm: https://github.com/harrisonmutai-arm
.. _hilamirandakuzi1: https://github.com/hilamirandakuzi1
.. _hoyes: https://github.com/hoyes
.. _hzhuang1: https://github.com/hzhuang1
.. _hugues-kambampiana-arm: https://github.com/hugueskamba
.. _JackyBai: https://github.com/JackyBai
.. _J-Alves: https://github.com/J-Alves
.. _jason-ch-chen: https://github.com/jason-ch-chen
.. _javieralso-arm: https://github.com/javieralso-arm
.. _jayanthchidanand-arm: https://github.com/jayanthchidanand-arm
.. _jcorbier: https://github.com/jcorbier
.. _jenswi-linaro: https://github.com/jenswi-linaro
.. _JiafeiPan: https://github.com/JiafeiPan
.. _joannafarley-arm: https://github.com/joannafarley-arm
.. _jslater8: https://github.com/jslater8
.. _jwerner-chromium: https://github.com/jwerner-chromium
.. _kostapr: https://github.com/kostapr
.. _lachitp: https://github.com/lachitp
.. _laurenw-arm: https://github.com/laurenw-arm
.. _leon-chen-mtk: https://github.com/leon-chen-mtk
.. _linyidi: https://github.com/linyidi
.. _loosper-arm: https://github.com/loosper-arm
.. _madhukar-Arm: https://github.com/madhukar-Arm
.. _maheedhar-bollapalli: https://github.com/maheedhar-bollapalli
.. _manish-pandey-arm: https://github.com/manish-pandey-arm
.. _ManishVB-Arm: https://github.com/ManishVB-Arm
.. _marcbonnici: https://github.com/marcbonnici
.. _marcone: https://github.com/marcone
.. _mardyk01: https://github.com/mardyk01
.. _marex: https://github.com/marex
.. _masahir0y: https://github.com/masahir0y
.. _masahisak: https://github.com/masahisak
.. _max-shvetsov: https://github.com/max-shvetsov
.. _meremST: https://github.com/meremST
.. _michalsimek: https://github.com/michalsimek
.. _mmind: https://github.com/mmind
.. _MrVan: https://github.com/MrVan
.. _Neal-liu: https://github.com/neal-liu
.. _niej: https://github.com/niej
.. _nmenon: https://github.com/nmenon
.. _npoushin: https://github.com/npoushin
.. _odeprez: https://github.com/odeprez
.. _pangupta: https://github.com/pangupta
.. _prabhakarlad: https://github.com/prabhakarlad
.. _quic_mkf: https://github.com/quicmkf
.. _quic_sgorecha: https://github.com/sgorecha
.. _raghuncstate: https://github.com/raghuncstate
.. _raymo200915: https://github.com/raymo200915
.. _remi-triplefault: https://github.com/repk
.. _rockchip-linux: https://github.com/rockchip-linux
.. _rohit-arm: https://github.com/rohit-arm
.. _o-tarhunakov: https://github.com/o-tarhunakov
.. _rutigl: https://github.com/rutigl
.. _sandrine-bailleux-arm: https://github.com/sandrine-bailleux-arm
.. _shawnguo2: https://github.com/shawnguo2
.. _sieumunt: https://github.com/sieumunt
.. _smaeul: https://github.com/smaeul
.. _soby-mathew: https://github.com/soby-mathew
.. _sreekare: https://github.com/sreekare
.. _stefanasimion: https://github.com/stefanasimion
.. _stephan-gh: https://github.com/stephan-gh
.. _thomas-arm: https://github.com/thomas-arm
.. _TonyXie06: https://github.com/TonyXie06
.. _TravMurav: https://github.com/TravMurav
.. _uarif1: https://github.com/uarif1
.. _vijayenthiran-arm: https://github.com/vijayenthiran-arm
.. _artkopotev: https://github.com/artkopotev
.. _vwadekar: https://github.com/vwadekar
.. _Yann-lms: https://github.com/Yann-lms
.. _sjaypee208: https://github.com/sjaypee208

--------------

*Copyright (c) 2019-2025, Arm Limited and Contributors. All rights reserved.*
