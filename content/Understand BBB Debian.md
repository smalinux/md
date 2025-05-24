
https://git.beagleboard.org/beagleboard
https://forum.digikey.com/t/debian-getting-started-with-the-beaglebone-black/12967

https://forum.beagleboard.org/t/beagleboneblack-debian-source-distribution/34024

فى البدايه لازم تكون جاهز نفسياً انك هتشوف repos كتير جدا بيعملوها وبيحطو فيها تغيرات وبعدين يركنوها يتيمه!

____
##### الكيرنال بتاعتهم


> $ find / -name "*.dtbo" 2> /dev/null

```
/usr/lib/linux-image-5.10.168-ti-r72/overlays/BBORG_COMMS-00A2.dtbo
/usr/lib/linux-image-5.10.168-ti-r72/overlays/BB-LCD-ADAFRUIT-24-SPI1-00A0.dtbo
/usr/lib/linux-image-5.10.168-ti-r72/overlays/BB-SPIDEV1-00A0.dtbo
/usr/lib/linux-image-5.10.168-ti-r72/overlays/BB-BONE-eMMC1-01-00A0.dtbo
/usr/lib/linux-image-5.10.168-ti-r72/overlays/BB-UART2-00A0.dtbo
/usr/lib/linux-image-5.10.168-ti-r72/overlays/BB-I2C2-BME680.dtbo
/usr/lib/linux-image-5.10.168-ti-r72/overlays/BB-UART4-00A0.dtbo
/usr/lib/linux-image-5.10.168-ti-r72/overlays/AM57XX-PRU-UIO-00A0.dtbo
/usr/lib/linux-image-5.10.168-ti-r72/overlays/BB-I2C1-MCP7940X-00A0.dtbo
/usr/lib/linux-image-5.10.168-ti-r72/overlays/BBORG_RELAY-00A2.dtbo
/usr/lib/linux-image-5.10.168-ti-r72/overlays/PB-MIKROBUS-1.dtbo
/usr/lib/linux-image-5.10.168-ti-r72/overlays/BB-BBBW-WL1835-00A0.dtbo
/usr/lib/linux-image-5.10.168-ti-r72/overlays/BB-BONE-4D4C-01-00A1.dtbo
/usr/lib/linux-image-5.10.168-ti-r72/overlays/BB-UART1-00A0.dtbo
/usr/lib/linux-image-5.10.168-ti-r72/overlays/BB-W1-P9.12-00A0.dtbo
/usr/lib/linux-image-5.10.168-ti-r72/overlays/BB-BONE-LCD4-01-00A1.dtbo
/usr/lib/linux-image-5.10.168-ti-r72/overlays/PB-MIKROBUS-0.dtbo
/usr/lib/linux-image-5.10.168-ti-r72/overlays/BB-SPIDEV0-00A0.dtbo
/usr/lib/linux-image-5.10.168-ti-r72/overlays/M-BB-BBG-00A0.dtbo
/usr/lib/linux-image-5.10.168-ti-r72/overlays/M-BB-BBGG-00A0.dtbo
/usr/lib/linux-image-5.10.168-ti-r72/overlays/BB-BONE-4D5R-01-00A1.dtbo
/usr/lib/linux-image-5.10.168-ti-r72/overlays/BONE-ADC.dtbo
/usr/lib/linux-image-5.10.168-ti-r72/overlays/BB-I2C2-MPU6050.dtbo
/usr/lib/linux-image-5.10.168-ti-r72/overlays/BB-ADC-00A0.dtbo
/usr/lib/linux-image-5.10.168-ti-r72/overlays/BB-BBGG-WL1835-00A0.dtbo
/usr/lib/linux-image-5.10.168-ti-r72/overlays/BB-HDMI-TDA998x-00A0.dtbo
/usr/lib/linux-image-5.10.168-ti-r72/overlays/PB-HACKADAY-2021.dtbo
/usr/lib/linux-image-5.10.168-ti-r72/overlays/AM335X-PRU-UIO-00A0.dtbo
/usr/lib/linux-image-5.10.168-ti-r72/overlays/BB-I2C1-RTC-PCF8563.dtbo
/usr/lib/linux-image-5.10.168-ti-r72/overlays/BB-I2C1-RTC-DS3231.dtbo
/usr/lib/linux-image-5.10.168-ti-r72/overlays/BB-NHDMI-TDA998x-00A0.dtbo
/usr/lib/linux-image-5.10.168-ti-r72/overlays/BB-CAPE-DISP-CT4-00A0.dtbo
/usr/lib/linux-image-5.10.168-ti-r72/overlays/LED_P8_04.dtbo
/usr/lib/linux-image-5.10.168-ti-r72/overlays/LED_P8_03.dtbo
/usr/lib/linux-image-5.10.168-ti-r72/overlays/BB-BONE-NH7C-01-A0.dtbo
/usr/lib/linux-image-5.10.168-ti-r72/overlays/BB-BBGW-WL1835-00A0.dtbo
/usr/lib/linux-image-5.10.168-ti-r72/overlays/BBORG_FAN-A000.dtbo
/boot/dtbs/5.10.168-ti-r72/overlays/BBORG_COMMS-00A2.dtbo
/boot/dtbs/5.10.168-ti-r72/overlays/BB-LCD-ADAFRUIT-24-SPI1-00A0.dtbo
/boot/dtbs/5.10.168-ti-r72/overlays/BB-SPIDEV1-00A0.dtbo
/boot/dtbs/5.10.168-ti-r72/overlays/BB-BONE-eMMC1-01-00A0.dtbo
/boot/dtbs/5.10.168-ti-r72/overlays/BB-UART2-00A0.dtbo
/boot/dtbs/5.10.168-ti-r72/overlays/BB-I2C2-BME680.dtbo
/boot/dtbs/5.10.168-ti-r72/overlays/BB-UART4-00A0.dtbo
/boot/dtbs/5.10.168-ti-r72/overlays/AM57XX-PRU-UIO-00A0.dtbo
/boot/dtbs/5.10.168-ti-r72/overlays/BB-I2C1-MCP7940X-00A0.dtbo
/boot/dtbs/5.10.168-ti-r72/overlays/BBORG_RELAY-00A2.dtbo
/boot/dtbs/5.10.168-ti-r72/overlays/PB-MIKROBUS-1.dtbo
/boot/dtbs/5.10.168-ti-r72/overlays/BB-BBBW-WL1835-00A0.dtbo
/boot/dtbs/5.10.168-ti-r72/overlays/BB-BONE-4D4C-01-00A1.dtbo
/boot/dtbs/5.10.168-ti-r72/overlays/BB-UART1-00A0.dtbo
/boot/dtbs/5.10.168-ti-r72/overlays/BB-W1-P9.12-00A0.dtbo
/boot/dtbs/5.10.168-ti-r72/overlays/BB-BONE-LCD4-01-00A1.dtbo
/boot/dtbs/5.10.168-ti-r72/overlays/PB-MIKROBUS-0.dtbo
/boot/dtbs/5.10.168-ti-r72/overlays/BB-SPIDEV0-00A0.dtbo
/boot/dtbs/5.10.168-ti-r72/overlays/M-BB-BBG-00A0.dtbo
/boot/dtbs/5.10.168-ti-r72/overlays/M-BB-BBGG-00A0.dtbo
/boot/dtbs/5.10.168-ti-r72/overlays/BB-BONE-4D5R-01-00A1.dtbo
/boot/dtbs/5.10.168-ti-r72/overlays/BONE-ADC.dtbo
/boot/dtbs/5.10.168-ti-r72/overlays/BB-I2C2-MPU6050.dtbo
/boot/dtbs/5.10.168-ti-r72/overlays/BB-ADC-00A0.dtbo
/boot/dtbs/5.10.168-ti-r72/overlays/BB-BBGG-WL1835-00A0.dtbo
/boot/dtbs/5.10.168-ti-r72/overlays/BB-HDMI-TDA998x-00A0.dtbo
/boot/dtbs/5.10.168-ti-r72/overlays/PB-HACKADAY-2021.dtbo
/boot/dtbs/5.10.168-ti-r72/overlays/AM335X-PRU-UIO-00A0.dtbo
/boot/dtbs/5.10.168-ti-r72/overlays/BB-I2C1-RTC-PCF8563.dtbo
/boot/dtbs/5.10.168-ti-r72/overlays/BB-I2C1-RTC-DS3231.dtbo
/boot/dtbs/5.10.168-ti-r72/overlays/BB-NHDMI-TDA998x-00A0.dtbo
/boot/dtbs/5.10.168-ti-r72/overlays/BB-CAPE-DISP-CT4-00A0.dtbo
/boot/dtbs/5.10.168-ti-r72/overlays/LED_P8_04.dtbo
/boot/dtbs/5.10.168-ti-r72/overlays/LED_P8_03.dtbo
/boot/dtbs/5.10.168-ti-r72/overlays/BB-BONE-NH7C-01-A0.dtbo
/boot/dtbs/5.10.168-ti-r72/overlays/BB-BBGW-WL1835-00A0.dtbo
/boot/dtbs/5.10.168-ti-r72/overlays/BBORG_FAN-A000.dtbo

```


