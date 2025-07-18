```c#
#define GET_WLDR_VAL(secs)      (0xffffffff - ((secs) * (32768/(1<<PTV))) + 1)
```

Math:
```
WLDR_VALUE = 0xFFFFFFFF - (secs × (32768 ÷ 2^PTV)) + 1
```

### ✅ What is `0xFFFFFFFF`?

- `0xFFFFFFFF` is a **32-bit hexadecimal number**.
- All its bits are set to `1`.
- 0xFFFFFFFF = 2^32

### ✅ 32768 ?
Base Frequency = 32768 Hz (32 kHz)
Effective Frequency = 32768 ÷ 2^PTV

**الشرح المنطقي:**

**1. فهم الـ Watchdog Counter:**

- الـ watchdog timer **بيعد تنازلي** من القيمة المحددة لحد 0
- لما يوصل 0 بيحصل **overflow** وبعدين **reset**
- إحنا عايزين نحسب **القيمة الابتدائية** اللي تخلي العد يستغرق `secs` ثانية

**2. حساب التردد الفعلي:**

```
Base Frequency = 32768 Hz (32 kHz)
Effective Frequency = 32768 ÷ 2^PTV
```

**مثال مع PTV = 6:**

```
Effective Frequency = 32768 ÷ 2^6 = 32768 ÷ 64 = 512 Hz
```

**3. حساب عدد النبضات المطلوبة:**

```
Required Pulses = secs × Effective Frequency
Required Pulses = secs × (32768 ÷ 2^PTV)
```

**4. حساب القيمة الابتدائية:**

- الـ counter بيعد من القيمة الابتدائية لحد 0
- عشان يعد `Required Pulses` نبضة، لازم يبدأ من `Required Pulses`
- لكن الـ register 32-bit، فلازم نحسب من الـ maximum value

**التحليل الرياضي التفصيلي:**

**المعادلة الأصلية:**

```
WLDR = 0xFFFFFFFF - (secs × (32768 ÷ 2^PTV)) + 1
```

**تفكيك المعادلة:**

**1. حساب التردد الفعلي:**

```
Base_Frequency = 32768 Hz
Prescaler_Division = 2^PTV
Effective_Frequency = 32768 ÷ 2^PTV
```

**2. حساب عدد النبضات المطلوبة:**

```
Required_Pulses = secs × Effective_Frequency
Required_Pulses = secs × (32768 ÷ 2^PTV)
```

**3. حساب القيمة الابتدائية:**

```
Counter_Range = 0xFFFFFFFF + 1 = 2^32
Starting_Value = Counter_Range - Required_Pulses
Starting_Value = 0xFFFFFFFF - Required_Pulses + 1
```


____

```c#
static void omap_wdt_reload(struct omap_wdt_dev *wdev)
static void omap_wdt_enable(struct omap_wdt_dev *wdev)
static void omap_wdt_disable(struct omap_wdt_dev *wdev)
static void omap_wdt_set_timer(struct omap_wdt_dev *wdev, unsigned int timeout)

static int omap_wdt_set_timeout(struct watchdog *wdog, unsigned int timeout)
```


Google: watchdog linux
https://linux.die.net/man/8/watchdog
https://docs.jethome.ru/en/controllers/linux/howto/watchdog.html
https://www.kernel.org/doc/Documentation/watchdog/watchdog-api.txt
https://developer.toradex.com/software/linux-resources/linux-features/watchdog-linux/
https://unix.stackexchange.com/questions/714910/what-is-a-good-way-to-test-watchdog-script-or-command-to-deliberately-overload
https://github.com/torvalds/linux/blob/master/tools/testing/selftests/watchdog/watchdog-test.c
https://docs.redhat.com/en/documentation/red_hat_virtualization/4.1/html/virtual_machine_management_guide/sect-configuring_a_watchdog
https://stackoverflow.com/questions/9072879/how-to-use-linux-software-watchdog
https://linux.die.net/man/5/watchdog.conf
https://kernel.org/doc/html/latest/watchdog/
