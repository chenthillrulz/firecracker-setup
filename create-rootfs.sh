#!/bin/bash

set -xe

dd if=/dev/zero of=rootfs.ext4 bs=1M count=500
mkfs.ext4 rootfs.ext4
