الـ repo دى هى اللى بتنبى image كامله لدبيان, جاهزه انها يتعملها flash لذلك تستاهل انها تتقرأ سطر سطر وافهم هى بتشتغل ازاى.
____

```bash
sudo apt-get install dosfstools git kpartx wget tree parted
```

اعملى image base on debian وحطلى فيها كل الـ packages:
```bash
./RootStock-NG.sh -c bb.org-debian-bookworm-iot-v5.10-ti-armhf-am335x.conf
```

اعملى file.img من الـ image اللى انا بنيتها:
```bash
Ubuntu@debian-12.11-iot-armhf-2025-05-25 $ sudo ./setup_sdcard.sh --img-4gb beaglebone-image --dtb beaglebone
```

اثناء الامر اللى فات حصل انه حمل حاجات من النت, لو انا عايز كله يحصل offline:
```bash
sudo ./setup_sdcard.sh --img-4gb beaglebone-image --dtb beaglebone --distro-bootloader
```

```bash
Flash to sdcard
bmaptool create -o beaglebone-image-4gb.img.bmap beaglebone-image-4gb.img

```

# كل الـ options اللى موجوده فى اسكربت setup_sdcard.sh:

setup_sdcard.sh Command Line Options
## Image Creation Options

|Option|Description|
|---|---|
|`--img <name>`|Create a 2GB image file with specified name (default size)|
|`--img-1gb <name>`|Create a 1GB image file|
|`--img-2gb <name>`|Create a 2GB image file|
|`--img-4gb <name>`|Create a 4GB image file|
|`--img-6gb <name>`|Create a 6GB image file|
|`--img-8gb <name>`|Create an 8GB image file|
|`--img-10gb <name>`|Create a 10GB image file|
|`--img-12gb <name>`|Create a 12GB image file|

## Hardware Configuration

|Option|Description|
|---|---|
|`--dtb <board>`|**Required** - Specify device tree board configuration (e.g., beaglebone, beagleplay)|
|`--force-device-tree <dtb>`|Force specific device tree file instead of auto-detection|

## Bootloader Options

|Option|Description|
|---|---|
|`--distro-bootloader`|Use local/distribution bootloader files instead of downloading|
|`--bbb-flasher` or `--emmc-flasher`|Enable eMMC flasher for BeagleBone Black (flashes from SD to eMMC)|

## U-Boot Overlay Options

|Option|Description|
|---|---|
|`--enable-cape-universal`|Enable Cape Universal for GPIO/pin control|
|`--enable-uboot-cape-overlays`|Enable U-Boot device tree overlays|
|`--enable-uboot-disable-emmc`|Disable eMMC overlay in U-Boot|
|`--enable-uboot-disable-video`|Disable video overlay in U-Boot|
|`--enable-uboot-disable-audio`|Disable audio overlay in U-Boot|

## PRU (Programmable Real-time Unit) Options

|Option|Description|
|---|---|
|`--enable-uboot-pru-rproc-414ti`|Enable PRU RemoteProc for 4.14.x-ti kernel|
|`--enable-uboot-pru-rproc-419ti`|Enable PRU RemoteProc for 4.19.x-ti kernel|
|`--enable-uboot-pru-rproc-54ti`|Enable PRU RemoteProc for 5.4.x-ti kernel|
|`--enable-mainline-pru-rproc`|Enable PRU RemoteProc for mainline kernel|
|`--optional-uboot-uio-pru`|Enable UIO PRU support (alternative to RemoteProc)|
|`--enable-uboot-disable-pru`|Disable PRU support entirely|

## System Configuration

|Option|Description|
|---|---|
|`--rootfs <type>`|Set root filesystem type (default: ext4)|
|`--kernel <version>`|Override kernel version selection|
|`--enable-bypass-bootup-scripts`|Skip some bootup scripts for faster boot|
|`--enable-fat-partition`|Enable FAT boot partition|

## Custom Overlays

|Option|Description|
|---|---|
|`--enable-load-custom-overlay`|Load custom device tree overlay|
|`--enable-load-bela-overlay`|Load Bela project specific overlays|
|`--enable-extlinux-flasher`|Enable extlinux-based flasher|

## Help and Information

|Option|Description|
|---|---|
|`-h` or `--help`|Display help message and usage information|

## Obsolete/Removed Options

The following options have been removed and will show error messages:

