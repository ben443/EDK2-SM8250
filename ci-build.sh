#!/bin/bash
set -e
sudo apt update
sudo apt install -y build-essential uuid-dev iasl git nasm gcc-aarch64-linux-gnu bc abootimg
curdir="$PWD"
cd ..
git clone --depth 1 --shallow-submodules --branch edk2-stable202208 https://github.com/tianocore/edk2.git --recursive
git init edk2-platforms
git -C edk2-platforms remote add origin https://github.com/tianocore/edk2-platforms.git
git -C edk2-platforms fetch --depth 1 origin 3c3b1168017073c2bb2d97336c5929ebae805be1
git -C edk2-platforms checkout FETCH_HEAD
cd "$curdir"
./firstrun.sh
./build.sh