Overlays:
https://github.com/beagleboard/bb.org-overlays

____

الـ Linux kernel بتاعت Beaglebone هنا: https://github.com/beagleboard/linux
وتحديداً بـ uname الكيرنال بتاعتى: https://github.com/beagleboard/linux/tree/v5.10.168-ti-r72

بصيت على الـ git commit ولقيت انهم ضافو حوالى 200 commit فوق 
```c
# git commit
707c48210a5384a72c82655a37895b7e822755f2 (tag: v5.10.168) Linux 5.10.168
```

دلوقتى بقى عندى فرصه اعرف كل التغيرات اللى ti بتعملها!
```bash
v5.10.168-ti-r72 $ tig arch/arm/boot/dts/
```

```bash
# Add BeagleBoard.org Device Tree Changes
$ git show acb7d16ba0cf12ccf5390d80720fb10f73c82914
```


____
عملت ملف اسمه what-is-new فيه كل الاضافات بتاعتهم

____
نقلو الـ device tree بتاع boneblack ودى حاجه رخمه جدا علشان هتصعب انى اشوف الـ history اللى اتعمل على تعديل الملف دا
كان هنا:
```
v5.10.168-ti-r72 $ ls arch/arm/boot/dts
```
وبقى هنا:
```
arch/arm/boot/dts/ti/omap/
```

