## File details
- setup-alpine.sh is the script that needs to be run inside alpine docker after mounting the rootfs ext4 filesystem volume 
at the mount point /my-rootfs
- hello-server.js is the nodejs app to be stored in connectorfs ext4 filesystem
- connector is the init script to mount (connectorfs ext4 disk) and run the nodejs app on startup
- Firecracker needs to be started with two disks,
  - rootfs (containing root filesystem for booting)
  - connectorfs (containing the filesystem for nodejs app)
