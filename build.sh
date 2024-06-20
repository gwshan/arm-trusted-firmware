#!/bin/sh
#
# This script is inherited from the following command line, extracted
# from shrinkwrap build log
#
# make BUILD_BASE=/home/gshan/.shrinkwrap/build/build/cca-3world/tfa \
# PLAT=fvp DEBUG=0 LOG_LEVEL=40 ARM_DISABLE_TRUSTED_WDOG=1           \
# FVP_HW_CONFIG_DTS=fdts/fvp-base-gicv3-psci-1t.dts                  \
# BL33=/home/gshan/.shrinkwrap/build/build/cca-3world/edk2/RELEASE_GCC5/FV/FVP_AARCH64_EFI.fd \
# ARM_ARCH_MAJOR=9 ARM_ARCH_MINOR=2 BRANCH_PROTECTION=1 CTX_INCLUDE_AARCH32_REGS=0 \
# ENABLE_RME=1 RMM=/home/gshan/.shrinkwrap/build/build/cca-3world/rmm/Release/rmm.img \
# FVP_HW_CONFIG=/home/gshan/.shrinkwrap/build/build/cca-3world/dt/dt_bootargs.dtb \
# -j$(( 32 < 8 ? 32 : 8 )) all fip
#

EDK2_PATH=/home/gshan/.shrinkwrap/build/build/cca-3world/edk2
DTB_PATH=/home/gshan/.shrinkwrap/build/build/cca-3world/dt
TFA_PATH=$PWD
RMM_PATH=${TFA_PATH}/../tf-rmm

export | grep CROSS_COMPILE > /dev/null
if [ $? -ne 0 ]; then
   export CROSS_COMPILE=aarch64-none-elf-
fi

make CROSS_COMPILE=aarch64-none-elf-                          \
     PLAT=fvp DEBUG=0 LOG_LEVEL=40 ARM_DISABLE_TRUSTED_WDOG=1 \
     ARM_ARCH_MAJOR=9 ARM_ARCH_MINOR=2 BRANCH_PROTECTION=1    \
     CTX_INCLUDE_AARCH32_REGS=0 ENABLE_RME=1                  \
     FVP_HW_CONFIG_DTS=fdts/fvp-base-gicv3-psci-1t.dts        \
     BL33=${EDK2_PATH}/RELEASE_GCC5/FV/FVP_AARCH64_EFI.fd     \
     RMM=${RMM_PATH}/build/Release/rmm.img                    \
     FVP_HW_CONFIG=${DTB_PATH}/dt_bootargs.dtb                \
     -j 8 all fip

cp -f ${TFA_PATH}/build/fvp/release/*.bin /home/gshan/.shrinkwrap/package/cca-3world/
