
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


update git buildroot-bbb