_____
##### اذن المستفاد لحد دلوقتى, انك لو عايز تعرف بالضبط ايه اللى مؤسسه beagleboard بتعمله من تغيرات على الكيرنالز المختلفه, افتح اى git branch وشوف الـ history
```
https://github.com/beagleboard/linux
```

عايز اشوف الـ overlays:

```
https://github.com/beagleboard/bb.org-overlays
```

عايز اشوف كيرنالز قديمه شويه, بس اوضح من حيث التغيرات اللى هم عملوها فوق الـ upstream, يبقى افتح حاجه زى الـ branch دا:
```
v5.10.168-ti-r72
```

____
##### عايز اشوف ايه الـ repos التانيه اللى هم بيعدلو فيها غير الكيرنال بشكل عام و active
```
https://git.beagleboard.org/beagleboard/?sort=latest_activity_desc
```

____

https://git.beagleboard.org/beagleboard/capes
لما تشترى capes خرجيه, هتعرف قيمه الـ repo دى, وكمان دى قائمه حلوه تعرف منها ايه الـ capes المدعومه


الكيرنالز:
https://git.beagleboard.org/beagleboard/BeagleBoard-DeviceTrees


علشان افهم uEnv.txt اقرأ: https://elinux.org/Beagleboard:U-boot_partitioning_layout_2.0



_____

# مستودعات BeagleBoard 

# [linux](https://git.beagleboard.org/beagleboard/linux) - [linux](https://github.com/beagleboard/linux) 👍👍👍👍 [mirror-ti-linux-kernel](https://github.com/beagleboard/mirror-ti-linux-kernel) - [mirror-linux-stable](https://github.com/beagleboard/mirror-linux-stable) - [arm64-mainline-linux](https://github.com/beagleboard/arm64-mainline-linux) - 
المستودع الرسمي الذي يحتوي على نواة لينكس للوحات BeagleBoard و BeagleBone. هذا المستودع يوفر كود نواة لينكس المخصص والمُعدل خصيصاً لتعمل بشكل مثالي مع أجهزة BeagleBoard، حيث يتضمن تعريفات الأجهزة وبرامج تشغيل للأجهزة الطرفية المختلفة والكثير من التحسينات الخاصة بهذه الأجهزة.

اكتر مكان فيه حياة دلوقتى: https://github.com/beagleboard/linux


# [buildroot](https://git.beagleboard.org/beagleboard/buildroot) 👎

هنا بيحطو تغيراتهم. لكن ما اعتقدش انها تغيرات كبيره وليها لزمه, مجرد starter لان شركه beagle بتدعم debian اكتر من اى حاجه تانيه...

# [librobotcontrol](https://github.com/beagleboard/librobotcontrol) 👎

