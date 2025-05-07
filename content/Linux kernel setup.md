
التصور العام, انا عايز ايه؟

فيه اتجاهين:
1- وقت التطوير
2- وقت الـ deploy

**وقت التطوير:**
عندى repo برا تماماً yocto بعملها build وبتدينى شويه ملفات بيروحو تلقائى فى TFTP
الـ uboot env فيها الوضع الافتراضى bootcmd=bootp
وبالتالى مع كل repo بياخد الكيرنال من الـ TFTP وبياخد الـ rootfs من الـ poky-exporter
تم!
لو غيرت فى الـ Linux core هقدر اولد بتشات بسهوله واحطها فى yocto 
الميزات:
اكبر ميزه انى ما احتاجتش اشغل bitbake تانى علشان اشوف تغيراتى
الـ rootfs بنسبه كبيره جدا سليم بسبب poky exporter
العيوب:
- 1
- 2

**وقت الـ deploy:**
هتشغل bitbake مره واحده بس, بعيدن هشغل rauc وبكده هبقى غيرت كل الـ rootfs واخدت الكيرنال الجديده
_____

- [dnsmasq](content/dnsmasq.md)
- use external toolchain in yocto


# ~~Buildroot~~
- [ ] use external Linux source, (out-of-tree)
- [x] enable systemd
- [x] use fs_overlay
- [ ] use external toolchain

تجنب ديما تعدل اى حاجه فى buildroot غير من خلال الـ menuconfig
اى تعديلات custom هتخليك تنقل بصعوبه جدا لـ version جديد
الحاجه الوحيده اللى الكلام دا ماينطبقش عليها هو الكيرنال, غير كدا اى package او init system بلاش تعمل حلول custom 
# makeshift
- [x] run $ m savedefconfig  after every $ m
- [ ] Git worktree: https://github.com/smalinux/buildroot-bbb
- [ ] 


# persistent data partition
enable systemd
fs_overlay
use mmc as persistent data partition for now
rootfs read-only: BR2_ROOTFS_READ_ONLY

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



==عايز احتفظ بأى .config موجود فى كل الـ package مش بس بتاع uboot & linux & yocto==

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


setenv bootargs "console=ttyO0,115200 root=/dev/nfs rw nfsroot=192.168.0.134:/src/yocto/build/bbb/nfsroot-core-image-bbb-bbb,nfsvers=3,port=3048,udp,mountport=3048"

bootz 0x82000000 - 0x88000000
```


# apt
```
# toolchain
sudo apt install gcc-arm-linux-gnueabihf
```

ازاى ممكن اسرع bitbake؟ 
هل ممكن استخدم toolchain خارجى؟

# Progress
- [ ] NFS & u-boot ❌
- [ ] شيل الحاجات اللى بتبطأ الـ boot من yocto وحاول تخلى الـ boot اسرع ما يمكن
- [ ] انقل الكيرنال مع rootfs علشان تعرف تعمل update بسهوله
- [x] الـ data patition موجود already !!
- [ ] شغل barebox جوا poky بدل uboot
- [ ] 


_____
قررت ارجع تانى لـ Yocto :
- يكتو اسهل تضيفله features مع الـ scale 
- الـ community والامثله متوفره اكتر
- مش هحتاج اعمل configure لكل حاجه from scratch زى مع buildroot
- محتاج جداً استخدم poky exporter مش معتمد تماماً على nfs بتاع الـ host 
- سهل الـ upgrade سواء لنسخه يكتو احدث او لـ arch مختلف
