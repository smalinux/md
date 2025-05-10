
التصور العام, انا عايز ايه؟
الهدف انى يكون عندى setup حلو وسريع وبقدر اضيف واعدل فيه زى ما انا حابب
سريع يعنى سريع. لو اى حاجه بطيئه فى الـ من وقت الـ build لحد الـ deploy دا معناه انى حياتى عطلانه


فيه اتجاهين اساسيين ماشيين ديما جنب بعض وشغلين (المفروض) حلو جدا معايا
اتجاه التغيرات السريعه و اتجاه الـ deploy الفعلى

**اتجاه التغيرات السريعه**
انى اعمل TFTP boot مع NFS rootfs
علشان تخلى uboot يستخدم الاتجاه دا كل اللى عليك تعمله
```
bootcmd = boot_tfpt
```
وبالتالى مع كل repo بياخد الكيرنال من الـ TFTP وبياخد الـ rootfs من الـ poky-exporter

لو غيرت فى الـ Linux core هقدر اولد patches بسهوله واحطها فى yocto 

الميزات:
- اكبر ميزه انى ما احتاجتش اشغل bitbake تانى علشان اشوف تغيراتى
- الـ rootfs بنسبه كبيره جدا سليم بسبب poky exporter
- الـ rootfs اللى بيطلع مش بس صغير, كمان scalable
- 

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

قررت اوقف استخدام buildroot فى البيت!
السبب: ان buildroot مرهق جدا فى الـ config بتاعه لانى بحتاج اكتب كل حاجه form scratch
ثانياً انا بكره اغير فى الـ config files direct, يمكن ما احتاجش دا دلوقتى, لكن اكيد هيحصل فى المستقبل
دا بيأدى انى مش هعرف اعمل upgrade بسهوله. so انا قررت اريح دماغى
الهدف من buildroot بالنسبالى او yocto انه يدينى rootfs محترم من غير وجع دماغ كبيره وكمان يصمد معايا فى الـ scale فى الـ upgrade من غير وجع دماغ كتير, so هكمل مع yocto
# Yocto
اكبر عيب مع yocto over buildroot هو انه بيجى مع pre config واغلبها مش احسن حاجه وهحتاج اقفل كتير منها علشان اخليه اسرع
الـ rootfs اللى بيطلع من yocto ديما scalable 
من اغلس العيوب فى buildroot ان علشان تعمل enable لحاجه, بتاخد وقت كتير علشان بحط كل الـ settings from scratch ودى حاجه مش مهتم بيها تماماً فى الوقت الحالى.
انا مهتم بالكيرنال والـ bootloader 
انما انى اعمل enable لأى package لازم يكون بسرعه وسريع, انا مش عندى الوقت انى اعمل enable لكل حاجه from scratch

- [ ] شوف ازاى تقلل الـ boot time
- [ ] نظف الـ commit messages اكتر
- [ ] 

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


# [systemd](systemd.md)
ليه انا اظطريت اركز مع systemd غصب عنى: علشان احتاجت data partition
وبعد بحث كتير لقيت ان احسن طريقه يتعمل بيها هو الـ init system 
دى الطريقه الواقعيه

> restart

systemctl daemon-reexec
systemctl daemon-reload
systemctl list-unit-files | grep overlay

- [ ] ذاكر udev
- [ ] شوف مكان الـ services اللى موجوده already
- [ ] شوف امثله كتير عامه على systemd وايه اللى الناس بتعمله بـ systemd 
- [ ] شوف المتاح عندك على الـ host وايه الـ units اللى موجوده وبتعمل ايه
- [ ] خد الـ udev من احمد فطوم
- [ ] 
# [fstab](fstab.md)
# [Genimage](Genimage.md)
# [Rauc](Rauc.md)
- [ ] اتأكد فعلا ان Rauc قادر يعمل update لكل حاجه ماعدا uboot
	- [ ] فى المستقبل هتخلى rauc كمان يعمل update لـ uboot فى mmcblk1boot0
