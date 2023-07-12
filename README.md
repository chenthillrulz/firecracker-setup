# Setting up Dev environment
- Requires a virtual machine that has nested virtualization support or EC2 bare metal machine or EC2 nitro based machine
- Building firecracker
- Building kernel and rootfs
- Testing the kernel and rootfs

## Building firecracker from source.
- Checkout https://github.com/firecracker-microvm/firecracker
- Readme - https://github.com/firecracker-microvm/firecracker/blob/main/docs/dev-machine-setup.md#local-virtual-machine
- I have used Parallels for Mac with Ubuntu 22.04
- Testing firecracker build using AWS provided kernel and rootfs image
  - https://s3.amazonaws.com/spec.ccfc.min/img/hello/kernel/hello-vmlinux.bin
  - https://s3.amazonaws.com/spec.ccfc.min/img/hello/fsfiles/hello-rootfs.ext4

## Building the kernel and rootfs ext4 file system
- Build your own kernel using kernel sources that match the distro
- Eg: Ubuntu 22.04 uses v5.15
- Use the scripts under config directory to setup an alpine root filesystem with nodejs

## Testing the kernel and rootfs
- Readme - https://github.com/firecracker-microvm/firecracker/blob/main/docs/getting-started.md
