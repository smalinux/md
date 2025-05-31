```
src/arm/am335x-boneblack.dts
	#include "am33xx.dtsi"
	#include "am335x-bone-common.dtsi"
	#include "am335x-boneblack-common.dtsi"
	#include "am335x-boneblack-hdmi.dtsi"

```

# Usage:
```
debian@BeagleBone:/opt/source/dtb-5.10-ti$ make
debian@BeagleBone:/opt/source/dtb-5.10-ti$ sudo make install

```

Play with dtbo file: بكل بساطه غير الملف دا
```
sudo vim /boot/uEnv.txt
```

###
auto load dtbo:
اى ملف تحت /lib/firmware بيتحمل تلقائى
```
uboot_overlays: loading /boot/dtbs/5.10.168-ti-r82/overlays/BB-ADC-00A0.dtbo ...
645 bytes read in 6 ms (104.5 KiB/s)
uboot_overlays: loading /lib/firmware/BB-GPIO-P8_12-IN-00A0.dtbo ...
1057 bytes read in 9 ms (114.3 KiB/s)
uboot_overlays: loading /lib/firmware/BB-GPIO-P8_26-OUT-00A0.dtbo ...
989 bytes read in 6 ms (160.2 KiB/s)
uboot_overlays: loading /boot/dtbs/5.10.168-ti-r82/overlays/BB-BONE-eMMC1-01-00A0.dtbo ...
1605 bytes read in 6 ms (260.7 KiB/s)
uboot_overlays: loading /boot/dtbs/5.10.168-ti-r82/overlays/BB-HDMI-TDA998x-00A0.dtbo ...
```