مكتبه user level اول لما بدأت كانت للروبوتات والـ capes 
مكتبه تقدر تستخدمها بالسى. هتجاهل انى ابص عليها دلوقتى, هبص عليها بعدين
Doc: https://old.beagleboard.org/static/librobotcontrol/index.html
Doc: https://docs.beagleboard.org/projects/librobotcontrol/

```bash
sudo apt install librobotcontrol
```

# [BeagleBoard-DeviceTrees](https://github.com/beagleboard/BeagleBoard-DeviceTrees) 👍

الـ device drivers الـ custom واللى مش شرط تكون موجوده upstream جوا الكيرنال. طبعا مهم جدا. 🥇

# [ti-linux-firmware](https://git.beagleboard.org/beagleboard/ti-linux-firmware) 👍 - [mirror-linux-firmware](https://github.com/beagleboard/mirror-linux-firmware) 

> تعريفات الـ firmware للاجهزه الصغيره اللى بتشتغل مع beaglebone , فيه firmware كتيره جدا زى اجهزه بلوتوث وغيرها, ومش كلهم open source لا ليك access عليهم 
> المطلوب منك هنا انك تستخدم اكبر قدر ممكن من الـ firmwares دى لحد ما تستريح مع طريقه دمجهم ....

```bash
$ f *.bin
$ f *.fw
```

