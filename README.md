Attempt to create a minimal EDK2 for SM8250 (Transplanted from Pixel3XL).

[![Build Status](https://dev.azure.com/zhuoweizhang/edk2-pixel3/_apis/build/status/Pixel3Dev.edk2-pixel3?branchName=master)](https://dev.azure.com/zhuoweizhang/edk2-pixel3/_build/latest?definitionId=1&branchName=master)

## Status

Boot Windows10 PE is stuck in the logo

Boot Linux must add kernel parameters:clk_ignore_unused

## Building
Tested on Ubuntu 18.04.

First, clone EDK2.

```
cd ..
git clone --depth 1 --branch edk2-stable202208 https://github.com/tianocore/edk2.git
git -C edk2 submodule update --init --recursive --depth 1
git init edk2-platforms
git -C edk2-platforms remote add origin https://github.com/tianocore/edk2-platforms.git
git -C edk2-platforms fetch --depth 1 origin 3c3b1168017073c2bb2d97336c5929ebae805be1
git -C edk2-platforms checkout -B pinned-edk2-stable202208 FETCH_HEAD
```

The `edk2-platforms` checkout is pinned to a matching 2022-08 commit because newer upstream revisions are not compatible with this platform tree.
These commands expect a recent Git version with `git -C` and shallow submodule update support.

You should have all three directories side by side.

Next, install dependencies:

18.04:

```
sudo apt install build-essential uuid-dev iasl git nasm python3-distutils gcc-aarch64-linux-gnu abootimg
```

Also see [EDK2 website](https://github.com/tianocore/tianocore.github.io/wiki/Using-EDK-II-with-Native-GCC#Install_required_software_from_apt)

Finally, ./build.sh.

Then fastboot boot boot_uefi.img.

# Credits

SimpleFbDxe screen driver is from imbushuo's [Lumia950XLPkg](https://github.com/WOA-Project/Lumia950XLPkg).
