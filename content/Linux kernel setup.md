
dotfiles: makeshift

- [dnsmasq](content/dnsmasq.md)
- load rootfs from tftp, better than nfs!
- use external toolchain in buildroot


> flash buildroot sdcard.img FAST!

```
bmaptool create build/images/sdcard.img > build/images/sdcard.bmap
time sudo bmaptool copy build/images/sdcard.img /dev/sda
```


# makeshift
- I added make savedefconfig with everysingle make


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

```
sudo apt install nfs-kernel-server nfs-common
sudo exportfs -ra
sudo systemctl start nfs-server
sudo systemctl enable nfs-server
```

عايز احاول اعمل symlinks لكل الـ target dirs فى nfs
