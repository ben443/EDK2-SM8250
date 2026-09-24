#!/bin/bash
# based on the instructions from edk2-platform
set -e
. build_common.sh
GCC5_AARCH64_PREFIX=aarch64-linux-gnu- build -s -n 0 -a AARCH64 -t GCC5 -p SM8250/SM8250.dsc
gzip -c < workspace/Build/SM8250/DEBUG_GCC5/FV/SM8250_UEFI.fd >uefi.img
cat redmi_lmi.dtb >>uefi.img
$(which "abootimg") --create workspace/boot_uefi.img -k uefi.img -r androidboot/ramdisk -f androidboot/android.cfg
rm -f uefi.img
#dd if=uefi_out.img of=/dev/block/by-name/recovery
