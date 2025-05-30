# beaglebone -debian

Fix date & time:
```bash
/usr/bin/ntpdate -b -s -u pool.ntp.org
```

Install pipx:
```bash
sudo apt install pipx
```

Install Adafruit library:
```bash
pipx install Adafruit_BBIO
```


#### Before:
```
device: ocp:P9_12_pinmux current state: default
  state: default
    type: MUX_GROUP controller pinctrl-single group: pinmux_P9_12_default_pin (79) function: pinmux_P9_12_default_pin (79)
  state: gpio
    type: MUX_GROUP controller pinctrl-single group: pinmux_P9_12_gpio_pin (80) function: pinmux_P9_12_gpio_pin (80)
  state: gpio_pu
    type: MUX_GROUP controller pinctrl-single group: pinmux_P9_12_gpio_pu_pin (81) function: pinmux_P9_12_gpio_pu_pin (81)
  state: gpio_pd
    type: MUX_GROUP controller pinctrl-single group: pinmux_P9_12_gpio_pd_pin (82) function: pinmux_P9_12_gpio_pd_pin (82)
```


#### نسخه الـ Debian محتفظه بمكان بعض الـ sources:
```bash
ls /opt/source/
```

#### cat /boot/uEnv.txt

Docs: https://elinux.org/Beagleboard:U-boot_partitioning_layout_2.0

```bash
debian@BeagleBone:/sys/kernel/debug/pinctrl$ cat /boot/uEnv.txt
#Docs: http://elinux.org/Beagleboard:U-boot_partitioning_layout_2.0

uname_r=5.10.168-ti-r82
#uuid=
#dtb=

###U-Boot Overlays###
###Documentation: http://elinux.org/Beagleboard:BeagleBoneBlack_Debian#U-Boot_Overlays
###Master Enable
enable_uboot_overlays=1
###
###Overide capes with eeprom
#uboot_overlay_addr0=<file0>.dtbo
#uboot_overlay_addr1=<file1>.dtbo
#uboot_overlay_addr2=<file2>.dtbo
#uboot_overlay_addr3=<file3>.dtbo
###
###Additional custom capes
#uboot_overlay_addr4=<file4>.dtbo
#uboot_overlay_addr5=<file5>.dtbo
#uboot_overlay_addr6=<file6>.dtbo
#uboot_overlay_addr7=<file7>.dtbo
###
###Custom Cape
#dtb_overlay=<file8>.dtbo
###
###Disable auto loading of virtual capes (emmc/video/wireless/adc)
#disable_uboot_overlay_emmc=1
#disable_uboot_overlay_video=1
#disable_uboot_overlay_audio=1
#disable_uboot_overlay_wireless=1
#disable_uboot_overlay_adc=1
###
###Cape Universal Enable
enable_uboot_cape_universal=1
###
###Debug: disable uboot autoload of Cape
#disable_uboot_overlay_addr0=1
#disable_uboot_overlay_addr1=1
#disable_uboot_overlay_addr2=1
#disable_uboot_overlay_addr3=1
###
###U-Boot fdt tweaks... (60000 = 384KB)
#uboot_fdt_buffer=0x60000
###U-Boot Overlays###

console=ttyS0,115200n8
cmdline=coherent_pool=1M net.ifnames=0 lpj=1990656 rng_core.default_quality=100 quiet

#In the event of edid real failures, uncomment this next line:
#cmdline=coherent_pool=1M net.ifnames=0 lpj=1990656 rng_core.default_quality=100 quiet video=HDMI-A-1:1024x768@60e

#Use an overlayfs on top of a read-only root filesystem:
#cmdline=coherent_pool=1M net.ifnames=0 lpj=1990656 rng_core.default_quality=100 quiet overlayroot=tmpfs

##enable Generic eMMC Flasher:
#cmdline=init=/usr/sbin/init-beagle-flasher
```


اولاً روحت للمكان دا:
## Finding Pin Addresses

To find the correct register offset for your pin:

1. Check the BeagleBone pinout diagram
2. Look up the processor datasheet (AM335x)
3. Use existing device tree files as reference in `/opt/source/dtb-5.10-ti/src/arm`

## Compiling and Loading

1. Save as `.dts` file (e.g., `gpio-input.dts`)
2. Compile: `cd /opt/source/dtb-5.10-ti && make all`
3. Copy to `/lib/firmware/`
4. Load via `/boot/uEnv.txt` or dynamically with config-pin

عايز اعرف كل الـ overlays اللى اتعملها load فعلا:
ls /proc/device-tree/chosen/overlays/
