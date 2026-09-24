#!/bin/bash
set -e
sudo apt update
sudo apt install -y build-essential uuid-dev iasl git nasm gcc-aarch64-linux-gnu bc abootimg
curdir="$PWD"
cd ..
git clone --depth 1 --branch edk2-stable202208 https://github.com/tianocore/edk2.git --recursive
git clone --depth 1 https://github.com/tianocore/edk2-platforms.git
cd "$curdir"
./firstrun.sh
./build.sh
