#!/bin/sh

set -xe

apk add --no-cache openrc
apk add --no-cache util-linux
apk add --no-cache nodejs
apk add --no-cache openssh
apk add --no-cache sudo
apk add --no-cache bash
apk add --no-cache npm
apk add --no-cache useradd

npm install pm2 -g
#undisk2 has some issues starting hence not using udiskctrl to mount /dev/vdb


ln -s agetty /etc/init.d/agetty.ttyS0
echo ttyS0 >/etc/securetty
rc-update add agetty.ttyS0 default

NEWUSER='connuser'
addgroup -g 1000 -S conngroup && adduser -u 1000 -S $NEWUSER -G conngroup
echo "root:root" | chpasswd
echo "$NEWUSER ALL=(ALL) ALL" > /etc/sudoers.d/$NEWUSER && chmod 0440 /etc/sudoers.d/$NEWUSER
#Allowing login using password and root login through sshd_config for POC. Better to use ssh key value pair

mkdir -p /home/$NEWUSER                                                                                                                                                                                                        
chown 1000:1000 /home/$NEWUSER 
cp /config/connector /etc/init.d/
cp /config/start-connector.sh /usr/bin/

rc-update add devfs boot
rc-update add procfs boot
rc-update add sysfs boot

rc-update add sshd
rc-update add connector

#for d in bin etc lib root sbin usr; do tar c "/$d" | tar x -C /my-rootfs; done
#for dir in dev proc run sys var tmp; do mkdir /my-rootfs/${dir}; done

echo "Root file system ready!! now modify sshd_config to allow password login"
