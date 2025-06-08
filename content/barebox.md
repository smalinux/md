

```bash
git checkout smalinux main branch
```


```bash
nv net.server=192.168.0.134
reset
boot bnet
```






















































https://www.barebox.org/demo/


```
$ magicvar
```

لو عايز تعمل manual, هنا تقدر توصف الـ partitions:
```
global.fastboot.partitions = auto
global.usbgadget.autorun = yes
```

الطريقه الافضل انك تعمل المتغيرات وقت الـ compile & build

- للأسف مافيش USB Ethernet Gadget Support في barebox
  يا إما تركب USB Ethernet Adapter يا تستخدم ال Ethernet العادي


الratp بيعرف يعمل حاجات ظريفة زي انك تعمل mount لfile system عبر الserial
مفيد لو ما عندكش Ethernet مثلا



----
عن دعم Allwinner فى barebox

There is initial support upstream and some more support here:
https://github.com/jmaselbas/barebox
You can reach out to the author on the barebox IRC
More hardware support is always welcome

--------

uboot:
	user nv.user=none
	server: netserver ip
	nfs: server port, use env vars to fix this port number, and choose high number of nfs
	global.nfsserver


### misc barebox config

```
[10:02 pm, 17/03/2025] Ahmed Fatoum: mkdir -p barebox/env/nv
[10:02 pm, 17/03/2025] Ahmed Fatoum: echo mmc1 > barebox/env/nv/boot.default
```

```
bootm /mnt/mmc1.1/boot/zImage -o /mnt/mmc1.1/boot/am335-beagleboneblack.dtb
```


> am335x-boneblack.conf
```
# /loader/entries/am335x-boneblack.conf 

title		poky am335x-boneblack
version		v6.12
options		rootwait rw
linux		/boot/zImage
devicetree	/boot/am335x-boneblack.dtb
linux-appendroot	true
```

> boot.default
```
# $bareboxenv/nv/boot.default

mmc1
```

==barebox will then check inside mmc1 for all files matching /loader/entries/*.conf==

----

echo $global.boot.default will tell you that there is only one boot target: net

> https://www.barebox.org/doc/latest/user/booting-linux.html
____

[10:15 pm, 17/03/2025] Ahmed Fatoum: NFS boot options are a left-over from the failed NFS boot
[10:15 pm, 17/03/2025] Ahmed Fatoum: You can set global.bootm.root_dev=mmc1.1 and it should boot to shell
[10:15 pm, 17/03/2025] Ahmed Fatoum: or mmc0.1 or whatever
This will only generate root= option, not rootwait/rw. You may need rootwait though

[10:16 pm, 17/03/2025] Ahmed Fatoum: alternatively, hardcode the command line argument:

global.linux.bootargs.rootopts="root=/dev/mmcblk0p2 rootwait rw"

____
global linux.bootargs.rootopts="root=/dev/mmcblk0p2 rootwait rw"
____
[10:24 pm, 17/03/2025] Ahmed Fatoum: don't use setenv
[10:24 pm, 17/03/2025] Ahmed Fatoum: setenv is only needed if your variable has strange symbols e.g. -

my-device.param=something # error
setenv my-device.param=something # ok

____
echo $nv.boot.default

___
