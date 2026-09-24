#!/bin/bash
set -e
sudo apt update
sudo apt install -y build-essential uuid-dev iasl git nasm gcc-aarch64-linux-gnu bc abootimg
curdir="$PWD"
cd ..
git clone --depth 1 --branch edk2-stable202208 https://github.com/tianocore/edk2.git
git -C edk2 submodule update --init --recursive --depth 1
if [ -e edk2-platforms ]; then
  echo "Please remove ../edk2-platforms before running ci-build.sh" >&2
  exit 1
fi
git clone --no-checkout --depth 1 https://github.com/tianocore/edk2-platforms.git
git -C edk2-platforms fetch --depth 1 origin 3c3b1168017073c2bb2d97336c5929ebae805be1
git -C edk2-platforms checkout -B pinned-edk2-stable202208 FETCH_HEAD
git -C edk2-platforms submodule update --init --recursive --depth 1
cd "$curdir"
./firstrun.sh
./build.sh
