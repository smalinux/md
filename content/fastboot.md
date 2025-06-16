
الطريقه اليدوى:
```
usbgadget -A "/dev/mmc0(sd),/dev/mmc1(emmc)" -b
# or
usbgadget -A auto -b

usbgadget -a
```

![](../assets/Pasted%20image%2020250429002224.png)


flash to mmc:
```
fastboot flash mmc0 sdcard.img
```

You can list all partitions with fastboot getvar all

normally, you would use the barebox update handler. From fastboot, that is: fastboot flash bbu-NAMEOFHANDLER yourbootloader-image.img

https://lore.barebox.org/barebox/20241212075308.2499846-1-a.fatoum@pengutronix.de/T/#mb9261d3b308fd7941e72833600944a54067d1d1e

___
https://docs.digi.com/resources/documentation/digidocs/embedded/dey/3.2/cc8x/yocto_t_program-firmware-using-fastboot
https://bootlin.com/blog/tag/fastboot/
https://source.android.com/docs/setup/test/running
https://wiresareobsolete.com/2013/11/fastboot-on-the-beaglebone-black/
