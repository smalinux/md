# Dev Setup

التصور العام, انا عايز ايه؟

الهدف انى يكون عندى setup حلو وسريع وبقدر اضيف واعدل فيه زى ما انا حابب
سريع يعنى سريع. لو اى حاجه بطيئه فى الـ من وقت الـ build لحد الـ deploy دا معناه انى حياتى عطلانه

فيه اتجاهين اساسيين ماشيين ديما جنب بعض وشغالين حلو جدا معايا:
1. اتجاه التغيرات السريعه
2. اتجاه الـ deploy الفعلى

### اتجاه التغيرات السريعه ⚡

- اعمل TFTP boot مع NFS rootfs
- علشان تخلى uboot يستخدم الاتجاه دا كل اللى عليك تعمله `bootcmd=boot_net`
- وبالتالى مع كل reboot بياخد الكيرنال من الـ TFTP وبياخد الـ rootfs من الـ poky nfsroot
- لو غيرت فى الـ Linux core هقدر اولد patches بسهوله واحطها فى yocto 
#### الميزات:
- اكبر ميزه انى ما احتاجتش اشغل bitbake تانى علشان اشوف تغيراتى
- الـ rootfs بنسبه كبيره جدا سليم بسبب poky exporter
- الـ rootfs اللى بيطلع مش بس صغير, كمان scalable

### اتجاه الـ deploy 🚀

- هتشغل bitbake مره واحده بس
- بعدين هشغل rauc وبكده هبقى غيرت كل الـ rootfs واخدت الكيرنال الجديده
#### الميزات:
- مش هياخد اى وقت علشان انقل التغيرات لـ yocto, مجرد defconfig بيتغير
- حتى لو الـ software update بـ RAUC بطيئ وبياخد دقيقه, الطبيعى اننا مش بنعمل software update كل يوم. دقيقه لا شئ,
- التحسين الفشيخ بتاع الـ Rauc delta update مش وقته دلوقتى خالص, دا وقته لما تقرأ rauc doc فى المستقبل بعدين خالص, مش حاجه ضروريه حالياً ودقيقه مش مده وحشه جدا تقف عندها دلوقتى

### الـ environment setup 🛠️
- [ ] [dnsmasq](content/dnsmasq.md) as TFTP (amazing with symlinks)
- [ ] nfsroot poky exporter