- `--mmc` - Direct SD card access (use `--img` instead)
- `--probe-mmc` - MMC probing (deprecated)
- `--hostname` - Hostname setting (use sysconf.txt)
- `--ro` - Read-only filesystem
- `--boot_label` / `--rootfs_label` - Custom labels
- `--spl` / `--bootloader` - Custom bootloader
- `--offline` - Offline mode
- `--efi` - EFI support
- Various flasher options (consolidated into `--bbb-flasher`)

## Example Usage

### Basic BeagleBone Black Image

bash

```bash
sudo ./setup_sdcard.sh --img-4gb my-beaglebone --dtb beaglebone --distro-bootloader
```

### BeagleBone Black with Cape Universal

bash

```bash
sudo ./setup_sdcard.sh --img-4gb my-beaglebone --dtb beaglebone --distro-bootloader --enable-cape-universal --enable-uboot-cape-overlays
```

### BeagleBone Black eMMC Flasher

bash

```bash
sudo ./setup_sdcard.sh --img-4gb flasher-image --dtb beaglebone --distro-bootloader --bbb-flasher
```

### BeaglePlay Image

bash

```bash
sudo ./setup_sdcard.sh --img-8gb beagleplay-image --dtb beagleplay --distro-bootloader
```

## Notes

- **`--dtb` is required** - You must specify a device tree board configuration
- **Use `--distro-bootloader`** for offline builds (no internet downloads)
- **Image sizes** are optimized for typical SD card capacities (90-95% utilization)
- **Multiple options can be combined** for complex configurations
- **Order matters** - some options may override others


# شرح مفصل لاسكربت image-builder

شرح مفصل لخطوات بناء صورة BeagleBoard Debian

## المرحلة الأولى: التحضير والإعداد (Setup Phase)

### 1. تحديد معاملات النظام

```bash
system=smalinux
HOST_ARCH=x86_64
TIME=2025-05-24
```

- الاسكربت بيحدد معلومات الـ host system اللى بيشتغل عليه
- بيخزن التاريخ للاستخدام في تسمية المجلدات والملفات

### 2. قراءة Configuration File

```bash
project_config=bb.org-debian-bookworm-iot-v5.10-ti-armhf-am335x.conf
```

**التفاصيل:**

- الـ config file بيحتوي على specifications للصورة المطلوبة
- `debian bookworm` = الـ distro version
- `armhf` = ARM Hard Float architecture
- `am335x` = Texas Instruments processor family (BeagleBone Black/Green)
- `v5.10-ti` = Kernel version مع TI patches

### 3. إنشاء Temporary Directory

```bash
tempdir=/src/image-builder/ignore/tmp.iRjTxgRfkh
```

- بيعمل temporary directory جوه مجلد `ignore` عشان ميتمش commit في git
- الاسم random للتأكد من عدم التضارب

## المرحلة التانية: Bootstrap Process

### 4. تشغيل Debootstrap - المرحلة الأولى

```bash
sudo debootstrap --arch=armhf --include=[package_list] --components=main,contrib,non-free,non-free-firmware --no-check-gpg --foreign
```

**ايه اللى بيحصل:**

- بيحمل base system packages من Debian repository
- الـ `--foreign` معناها ان الـ second stage هيتم جوه الـ chroot environment
- بيحمل packages أساسية زي `bash`, `coreutils`, `systemd`

**الـ packages المحملة:**

- Base system: `adduser`, `apt`, `bash`, `coreutils`
- Development tools: `build-essential`, `gcc-12`, `make`
- Networking: `curl`, `wget`, `openssh-server`
- Hardware support: firmware packages للـ wireless chips

### 5. إعداد QEMU Emulation

```bash
sudo cp -v /usr/bin/qemu-arm-static "${tempdir}/usr/bin/"
```

- بينسخ QEMU static binary جوه الـ chroot
- ده ضروري عشان نقدر نشغل ARM binaries على x86_64 host

### 6. Debootstrap Second Stage

```bash
sudo chroot ${tempdir} debootstrap/debootstrap --second-stage
```

**العملية دي بتعمل:**

- Unpacking all downloaded packages
- Configuration of essential packages
- Setting up package management system
- إنشاء الـ basic directory structure

## المرحلة التالتة: Package Installation & Configuration

### 7. إعداد Package Sources

```bash
deb http://deb.debian.org/debian bookworm main contrib non-free non-free-firmware
deb [arch=armhf signed-by=/usr/share/keyrings/rcn-ee-archive-keyring.gpg] http://repos.rcn-ee.com/debian/ bookworm main
```

- بيضيف Debian official repositories
- بيضيف BeagleBoard-specific repository (rcn-ee) للـ kernel وhardware support

