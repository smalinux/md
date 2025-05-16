#### Day: 2025-05-11
- [x] RAUC can update linux! since I moved linux under rootfs instead of boot partition.
#### Day: 2025-05-14
- [x] NFS & TFTP boot: Fixed!
- [ ] TODO: cleanup: I think meta-rauc-bbb/recipe-core/ need to mv somewhere under meta-bbb
- [ ] TODO: Reset all uboot env vars ❗
- [ ] understand all uboot env vars that are already exist
- [x] nice uboot bootmenu [u-boot/doc/README.bootmenu](https://github.com/ARM-software/u-boot/blob/master/doc/README.bootmenu)
- [x] /srv/nfs/MACHINE : default location for any nfs rootfs
- [ ] copy yocto/linux.config to makeshift/linux and boot using makeshift kernel
- [x] Cleanup your uboot env all put all your boot options together
- [x] delete evvvvvv & document boot_net & boot_net_dbg (earlyprintk ignore_loglevel initcall_debug nfsrootdebug)

اليوم دا هو اخر يوم بجداره للـ U-boot ,مفيش رجوع لـ Uboot غير لو عايز اسرع حاجه, او ادرس الـ Uboot ذات نفسه, غير كدا مش محتاج افتح موضوع الـ Uboot 
ومش محتاج اشير تانى الـ SDCard من البورده, لان أى update طالما مش بيغير فى Uboot يبقى هيتعمل بـ RAUC خلال دقيقه, يعنى اسرح حتى من انك تشيل الكارت وتركبه تانى.

**مشكله انى لما بكتب env vars مش بيكون ليها تأثير مباشر غير لما بعمل boot على الأقل مره واحده**
مش عارف, هل دى فعلا ميزه ولا عيب, لان المتغيرات اللى عندى بتتكتب فى ext4 فى الـ runtime
دى حاجه سيئه جداً. انا هغيرها بس قدام. لان لو الكهربا قطعت ممكن تحصل مشاكل. 
العيب اللى انا شيافه حالياً ان لازم الـ device يعمل boot مره واحده على الاقل علشان يعمل save للـ env vars
لكن عموما انا هتجاهل العيب دا وهكمل، مش عايز اضيع وقت هنا.

**كمان عيب انى بكتب serverip بايدى manual**
دا مش عيب كبير أوى لان اصلا فيه bootloaders مافيهاش http stack ولازم تديله الـ serverip مره واحده فى الأول
لكن still انا شايفها حاجه لطيفه جدا ان الجهاز اول ما بيبدأ بيقدر يتوصل نت عن طريق الـ usb وبياخد الـ serverip من غير ما اكتبه manual
وبرضو دى حاجه مش هقف اعملها دلوقتى لانها هتضيع وقت وكود الـ uboot
عايز فى المستقبل استخدم RNDIS واجيب الـ serverip بشكل تلقائى

**مشكله اخيره: حاولت اعمل build لـ uboot فى dir خارجى بـ make shift لكن فيه مشكله كبيره, الـ build بايظ**
برجح ان فى yocto فيه شويه باتشز وحاجات بتلطف, لكن مع makeshift الموضوع dry 
هبقى ابص فى دا بعدين, كدا كدا انا مش محتاج دلوقتى ابص فى كود uboot او اعدل فيه, كفايه بالنسبالى اللى بيطلع من yocto
#### Day: 2025-05-15
- [x] makeshift: delete symlink under /tftp and create a new one
- [ ] faster build & deploy cycle
	- [ ] yocto boot time
- [ ] use uhubctl ❗❗❗❗❗
- [ ] pinctrl
- [ ] usb wireless
- [ ] logic analyzer
- [ ] make minimal barebox setup without yocto
	- [ ] yocto & barebox = one line change virtual provider, until then don't use barebox with yocto!
- [ ] 












_____
#### LATER
- [ ] TODO: set up U-Boot RNDIS over USB on BeagleBone Black using Yocto to enable TFTP boot without manually specifying IP addresses each time❗
- [ ] fs_overlay❗
- [ ] port for barebox❗

- [ ] colors in bash❗
- [ ] عايز اعمل QA quality assurance لكل feature عملتها, مثلا عملت runqemu, عايز اتأكد انها ديما شغاله
- [ ] شيل الـ list الافتراضيه الفتراضيه بتاع الـ core-image-bbb اللى بتضاف بسبب الـ group واعمل list خاصه بيك فيها كل الـ packages اللى انت عايزها بالضبط علشان يبقى عندك تحكم فى كل حاجه
- [ ] 