مستودع مرآة (mirror) لحزم البرامج الثابتة (firmware) الخاصة بشركة تكساس إنسترومنتس (Texas Instruments) التي كانت موزعة سابقًا في مواقع مختلفة. هذا المستودع هو مرآة رسمية لـ [https://git.ti.com/gitweb?p=processor-firmware/ti-linux-firmware.git](https://git.ti.com/gitweb?p=processor-firmware/ti-linux-firmware.git)، ويوفر مكانًا مركزيًا موحدًا للوصول إلى جميع ملفات البرامج الثابتة اللازمة لأجهزة BeagleBoard التي تستخدم معالجات Texas Instruments.

يتضمن المستودع ملفات البرامج الثابتة الضرورية للعديد من المكونات الأساسية في لوحات BeagleBoard، مثل:

- البرامج الثابتة لوحدات الواي-فاي (WiFi) والبلوتوث (Bluetooth)
- برامج تشغيل معالجات الإشارات الرقمية (DSP)
- ملفات PRU (Programmable Real-time Units)
- برامج RTOS (نظام التشغيل الفوري) للمعالجات المساعدة
- برامج تشغيل وحدات معالجة الرسومات (GPU)
- برامج تشغيل معالجات الرؤية (Vision Processing)
- برامج تشغيل وحدات معالجة الفيديو

هذه البرامج الثابتة ذات أهمية حاسمة في عملية تطوير أنظمة لينكس الخاصة بلوحات BeagleBoard، لأنها تمكّن من استخدام جميع إمكانيات العتاد الموجود في هذه اللوحات. دون هذه الملفات، لن تعمل العديد من المكونات الهامة مثل الاتصالات اللاسلكية، معالجة الوسائط، وواجهات الاتصال المختلفة.

تحتوي جميع البرامج الثابتة في هذا المستودع على تراخيص خاصة تسمح بإعادة توزيعها، حتى وإن كانت الشفرة المصدرية غير متاحة (binary blobs). هذه التراخيص تضمن للمستخدمين النهائيين الحقوق اللازمة لاستخدام هذه البرامج مع أجهزة Texas Instruments، وتشمل في الغالب منحًا ضمنية أو صريحة لبراءات الاختراع المتعلقة بها لضمان الأداء الكامل للأجهزة.

يُستخدم هذا المستودع بشكل أساسي من قبل مطوري نواة لينكس ومطوري أنظمة التشغيل المدمجة الذين يعملون على لوحات BeagleBoard. يتم دمج هذه البرامج الثابتة في صور نظام التشغيل التي يتم إنشاؤها باستخدام مستودعات أخرى مثل image-builder وbuildroot، مما يضمن توفر جميع مكونات العتاد بشكل صحيح عند تشغيل النظام.

# [repos](https://github.com/beagleboard/repos) 👍 - # [repos-riscv64](https://github.com/beagleboard/repos-riscv64) 👎 - [repos-armhf](https://github.com/beagleboard/repos-armhf) - # [repos-arm64](https://git.beagleboard.org/beagleboard/repos-arm64) 👎
> لما بتعمل apt install فيه packages كتيييير, صح؟ فيه بقى packages معموله مخصوص من شركه beagleboard
> لو عايز تعرف كل الـ packages دى واسماءها هتلاقيهم هنا
> مثلا انا جربت على البورده امر: dpkg -l

مستودع repos-arm64 هو مستودع لإدارة حزم دبيان (Debian) المخصصة لمنصات BeagleBoard التي تعتمد على معمارية ARM64 (aarch64). يحتوي هذا المستودع على ملفات المصدر والتكوين اللازمة لبناء وإنشاء حزم دبيان (.deb) مخصصة ومحسنة لأجهزة BeagleBoard المعتمدة على معالجات ARM 64-bit مثل BeagleBone AI-64 وBeaglePlay. يرتبط هذا المستودع بخدمة مستودع APT العامة على الإنترنت في العنوان [http://debian.beagleboard.org/arm64/](http://debian.beagleboard.org/arm64/) والتي تستخدمها صور نظام التشغيل الرسمية من BeagleBoard.org للوصول إلى الحزم المخصصة التي لا تتوفر في مستودعات دبيان القياسية.

## الغرض

الغرض الرئيسي من هذا المستودع هو:

- توفير بنية تحتية لإنشاء وصيانة حزم دبيان المخصصة لمنصات ARM64 من BeagleBoard
- دعم تجميع ونشر برمجيات مخصصة تتطلبها أجهزة BeagleBoard مثل U-Boot وLinux Kernel والأدوات المساعدة
- توفير آلية لتحديث البرامج والتعريفات على أجهزة BeagleBoard ARM64 القائمة
- المساعدة في إنشاء صور نظام التشغيل الرسمية لـ BeagleBoard.org
- تسهيل تطوير وصيانة حزم خاصة بتوزيعات دبيان المختلفة (مثل bullseye وbookworm)
- دعم متطلبات العتاد الخاصة لأجهزة BeagleBoard المختلفة والتي لا تتوفر في المستودعات الرسمية

## المحتوى التقني

يحتوي المستودع على عدة مكونات رئيسية:

- **حزم البرامج**: كل مجلد في المستودع يمثل حزمة برمجية، مثل:
    - bb-u-boot-beagleboneai64: حزمة U-Boot المخصصة لـ BeagleBone AI-64
    - bb-beagle-flasher: أدوات لكتابة صور النظام على الأجهزة
    - bb-wl18xx-firmware: برامج ثابتة (firmware) لوحدات WiFi
    - linux-image-*: حزم نواة لينكس المخصصة لمختلف المنصات
- **هيكل مجلدات الحزم**: داخل كل حزمة توجد عدة مجلدات فرعية:
    - suite/: يحتوي على إصدارات دبيان المدعومة (مثل bullseye، bookworm)
    - debian/: يحتوي على ملفات التحكم بالحزمة ونصوص البناء والتثبيت
    - source/: يحتوي على الشيفرة المصدرية للبرمجيات (إن وجدت)
- **ملفات الإعداد**: ملفات تحدد كيفية بناء وتجميع الحزم، مثل:
    - control: معلومات الحزمة والاعتماديات
    - rules: قواعد بناء الحزمة
    - install: قائمة بالملفات التي سيتم تثبيتها
- **سكريبتات**: نصوص برمجية للمساعدة في مختلف العمليات، مثل:
    - install-emmc.sh: لتثبيت البرامج على ذاكرة eMMC الداخلية
    - setup_sdcard.sh: لتهيئة بطاقات SD
    - تحديث وإعداد تعريفات الأجهزة (device trees)




# [config-pin](https://git.beagleboard.org/beagleboard/config-pin) 👍👍

أداة لتكوين دبابيس الإدخال/الإخراج (GPIO pins) على لوحات BeagleBoard. تسمح هذه الأداة للمستخدمين بإعداد وتهيئة دبابيس GPIO بسهولة على أجهزة BeagleBoard، مما يتيح تكوين الدبابيس للعمل في أوضاع مختلفة (مثل GPIO، I2C، SPI، UART، وغيرها) وفقًا لاحتياجات مشروع المستخدم.

# [bbbio-set-sysconf](https://git.beagleboard.org/beagleboard/bbbio-set-sysconf) 👍👍
> اسكربت شبه ltsudo

أداة لإعداد وتكوين النظام على BeagleBone. تسمح للمستخدمين بتعديل إعدادات النظام مثل كلمات المرور، إعدادات الشبكة، وغيرها من خيارات التكوين، خاصة في صور نظام التشغيل التي توفرها BeagleBoard.org. هذه الأداة مفيدة بشكل خاص عند إعداد جهاز جديد أو بعد تثبيت صورة نظام جديدة.


```
systemctl disable bbbio-set-sysconf

systemctl enable bbbio-set-sysconf
```


# [vsx-examples](https://git.beagleboard.org/beagleboard/vsx-examples) 👎

مستودع `vsx-examples` هو مجموعة من الأمثلة والشفرات البرمجية التي توضح استخدام تعليمات Vector Scalar Extensions (VSX) على معالجات TI TDA4VM التي تستخدم نواة ARM Cortex-A72. هذه التعليمات هي جزء من تقنية ARM NEON (Advanced SIMD) المصممة للمعالجة المتوازية للبيانات وتحسين الأداء في تطبيقات معالجة الإشارات والصور والذكاء الاصطناعي.
الهدف الرئيسي من هذا المستودع هو توفير أمثلة عملية للمطورين الذين يعملون مع لوحات BeagleBone AI-64 التي تستخدم معالج TI TDA4VM
# [ti-sgx-modules](https://git.beagleboard.org/beagleboard/ti-sgx-modules)
يحتوي مستودع ti-sgx-modules على وحدات نواة لينكس (Kernel Modules) الخاصة بمعالجات الرسوميات PowerVR SGX من شركة Imagination Technologies والمستخدمة في معالجات Texas Instruments. هذه الوحدات ضرورية لتشغيل وتفعيل تسريع الرسوميات ثلاثية الأبعاد على أجهزة BeagleBoard المختلفة مثل BeagleBone Black وBeaglePlay وBeagleBone AI-64.

# [distros](https://github.com/beagleboard/distros) 👎

> ملهوش اى لزمه بالنسبالك.

# [beagle-tester](https://git.beagleboard.org/beagleboard/beagle-tester) 👎

> شبه بالضبط الـ test اللى بيتم فى الـ production
> فى الأول بيكون عندك باركود بيحدد نوع البورده, بعدين بيبدأ الاختبار يعمل test على كل حاجه تقريباً

أدوات وبرامج تُستخدم لاختبار وظائف لوحات BeagleBoard المختلفة. يحتوي هذا المستودع على مجموعة من برامج الاختبار التي تُستخدم للتحقق من صحة عمل الأجهزة، اختبار المكونات المختلفة مثل المنافذ والدبابيس، وتشخيص المشكلات المحتملة في لوحات BeagleBoard.
## الوصف

مستودع distros هو مستودع رئيسي في منظومة BeagleBoard.org، مخصص لإدارة ونشر صور توزيعات نظام التشغيل الرسمية (OS distributions) لمختلف أجهزة BeagleBoard. يعمل هذا المستودع كنقطة مركزية لتنظيم وإدارة الصور الجاهزة للتنزيل التي يمكن للمستخدمين تثبيتها على أجهزتهم، ويرتبط مباشرة بصفحة التوزيعات الرسمية على موقع BeagleBoard.org (beagleboard.org/distros). يتيح هذا المستودع للفريق المسؤول عن BeagleBoard.org إدارة إصدارات الصور المختلفة، وتتبع التغييرات، وتوفير معلومات وصفية لكل صورة متاحة للتنزيل.

# [capes](https://git.beagleboard.org/beagleboard/capes) 👎

مش عندى نيه دلوقتى انى استخدم capes, على الاقل الكام شهر الجايين, لذلك هتجاهل الـ repo دى وهبقى ابص عليها تانى بعدين

مستودع capes هو مستودع رسمي يحتوي على ملفات التصميم والوثائق الخاصة بلوحات التوسعة (Capes) الرسمية من BeagleBoard.org. هذه اللوحات هي عبارة عن دوائر إلكترونية إضافية تركب على أجهزة BeagleBone لتوسيع وظائفها وقدراتها. يتضمن المستودع ملفات التصميم الهندسي للوحات، بما في ذلك المخططات الكهربائية (schematics) وتصميمات الدوائر المطبوعة (PCB) والمكونات الإلكترونية المستخدمة، بالإضافة إلى البرمجيات والوثائق اللازمة لتشغيل هذه اللوحات. يعتبر هذا المستودع مرجعًا مهمًا للمطورين والمهندسين الذين يرغبون في فهم أو استخدام أو تعديل أو حتى تصنيع هذه اللوحات.


# [gnupru](https://git.beagleboard.org/beagleboard/gnupru) 👍👎 LATER
مستودع gnupru: أدوات GCC وBinutils لمعالج PRU في BeagleBone

مستودع [gnupru](https://github.com/dinuxbg/gnupru) هو مشروع مفتوح المصدر طوره Dimitar Dimitrov لتوفير مجموعة أدوات GNU للبرمجة بلغة C/C++ تستهدف معالجات PRU (وحدة المعالجة ذات الوقت الحقيقي) الموجودة في شرائح Texas Instruments Sitara AM33xx وما بعدها، والتي تستخدم في لوحات BeagleBone.

## ما هو معالج PRU؟

معالج PRU (Programmable Real-Time Unit) هو عبارة عن وحدة معالجة صغيرة مدمجة داخل معالجات TI Sitara، تعمل بسرعة 200 ميغاهرتز، وهي مصممة خصيصاً لمعالجة العمليات في الوقت الحقيقي (Real-Time) بشكل محدد وثابت زمنياً. تحتوي لوحة BeagleBone Black على اثنين من معالجات PRU، وهي تتميز بـ:

- قدرتها على التنفيذ المحدد زمنياً (تعليمة واحدة كل 5 نانوثانية)
- إمكانية الوصول المباشر إلى دبابيس الإدخال/الإخراج (GPIO)
- عدم تأثرها بجدولة نظام التشغيل لينكس
- مثالية للتطبيقات التي تتطلب استجابة سريعة ومحددة زمنياً


التثبيت من حزم Debian

```bash
sudo apt-get update
sudo apt-get install gcc-pru gnuprumcu
```

## أمثلة ومشاريع ذات صلة

- [pru-gcc-examples](https://github.com/dinuxbg/pru-gcc-examples): أمثلة بسيطة لاستخدام PRU-GCC
- [beaglemic](https://github.com/dinuxbg/beaglemic): مشروع عملي يستخدم PRU للتعامل مع الميكروفون
- [pru-software-support-package](https://github.com/dinuxbg/pru-software-support-package): نسخة معدلة من حزمة دعم برمجيات PRU من TI


# [beaglebone-black](https://github.com/beagleboard/beaglebone-black) 👍 - [beagley-ai](https://github.com/beagleboard/beagley-ai)

كل الـ docs اللى هتحتاجها هنا 😄

# [u-boot](https://github.com/beagleboard/u-boot) 👍 - [mirror-ti-u-boot](https://github.com/beagleboard/mirror-ti-u-boot) - [u-boot-archive](https://github.com/beagleboard/u-boot-archive) - 

## بناء U-Boot مخصص

يمكن بناء نسخة مخصصة من U-Boot لأجهزة BeagleBone باتباع الخطوات التالية:

1. **الحصول على الشفرة المصدرية**: من خلال استنساخ مستودع U-Boot
    
    ```
    git clone https://git.beagleboard.org/beagleboard/u-boot-am335x-beagle.git
    ```
    
2. **تثبيت سلسلة أدوات الترجمة المتقاطعة**: لبناء البرنامج لمعماريات ARM
    
    ```
    sudo apt-get install gcc-arm-linux-gnueabihf
    ```
    
3. **تطبيق الرقع (Patches)**: تطبيق الرقع الخاصة بـ BeagleBone
    
    ```
    patch -p1 < 0001-am335x_evm-uEnv.txt-bootz-n-fixes.patch
    patch -p1 < 0002-U-Boot-BeagleBone-Cape-Manager.patch
    ```
    
4. **تكوين وبناء U-Boot**: إنشاء التكوين وبناء الصور
    
    ```
    make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- am335x_evm_defconfig
    make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf-
    ```
    
# [boot-firmware](https://github.com/beagleboard/boot-firmware) 👎

الـ repo دى غريبه بالنسبالى, مافيهاش مجرد بس uboot لا فيها كمان arm trasted firmware وكل البرامج اللى بنحتاجها فى الـ boot قبل الكيرنال
مفيش اى حاجه هنا تدل على انه مستخدم مع beaglebone black

# [beagle-pin-mux](https://openbeagle.org/beagleboard/beagle-pin-mux) 👍 (مزعج)

دا مجرد اسكربت, الغريب بالنسبالى انهم لسه بيدعموه وانا مش عارف استخدمه ولا لاى ليه docs
محتاج ابص فى الـ commit massages واقرأ الكود
- 
# [image-builder](https://github.com/beagleboard/image-builder) 👍

اخيرا لقيت حاجه نورت معايا
دا بيبنى نسخه debian كامله من الـ source
دا الأمر اللى استخدمته علشان ابنى كل حاجه:
```
./RootStock-NG.sh -c bb.org-debian-bookworm-iot-v5.10-ti-armhf-am335x.conf
```
لو عايز فعلا تشوف نتيجه اللى حصل بالتفصيل افتح ignore dir وشوف جواه ايه
## Create an SD Card Image

After building the root filesystem, you need to create an SD card image:
```bash
cd tools
sudo ./setup_sdcard.sh --img-2gb [image-name] --dtb beaglebone [options]
```

Common options include:
- `--rootfs_label rootfs` - Sets the filesystem label
- `--hostname beaglebone` - Sets the hostname
- `--enable-cape-universal` - Enables universal cape support
- `--emmc-flasher` - Makes the SD card an eMMC flasher


Example:
```bash
sudo ./setup_sdcard.sh --img-2gb bone-debian-11-console-armhf --dtb beaglebone --rootfs_label rootfs --hostname beaglebone --enable-cape-universal
```

For creating an image that will flash to the eMMC (internal storage):
```bash
sudo ./setup_sdcard.sh --img-2gb bone-debian-11-console-armhf --dtb beaglebone --rootfs_label rootfs --hostname beaglebone --enable-cape-universal --emmc-flasher
```

## Flash the Image to an SD Card

The previous step creates an .img file in the deploy directory. You can flash this to an SD card using a tool like balenaEtcher, dd, or Win32DiskImager.


**Versioning**: The image-builder repository is regularly updated. If you need to build images for a specific release, you may want to check out a specific tag:
```bash
git checkout bb.org-v[YYYY.MM.DD]
```


دى trick تحفه 😄
انا بس عملت comment للسطر اللى بيعمل delete لـ ignore dir
لقيته سابلى الـ rootfs كله بكل محتوياته 😄 وبكده انا لو عايز اقرأ الـ linux config او اى حاجه على الـ live system مش محتاج اعمل ssh ولا محتاج الجهاز اصلا
كل الملفات موجوده على الـ host 😵

كمان: عايز تعمل debian خطوه بخطوه؟ 
اللينك: https://forum.digikey.com/t/debian-getting-started-with-the-beaglebone-black/12967

____
محتاج اقف عن عند كل repo وكل ci, وافهم على الاقل استخدامهم:
https://git.beagleboard.org/beagleboard/

كمان github و gitlab الاتنين مختلفين تماماً
وعندك كمان openbeagle: 
هنا: https://openbeagle.org/explore/projects/topics/boards

# [zephyr](https://github.com/beagleboard/zephyr) 👎
دا بديل عن لينكس للـ RTOS

# [u-boot-pocketbeagle2](https://github.com/beagleboard/u-boot-pocketbeagle2) - [beaglev-fire-u-boot](https://github.com/beagleboard/beaglev-fire-u-boot) - [ti-u-boot](https://github.com/beagleboard/ti-u-boot) - [beaglev-ahead-u-boot](https://github.com/beagleboard/beaglev-ahead-u-boot) - 


# [bb-imager](https://github.com/beagleboard/bb-imager) 👎👎👎


# [micropython](https://github.com/micropython/micropython) 👎
مشروع الهدف منه انه يوفر python بشكل مبسط على الاجهزه الـ bera-metal microcontrollers اللى مافيهاش لينكس


# [k3-image-gen](https://github.com/beagleboard/k3-image-gen) 👎
كل ما هو مش BBB انا مش مهتم بيه دلوقتى

# [bb.org-overlays](https://github.com/beagleboard/bb.org-overlays) 👍👍
.

# [mirror-wireless-regdb](https://github.com/beagleboard/mirror-wireless-regdb) 👎
لما اجاى اللعب مع الـ wireless هحتاجها, لكن مش ضروريه لعمل base للـ BBB


# [beagleconnect-freedom](https://github.com/beagleboard/beagleconnect-freedom) 👎
حاجه شبه الـ microbus , مش اساسى كبدايه, لكن هبص عليه فى المستقبل

# [PRUCookbook](https://github.com/beagleboard/PRUCookbook) - [am335x_pru_package](https://github.com/beagleboard/am335x_pru_package) 👎

مش هبص على حاجه زى كده فى البدايه, ومش عاجبنى انه مفيش اى دعم, طالما اللى عملو البورده ما دعموهاش, انا مش هاجى ادعمها

# [node-beaglebone-usbboot](https://github.com/beagleboard/node-beaglebone-usbboot) - [BBBlfs](https://github.com/ungureanuvladvictor/BBBlfs) 👍



# =====