```
debian@BeagleBone:/opt/source/dtb-5.10-ti$ make
  DTC     src/arm/am335x-boneblack-pruswuart.dtb
  DTC     src/arm/am335x-sancloud-bbe-uboot-univ.dtb
  DTC     src/arm/am335x-boneblack-wireless.dtb
  DTC     src/arm/am335x-sancloud-bbe.dtb
  DTC     src/arm/am335x-sancloud-bbe-uboot.dtb
  DTC     src/arm/am335x-boneblack-uboot-univ.dtb
  DTC     src/arm/am57xx-beagle-x15.dtb
  DTC     src/arm/am335x-sancloud-bbe-lite.dtb
  DTC     src/arm/am335x-sancloud-bbe-lite-uboot.dtb
  DTC     src/arm/am335x-sancloud-bbe-lite-uboot-univ.dtb
  DTC     src/arm/am335x-bonegreen-wireless-uboot-univ.dtb
  DTC     src/arm/am335x-pocketbeagle.dtb
  DTC     src/arm/am335x-boneblack-uboot.dtb
  DTC     src/arm/am335x-boneblack-pps.dtb
  DTC     src/arm/am335x-bonegreen-wireless.dtb
  DTC     src/arm/am57xx-beagle-x15-revb1.dtb
  DTC     src/arm/am335x-sancloud-bbe-extended-wifi-uboot.dtb
  DTC     src/arm/am335x-sancloud-bbe-extended-wifi-uboot-univ.dtb
  DTC     src/arm/am335x-bonegreen.dtb
  DTC     src/arm/am335x-boneblue.dtb
  DTC     src/arm/am335x-bone.dtb
  DTC     src/arm/am5729-beagleboneai.dtb
  DTC     src/arm/am335x-bonegreen-gateway.dtb
  DTC     src/arm/am57xx-beagle-x15-revc.dtb
  DTC     src/arm/am335x-boneblack.dtb
  DTC     src/arm/am335x-bone-uboot-univ.dtb
  DTC     src/arm/omap5-uevm.dtb
  DTC     src/arm/am335x-sancloud-bbe-extended-wifi.dtb
  DTC     src/arm/am335x-osd3358-sm-red.dtb
  DTC     src/arm/overlays/BB-BONE-NH7C-01-A0.dtbo
  DTC     src/arm/overlays/AM335X-PRU-UIO-00A0.dtbo
  DTC     src/arm/overlays/LED_P8_03.dtbo
  DTC     src/arm/overlays/M-BB-BBGG-00A0.dtbo
  DTC     src/arm/overlays/BB-BONE-LCD4-01-00A1.dtbo
  DTC     src/arm/overlays/BONE-ADC.dtbo
  DTC     src/arm/overlays/BB-BONE-4D5R-01-00A1.dtbo
  DTC     src/arm/overlays/BB-I2C1-RTC-DS3231.dtbo
  DTC     src/arm/overlays/PB-MIKROBUS-1.dtbo
  DTC     src/arm/overlays/BB-GPIO-P8_12-IN-00A0.dtbo
  DTC     src/arm/overlays/BB-UART1-00A0.dtbo
  DTC     src/arm/overlays/BB-UART2-00A0.dtbo
  DTC     src/arm/overlays/M-BB-BBG-00A0.dtbo
  DTC     src/arm/overlays/BB-ADC-00A0.dtbo
  DTC     src/arm/overlays/BB-BBGW-WL1835-00A0.dtbo
  DTC     src/arm/overlays/BB-UART4-00A0.dtbo
  DTC     src/arm/overlays/BB-BONE-eMMC1-01-00A0.dtbo
  DTC     src/arm/overlays/BB-GPIO-P8_26-OUT-00A0.dtbo
  DTC     src/arm/overlays/AM57XX-PRU-UIO-00A0.dtbo
  DTC     src/arm/overlays/BB-I2C2-MPU6050.dtbo
  DTC     src/arm/overlays/BB-I2C2-BME680.dtbo
  DTC     src/arm/overlays/BB-CAPE-DISP-CT4-00A0.dtbo
  DTC     src/arm/overlays/BB-W1-P9.12-00A0.dtbo
  DTC     src/arm/overlays/BB-LCD-ADAFRUIT-24-SPI1-00A0.dtbo
  DTC     src/arm/overlays/BBORG_RELAY-00A2.dtbo
  DTC     src/arm/overlays/BB-HDMI-TDA998x-00A0.dtbo
  DTC     src/arm/overlays/BB-NHDMI-TDA998x-00A0.dtbo
  DTC     src/arm/overlays/BBORG_FAN-A000.dtbo
  DTC     src/arm/overlays/LED_P8_04.dtbo
  DTC     src/arm/overlays/BB-I2C1-RTC-PCF8563.dtbo
  DTC     src/arm/overlays/BB-BBBW-WL1835-00A0.dtbo
  DTC     src/arm/overlays/BB-BONE-4D4C-01-00A1.dtbo
  DTC     src/arm/overlays/BB-BBGG-WL1835-00A0.dtbo
  DTC     src/arm/overlays/PB-HACKADAY-2021.dtbo
  DTC     src/arm/overlays/BB-SPIDEV1-00A0.dtbo
  DTC     src/arm/overlays/BBORG_COMMS-00A2.dtbo
  DTC     src/arm/overlays/BB-SPIDEV0-00A0.dtbo
  DTC     src/arm/overlays/PB-MIKROBUS-0.dtbo
  DTC     src/arm/overlays/BB-I2C1-MCP7940X-00A0.dtbo
  DTC     src/arm64/k3-am625-pocketbeagle2.dtb
  DTC     src/arm64/k3-am625-sk.dtb
  DTC     src/arm64/k3-j721e-sk-csi2-ov5640.dtb
  DTC     src/arm64/k3-am625-skeleton.dtb
  DTC     src/arm64/k3-j721e-proc-board-tps65917.dtb
  DTC     src/arm64/k3-am625-beagleplay.dtb
  DTC     src/arm64/k3-j721e-cpb-csi2-ov5640.dtb
  DTC     src/arm64/k3-am625-beagleplay-cc33xx.dtb
  DTC     src/arm64/k3-am62x-lp-sk.dtb
  DTC     src/arm64/k3-j721e-common-proc-board-infotainment.dtb
  DTC     src/arm64/k3-j721e-beagleboneai64-no-shared-mem.dtb
  DTC     src/arm64/k3-j721e-sk-rpi-cam-imx219.dtb
  DTC     src/arm64/k3-j721e-beagleboneai64.dtb
  DTC     src/arm64/k3-j721e-sk.dtb
  DTC     src/arm64/k3-j721e-common-proc-board.dtb
  DTC     src/arm64/overlays/BPLAY-CSI-ov5647.dtbo
  DTC     src/arm64/overlays/BBORG_SERVO-00A2.dtbo
  DTC     src/arm64/overlays/BONE-LED_P8_03.dtbo
  DTC     src/arm64/overlays/BONE-PWM0.dtbo
  DTC     src/arm64/overlays/BONE-I2C1.dtbo
  DTC     src/arm64/overlays/BBAI64-CSI1-imx219.dtbo
  DTC     src/arm64/overlays/BBORG_LOAD-00A2.dtbo
  DTC     src/arm64/overlays/BPLAY-CSI-ov5640.dtbo
  DTC     src/arm64/overlays/BBAI64-DSI-RPi-7inch-panel.dtbo
  DTC     src/arm64/overlays/BONE-PWM1.dtbo
  DTC     src/arm64/overlays/BBAI64-P9_25-ehrpwm4_b.dtbo
  DTC     src/arm64/overlays/BONE-I2C3.dtbo
  DTC     src/arm64/overlays/J721E-PRU-UIO-00A0.dtbo
  DTC     src/arm64/overlays/k3-am625-beagleplay-csi2-ov5640.dtbo
  DTC     src/arm64/overlays/BONE-FAN.dtbo
  DTC     src/arm64/overlays/BONE-LED_P9_11.dtbo
  DTC     src/arm64/overlays/k3-j721e-beagleboneai64-RPi-7inch-panel.dtbo
  DTC     src/arm64/overlays/robotics-cape-spitest.dtbo
  DTC     src/arm64/overlays/k3-am625-beagleplay-release-mikrobus.dtbo
  DTC     src/arm64/overlays/BBAI64-P8_37-ehrpwm5_a.dtbo
  DTC     src/arm64/overlays/BONE-USB0-host.dtbo
  DTC     src/arm64/overlays/BBAI64-CSI0-imx219.dtbo
  DTC     src/arm64/overlays/BB-I2C2-MPU6050.dtbo
  DTC     src/arm64/overlays/BONE-SPI1_0.dtbo
  DTC     src/arm64/overlays/BBORG_RELAY-00A2.dtbo
  DTC     src/arm64/overlays/BONE-LED_P9_14.dtbo
  DTC     src/arm64/overlays/BONE-I2C2.dtbo
  DTC     src/arm64/overlays/k3-am625-beagleplay-bcfserial-no-firmware.dtbo
  DTC     src/arm64/overlays/robotics-cape.dtbo
  DTC     src/arm64/overlays/BONE-SPI0_1.dtbo
  DTC     src/arm64/overlays/BONE-UART1.dtbo
  DTC     src/arm64/overlays/BONE-PWM2.dtbo
  DTC     src/arm64/overlays/k3-am625-beagleplay-release-mikrobus-set-gpios-all.dtbo
  DTC     src/arm64/overlays/BONE-I2C4.dtbo
  DTC     src/arm64/overlays/k3-am625-beagleplay-lt-lcd185.dtbo
  DTC     src/arm64/overlays/BONE-SPI0_0.dtbo
  DTC     src/riscv/light-beagle-ref.dtb
  DTC     src/riscv/light-beagle.dtb
  DTC     src/riscv/overlays/BVA_DSI.dtbo
  DTC     src/riscv/overlays/BONE-LED_P8_03.dtbo
  DTC     src/riscv/overlays/BBORG_LOAD-00A2.dtbo
  DTC     src/riscv/overlays/BONE-LED_P9_11.dtbo
  DTC     src/riscv/overlays/BBORG_RELAY-00A2.dtbo
  DTC     src/riscv/overlays/BVA-MIKROBUS-0.dtbo
  
```