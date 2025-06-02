- [ ] عايز اشوف kernel modules موجوده جوا الكيرنال واشوف لما بتضاف هل فعلا بتغير فى القيم بتاعت الـ dts ولا لا. علشان انا عايز اخلى التحكم ديما يكون من الـ dts
	- [ ] شوف امثله من الشغل, واقرأ GPIO drivers
- [ ] فيه bug تقريباً فى libgpiod بتتسبب انى مش قادر اشوف قيمه الـ GPIO لو هى input او output قبل ما اضيف اى module

> pinmux-pins
```bash
debian@BeagleBone:/sys/kernel/debug/pinctrl/44e10800.pinmux-pinctrl-single$ cat pinmux-pins
   pin 12 (PIN12): ocp:P8_gpio_helper (GPIO UNCLAIMED) function pinmux_gpio_p8_pins group pinmux_gpio_p8_pins
   pin 31 (PIN31): ocp:P8_gpio_helper (GPIO UNCLAIMED) function pinmux_gpio_p8_pins group pinmux_gpio_p8_pins
```

check
```bash
cat /sys/kernel/debug/pinctrl/44e10800.pinmux-pinctrl-single/pinmux-pins | grep -E "pin 12|pin 31"
```

> /sys/kernel/debug/gpio
```bash
debian@BeagleBone:/sys/kernel/debug/pinctrl/44e10800.pinmux-pinctrl-single$ cat /sys/kernel/debug/gpio
gpiochip0: GPIOs 0-31, parent: platform/44e07000.gpio, gpio-0-31:
 gpio-6   (                    |cd                  ) in  hi IRQ ACTIVE LOW

gpiochip1: GPIOs 32-63, parent: platform/4804c000.gpio, gpio-32-63:
 gpio-40  (                    |reset               ) out hi ACTIVE LOW
 gpio-44  (                    |button_gpio         ) in  lo IRQ
 gpio-53  (                    |beaglebone:green:usr) out lo
 gpio-54  (                    |beaglebone:green:usr) out lo
 gpio-55  (                    |beaglebone:green:usr) out hi
 gpio-56  (                    |beaglebone:green:usr) out lo
 gpio-61  (                    |led_gpio            ) out lo

gpiochip2: GPIOs 64-95, parent: platform/481ac000.gpio, gpio-64-95:

gpiochip3: GPIOs 96-127, parent: platform/481ae000.gpio, gpio-96-127:
```

```bash
debian@BeagleBone:/sys/kernel/debug/pinctrl/44e10800.pinmux-pinctrl-single$ sudo gpioinfo gpiochip1
gpiochip1 - 32 lines:
        line   0:      unnamed       unused   input  active-high
        line   1:      unnamed       unused   input  active-high
        line   2:      unnamed       unused   input  active-high
        line   3:      unnamed       unused   input  active-high
        line   4:      unnamed       unused   input  active-high
        line   5:      unnamed       unused   input  active-high
        line   6:      unnamed       unused   input  active-high
        line   7:      unnamed       unused   input  active-high
        line   8:      unnamed      "reset"  output   active-low [used]
        line   9:      unnamed       unused   input  active-high
        line  10:      unnamed       unused   input  active-high
        line  11:      unnamed       unused   input  active-high
        line  12:      unnamed "button_gpio" input active-high [used]  <----------------------------------------------
        line  13:      unnamed       unused   input  active-high
        line  14:      unnamed       unused   input  active-high
        line  15:      unnamed       unused   input  active-high
        line  16:      unnamed       unused   input  active-high
        line  17:      unnamed       unused   input  active-high
        line  18:      unnamed       unused   input  active-high
        line  19:      unnamed       unused   input  active-high
        line  20:      unnamed       unused   input  active-high
        line  21:      unnamed "beaglebone:green:usr0" output active-high [used]
        line  22:      unnamed "beaglebone:green:usr1" output active-high [used]
        line  23:      unnamed "beaglebone:green:usr2" output active-high [used]
        line  24:      unnamed "beaglebone:green:usr3" output active-high [used]
        line  25:      unnamed       unused   input  active-high
        line  26:      unnamed       unused   input  active-high
        line  27:      unnamed       unused   input  active-high
        line  28:      unnamed       unused   input  active-high
        line  29:      unnamed   "led_gpio"  output  active-high [used]  <----------------------------------------------
        line  30:      unnamed       unused   input  active-high
        line  31:      unnamed       unused   input  active-high

```


