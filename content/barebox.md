- [ ] https://www.barebox.org/demo/


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
	