### 8. System Updates

```bash
apt-get update
apt-get upgrade -y
apt-get dist-upgrade -y
```

- بيحدث package lists
- بيرقي الـ packages الموجودة
- `dist-upgrade` بيتعامل مع dependency changes

### 9. تنصيب Additional Packages

**Hardware Support:**

- `firmware-atheros`, `firmware-brcm80211` = WiFi firmware
- `firmware-ti-connectivity` = TI-specific wireless
- `i2c-tools`, `v4l-utils` = Hardware interface tools

**Development Environment:**

- `python3-dev`, `python3-pip` = Python development
- `nodejs` packages from bb-node-red-installer
- `code-server` = VSCode web interface

**BeagleBoard-Specific:**

- `bb-customizations` = BeagleBoard-specific configs
- `bb-usb-gadgets` = USB gadget functionality
- `generic-sys-mods` = System modifications

### 10. Kernel Installation

```bash
linux-image-5.10.168-ti-r82
```

- Kernel مخصوص للـ TI processors مع real-time patches
- بيجي مع modules للـ wireless, GPIO, PRU

## المرحلة الرابعة: System Configuration

### 11. User Management

```bash
rfs_username=debian
rfs_password=temppwd
rfs_hostname=BeagleBone
```

- بينشئ user `debian` with sudo privileges
- بيحط hostname = BeagleBone
- بيخليه member في groups مهمة زي `gpio`, `dialout`

### 12. Network Configuration

**systemd-networkd:**

- `eth0.network` = Wired ethernet DHCP
- `usb0.network` = USB gadget network server
- `wlan0.network` = WiFi DHCP client

**Services enabled:**

- `systemd-networkd` = Network management
- `systemd-resolved` = DNS resolution
- `iwd` = WiFi management

### 13. Hardware-Specific Services

```bash
bb-usb-gadgets.service = USB mass storage/ethernet gadget
regenerate_ssh_host_keys.service = Security
grow_partition.service = Auto-resize root partition
```

### 14. Development Environment Setup

**Node-RED:**

- Web-based development environment
- Pre-configured with BeagleBoard nodes
- Service enabled by default

**Code Server:**

- Web-based VSCode
- Accessible via browser
- Pre-configured with extensions

**Cockpit:**

- Web-based system management
- Hardware monitoring
- Package management interface

## المرحلة الخامسة: Hardware Support & Device Trees

### 15. Device Tree Sources

```bash
git clone -b v5.10.x-ti-unified https://github.com/beagleboard/BeagleBoard-DeviceTrees.git
```

- بيحمل device tree sources للـ different kernel versions
- Device trees بتوصف الـ hardware layout للـ kernel

### 16. Hardware Utilities

```bash
bbb-pin-utils = Pin configuration utilities
py-uio = Python UIO (Userspace I/O) library
overlay-utils = Device tree overlay management
```

## المرحلة السادسة: Cleanup & Packaging

### 17. System Cleanup

- إزالة temporary files
- Cleanup package cache
- Reset machine-id
- Clear log files

### 18. Image Packaging

```bash
armhf-rootfs-debian-bookworm.tar (1.8G)
```

- بيعمل tarball للـ complete root filesystem
- بيخزن معاه الـ configuration files
- Setup scripts للـ SD card creation

### 19. بيانات إضافية

**Files created:**

- `setup_sdcard.sh` = Script for writing to SD card
- `sysconf.txt` = First-boot configuration
- `u-boot/` = Bootloader files for different boards
- Hardware-specific configs للـ different BeagleBoard variants

## الخلاصة التقنية

الاسكربت ده بيعمل complete Linux distribution build من الصفر، مخصوص للـ BeagleBoard hardware. العملية بتشمل:

1. **Cross-compilation environment** using QEMU
2. **Hardware-specific kernel** مع TI patches
3. **Complete development stack** (Python, Node.js, web tools)
4. **Hardware abstraction** via device trees
5. **Production-ready image** قابل للـ deployment

النتيجة النهائية: صورة Debian كاملة حجمها 1.8GB، جاهزة للـ flash على SD card والتشغيل على BeagleBoard devices.

____
# المميز والمختلف في نسخة BeagleBoard Debian

بناءً على تحليل الاسكربت والبحث، إليك **الأشياء المميزة والمختلفة** في نسخة BeagleBoard Debian:

## **1. Robert Nelson's Ecosystem (rcn-ee)**

### **Custom Package Repository**

```bash
deb [arch=armhf signed-by=/usr/share/keyrings/rcn-ee-archive-keyring.gpg] http://repos.rcn-ee.com/debian/ bookworm main
```

