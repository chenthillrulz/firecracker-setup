#!/bin/bash

set -xe

git clone https://github.com/torvalds/linux.git linux
cd linux
# use v5.15 branch on ubuntu 22.04
git checkout v5.15
echo "Look at bash script to download configurations for microvm"
# Download https://github.com/firecracker-microvm/firecracker/blob/main/resources/guest_configs/microvm-kernel-x86_64-4.14.config
# and place it at .config
#make -j16 vmlinux

