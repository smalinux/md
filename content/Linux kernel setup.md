

- [dnsmasq](content/dnsmasq.md)
- load rootfs from tftp, better than nfs!
- use external toolchain in buildroot


> flash buildroot sdcard.img FAST!

```
bmaptool create build/images/sdcard.img > build/images/sdcard.bmap
time sudo bmaptool copy build/images/sdcard.img /dev/sda
```

# Buildroot
- [ ] use external Linux source, (out-of-tree)
- [x] enable systemd
- [x] use fs_overlay
- [ ] use external toolchain
- [ ] 
# makeshift
- [x] run $ m savedefconfig  after every $ m
- [ ] 


# persistent data partition
## enable systemd
## fs_overlay
## use mmc as persistent data partition for now




تجنب ديما تعدل اى حاجه فى buildroot غير من خلال الـ menuconfig
اى تعديلات custom هتخليك تنقل بصعوبه جدا لـ version جديد
الحاجه الوحيده اللى الكلام دا ماينطبقش عليها هو الكيرنال, غير كدا اى package او init system بلاش تعمل حلول custom 


Git worktree: https://github.com/smalinux/buildroot-bbb




- rootfs read-only: BR2_ROOTFS_READ_ONLY

>
>Write a small systemd service or script to:
>Check if the device is formatted.
>If not, format it.
>Mount it or let mnt-data.mount handle it afterward.

زى ما مهم بالنسبالى ان الـ rootfs يكون ابسط ما يمكن, كمان مهم بالنسبالى ان الـ rootfs يكون scalable
اقدر انقل منه لاى rootfs تانى, دا هيسهل حياتى وهيسهل انى اكتب configuration 


## [systemd](systemd.md)
ليه انا اظطريت اركز مع systemd غصب عنى: علشان احتاجت data partition
وبعد بحث كتير لقيت ان احسن طريقه يتعمل بيها هو الـ init system 
دى الطريقه الواقعيه

> restart

systemctl daemon-reexec
systemctl daemon-reload
systemctl list-unit-files | grep overlay



==عايز احتفظ بأى .config موجود فى كل الـ package مش بس بتاع uboot & linux & buildroot==

## [fstab](fstab.md)
## [Genimage](Genimage.md)
## [[Rauc]]


## NFS
علشان تخلى الكيرنال تعمل nfs boot لازم توفر الـ kernel configs اللى تسمح بكده
من غيره, الـ nfs server اللى هتسطبه ولا ليه اى لزمه:
```
CONFIG_NFS_FS=y
CONFIG_ROOT_NFS=y
CONFIG_IP_PNP=y
CONFIG_IP_PNP_DHCP=y
CONFIG_NFS_V3=y
```

```
sudo apt install nfs-kernel-server nfs-common
sudo exportfs -ra
sudo systemctl start nfs-server
sudo systemctl enable nfs-server
```

عايز احاول اعمل symlinks لكل الـ target dirs فى nfs

# U-boot env
```
setenv serverip 192.168.0.134
setenv ipaddr 192.168.0.10

tftpboot 0x82000000 zImage
tftpboot 0x88000000 am335x-boneblack.dtb

setenv bootargs "console=ttyO0,115200 root=/dev/nfs rw nfsroot=192.168.1.100:/srv/nfs/rootfs,tcp ip=192.168.1.10:::::eth0:"
setenv bootargs "console=ttyO0,115200 root=/dev/nfs rw nfsroot=192.168.0.134:/nfsroot,tcp ip=dhcp"

bootz 0x82000000 - 0x88000000
```


# apt
```
# toolchain
sudo apt install gcc-arm-linux-gnueabihf
```



# Progress
- [ ] NFS & u-boot ❌
- [ ] use 