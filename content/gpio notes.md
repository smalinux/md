
Files
```file

drivers/led/led-gpio.c
drivers/gpio/gpio-omap.c
=================================================================

dts/src/arm/ti/omap/am33xx.dtsi
dts/src/arm/ti/omap/am335x-boneblack-common.dtsi
dts/src/arm/ti/omap/am335x-boneblack.dts
dts/src/arm/ti/omap/am335x-bone-common.dtsi


dts/Bindings/leds/common.yaml
dts/Bindings/leds/leds-gpio.yaml

dts/include/dt-bindings/pinctrl/omap.h
dts/include/dt-bindings/pinctrl/am33xx.h
dts/include/dt-bindings/leds/common.h

arch/arm/dts/am335x-bone-common-strip.dtsi

current_drivers

dts/Bindings/gpio/ti,omap-gpio.yaml
dts/src/arm/ti/omap/am33xx-l4.dtsi


drivers/led/core.c
include/led.h

dts/src/arm/ti/omap/am33xx-clocks.dtsi

include/mach/omap/am33xx-silicon.h
drivers/watchdog/omap_wdt.c
drivers/base/driver.c
arch/arm/mach-omap/am33xx_generic.c
common/resource.c
include/asm-generic/io.h

device.h
driver.h
platform.h
wd_core.c
io.h
<asm-generic/io.h>
xfuncs.h
```

TODO:
شوف أول باتش ضافو بيه machine جديده, علشان تعرف بالضبط ايه الملفات الأساسية علشان تدعم جهاز جديد جوا barebox

> hard parts:
> - 25.3.2.2 اغلس جزء بجد
> - 25.3.3.2 تجاوزت
> - 25.3.3.3 تجاوزت
> - 25.3.4.4 هرجع اقرأه بعدين وهحاول اطبقه عملياً. عايز زرار مستقر!
> - 25.3.4.5 مش متخيله عملياً. فى المستقبل يمكن الاقى حد لعب مع الجزء دا


الملف دا اللى بيأثر على الـ heartbeat على بوردتى
```
# dts/src/arm/ti/omap/am335x-bone-common.dtsi

led2 {
	label = "beaglebone:green:heartbeat";
	gpios = <&gpio1 21 GPIO_ACTIVE_HIGH>;
	linux,default-trigger = "heartbeat";
	default-state = "off";
};
```

مش فاهم ايه لزمه الملف دا, لكن هسجله هنا بس علشان افتكر:
```
arch/arm/dts/am335x-bone-common-strip.dtsi
```

# السؤال الأصعب: ايه هى نقطه البدايه؟
ايه راكب على ايه؟
الاجابه: البدايه هى الـ defconfig ⭐
المفروض تبص فى kconfig كمان تبقى فاهم كويس جدا الـ unit دى اولها وآخرها فين
كمان ملف MAINTAINER علشان تشوف الـ framework كله أوله وآخره فين...

# barebox cmd
$ led
التحكم فى كل الـ leds اللى على جهازك... لازم ديما توفر دا لأى جهاز تحت ايدك
$ trigger
$ gpioinfo
$ gpio_direction_input
$ gpio_direction_output
$ gpio_set_value
$ gpio_get_value


_____________________________
________________

```bash
Ubuntu@barebox $ grep GPIO build/.config
CONFIG_GENERIC_GPIO=y
CONFIG_CMD_GPIO=y
CONFIG_OF_GPIO=y
# CONFIG_MDIO_BUS_MUX_GPIO is not set
# CONFIG_DRIVER_SPI_GPIO is not set
# CONFIG_I2C_GPIO is not set
CONFIG_LED_GPIO=y
CONFIG_LED_GPIO_OF=y
# CONFIG_LED_GPIO_RGB is not set
# CONFIG_LED_GPIO_BICOLOR is not set
# CONFIG_KEYBOARD_GPIO is not set
# CONFIG_GPIO_WATCHDOG is not set
CONFIG_GPIOLIB=y --------------------------------> gpiolib.c
# GPIO
CONFIG_GPIO_GENERIC=y
# CONFIG_GPIO_74164 is not set
# CONFIG_GPIO_74XX_MMIO is not set
CONFIG_GPIO_GENERIC_PLATFORM=y
CONFIG_GPIO_OMAP=y ------------------------------> gpio-omap.c
# CONFIG_GPIO_PCA953X is not set
# CONFIG_GPIO_PCF857X is not set
# CONFIG_GPIO_PL061 is not set
# CONFIG_GPIO_DESIGNWARE is not set
# CONFIG_GPIO_SX150X is not set
# CONFIG_GPIO_SIFIVE is not set
# CONFIG_GPIO_LATCH is not set
# end of GPIO
# CONFIG_POWER_RESET_GPIO is not set
# CONFIG_POWER_RESET_GPIO_RESTART is not set
```