## Yocto Setup
- [ ] شوف ازاى تقلل الـ boot time
- [ ] نظف الـ commit messages اكتر
- [ ] هل ينفع استخدم bmaptool مثلا علشان اعمل flash over http؟ 
- [ ] هل ينفع اقلب الـ BBB لـ usb gadget واستخدم bmaptool مباشر؟ 
- [ ] او اقلب الـ BBB eMMC لـ usb gadget واعملها flash بـ bmaptool؟
- [ ] شوف ازاى ممكن تضيف kernel modules directly after boot زى etc/modules/
- [ ] جرب تضيف واحد
- [ ] poky/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb
- [ ] https://docs.yoctoproject.org/kernel-dev/maint-appx.html
      محتاج اقرأها تانى. مهم. خصوصاً لما اقرر اعتمد yocto-linux كمصدر ليا فى تطوير الكيرنال... هنا بيوصفو علمياً ازاى yocto team شغال على تطوير الكيرنال, والصفحه اللى قبلها هى الجانب النظرى للموضوع [4 Advanced Kernel Concepts — The Yocto Project ® 5.2 documentation](https://docs.yoctoproject.org/kernel-dev/concepts-appx.html) صفحه مهمه جدا لدرجه انى نفسى اقرأها مره كل كام شهر!

#### **ليه تستخدم الـ yocto-linux اللى بتقدمها يكتو؟**
- لانك مش هتضطر تعملها صيانه و upgrade بايدك
- لان الناس اللى وراها عندهم تكنيك وخبره سنين انه يعمل وايه احسن design
- تغيراتك اللى بتضيفها هى الشر، لازم تتعلم تشتغل معاهم
- تـ integrate حاجات بشكل nice من غير conflicts كتير
- مشكلتك قابلت ناس كتير غيرك، وديما فيه حلول جاهزه انت جاهل بيها
- احسن حاجه ممكن تعملها انك تخلى حلولك الـ custom معتمده على حاجه upstream وتـ hold الـ version وتكتب unit test
- اقتل الشغف بتاع انك تكتب حاجه very custom وتكون perfect لان دا مش هيحصل
- حاول على اد ما تقدر تحل مشاكلك مع الـ community

**ليه ماتستخدمش yocto-linux اللى بتقدمه يكتو؟**
- لو عندك تعديلات very custom
- لو عندك كيرنال عايز تفضل قاعد جنبها من غير ما تعمل اى update فى المستقبل!

## مهام التطوير 📝

### Makeshift
- [x] run $ m savedefconfig  after every $ m
- [x] Git worktree: https://github.com/smalinux/buildroot-bbb

### Persistent Data Partition
- [ ] enable systemd
- [ ] fs_overlay
- [ ] use mmc as persistent data partition for now
- [ ] rootfs read-only: BR2_ROOTFS_READ_ONLY
- [ ] (اكتب سكريبت او خدمة systemd للتحقق من فورمات الجهاز والقيام بالفورمات اذا لزم الأمر ثم عمل mount)

### Systemd Setup
- ليه انا اظطريت اركز مع systemd غصب عنى: علشان احتاجت data partition
- بعد بحث كتير لقيت ان احسن طريقه يتعمل بيها هو الـ init system 
#### مهام systemd:
- [ ] ذاكر udev
- [ ] شوف مكان الـ services اللى موجوده already
- [ ] شوف امثله كتير عامه على systemd وايه اللى الناس بتعمله بـ systemd 
- [ ] شوف المتاح عندك على الـ host وايه الـ units اللى موجوده وبتعمل ايه
- [ ] خد الـ udev من احمد فطوم
- [ ] جرب تحط custom unit زى اللى حطيتها مع buildroot overlay
- [ ] جرب تحتفظ بـ overlay خارجى! هل دا مفيد فعلا؟ مع yocto؟
- [ ] كمل مذاكره systemd واجمع tricks على اد ما تقدر ونظف الـ cheat sheet بتاعك

### مهام اضافية
- [ ] [fstab](fstab.md)
- [x] ~~[Genimage](Genimage.md)~~
  - [ ] اقرأ الـ docs
 - [x] [GitHub - a3f/genimages: Very simple Makefile for genimage(1)](https://github.com/a3f/genimages)

### RAUC Setup
- [x] اتأكد فعلا ان Rauc قادر يعمل update لكل حاجه ماعدا uboot
- [ ] فى المستقبل هتخلى rauc كمان يعمل update لـ uboot فى mmcblk1boot0
- [x] ارفع الاسكربت بتاع raucintall
- [ ] افهم met-rauc-bbb
- [ ] اقرأ الاسكربتس اللى موجوده already وافهم ازاى شغاله كويس جدا
- [ ] بعد ما تقرأ الـ docs كاملاً فكر ازاى تسرع الموضوع جدا 🥱 هنا: [Pengutronix - Saving Download Bandwidth with RAUC Adaptive Updates](https://pengutronix.de/en/blog/2022-10-12-rauc-adaptive-updates.html)
- [ ] غير حاجه فى الكيرنال واتأكد ان التأثير موجود بعد استخدام raucinstall
- [ ] فى المستقبل خلى rauc يستخدم الـ emmc
- [ ] [\[U-Boot,v3,1/3\] AM335x : Add USB support for AM335x in u-boot - Patchwork](https://patchwork.ozlabs.org/project/uboot/patch/1340703483-27276-2-git-send-email-harman_sohanpal@ti.com/) 🥱
- [ ] [Programming eMMC with USB for OSD335x (AM335x System in Package) - Octavo Systems](https://octavosystems.com/docs/programming-emmc-with-usb-for-osd335x/) 🥱

### Network Boot Setup
- [x] احسن NFS بالنسبالى هو اللى جاى من poky-nfsroot لانى مش محتاج اعمل install لأى حاجه زياده
- [x] شغل الـ network boot وضيف env vars فى yocto خاصه بيك فى اخر الملف
- [ ] اقرأ كل الـ man بتاعت dnsmasq وجرب كل الـ params بتاعته
- [x] نظف جدا اوامر الـ uboot فى الملف, كل سطر يكون مقروء ومفيش قيم مريبه
- [ ] ما تحطش الـ ip والـ serverip بايدك
- [x] اعمل boot menu لطيفه زى اللى عندك فى الشغل جوا uboot

### Barebox Setup
- [ ] اقرأ الـ docs كويس
- [ ] barebox & yocto integration 
  - [ ] ايه احسن طريقه للتبديل بينهم فى نفس الـ bbb image؟ عايز اغير سطر الـ prefered virtual provider بس
- [ ] [Pengutronix - Bringing Barebox into OE-Core (Yocto)](https://pengutronix.de/en/blog/2024-10-23-bringing-barebox-in-oe-core.html)
- [ ] توفير مكان خارجى لتطوير barebox وانك تاخد linux من الـ tftp
  - [ ] مازال استخدام barebox لوحده برا yocto اسرع واحسن لو عايز تركز بس فى تطوير barebox
  - [ ] مهمه barebox بتنتهى مع بدايه اللينكس, so انت مش محتاج yocto integration فى حاجه غير للـ deploy النهائى, مش لتطوير barebox نفسه

### Boot Time Optimization
- [ ] 

## TODO list 📊

- [ ] شيل الحاجات اللى بتبطأ الـ boot من yocto وحاول تخلى الـ boot اسرع ما يمكن
- [x] الـ data patition موجود already !!
- [ ] لقيت أمر بالصدفه فى uboot اسمه usb_boot عايز اجربه!!
- [ ] عايز انظف طريقه احط بيها الكيرنال برا yocto واخلى يكتو يستخدمها وفى نفس الوقت ما اعملش gap كبيره وما اعرفش ارجع استخدم الكيرنال اللى جوا yocto
      اظن انظف طريقه هى الـ NFS & TFTP
- [x] تاسك: انى انقل الـ zImage والـ dtb لـ rootfs علشان تعرف تعمل update بسهوله
- [ ] ==عايز احتفظ بأى .config موجود فى كل الـ package مش بس بتاع uboot & linux & yocto==
- [x] استخدم uhubctl
  - [ ] افهم الـ systemd unit دا كويس جدا وخليه يعمل cache للـ web interface علشان ما يضيعش وقت فى الـ scan مع كل reboot
- [ ] Google: "processor sdk linux software developer guide"
- [ ] [GitHub - mvp/uhubctl: uhubctl - USB hub per-port power control](https://github.com/mvp/uhubctl)
- [ ] استخدم git worktree وامسح كل الـ branches
- [ ] شغل Qemu واسكربت على سيرفر يشتغل جوا docker كل يوم ويعمل testing ,, على feature بحيث تكون ديما بتعمل integration testing كل لما تتقدم لقدام
- [ ] ضيف الألوان فى الـ shell ديماً من خلال الـ overlay, لان الـ shell دلوقتى ناشف جدا
- [ ] عايز اركز مع كل اللى مكتوب فى dmesg واصلح كل المشاكل اللى مكتوبه
## مهام Device Tree 🌴

- [ ] linux config: افهم الـ config دا بيعمل ايه: FW_LOADER_USER_HELPER
- [ ] احتفظ بكل الـ device tree الكامل برا واعمله tracking 🟡
- [ ] ذاكر الـ linux_build وشوف الـ device tree موجودين فين
- [ ] مشكله ان الـ device tree بتاعت beaglebone black ديما اصغر ما يمكن مقارنه باللى موجوده مع debian
- [ ] محتاج اعمل ملف dts نظف لجوا yocto ولبرا yocto علشان اغير براحتى واحس بتغيراتى 🟡

طريقة البحث عن بيانات الـ device tree:
```bash 
cd kernel.org/doc/Documentation/devicetree/bindings/
ack am33xx-
```

Device tree الرسمي لـ debian/beaglebone:
https://github.com/beagleboard/BeagleBoard-DeviceTrees

## مهام مستمرة 🔄

- [ ] وثق الاوامر اللى بتسخدمها مع bitbake فى README
- [ ] بعد ما كل حاجه تشتغل اعمل performance monitoring وراجع ايه اللى ناقص وايه اللى ممكن تخليه يكون اسرع فى الـ cycle دى
- [ ] انك تضيع وقت دلوقتى فى انك تسرع كل حاجه اهم من انك تكمل dev على حاجه بطيئه وممله🟡
- [ ] راجع كشاكيلك
- [ ] انك تراجع الحاجات اللى بتنزل مع كل release من Rauc و barebox ولينكس و uboot والخ

