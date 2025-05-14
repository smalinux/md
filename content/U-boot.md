
عندى vars كتير وكنت عايز اعرف هم جايين منين بالضبط, متعرفين فين؟
علشان لو عايز اعمل extend؟ وكمان علشان مش عايز مكان يكون بيبعبصنى وبيـ overwrite  تغيراتى
دى النتيجه: دا جرد للاماكن اللى لقيتها مؤثره:
```bash
$ bitbake -e virtual/bootloader | grep ^B=
B="/mnt/_OUTPUT/tmp/poky-bbb-glibc/work/bbb-poky-linux-gnueabi/u-boot/2024.01/build"

builddir $ grep -r 'boot_efi_binary' .

builddir $ u-boot-initial-env
هنا المتغيرات اللى مبدياً هتاخدها معاك, دا اول مكان
```

- [ ] الخطوه اللى جايه انى افهم كل env var واجربه واستخدمه
- [ ] ممكن افضى تماما كل الـ env vars الافتراضيه, اعمل ملف واحد بس فيه كل حاجه. زى فى الشغل
- [ ] 