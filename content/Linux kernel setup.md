
التصور العام, انا عايز ايه؟

> [!NOTE]
> وثق تماما كل قرار اخدته وليه


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
- [ ] هل ينفع استخدم bmaptool مثلا علشان اعمل flash over http؟
	- [ ] هل ينفع اقلب الـ BBB لـ usb gadget واستخدم bmaptool مباشر؟ 
	- [ ] او اقلب الـ BBB eMMC لـ usb gadget واعملها flash بـ bmaptool؟
- [ ] شوف ازاى ممكن تضيف kernel modules directly after boot زى etc/modules/
	- [ ] جرب تضيف واحد
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
- [ ] جرب تحط custom unit زى اللى حطيتها مع buildroot overlay
- [ ] جرب تحتفظ بـ overlay خارجى! هل دا مفيد فعلا؟ مع yocto؟
- [ ] كمل مذاكره systemd واجمع tricks على اد ما تقدر ونظف الـ cheat sheet بتاعك
- [ ] 
# [fstab](fstab.md)
# [Genimage](Genimage.md)
- [ ] اقرأ الـ docs
- [ ] [GitHub - a3f/genimages: Very simple Makefile for genimage(1)](https://github.com/a3f/genimages)
- [ ] 
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
- [ ] غير حاجه فى الكيرنال واتأكد ان التأثير موجود بعد استخدام raucinstall
- [ ] 

# Network boot
احسن NFS بالنسبالى هو اللى جاى من poky-nfsroot لانى مش محتاج اعمل install لأى حاجه زياده.

- [ ] اعمل nfs setup عدل 🟡
- [ ] شغل الـ network boot وضيف env vars فى yocto خاصه بيك فى اخر الملف
- [ ] اقرأ كل الـ man بتاعت dnsmasq وجرب كل الـ params بتاعته

الاوامر دى اشغلت معايا كويس ومع poky-nfsboot لكن عطلت وقت لما systemd بدأ:

```
setenv serverip 192.168.0.134
setenv ipaddr 192.168.0.10

tftpboot 0x82000000 zImage
tftpboot 0x88000000 am335x-boneblack.dtb

setenv bootargs "console=${console} root=/dev/nfs rw rootfstype=nfs ip=dhcp nfsroot=192.168.0.134:/src/yocto/build/bbb/nfsroot-core-image-bbb-bbb,nfsvers=3,proto=tcp,port=3048,mountport=3048 init=/usr/sbin/init"

bootz 0x82000000 - 0x88000000
```
- [ ] فى المستقبل خلى rauc يستخدم الـ emmc
- [ ] [\[U-Boot,v3,1/3\] AM335x : Add USB support for AM335x in u-boot - Patchwork](https://patchwork.ozlabs.org/project/uboot/patch/1340703483-27276-2-git-send-email-harman_sohanpal@ti.com/)
- [ ] [Programming eMMC with USB for OSD335x (AM335x System in Package) - Octavo Systems](https://octavosystems.com/docs/programming-emmc-with-usb-for-osd335x/)
- [ ] 
# barebox
- [ ] اقرأ الـ docs كويس 🟡
- [ ] barebox & yocto integration
	- [ ] ايه احسن طريقه للتبديل بينهم فى نفس الـ bbb image؟ عايز اغير سطر الـ prefered virtual provider بس
- [ ] [Pengutronix - Bringing Barebox into OE-Core (Yocto)](https://pengutronix.de/en/blog/2024-10-23-bringing-barebox-in-oe-core.html)
- [ ] توفير مكان خارجى لتطوير barebox وانك تاخد linux من الـ tftp
	- [ ] مازال استخدام barebox لوحده برا yocto اسرع واحسن لو عايز تركز بس فى تطوير barebox
	- [ ] مهمه barebox بتنتهى مع بدايه اللينكس, so انت مش محتاج yocto integration فى حاجه غير للـ deploy النهائى, مش لتطوير barebox نفسه
- [ ] 

# external toolchain
```
# toolchain
sudo apt install gcc-arm-linux-gnueabihf
```

ازاى ممكن اسرع bitbake؟ 
هل ممكن استخدم toolchain خارجى؟

# Boot time
- [ ] 
- [ ] 
- [ ] 
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
- [ ] Google: "processor sdk linux software developer guide"
- [ ] [GitHub - mvp/uhubctl: uhubctl - USB hub per-port power control](https://github.com/mvp/uhubctl)
- [ ] استخدم git worktree وامسح كل الـ branches
- [ ] كمل الـ فيديوهات الـ live بتاعت yocto
- [ ] حط متغير فى الملفين دول وشوف ليهم تأثير ولا لا تماماً, لو لا ضيف comment قول فيه ان الملف دا مات
```
meta-bbb/recipes-bsp/u-boot-scr/files/boot.cmd
meta-bbb/recipes-bsp/u-boot-scr/files/emmc-boot.cmd
meta-bbb/recipes-bsp/u-boot-scr/u-boot-scr_1.0.bb
```

- [ ] ايه دلاله الارقام دى! هل دى احسن حاجه؟!
```
Ubuntu@yocto $ git diff meta-bbb/recipes-core/images/core-image-bbb.bb
diff --git a/meta-bbb/recipes-core/images/core-image-bbb.bb b/meta-bbb/recipes-core/images/core-image-bbb.bb
index 13f439c5ff..fc4631c200 100644
--- a/meta-bbb/recipes-core/images/core-image-bbb.bb
+++ b/meta-bbb/recipes-core/images/core-image-bbb.bb
@@ -10,7 +10,9 @@ LICENSE = "MIT"
 # REMOVEME
 inherit core-image

+# ???
 IMAGE_ROOTFS_SIZE ?= "8192"
+# ???
 IMAGE_ROOTFS_EXTRA_SPACE:append = "${@bb.utils.contains("DISTRO_FEATURES", "systemd", " + 4096", "", d)}"

 #
@@ -52,8 +54,13 @@ IMAGE_INSTALL:append = " vim-tiny"
 IMAGE_INSTALL:append = " util-linux-lsblk"
 IMAGE_INSTALL:append = " alsa-plugins alsa-utils alsa-lib alsa-tools alsa-state alsa-equal"
 IMAGE_INSTALL:append = " usbutils"
+IMAGE_INSTALL:append = " nfs-utils"
 #IMAGE_INSTALL:append = " dropbear"
 #IMAGE_INSTALL:append = " bc"
+### USB Wireless
+IMAGE_INSTALL:append = " linux-firmware-rtl8192cu wpa-supplicant connman connman-client"
+
+

 #
 # buildhistory

```

- [ ] ضيف الألوان فى الـ shell ديماً من خلال الـ overlay, لان الـ shell دلوقتى ناشف جدا
- [ ] 
# continuous tasks 🔄
- [ ] وثق الاوامر اللى بتسخدمها مع bitbake فى README
- [ ] بعد ما كل حاجه تشتغل اعمل performance monitoring وراجع ايه اللى ناقص كدا وايه اللى ممكن تخليه يكون اسرع فى الـ cycle دى. 
	- [ ] انك تضيع وقت دلوقتى فى انك تسرع كل حاجه اهم من انك تكمل dev على حاجه بطيئه وممله🟡
- [ ] راجع كشاكيلك
- [ ] انك تراجع الحاجات اللى بتنزل مع كل release من Rauc و barebox ولينكس و uboot والخ
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
- [ ]  linux config
افهم الـ config دا بيعمل ايه: FW_LOADER_USER_HELPER
- [ ] احتفظ بكل الـ device tree الكامل برا واعمله tracking 🟡
- [ ] ذاكر الـ linux_build وشوف الـ device tree موجودين فين
- [ ] مشكله ان الـ device tree بتاعت beaglebone black ديما اصغر ما يمكن مقارنه باللى موجوده مع debian
- [ ] محتاج اعمل ملف dts نظف لجوا yocto ولبرا yocto علشان اغير براحتى واحس بتغيراتى  🟡

ابحث جوا الـ dir دا: 
```bash 
cd kernel.org/doc/Documentation/devicetree/bindings/
ack am33xx-
```

____
The official debain/beaglebone device tree :
https://github.com/beagleboard/BeagleBoard-DeviceTrees

_____
- [ ] 