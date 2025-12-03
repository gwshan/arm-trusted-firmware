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

if [ $# -ne 1 ]; then
   echo "./build.sh fvp|qemu"
   exit 1
fi

TFA_PATH=$PWD

if [ "$1" == "fvp" ]; then
   SHRINKWRAP_PATH=/home/gshan/.shrinkwrap
   SHRINKWRAP_BUILD_PATH=${SHRINKWRAP_PATH}/build/build/cca-3world
   SHRINKWRAP_PACKAGE_PATH=${SHRINKWRAP_PATH}/package/cca-3world
   EDK2_IMAGE=${SHRINKWRAP_BUILD_PATH}/edk2/DEBUG_GCC5/FV/FVP_AARCH64_EFI.fd
   DTB_IMAGE=${SHRINKWRAP_BUILD_PATH}/dt/dt_bootargs.dtb
   RMM_IMAGE=${TFA_PATH}/../tf-rmm/build/Release/rmm.img

   make CROSS_COMPILE=aarch64-none-elf-                                 \
        PLAT=fvp DEBUG=0 LOG_LEVEL=40 ARM_DISABLE_TRUSTED_WDOG=1        \
        ARM_ARCH_MAJOR=9 ARM_ARCH_MINOR=2 BRANCH_PROTECTION=1           \
        CTX_INCLUDE_AARCH32_REGS=0 ENABLE_RME=1                         \
        FVP_HW_CONFIG_DTS=fdts/fvp-base-gicv3-psci-1t.dts               \
        BL33=${EDK2_IMAGE} RMM=${RMM_IMAGE} FVP_HW_CONFIG=${DTB_IMAGE}  \
        -j 8 all fip

   cp -f ${TFA_PATH}/build/fvp/release/*.bin ${SHRINKWRAP_PACKAGE_PATH}/
elif [ "$1" == "qemu" ]; then
   EDK2_IMAGE=${TFA_PATH}/../edk2/Build/ArmVirtQemuKernel-AARCH64/RELEASE_GCC5/FV/QEMU_EFI.fd
   RMM_IMAGE=${TFA_PATH}/../tf-rmm/build-qemu/Debug/rmm.img

   make CROSS_COMPILE=aarch64-none-elf-                        \
        PLAT=qemu ENABLE_RME=1 DEBUG=1 LOG_LEVEL=40            \
        QEMU_USE_GIC_DRIVER=QEMU_GICV3                         \
        BL33=${EDK2_IMAGE} RMM=${RMM_IMAGE}                    \
        -j 8 all fip

   rm -fr ${TFA_PATH}/flash.bin
   dd if=${TFA_PATH}/build/qemu/debug/bl1.bin of=${TFA_PATH}/flash.bin
   dd if=${TFA_PATH}/build/qemu/debug/fip.bin of=${TFA_PATH}/flash.bin seek=64 bs=4096
else
   echo "./build.sh fvp|qemu"
   exit 1
fi
