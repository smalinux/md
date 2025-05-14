###### 2025-05-11
- [ ] NFS & TFTP boot: Fixed!
###### 2025-05-14
- [x] NFS & TFTP boot: Fixed!
- [ ] TODO: cleanup: I think meta-rauc-bbb/recipe-core/ need to mv somewhere under meta-bbb
- [ ] TODO: Reset all uboot env vars ❗
- [x] nice uboot bootmenu [u-boot/doc/README.bootmenu](https://github.com/ARM-software/u-boot/blob/master/doc/README.bootmenu)
- [ ] understand all uboot env vars that are already exist
- [ ] makeshift: delete symlink under /tftp and create a new one
- [x] /srv/nfs/MACHINE : default location for any nfs rootfs
- [ ] copy yocto/linux.config to makeshift/linux and boot using makeshift kernel
- [x] Cleanup your uboot env all put all your boot options together
- [x] delete evvvvvv & document boot_net & boot_net_dbg (earlyprintk ignore_loglevel initcall_debug nfsrootdebug)
- [ ] TODO: set up U-Boot RNDIS over USB on BeagleBone Black using Yocto to enable TFTP boot without manually specifying IP addresses each time❗
- [ ] fs_overlay❗
- [ ] port for barebox❗
- [ ] faster build & deploy cycle
- [ ] colors in bash❗
- [ ] usb wireless❗
- [ ] use uhubctl
اليوم دا هو اخر يوم بجداره للـ U-boot ,مفيش رجوع لـ Uboot غير لو عايز اسرع حاجه, او ادرس الـ Uboot ذات نفسه, غير كدا مش محتاج افتح موضوع الـ Uboot 
ومش محتاج اشير تانى الـ SDCard من البورده, لان أى update طالما مش بيغير فى Uboot يبقى هيتعمل بـ RAUC خلال دقيقه, يعنى اسرح حتى من انك تشيل الكارت وتركبه تانى.

مشاكل تحسين اكتر فى الـ uboot:
مشكله انى لما بكتب env vars مش بيكون ليها تأثير مباشر غير لما بعمل boot على الأقل مره واحده 
مش. عارف هحتاج اصلا انه لازم اكتب var واشوفه علشان اتأكد انى ضفته من أول مره

انا اصلا اقدر أضيف واغير من اللينكس بـ fw_set

هتجاهل العيب دا وهكمل، مش عايز اضيع وقت في الـ debugging هنا