- **Repository خاص** مش موجود في أي distro تاني
- Robert Nelson يحتفظ بـ repositories مخصوصة للـ BeagleBoard hardware
- Packages مبنية خصيصاً للـ TI processors

### **Custom Kernel Maintenance**

- Kernel يتم تحديثه باستمرار مع fixes للـ capes و hardware support جديد
- TI kernel مع real-time patches
- Custom device tree overlays system

---

## **2. Hardware-Specific Integration**

### **U-Boot Overlays System**

- نظام U-Boot Overlays بدلاً من Kernel Overlays بسبب "too many bugs, too many race conditions"
- Custom cape manager system
- Hardware detection automatic

### **PRU (Programmable Real-time Unit) Support**

- TI PRU Compiler مدمج في النظام
- Real-time programming capabilities
- Industrial I/O support

---

## **3. Out-of-the-Box Development Environment**

### **Ready-to-Use Web Development Stack**

```bash
# من الاسكربت:
bb-code-server (VSCode in browser)
bb-node-red-installer (Visual programming)
cockpit-* (System management)
nginx مع custom configs
```

### **USB Gadget Zero-Configuration**

- USB gadget بـ IP addresses جاهزة: 192.168.7.2/192.168.6.2
- Mass storage gadget
- Network over USB automatic
- **Custom IP configuration** للـ multiple BeagleBoards على نفس الـ PC

---

## **4. Educational/Maker-Focused Features**

### **BeagleBone-Specific Utilities**

```bash
# Custom packages مش موجودة في Debian عادي:
bbb.io-getting-started
bb-customizations  
bb-beagle-version
generic-sys-mods
```

### **Hardware Learning Environment**

- GPIO/I2C/SPI tools pre-configured
- Python GPIO libraries installed
- Device tree examples و documentation

---

## **5. Production-Ready Industrial Features**

### **Real-time Kernel Support**

- RT patches مدمجة
- Low-latency industrial applications
- CAN bus support built-in

### **Update Infrastructure**

- مبني update system: `/opt/scripts/tools/update_kernel.sh`
- Rolling updates للـ kernel
- **Safe update mechanism** مع rollback

---

## **6. Custom Boot و Flashing Experience**

### **Intelligent Flashing System**

- Auto-detection للـ eMMC flashing مع LED indicators (Cylon Sweep pattern)
- Different image variants: Regular, Flasher, Console, IoT
- **Custom boot scripts** للـ different scenarios

### **First Boot Configuration**

```bash
# sysconf.txt system
# Custom first-boot services
regenerate_ssh_host_keys.service
grow_partition.service
```

---

## **7. Integration Layer غير مسبوق**

### **Seamless Desktop Integration**

- Web interfaces accessible من الـ host PC
- Network services: Apache على port 80, SSH على port 22
- **Browser-based IDE** مع hardware integration

### **Cross-Development Support**

- Native compilation on-device
- Remote development capabilities
- Hardware debugging tools integrated

---

## **8. Community و Long-term Support**

### **Dedicated Maintenance**

- Release cycle منتظم: 3 مرات سنوياً
- Community-driven development
- **Hardware vendor collaboration** مع TI

### **Educational Institution Support**

- Timing للـ releases: "Before School for universities who use our boards"
- Documentation و examples مدمجة
- **Zero-setup learning environment**

---

## **الخلاصة: ليه مختلف؟**

### **مش مجرد Debian + Packages:**

1. **Ecosystem Integration** - كل حاجة متكاملة مع بعض
2. **Hardware-First Approach** - مبني عشان الـ hardware مش مجرد adapted
3. **Educational Mission** - مصمم للتعليم والتطوير السريع
4. **Industrial Reliability** - real-time capabilities مع stability
5. **Community Ecosystem** - Robert Nelson's decade of experience مكدس في النظام

### **مقارنة مع Standard Debian:**

- Standard Debian = General purpose OS
- BeagleBoard Debian = **Specialized embedded development platform**
- الفرق زي الفرق بين Ubuntu Desktop و Ubuntu Server - **نفس الـ core لكن use case مختلف تماماً**

---

## **لو عايز تعمل نفس الحاجة في Yocto:**

محتاج تعمل recreate للـ **entire ecosystem** مش بس الـ packages:

- Custom BSP layer
- Hardware integration layer
- Web development environment
- Educational content delivery system
- Update infrastructure
- Community repository system

**دي مش مجرد "packages" - دي complete embedded development platform!**