- [ ] ارفع الاسكربت بتاع raucintall
- [ ] اقرأ الاسكربتس اللى موجوده already وافهم ازاى شغاله كويس جدا
- [ ] افهم met-rauc-bbb
- [ ] اقرأ الـ docs
- [ ] (غير ضرورى): بعد ما تقرأ الـ docs كاملاً فكر ازاى تسرع الموضوع جدا
	- [ ] [Pengutronix - Saving Download Bandwidth with RAUC Adaptive Updates](https://pengutronix.de/en/blog/2022-10-12-rauc-adaptive-updates.html)
	- [ ] delta based update (aka Rauc adaptive updates)
- [ ] 

# NFS
احسن NFS بالنسبالى هو اللى جاى من poky-nfsroot لانى مش محتاج اعمل install لأى حاجه زياده.

علشان تخلى الكيرنال تعمل nfs boot لازم توفر الـ kernel configs اللى تسمح بكده
```
CONFIG_NFS_FS=y
CONFIG_ROOT_NFS=y
CONFIG_IP_PNP=y
CONFIG_IP_PNP_DHCP=y
CONFIG_NFS_V3=y
```
مع rauc لقيت فيه systemd unit بتشغل nftd, صلح الحته دى:
```
         Mounting NFSD configuration filesystem...
         Starting Virtual Console Setup...
[  OK  ] Mounted /boot.
[   26.750494] EXT4-fs (mmcblk0p4): recovery complete
[  OK  ] Finished Load Kernel Module fuse   26.765389] EXT4-fs (mmcblk0p4): mounted filesystem 373a7fb4-3bba-4bf7-90b0-21b45e8aea03 r/w with ordered data mode. Quota mode: disabled.
m.
[  OK  ] Mounted /data.
[FAILED] Failed to mount NFSD configuration filesystem.
See 'systemctl status proc-fs-nfsd.mount' for details.

```
- [ ] اعمل nfs setup عدل 🟡
- [ ] 
# U-boot
```
setenv serverip 192.168.0.134
setenv ipaddr 192.168.0.10

tftpboot 0x82000000 zImage
tftpboot 0x88000000 am335x-boneblack.dtb


setenv bootargs "console=ttyO0,115200 root=/dev/nfs rw nfsroot=192.168.0.134:/src/yocto/build/bbb/nfsroot-core-image-bbb-bbb,nfsvers=3,port=3048,udp,mountport=3048"

bootz 0x82000000 - 0x88000000
```
- [ ] فى المستقبل خلى rauc يستخدم الـ emmc
# barebox
- [ ] barebox & yocto integration
	- [ ] ايه احسن طريقه للتبديل بينهم فى نفس الـ bbb image؟ عايز اغير سطر الـ prefered virtual provider بس
- [ ] [Pengutronix - Bringing Barebox into OE-Core (Yocto)](https://pengutronix.de/en/blog/2024-10-23-bringing-barebox-in-oe-core.html)
- [ ] توفير مكان خارجى لتطوير barebox وانك تاخد linux من الـ tftp
	- [ ] مازال استخدام barebox لوحده برا yocto اسرع واحسن لو عايز تركز بس فى تطوير barebox
	- [ ] مهمه barebox بتنتهى مع بدايه اللينكس, so انت مش محتاج yocto integration فى حاجه غير للـ deploy النهائى, مش لتطوير barebox نفسه

# external toolchain
```
# toolchain
sudo apt install gcc-arm-linux-gnueabihf
```

ازاى ممكن اسرع bitbake؟ 
هل ممكن استخدم toolchain خارجى؟

# Boot time
# Progress
- [ ] شيل الحاجات اللى بتبطأ الـ boot من yocto وحاول تخلى الـ boot اسرع ما يمكن
- [x] الـ data patition موجود already !!
- [ ] لقيت أمر بالصدفه فى uboot اسمه usb_boot عايز اجربه!!
- [ ] عايز انظف طريقه احط بيها الكيرنال برا yocto واخلى يكتو يستخدمها وفى نفس الوقت ما اعملش gap كبيره وما اعرفش ارجع استخدم الكيرنال اللى جوا yocto
- [ ] تاسك: انى انقل الـ zImage والـ dtb لـ rootfs علشان تعرف تعمل update بسهوله
- [ ] ==عايز احتفظ بأى .config موجود فى كل الـ package مش بس بتاع uboot & linux & yocto==
- [ ] استخدم uhubctl
- [ ] شغل الـ wireless usb dongle 🟡
	- [ ] افهم الـ systemd unit دا كويس جدا وخليه يعمل cache للـ web interface علشان ما يضيعش وقت فى الـ scan مع كل reboot
- [ ] 

# continuous tasks 🔄
- [ ] وثق الاوامر اللى بتسخدمها مع bitbake فى README
- [ ] بعد ما كل حاجه تشتغل اعمل performance monitoring وراجع ايه اللى ناقص كدا وايه اللى ممكن تخليه يكون اسرع فى الـ cycle دى. 
	- [ ] انك تضيع وقت دلوقتى فى انك تسرع كل حاجه اهم من انك تكمل dev على حاجه بطيئه وممله🟡
- [ ] 

_____
قررت ارجع تانى لـ Yocto :
- يكتو اسهل تضيفله features مع الـ scale 
- الـ community والامثله متوفره اكتر
- مش هحتاج اعمل configure لكل حاجه from scratch زى مع buildroot
- محتاج جداً استخدم poky exporter مش معتمد تماماً على nfs بتاع الـ host 
- سهل الـ upgrade سواء لنسخه يكتو احدث او لـ arch مختلف

____
```
recipes-bsp/u-boot/files/boot.cmd
```
واضح كدا ان rauc بيضيف الـ env vars اللى انا بحطها لكن بعد أول reboot

____
> تاسك: انى انقل الـ zImage والـ dtb لـ rootfs

أولا عايز افهم الوضع الحالى الأول:

```
./poky/scripts/lib/wic/plugins/source/bootimg-partition.py

```

images/bbb/fw_env.config ???
images/bbb/boot.scr ???

```
$ bitbake -e core-image-bbb | grep ^IMAGE_BOOT_FILES=
IMAGE_BOOT_FILES="u-boot.img MLO boot.scr"
```

____

- [ ]  Support USB wireless dongel

**0bda:8176 — Realtek RTL8188CUS**

That chipset is officially supported **in-tree** by the Linux kernel via the `rtl8192cu` driver.

But here's why I mentioned the external driver like `rtl8188eu`:  
The **in-tree `rtl8192cu` driver** is **known to be buggy**, especially with newer kernels, poor roaming, and packet loss. So **many users** choose to disable `rtl8192cu` and use a more stable **out-of-tree driver** (often called `rtl8188eu`) from Realtek or community repos.

- [GitHub - lwfinger/rtl8188eu: Repository for stand-alone RTL8188EU driver.](https://github.com/lwfinger/rtl8188eu)
- [GitHub - aircrack-ng/rtl8188eus: RealTek RTL8188eus WiFi driver with monitor mode & frame injection support](https://github.com/aircrack-ng/rtl8188eus)

____
