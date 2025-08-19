Grep: "ti,omap4-gpio"

```bash
$ devinfo 4804c000.gpio@0.of
$ devinfo 44e07000.gpio@0.of
$ devinfo 481ac000.gpio@0.of
$ devinfo 481ae000.gpio@0.of
```

```bash
https://www.barebox.org/doc/latest/commands/info/gpioinfo.html
https://www.barebox.org/doc/latest/commands/hwmanip/gpio_direction_input.html
https://www.barebox.org/doc/latest/commands/hwmanip/gpio_get_value.html
https://www.barebox.org/doc/latest/commands/hwmanip/gpio_set_value.html
```

```bash
# files
dts/Bindings/gpio/ti,omap-gpio.yaml
dts/src/arm/ti/omap/am33xx-l4.dtsi
gpio

```

```
OCP compatible interface??
```
____
____

de-bounce clock??
de-bouncing cells??

___
# الشرح
## Chapter 25: General-Purpose Input/Output (GPIO)

### 25.1 Introduction - المقدمة

**بالعربي المصري:** الـ GPIO ده عبارة عن interface عام الغرض بيدمج أربع GPIO modules. كل module فيه 32 pin مخصصين للـ input والـ output، يعني إجمالي 128 pins (4 × 32). 
الـ pins دي ممكن تـ configure للاستخدامات دي:

- **Data input/output** - قراءة وكتابة البيانات
- **Keyboard interface** مع debounce cell - واجهة لوحة مفاتيح مع تنظيف الإشارة
- **Interrupt generation** في الـ active mode - توليد مقاطعات عند اكتشاف أحداث خارجية
- **Wake-up request generation** في الـ idle mode - طلب إيقاظ النظام

### 25.1.2 GPIO Features - مميزات الـ GPIO

**بالعربي المصري:** كل GPIO module مكون من 32 channel متطابقين. كل channel ممكن يتـconfigure للاستخدامات دي:

**الـ Global Features:**

- الـ **Synchronous interrupt requests** من كل channel بتتعامل بواسطة اثنين interrupt generation sub-modules منفصلين للـ ARM Subsystem
- الـ **Wake-up requests** من الـ input channels بتتدمج مع بعض عشان تطلع wake-up signal واحد للنظام
- الـ**Shared registers** ممكن توصلها من خلال "Set & Clear" protocol

**In English:** Each GPIO module consists of 32 identical channels configurable for data input/output, keyboard interface with debouncing, synchronous interrupt generation, and wake-up request generation. Global features include dual interrupt generation sub-modules for ARM Subsystem independence, merged wake-up requests, and shared registers accessible through Set & Clear protocol.

### 25.1.3 Unsupported GPIO Features - المميزات غير المدعومة

مهم جداً نعرف إن الـ **wake-up feature** مدعوم بس في الـ **GPIO0** فقط. باقي الـ GPIO modules (GPIO1, GPIO2, GPIO3) مش بيدعموا الـ wake-up functionality.
### 25.2 Integration - التكامل

الـ device فيه أربع GPIO_V2 modules. كل module بيدعم 32 pin مخصص للـ input والـ output configuration. الـ Input signals ممكن تستخدم لتوليد interruptions و wake-up signals. فيه اثنين Interrupt lines متاحين للـ bi-processor operation.

**الـ Domain Distribution:**

- **GPIO0**: في الـ Wakeup domain - ممكن يوقظ الجهاز من مصادر خارجية
- **GPIO[1:3]**: في الـ Peripheral domain

### 25.2.1 GPIO Connectivity Attributes - خصائص الاتصال

**GPIO0 Attributes:**

- **Power Domain**: Wakeup Domain
- **Clock Domain**:
    - PD_WKUP_L4_WKUP_GCLK للـ OCP
    - GPIO_0_GDBCLK للـ Debounce
- **Reset Signals**: WKUP_DOM_RST_N
- **Idle/Wakeup**: Smart Idle / Slave Wakeup
- **Interrupt Requests**:
    - INTRPEND1 (GPIOINT0A) للـ MPU subsystem, PRU-ICSS, WakeM3
    - INTRPEND2 (GPIOINT0B) للـ MPU subsystem, WakeM3

**GPIO[1:3] Attributes:**

- **Power Domain**: Peripheral Domain
- **Clock Domain**:
    - PD_PER_L4LS_GCLK للـ OCP
    - GPIO_x_GDBCLK للـ Debounce (لكل module)
- **Reset Signals**: PER_DOM_RST_N
- **Idle/Wakeup**: Smart Idle فقط
- **Interrupt Requests**: اثنين interrupts للـ MPU subsystem

### 25.2.2 GPIO Clock and Reset Management - إدارة الساعة والإعادة التشغيل

**بالعربي المصري:** الـ GPIO modules محتاجة اثنين clocks:

1. **De-bounce clock**: مستخدم للـ de-bouncing cells
2. **Interface clock**: من الـ peripheral bus (L4 interface) - ده كمان الـ functional clock

**GPIO0 Debounce Clock Sources:** الـ GPIO0 ممكن يختار الـ debounce clock من ثلاث مصادر باستخدام الـ CLKSEL_GPIO0_DBCLK register في الـ PRCM:

- الـ on-chip ~32.768 KHz oscillator (CLK_RC32K)
- الـ PER PLL generated 32.768 KHz clock (CLK_32KHZ)
- الـ external 32.768 KHz oscillator/clock (CLK_32K_RTC)

**Clock Frequencies:**

- **Functional/Interface clock**: 100 MHz max (CORE_CLKOUTM4 / 2)
- **Debounce clock**: 32.768 KHz

### 25.2.3 GPIO Pin List - قائمة الأطراف

**بالعربي المصري:** كل GPIO module بيشمل 32 interface I/Os. الـ signals دي مسماة كده:

- GPIO0_[31:0]
- GPIO1_[31:0]
- GPIO2_[31:0]
- GPIO3_[31:0]

مهم نعرف إن لأغلب الـ device، الـ signals دي هتكون مشتركة (multiplexed) مع functional signals من interfaces تانية.

____
____
# 25.3 Functional Description
## ==25.3.1 Operating Modes - أوضاع التشغيل==

##### الأربع 4 أوضاع الأساسية للتشغيل

###### 1. Active Mode - الوضع النشط

ده الوضع الطبيعي للشغل. فيه:

- الـ module بيشتغل **synchronously** على الـ **interface clock**
- ممكن يولد **interrupt** حسب الـ configuration والـ external signals
- كل الوظائف شغالة بالكامل
- الـ **event detection** (level أو transition) بتتم في الـ GPIO module باستخدام الـ interface clock
- دقة الـ detection محددة بتردد الـ clock والـ internal gating scheme المختار

###### 2. Idle Mode - وضع الخمول

ده وضع الانتظار. فيه:

- الـ module في حالة **waiting state**
- الـ **interface clock ممكن يتوقف**
- **مش ممكن يولد interrupt**
- **ممكن يولد wake-up signal** حسب الـ configuration والـ external signals
- لازم نشيك الـ chip top-level functional specification عشان نعرف availability الـ debouncing clock في الـ Idle mode
- لو الـ **debouncing clock active**: الـ debouncing cell ممكن تستخدم لعمل sample وfilter للـ input عشان تولد wakeup event
- لو الـ **debouncing clock inactive**: الـ debouncing cell مش ممكن تستخدم، لأنها هتمنع كل الـ input signals

###### 3. Inactive Mode - الوضع غير النشط

ده وضع عدم النشاط. فيه:

- الـ module **مالوش activity خالص**
- الـ interface clock ممكن يتوقف
- **مش ممكن يولد interrupt**
- الـ **wake-up feature ممنوع (inhibited)**
- مفيش أي عمليات داخلية

###### 4. Disabled Mode - الوضع المعطل

ده وضع الإغلاق الكامل. فيه:

- الـ module **مش مستخدم خالص**
- الـ **internal clock paths مقفولة (gated)**
- **مش ممكن يولد interrupt أو wake-up request**
- بيستخدم لتوفير الطاقة لما الـ module مش مطلوب

#### التحكم في الأوضاع

#### كيفية تفعيل الأوضاع:
- الـ**Idle و Inactive modes**: بيتكونفيجر جوه الـ module وبتتفعل على طلب من الـ host processor من خلال system interface sideband signals
- الـ**Disabled mode**: بيتحط بواسطة software من خلال dedicated configuration bit
- الـ Disabled mode بيقفل الـ internal clock paths اللي مش مستخدمة للـ system interface **unconditionally**
#### خصائص مهمة:
- كل الـ module registers accessible كـ **8, 16 أو 32-bit** من خلال الـ **OCP compatible interface** (little endian encoding)
- في الـ Active mode، الـ event detection بتتم باستخدام الـ interface clock
- دقة الـ detection محددة بتردد الـ clock والـ internal gating scheme المختار

### أهمية فهم الأوضاع

**بالعربي المصري:** فهم الـ Operating Modes مهم جداً لأن:

- بيحدد امتى ممكن تستخدم الـ interrupt functionality
- بيحدد امتى ممكن تستخدم الـ wake-up functionality
- بيأثر على استهلاك الطاقة
- بيحدد إيه الوظائف المتاحة في كل وضع
- مهم لتصميم power management strategy صحيحة
الـ Operating Modes دي بتديك مرونة كبيرة في التحكم في استهلاك الطاقة والوظائف المطلوبة حسب حالة النظام.

## 25.3.2 ==Clocking and Reset Strategy - استراتيجية الساعة والإعادة التشغيل
==
### 25.3.2.1 Clocks

#### الساعتين الأساسيتين للـ GPIO Module:

**1. Debouncing Clock:**
- **الوظيفة**: مستخدمة للـ **debouncing sub-module logic** (بدون الـ configuration registers المقابلة)
- **القدرة**: الـ module ده قادر يعمل **sample للـ input line** ويفلتر الـ input level باستخدام **programmed delay**
- **التردد**: **32.768 KHz** (ثابت لكل الـ GPIO modules)
- **الاستقلالية**: مستقل عن الـ interface clock

**2. Interface Clock:**

- **المصدر**: من الـ **peripheral bus** (OCP compatible system interface)
- **الوظيفة**:
    - هو كمان الـ **functional clock**
    - بيستخدم في **كل الـ GPIO module** (ما عدا جوه الـ debouncing sub-module logic)
- **المسؤوليات**:
    - بيعمل clock للـ **OCP interface**
    - بيعمل clock للـ **internal logic**
- **مميزات التحكم**: Clock gating features بتسمح بتكييف استهلاك الطاقة للـ module حسب الـ activity

### 25.3.2.2 Clocks, Gating and Active Edge Definitions

#### Clock Domains:
الـ **interface clock** من الـ peripheral bus بيستخدم في كل الـ GPIO module. فيه **اثنين clock domains** محددين:

1. **OCP interface domain**
2. **Internal logic domain**

كل **clock domain ممكن يتحكم فيه بشكل مستقل**.

#### Sampling Operations:

**عمليات الـ Sampling للـ:**

- **Data capture** - التقاط البيانات
- **Events detection** - كشف الأحداث

**بتتم باستخدام الـ rising edge** - الحافة الصاعدة.

**تحميل البيانات:** البيانات المحملة في الـ **data output register (GPIO_DATAOUT)** بتتحط على الـ output GPIO pins **synchronously** مع الـ **rising edge** من الـ interface clock.

#### Clock Gating Features - مميزات بوابات الساعة:

فيه **خمس clock gating features** متاحة لتوفير الطاقة:

**1. الـ System Interface Logic Clock Gating:**
- **الوظيفة**: Clock للـ system interface logic ممكن يتقفل لما الـ module مش متوصل
- **الشرط**: لو الـ **AUTOIDLE configuration bit** في الـ **GPIO_SYSCONFIG register** مضبوط
- **البديل**: لو مش مضبوط، الـ logic ده بيكون **free running** على الـ interface clock

**2. الـ Input Data Sample Logic Clock Gating:**
- **الوظيفة**: Clock للـ input data sample logic ممكن يتقفل لما الـ **data in register** مش متوصل
- **الفايدة**: بيوفر طاقة لما مفيش قراءة للـ input data

**3. الـ Synchronous Events Detection Logic Clock Groups:**
- **التنظيم**: **أربع clock groups** مستخدمة للـ logic في الـ synchronous events detection
- **التوزيع**: كل **8 input GPIO pins** لهم **separate enable signal** حسب الـ edge/level detection register setting
- **الشرط**: لو group مش محتاج detection، الـ clock المقابل هيتقفل
- **Clock Gating Scheme**: كل الـ channels كمان مقفولة باستخدام **'one out of N' scheme**
    - **N values**: 1, 2, 4, أو 8
    - **N = 1**: مفيش gating والـ logic **free running** على الـ interface clock
    - **N = 2-8**: الـ logic بيشتغل على تردد مكافئ لـ **interface clock frequency divided by N**

**4. الـ Inactive Mode Clock Gating:**
- **التأثير**: **كل الـ internal clock paths مقفولة** في الـ Inactive mode
- **الاستثناء**: مفيش استثناءات

**5. الـ Disabled Mode Clock Gating:**
- **التأثير**: **كل الـ internal clock paths** اللي **مش مستخدمة للـ system interface مقفولة**
- **الوصول**: كل الـ **GPIO registers accessible synchronously** مع الـ interface clock
- **الفايدة**: توفير طاقة مع الحفاظ على إمكانية الوصول للـ configuration
### 25.3.2.3 Sleep Mode Request and Acknowledge
#### آلية Sleep Mode:

لما الـ **host processor** يصدر **Sleep mode request**، الـ GPIO module بيروح للـ **Idle mode** حسب الـ **IDLEMODE field** في الـ **GPIO_SYSCONFIG register**.

#### الأوضاع المختلفة للـ IDLEMODE:

**IDLEMODE = 0 (Force-Idle mode):**

- **السلوك**: الـ GPIO بيروح **Inactive mode** بغض النظر عن الـ **internal module state**
- **الاستجابة**: الـ **Idle acknowledge** بيتبعت **unconditionally** (بدون شروط)
- **التأثير**: في الـ Force-Idle mode، الـ module في **Inactive mode** والـ **wake-up feature totally inhibited** (ممنوع تماماً)

**IDLEMODE = 1h (No-Idle mode):**

- **السلوك**: الـ GPIO **مش بيروح للـ Idle mode** خالص
- **الاستجابة**: الـ **Idle acknowledge never sent** (مش بيتبعت أبداً)
- **الاستخدام**: لما عايز تضمن إن الـ GPIO يفضل شغال طول الوقت

**IDLEMODE = 2h (Smart-Idle mode) أو IDLEMODE = 3h (Smart-Idle mode):**

- **التقييم**: الـ GPIO module **بيقيم قدرته الداخلية** على إيقاف الـ interface clock
- **الشروط للـ Idle acknowledge**:
    - **مفيش internal activity** (الـ data input register خلص capture للـ input GPIO pins)
    - **مفيش pending interrupt**
    - **كل الـ interrupt status bits cleared**
    - **مفيش write access للـ GPIO_DEBOUNCINGTIME register pending** للمزامنة

#### آلية الـ Wake-up:

**الشرط الأساسي:** الـ **wake-up request** بيتبعت بس لو الـ **ENAWAKEUP bit** في الـ **GPIO_SYSCONFIG** مضبوط لتفعيل الـ **GPIO wakeup capability**.

**عملية الـ Wake-up:**

1. لما النظام يصحى، الـ **Idle Request goes inactive**
2. الـ **Idle acknowledge** و الـ **wake-up request** signals بيتألغوا فوراً
3. الـ **asynchronous wake-up request** (لو موجود) بينعكس في الـ **synchronous interrupt status registers**

#### ملاحظات مهمة - Important Notes:

**ملاحظة 1:** الـ **Idle mode request** و الـ **Idle acknowledge** هما **system interface sideband signals**. لما الـ GPIO يأكد الـ Sleep mode request (الـ Idle acknowledge اتبعت)، الـ **interface clock ممكن يتوقف في أي وقت**.

**ملاحظة 2:** لما الـ host processor يصدر **Sleep mode request**، الـ GPIO module بيروح للـ **Idle mode بس لو مفيش active bit** في الـ **GPIO_IRQSTATUS_RAW_n registers**.

### 25.3.2.4 Reset - الإعادة التشغيل
باختصار: هنا هتعرف طريقتين للـ reset, واحده hardware والتانيه software وهتعرف RESETDONE bit دى اللى بتقرأها علشان تعرف الـ reset تم بنجاح او لا.
#### أولاً Hardware Reset Signal:

الـ **OCP hardware Reset signal** له **global reset action** على الـ GPIO:
- **كل الـ configuration registers** بترجع لحالتها الأولى
- **كل الـ DFFs** اللي متزامنة مع الـ **Interface clock** أو **Debouncing clock** بترجع لحالتها الأولى
- **كل الـ internal state machines** بترجع لحالتها الأولى
- **الشرط**: لما الـ OCP hardware Reset يكون **active (low level)**
#### ثانياً: Software Reset:

الـ **Software Reset** (**SOFTRESET bit** في الـ **GPIO_SYSCONFIG register**):
- **التأثير**: له **نفس تأثير** الـ **OCP hardware Reset signal**
- **التحديث**: الـ **RESETDONE bit** في الـ **GPIO_SYSSTATUS** بيتحدث في **نفس الشرط**
- **الاستخدام**: بيسمحلك تعمل reset بـ software بدل hardware signal

#### ثالثاً واخيراً: RESETDONE Bit Monitoring:

الـ **RESETDONE bit** في الـ **GPIO_SYSSTATUS register**:
- **الوظيفة**: بيراقب الـ **internal reset status**
- **متى يتحط**: لما الـ **Reset يكمل على الـ OCP والـ Debouncing clock domains** سوا
- **الفايدة**: بيأكدلك إن الـ reset خلص بنجاح على كل النطاقات

### الخلاصة والأهمية
الـ **Clocking and Reset Strategy** مهم جداً لأنه:
1. **بيحدد كيفية توفير الطاقة** من خلال الـ clock gating features المختلفة
2. **بيضمن synchronization صحيحة** بين العمليات المختلفة
3. **بيوفر مرونة في التحكم** في الـ power management
4. **بيضمن reset آمن ومضمون** للـ module
5. **بيسمح بـ wake-up functionality** صحيحة
6. **بيوفر آلية موثوقة للـ sleep/wake cycles**

## 25.3.3 Interrupt and Wake-up Features

### 25.3.3.1 Functional Description
#### فهم آلية الـ Interrupt والـ Wake-up:

**الفكرة الأساسية:** بدل ما الـ processor يفضل يشيك على الـ GPIO pins باستمرار (polling)، ممكن نبرمج الـ GPIO عشان يبعت **interrupt** أو **wake-up signal** لما حاجة معينة تحصل على الـ pin.
**صهيب:** فيه حدثين مختلفين عن بعض هنا, كل واحد ليه الـ config الخاصه. حدث الـ wake-up وحدث الـ interrupt
#### شروط توليد الـ Interrupt Request:

**الخطوات المطلوبة:**

**1. تفعيل الـ Interrupts للـ GPIO Channel:**

```
GPIO_IRQSTATUS_SET_0 register  // للـ interrupt line 0
GPIO_IRQSTATUS_SET_1 register  // للـ interrupt line 1
```

**لماذا مهم؟** عشان تقدر تختار أي interrupt line هيستقبل الـ event من الـ GPIO pin ده.

**2. تحديد نوع الأحداث المطلوب كشفها:**

```
GPIO_LEVELDETECT0     // كشف المستوى المنخفض (0)
GPIO_LEVELDETECT1     // كشف المستوى المرتفع (1)  
GPIO_RISINGDETECT     // كشف الحافة الصاعدة (0→1)
GPIO_FALLINGDETECT    // كشف الحافة الهابطة (1→0)
```

#### شروط توليد الـ Wake-up Request:

**الخطوات المطلوبة:**

**1. تفعيل الـ GPIO Channel للـ Wake-up:**

```
GPIO_IRQWAKEN register  // تفعيل wake-up للـ pin المحدد
```

**2. تحديد نوع الأحداث:**

```
GPIO_RISINGDETECT     // rising transition بس
GPIO_FALLINGDETECT    // falling transition بس
```

**ملاحظة مهمة:** الـ Wake-up **بيشتغل بس مع transitions** (حواف)، **مش مع levels** (مستويات).

#### مثال عملي:

لو عايز تولد interrupt على الـ **rising والـ falling edges** على input pin رقم **k**:

```c
// تفعيل detection للحواف
GPIO_RISINGDETECT |= (1 << k);   // تفعيل rising edge detection
GPIO_FALLINGDETECT |= (1 << k);  // تفعيل falling edge detection

// تفعيل interrupt للـ pin ده على interrupt line 0
GPIO_IRQSTATUS_SET_0 |= (1 << k);
```
### رغى
**ليه مفيد؟**

- **توفير معالج**: مش محتاج polling مستمر
- **استجابة سريعة**: فوري لما الحدث يحصل
- **مرونة**: ممكن تختار أنواع أحداث مختلفة


==**تعليق على هذا القسم:**==

**الفوائد:**

- **كفاءة عالية**: النظام مش محتاج يضيع وقت في polling
- **مرونة في التحكم**: ممكن تختار أنواع أحداث مختلفة لكل pin
- **دعم مزدوج**: Interrupt للـ active mode و Wake-up للـ idle mode

**العيوب المحتملة:**

- **تعقيد البرمجة**: محتاج تكوين multiple registers صح
- **قيود الـ Wake-up**: بيشتغل بس مع transitions مش levels
- **إدارة الـ Interrupt**: محتاج تتعامل مع clearing الـ status bits بعد كل interrupt

**لزمة فهم هذا القسم:**

- أساسي لأي تطبيق يتفاعل مع external signals
- ضروري لتطبيقات الـ power management
- مهم لفهم الفرق بين synchronous و asynchronous detection
==امثله:==
##### أمثلة ومشاريع عملية على الـ GPIO Interrupt & Wake-up Features

1. **مشروع Smart Doorbell System - جرس الباب الذكي**
**القصة:** تخيل إنك بتعمل جرس باب ذكي للبيت. عندك button للجرس، motion sensor، وكاميرا. النظام محتاج يكون في وضع نوم عشان يوفر البطارية، بس يصحى فوراً لما حد يجي عند الباب.
**استخدام الـ Features:**
**Synchronous Detection (Active Mode):**
لما النظام يكون شغال، بيستخدم **synchronous detection** للـ doorbell button. ليه؟ عشان محتاج **debouncing** - الـ button الميكانيكي بيعمل "bounce" لما ينضغط، فممكن يطلع signal واحد يتقرا كأنه عدة ضغطات. الـ synchronous detection مع الـ debouncing بيحل المشكلة دي.
**Asynchronous Detection (Sleep Mode):**
لما النظام في وضع النوم، بيستخدم **asynchronous wake-up** للـ motion sensor. ليه؟ عشان لو حد قرب من الباب، النظام يصحى فوراً بدون انتظار أي clock، ويشغل الكاميرا ويسجل فيديو.
**التحدي:** الـ motion sensor بيبعت signal سريع جداً (few microseconds)، لو استخدمت synchronous detection مع clock بطيء، ممكن تفوتك الـ signal. لكن الـ asynchronous detection بيشوف أي pulse مهما كان سريع.

2. **مشروع Baby Monitor System - جهاز مراقبة الأطفال**
**القصة:** جهاز مراقبة للطفل فيه microphone sensor عشان يكشف البكاء، temperature sensor، وcamera. الجهاز لازم يشتغل على البطارية لساعات طويلة.
**استخدام الـ Features:**
الـ**Power Management Strategy:**
الجهاز معظم الوقت في **idle mode** عشان يوفر البطارية. بس محتاج يصحى فوراً لما:
- الطفل يبكي (sound detection)
- درجة الحرارة تطلع أو تنزل عن الحد المسموح
الـ**Level Detection vs Edge Detection:**
للـ **temperature sensor**: بيستخدم **level detection** عشان لو درجة الحرارة فضلت عالية، يفضل يبعت تنبيهات مستمرة.
للـ **sound sensor**: بيستخدم **edge detection** عشان يكشف بداية البكاء (transition from quiet to noise).
الـ**Latency Requirements:**
الـ sound detection محتاج **asynchronous wake-up** عشان الاستجابة تكون فورية. أما الـ temperature sensor فممكن يستخدم **synchronous detection** مع debouncing عشان يتجنب false alarms من noise.

2. **مشروع Smart Home Security System - نظام أمان المنزل الذكي**
**القصة:** نظام أمان متكامل فيه door sensors، window sensors، motion detectors، وglass break detectors في كل الشبابيك والأبواب.
**استخدام الـ Features:**
**Multiple Interrupt Lines:** كل نوع sensor له **interrupt line منفصل**:
- **Line 0**: Critical sensors (doors, windows) - أولوية عالية
- **Line 1**: Motion sensors - أولوية متوسطة
**Synchronous vs Asynchronous Detection Strategy:**

**للـ Door/Window Sensors:**
- **Active Mode**: synchronous detection مع debouncing عشان نتجنب false alarms من الهواء أو vibrations
- **Armed Mode**: asynchronous wake-up عشان أي فتح للباب/شباك يصحي النظام فوراً

**للـ Motion Sensors:**
- بيستخدم **asynchronous detection** دايماً عشان الـ motion signals سريعة جداً وممكن تفوت لو اعتمدت على clock sampling
**Glass Break Detection:**
- محتاج **extremely fast response** عشان كده بيستخدم asynchronous detection بدون debouncing
- الـ glass break بيعمل unique sound signature محتاجة capture فوري

4. **مشروع Smart Irrigation System - نظام الري الذكي**
**القصة:** نظام ري للحديقة يعتمد على soil moisture sensors، rain detection، وtimer control. النظام لازم يوفر المياه ويشتغل بكفاءة عالية.
**استخدام الـ Features:**

**Soil Moisture Monitoring:**

- **Level Detection**: لمراقبة مستوى الرطوبة باستمرار
- **Synchronous Detection**: مع sampling كل دقيقة عشان نشوف trend الرطوبة
- **Debouncing**: عشان نتجنب تأثير الـ electrical noise من الـ soil

**Rain Detection:**

- **Asynchronous Wake-up**: لو بدأ المطر، النظام يصحى فوراً ويقفل الري عشان ميضيعش مياه
- **Edge Detection**: عشان يكشف بداية ونهاية المطر

**Emergency Water Level:**

- **Level Detection مع Interrupt**: لو مستوى المياه في الخزان نزل تحت الحد الأدنى، يبعت تنبيه فوري

5. **مشروع Smart Car Parking Sensor - حساس ركن السيارة الذكي**
**القصة:** نظام ركن للسيارة فيه multiple ultrasonic sensors حوالين العربية، مع تنبيهات صوتية ومرئية للسائق.
**استخدام الـ Features:**

**Real-time Distance Monitoring:**

- **Synchronous Detection**: للـ ultrasonic sensors عشان نعمل precise timing للـ echo signals
- **High Frequency Sampling**: عشان نقيس المسافة بدقة عالية

**Emergency Obstacle Detection:**

- **Asynchronous Wake-up**: لو حاجة قريبة جداً من العربية، النظام يصحى من power saving mode ويشغل الإنذار فوراً

**Multiple Sensor Coordination:**

- كل sensor له **separate interrupt line** عشان نعرف الاتجاه بالضبط
- **Priority-based handling**: الـ sensors اللي في المقدمة والخلف لهم أولوية أعلى من الجوانب

**الفوائد العملية من فهم هذه المفاهيم:**

**1. أساسي لأي تطبيق يتفاعل مع External Signals:**

- **Smart Home**: أجهزة الاستشعار المختلفة محتاجة response types مختلفة
- **Industrial Control**: الماكينات محتاجة safety interlocks فورية
- **Medical Devices**: أجهزة المراقبة محتاجة real-time response للحالات الحرجة
**2. ضروري لتطبيقات الـ Power Management:**
- **Battery-powered Devices**: IoT sensors, wearables, remote monitoring
- **Solar-powered Systems**: weather stations, agricultural sensors
- **Mobile Applications**: smartphones, tablets بتستخدم نفس المفاهيم
**3. مهم لفهم الفرق بين Synchronous و Asynchronous Detection:**
- **Synchronous**: للـ signals اللي محتاجة processing أو filtering
- **Asynchronous**: للـ emergency signals أو fast response requirements
- **Timing-critical Applications**: real-time systems, safety systems
كل مشروع من دول بيوضح ازاي الـ GPIO interrupt و wake-up features مش مجرد تقنيات، لكن حلول عملية لمشاكل حقيقية في التصميم!

### 25.3.3.2 Synchronous Path: Interrupt Request Generation - الحدث الأول
#### Operation Mechanism in Active Mode - آلية العمل في الـ Active Mode
**الفكرة الأساسية:** في الـ **Active mode**، الـ GPIO بيعمل **sample** للـ input signals باستخدام الـ **internally gated interface clock**. يعني بيشوف الـ signal في أوقات محددة بتردد الـ clock.
#### فهم الـ Sampling Process:

**إيه اللي بيحصل:**

1. الـ **interface clock** بيعمل "tick" كل فترة زمنية معينة
2. في كل "tick"، الـ GPIO بيقرأ قيمة الـ input pin
3. بيقارن القراءة الجديدة مع القراءة اللي فاتت
4. لو لقى الحدث المطلوب (level أو transition)، بيولد interrupt

#### Timing Requirements - المتطلبات الزمنية:

**1. Minimum Pulse Width للـ Synchronous Interrupt:**

- **المطلوب**: **==ضعف== فترة الـ internally gated interface clock**
- **السبب**: عشان نضمن إن الـ signal يتقرا في sampling points مختلفة

**مثال:** لو الـ interface clock تردده 100 MHz (فترة = 10 ns):

- الـ internally gated clock ممكن يكون أبطأ (مثلاً 25 MHz، فترة = 40 ns)
- الـ minimum pulse width = 2 × 40 ns = **80 ns**

**2. Level Detection Requirements:**

- **المطلوب**: المستوى المختار لازم يكون **stable** لمدة **ضعف فترة الـ internally gated interface clock** على الأقل
- **السبب**: عشان نتأكد إن مش مجرد noise أو glitch

#### فهم الـ Latency - زمن التأخير:

**1. بدون Debouncing:**

- **الزمن**: مش أكتر من **3 internally gated interface clock cycles + 2 interface clock cycles**
- **السبب**:
    - 3 cycles للـ detection والـ synchronization
    - 2 cycles للـ interrupt generation

**2. مع Debouncing:**

- **الزمن الإضافي**:
    - نفس الـ latency السابقة
    - **+ GPIO_DEBOUNCINGTIME value** (بوحدة debouncing clock cycles)
    - **+ 3 debouncing clock cycles** (للـ synchronization)

**مثال على الـ Latency:**

```
Interface clock = 100 MHz (10 ns period)
Internally gated clock = 25 MHz (40 ns period)  
Debouncing clock = 32.768 KHz (30.5 μs period)
GPIO_DEBOUNCINGTIME = 10

بدون debouncing:
Latency = (3 × 40 ns) + (2 × 10 ns) = 120 + 20 = 140 ns

مع debouncing:
Latency = 140 ns + (10 × 30.5 μs) + (3 × 30.5 μs) 
        = 140 ns + 305 μs + 91.5 μs = ~396.5 μs
```


**تعليق على هذا القسم:**

**الفوائد:**

- **دقة محددة**: الـ timing requirements واضحة ومحددة
- **مرونة**: ممكن تحدد الـ debouncing time حسب احتياجك
- **موثوقية**: الـ synchronous detection بيضمن عدم فقدان events مهمة

**العيوب:**

- **قيود الـ Pulse Width**: Signals أقل من minimum width مش هتتكشف
- **Latency عالية مع Debouncing**: الـ debouncing ممكن يأخر الاستجابة بشكل كبير
- **اعتماد على Clock**: لو الـ clock بطيء، الـ detection هيكون أبطأ

**لزمة فهم هذا القسم:**

- **تصميم Hardware Interface**: لضمان إن الـ signals متوافقة مع timing requirements
- **اختيار Clock Frequency**: توازن بين power consumption و response time
- **تحديد Debouncing Parameters**: حسب نوعية الـ input signals المتوقعة

### 25.3.3.3 Asynchronous Path: Wake-up Request Generation - الحدث الثانى

#### آلية العمل في الـ Idle Mode:

**الفكرة الأساسية:** في الـ **Idle mode**، الـ **interface clock مقفول** (عشان توفير الطاقة)، بس الـ GPIO لسه قادر يكشف **transitions** على الـ input pins ويولد **wake-up request** عشان يصحي النظام.

#### المقارنة مع الـ Synchronous Path: ⭐

|الخاصية|Synchronous Path|Asynchronous Path|
|---|---|---|
|**Clock Status**|Interface clock شغال|Interface clock مقفول|
|**Detection Type**|Levels + Transitions|Transitions بس|
|**Purpose**|Interrupt generation|Wake-up generation|
|**Mode**|Active mode|Idle mode|

#### فهم الـ Wake-up Configuration:

**الشروط المطلوبة:**

1. **GPIO configuration registers متبرمجة مسبقاً** (قبل دخول Idle mode)
2. **تفعيل الـ expected transitions**:
    
    ```
    GPIO_RISINGDETECT   // للـ rising edge detectionGPIO_FALLINGDETECT  // للـ falling edge detection
    ```
    
3. **تفعيل wake-up للـ pin المحدد**:
    
    ```
    GPIO_IRQWAKEN register
    ```
    

#### خصائص مهمة للـ Wake-up Line:

**Wake-up Line واحد بس:**

- **السبب**: كل الـ **wake-up sources مدمجة مع بعض** (merged together)
- **المعنى**: مش ممكن تعرف أي pin بالضبط اللي ولد الـ wake-up بدون قراءة الـ status registers
- **الفائدة**: تبسيط الـ hardware design

#### Pulse Width Requirements:

**1. بدون Debouncing:**

- **المطلوب**: **مفيش minimum input pulse width**
- **السبب**: **مفيش sampling operation** (asynchronous detection)
- **المعنى**: أي pulse مهما كان سريع ممكن يولد wake-up

**2. مع Debouncing:**

- **المطلوب**: **minimum pulse width محدد بالـ debouncing specified time**
- **السبب**: الـ debouncing filter بيحتاج وقت كافي عشان يأكد إن الـ signal مش noise

#### فهم الـ Wake-up Enable Control:

**ENAWAKEUP Bit في GPIO_SYSCONFIG:**

- **الوظيفة**: **global enable/disable** للـ GPIO wake-up feature
- **لو ENAWAKEUP = 0**: الـ **GPIO_IRQWAKEN مالوش تأثير خالص**
- **لو ENAWAKEUP = 1**: الـ GPIO_IRQWAKEN بيشتغل عادي

**مثال على الـ Configuration:**

```c
// تفعيل wake-up globally
GPIO_SYSCONFIG |= ENAWAKEUP_BIT;

// تفعيل wake-up للـ pin 5 على rising edge
GPIO_RISINGDETECT |= (1 << 5);
GPIO_IRQWAKEN |= (1 << 5);
```

**تعليق على هذا القسم:**

**الفوائد:**

- **توفير طاقة ممتاز**: Interface clock مقفول في Idle mode
- **استجابة فورية**: Asynchronous detection مش محتاج clock
- **بساطة التصميم**: Wake-up line واحد لكل الـ sources
- **مرونة في الـ Pulse Width**: بدون debouncing، أي pulse يقدر يصحي النظام

**العيوب:**

- **Transitions بس**: مش ممكن wake-up على levels
- **صعوبة تحديد المصدر**: مش ممكن تعرف أي pin ولد الـ wake-up بدون قراءة registers
- **إعداد مسبق مطلوب**: لازم تكوين كل حاجة قبل دخول Idle mode
- **تحكم محدود في Real-time**: مش ممكن تغير configuration في Idle mode

**لزمة فهم هذا القسم:**

- **Power Management**: أساسي لتصميم أنظمة موفرة للطاقة
- **Real-time Systems**: مهم للتطبيقات اللي محتاجة wake-up سريع
- **Battery-powered Devices**: ضروري للأجهزة اللي تشتغل بالبطارية

---

### 25.3.3.4 Interrupt (or Wake-up) Line Release - تحرير خط المقاطعة (أو الإيقاظ)
#### فهم آلية Interrupt Handling:

**المشكلة الأساسية:** لما يحصل interrupt، الـ interrupt line بيفضل **active** لحد ما الـ software يعمل **acknowledge** للـ interrupt ويمسح الـ status bit. لو ده محصلش، الـ interrupt هيفضل pending.

#### خطوات التعامل مع الـ Interrupt:

**1. استقبال الـ Interrupt:**

```c
// الـ processor يستقبل interrupt request من GPIO module
// ده بيحصل automatically لما الـ hardware event يحصل
```

**2. تحديد مصدر الـ Interrupt:**

```c
// قراءة الـ status register عشان نعرف أي pin ولد الـ interrupt
uint32_t status_line0 = GPIO_IRQSTATUS_0;  // للـ interrupt line 0
uint32_t status_line1 = GPIO_IRQSTATUS_1;  // للـ interrupt line 1

// مثال: لو bit 5 مضبوط، يبقى pin 5 ولد interrupt
if (status_line0 & (1 << 5)) {
    // GPIO pin 5 generated interrupt
}
```

**3. خدمة الـ Interrupt:**

```c
// هنا بنعمل اللي المفروض نعمله كرد فعل للـ interrupt
// مثال: قراءة sensor، تغيير LED، إرسال message، etc.
handle_gpio_interrupt(pin_number);
```

**4. مسح الـ Status Bit (Critical Step):**

```c
// لازم نكتب 1 في الـ bit المقابل عشان نمسحه
GPIO_IRQSTATUS_0 = (1 << 5);  // مسح interrupt status لـ pin 5
// أو
GPIO_IRQSTATUS_CLR_0 = (1 << 5);  // باستخدام clear register
```

#### فهم الـ Pending Interrupt Mechanism:

**Raw Status vs Masked Status:**

- **GPIO_IRQSTATUS_RAW_n**: بيراقب الـ events اللي حصلت فعلاً (قبل الـ masking)
- **GPIO_IRQSTATUS_SET_n**: بيفعل أو يمنع الـ interrupts للـ pins المحددة (mask)
- **GPIO_IRQSTATUS_CLR_n**: بيمسح الـ interrupt enables

**شروط إعادة تفعيل الـ Interrupt Line:** الـ interrupt line هيتفعل تاني لو:

1. فيه **active bits** في **GPIO_IRQSTATUS_RAW_n**
2. الـ bits دي **مش masked** بواسطة **GPIO_IRQSTATUS_SET_n**
3. الـ bits دي **مش cleared** بواسطة **GPIO_IRQSTATUS_CLR_n**

#### مثال عملي على Interrupt Handling:

```c
void gpio_interrupt_handler(void) {
    uint32_t status;
    int pin;
    
    // قراءة status للـ interrupt line 0
    status = GPIO_IRQSTATUS_0;
    
    // معالجة كل pin اللي ولد interrupt
    for (pin = 0; pin < 32; pin++) {
        if (status & (1 << pin)) {
            // خدمة الـ interrupt للـ pin ده
            switch (pin) {
                case BUTTON_PIN:
                    handle_button_press();
                    break;
                case SENSOR_PIN:
                    handle_sensor_data();
                    break;
                // ... cases أخرى
            }
            
            // مسح الـ status bit (مهم جداً!)
            GPIO_IRQSTATUS_0 = (1 << pin);
        }
    }
}
```

#### التعامل مع Wake-up Requests:

**الـ Wake-up Process:**

1. **النظام يصحى**: الـ Idle Request signal بيروح inactive
2. **تأكيد الـ Wake-up**: الـ processor يأكد استقبال الـ wake-up request
3. **إلغاء الـ Signals**: الـ Idle acknowledge و wake-up request signals بيتألغوا فوراً
4. **Reflection في Status Registers**: الـ asynchronous wake-up request (لو موجود) بينعكس في الـ synchronous interrupt status registers

**مثال على Wake-up Handling:**

```c
void system_wake_up_handler(void) {
    // النظام صحي من sleep mode
    
    // إعادة تشغيل الـ clocks
    enable_interface_clocks();
    
    // قراءة الـ interrupt status عشان نعرف سبب الـ wake-up
    uint32_t wakeup_status = GPIO_IRQSTATUS_0;
    
    // معالجة الـ wake-up event
    handle_wakeup_events(wakeup_status);
    
    // مسح الـ status bits
    GPIO_IRQSTATUS_0 = wakeup_status;
}
```

**تعليق على هذا القسم:**

**الفوائد:**

- **تحديد دقيق للمصدر**: ممكن تعرف بالضبط أي pin ولد الـ interrupt
- **معالجة متقدمة**: ممكن تعامل multiple interrupts في نفس الوقت
- **مرونة في الاستجابة**: كل pin ممكن يكون له handling مختلف
- **منع Interrupt Loss**: الـ pending mechanism بيضمن عدم فقدان events

**العيوب:**

- **تعقيد البرمجة**: محتاج تتعامل مع multiple registers وstatus bits
- **مسؤولية Software**: لو نسيت تمسح status bit، الـ interrupt هيفضل pending
- **Latency محتملة**: لو الـ handler بطيء، ممكن تفوت events تانية
- **Race Conditions**: ممكن يحصل conflicts لو multiple interrupts جت في نفس الوقت

**لزمة فهم هذا القسم:**

- **Real-time Response**: ضروري للتطبيقات اللي محتاجة استجابة سريعة
- **System Reliability**: منع hang أو freeze بسبب pending interrupts
- **Multi-tasking Systems**: أساسي لأنظمة تتعامل مع multiple inputs
- **Debugging**: فهم آلية الـ interrupt handling بيساعد في troubleshooting

**الخلاصة العامة للـ Interrupt and Wake-up Features:**

هذا النظام بيوفر آلية متطورة جداً للتفاعل مع external events، مع إمكانيات power management ممتازة. الـ synchronous path مناسب للـ active operation، والـ asynchronous path مناسب للـ power-saving modes. فهم الفروق دي وإزاي تستخدم كل واحد صح هو مفتاح تصميم نظام فعال.

___
____
____
____
_____
# 25.3.4: General-Purpose Interface Basic Programming Model

## 25.3.4.1 Power Saving by Grouping the Edge/Level Detection

### فهم المشكلة الأساسية
#### ليه نحتاج Power Saving؟
**المشكلة:** الـ GPIO module فيه **edge/level detection logic** محتاج **clocks** للتشغيل. لو كل الـ 32 pins تشتغل نفس الوقت، هيكون فيه استهلاك طاقة عالي حتى لو مش كلها مستخدمة.
**الحل:** تقسيم الـ 32 pins إلى **4 groups** كل group فيه **8 pins**، وكل group له **clock منفصل** يقدر يتقفل لو مش مستخدم.

```
32 GPIO Pins Division:
Group 0: Pins [7:0]   ──> Clock Enable Signal 0
Group 1: Pins [15:8]  ──> Clock Enable Signal 1  
Group 2: Pins [23:16] ──> Clock Enable Signal 2
Group 3: Pins [31:24] ──> Clock Enable Signal 3
```
#### Clock Enable Logic:
**كل group له bit واحده, لو شغاله الساعه هتشتغل لـ 8 pins مره واحده:**
```
For Group N (8 pins):
GPIO_LEVELDETECT0[group_bits] ───┐
GPIO_LEVELDETECT1[group_bits] ───┤
.                                |──> Clock Enable N
GPIO_RISINGDETECT[group_bits] ───|
GPIO_FALLINGDETECT[group_bits] ──┘

If ANY bit set in ANY register for this group ──> Clock ON
If ALL bits clear in ALL registers for this group ──> Clock OFF (Power Saved)
```
- **أي bit مضبوط** في أي من الـ 4 registers للـ group ده = Clock شغال
- **كل الـ bits فاضية** في كل الـ 4 registers للـ group ده = Clock مقفول
### تأثير تغيير الإعدادات - Detection Pipeline Cleaning
**المشكلة:** لما تغير الـ detection settings، فيه **synchronization pipeline** جوه الـ GPIO logic محتاج **"cleaning"** عشان يشتغل صح.
**الحل - 5 Clock Cycles Requirement:**

الصوره دى بتوضح الوضع الحالى وليه فيه مشكله:
```
Pipeline Stages Analysis:
Stage 1: [Input Sampling] ──→ Stage 2: [Edge Detection] ──→ 
Stage 3: [Level Detection] ──→ Stage 4: [Event Combination] ──→ 
Stage 5: [Output Generation]

When Settings Change:
T0: Write new settings ──→ [Pipeline has old data]
T1-T5: Pipeline cleaning ──→ [Old data shifts out]
T6: Clean detection ──→ [Reliable results start]
```

**الطريقة الصحيحة لتغيير الاعدادات:**
```
Recommended Sequence:
1. Set new detection required ──→ [Enable new functionality]
2. Keep clock running ──→ [Don't disable old settings yet]
3. Wait 5 clock cycles ──→ [Pipeline cleans automatically]  
4. Disable previous setting ──→ [Remove unneeded detection]

Advantage: Immediate detection start (no 5-cycle delay)
```

**الطريقة الخاطئة:**

```
Wrong Sequence:
1. Disable old detection ──→ [Clock might be gated]
2. Enable new detection ──→ [Clock starts, pipeline dirty]
3. Wait 5 clock cycles ──→ [Required cleaning delay]

Disadvantage: 5-cycle delay before reliable detection
```

**Clock Gating Impact:**

```
Independent Clock Groups Benefit:
If Group Requires No Detection ──→ Clock Gated Immediately
If Group Requires Detection ──→ Clock Active for Reliable Operation

Granular Control:
- مش محتاج تشغل كل الـ module عشان group واحد
- كل group مستقل في قرار الـ power management
```

### الآثار العملية على التصميم - Design Strategy Implications

**Pin Allocation Planning:**
```
Smart Pin Grouping:
Group 0 [7:0]: Critical/High-Speed Signals
Group 1 [15:8]: Moderate-Speed Control Signals  
Group 2 [23:16]: Low-Speed Status Signals
Group 3 [31:24]: Spare/Future Expansion

Benefit: Keep critical signals in active groups
        Unused groups automatically save power
```

**Power Management Benefits:**
```
Scenario Analysis:
├── All pins active ──→ 0% power savings
├── 3 groups active ──→ 25% power savings
├── 2 groups active ──→ 50% power savings  
├── 1 group active ──→ 75% power savings
└── No groups active ──→ 100% power savings (module idle)
```

**Real-World Application:**
```
Typical Embedded System:
- قليل من الـ pins محتاجة high-speed detection
- معظم الـ pins محتاجة occasional monitoring  
- بعض الـ pins مش مستخدمة خالص

Result: Significant power savings in real applications
        without performance compromise
```


---

### الخلاصة التقنية

**بالعربي المصري:**

هذا النظام بيحقق **توازن مثالي** بين:

**الأداء (Performance):**

- الـ **Reliable detection** لكل الـ pins المفعلة
- الـ**5-cycle pipeline** بيضمن accurate results
- الـ**Independent group control** مابيأثرش على بعض

**توفير الطاقة (Power Efficiency):**
- الـ**Up to 75% power savings** في الحالات المثلى
- الـ**Automatic clock gating** للـ groups غير المستخدمة
- الـ**Granular control** بدل module-wide control

**سهولة الاستخدام (Usability):**
- الـ**Transparent operation** - المطور مايحتاجش يتدخل
- الـ**Automatic optimization** حسب الاستخدام الفعلي
- الـ**No performance penalty** للـ active groups
## 25.3.4.2 Set and Clear Instructions

### المفهوم الأساسي

وحدة **GPIO** تنفذ **set-and-clear protocol register update** للـ **data output** و **interrupt enable** و **wake-up enable registers**. هذا البروتوكول هو بديل لعمليات **atomic test and set** ويتكون من عمليات كتابة في عناوين مخصصة (عنوان واحد لتعيين البت(ات) وعنوان آخر لمسح البت(ات)).

### طرق الوصول للـ Registers

يمكن الوصول للـ Registers بطريقتين:

#### الطريقة المعيارية (Standard)

عمليات قراءة وكتابة كاملة للـ register في العنوان الأساسي للـ register.

#### طريقة Set and Clear (الموصى بها)

عناوين منفصلة مُقدمة لتعيين (ومسح) البتات في الـ registers. الكتابة بـ 1 في هذه العناوين تعيّن (أو تمسح) البت المقابل في الـ register المكافئ؛ الكتابة بـ 0 ليس لها تأثير.
صهيب: يعنى فيه عنوان انت بتكتب فيه, وفيه عنوان تانى بيتأثر بكتابتك. (مش متأكد)
### آلية العمل

البيانات المُراد كتابتها هي 1 في موضع(مواضع) البت المُراد مسحه (أو تعيينه) و 0 في البتات غير المتأثرة.

لذلك، لهذه الـ registers، يتم تعريف ثلاثة عناوين لـ register فيزيائي واحد فريد. قراءة هذه العناوين لها نفس التأثير وترجع قيمة الـ register.

---

## 25.3.4.2.1 Clear Instruction - تعليمات المسح

### 25.3.4.2.1.1 Clear Interrupt Enable Registers (GPIO_IRQSTATUS_CLR_0 and GPIO_IRQSTATUS_CLR_1)

#### عملية الكتابة

عملية كتابة في **clear interrupt enable1** (أو **enable2**) register تمسح البت المقابل في **interrupt enable1** (أو **enable2**) register عندما يكون البت المكتوب 1؛ البت المكتوب بـ 0 ليس له تأثير.

#### عملية القراءة

قراءة **clear interrupt enable1** (أو **enable2**) register ترجع قيمة **interrupt enable1** (أو **enable2**) register.

### 25.3.4.2.1.2 Clear Wake-up Enable Register (GPIO_CLEARWKUENA)

#### عملية الكتابة

عملية كتابة في **clear wake-up enable register** تمسح البت المقابل في **wake-up enable register** عندما يكون البت المكتوب 1؛ البت المكتوب بـ 0 ليس له تأثير.

#### عملية القراءة

قراءة **clear wake-up enable register** ترجع قيمة **wake-up enable register**.

### 25.3.4.2.1.3 Clear Data Output Register (GPIO_CLEARDATAOUT)

#### عملية الكتابة

عملية كتابة في **clear data output register** تمسح البت المقابل في **data output register** عندما يكون البت المكتوب 1؛ البت المكتوب بـ 0 ليس له تأثير.

#### عملية القراءة

قراءة **clear data output register** ترجع قيمة **data output register**.

### 25.3.4.2.1.4 Clear Instruction Example - مثال على تعليمة المسح

#### الحالة الابتدائية

افترض أن **data output register** (أو أحد **interrupt/wake-up enable registers**) يحتوي على القيمة الثنائية `0000 0001 0000 0001h`، وتريد مسح البت 0.

#### التنفيذ

مع ميزة **clear instruction**، اكتب `0000 0000 0000 0001h` في عنوان **clear data output register** (أو في عنوان **clear interrupt/wake-up enable register**).

#### النتيجة

بعد عملية الكتابة هذه، قراءة **data output register** (أو **interrupt/wake-up enable register**) ترجع `0000 0001 0000 0000h`؛ البت 0 تم مسحه.

#### ملاحظة التمثيل

رغم أن **general-purpose interface registers** عرضها 32 بت، فقط الـ 16 بت الأقل أهمية ممثلة في هذا المثال.

---

## 25.3.4.2.2 Set Instruction - تعليمات التعيين

### 25.3.4.2.2.1 Set Interrupt Enable Registers (GPIO_IRQSTATUS_SET_0 and GPIO_IRQSTATUS_SET_1)

#### عملية الكتابة

عملية كتابة في **set interrupt enable1** (أو **enable2**) register تعيّن البت المقابل في **interrupt enable1** (أو **enable2**) register عندما يكون البت المكتوب 1؛ البت المكتوب بـ 0 ليس له تأثير.

#### عملية القراءة

قراءة **set interrupt enable1** (أو **enable2**) register ترجع قيمة **interrupt enable1** (أو **enable2**) register.

### 25.3.4.2.2.2 Set Wake-up Enable Register (GPIO_SETWKUENA)

#### عملية الكتابة

عملية كتابة في **set wake-up enable register** تعيّن البت المقابل في **wake-up enable register** عندما يكون البت المكتوب 1؛ البت المكتوب بـ 0 ليس له تأثير.

#### عملية القراءة

قراءة **set wake-up enable register** ترجع قيمة **wake-up enable register**.

### 25.3.4.2.2.3 Set Data Output Register (GPIO_SETDATAOUT)

#### عملية الكتابة

عملية كتابة في **set data output register** تعيّن البت المقابل في **data output register** عندما يكون البت المكتوب 1؛ البت المكتوب بـ 0 ليس له تأثير.

#### عملية القراءة

قراءة **set data output register** ترجع قيمة **data output register**.

### 25.3.4.2.2.4 Set Instruction Example - مثال على تعليمة التعيين

#### الحالة الابتدائية

افترض أن **interrupt enable1** (أو **enable2**) register (أو **data output register**) يحتوي على القيمة الثنائية `0000 0001 0000 0000h`، وتريد تعيين البتات 15، 3، 2، و 1.

#### التنفيذ

مع ميزة **set instruction**، اكتب `1000 0000 0000 1110h` في عنوان **set interrupt enable1** (أو **enable2**) register (أو في عنوان **set data output register**).

#### النتيجة

بعد عملية الكتابة هذه، قراءة **interrupt enable1** (أو **enable2**) register (أو **data output register**) ترجع `1000 0001 0000 1110h`؛ البتات 15، 3، 2، و 1 تم تعيينها.

#### ملاحظة التمثيل

رغم أن **general-purpose interface registers** عرضها 32 بت، فقط الـ 16 بت الأقل أهمية ممثلة في هذا المثال.

---

## الخلاصة التقنية

هذا القسم يوضح نموذجين أساسيين لبرمجة **GPIO interface**:

1. **نموذج توفير الطاقة**: من خلال تجميع **edge/level detection** في مجموعات من 8 بتات، مما يسمح بإغلاق الساعات للمجموعات غير المستخدمة.
    
2. **نموذج Set/Clear**: بروتوكول آمن للتعامل مع الـ registers يتجنب مشاكل **race conditions** من خلال توفير عناوين منفصلة للتعيين والمسح بدلاً من عمليات **read-modify-write** التقليدية.
    

كلا النموذجين يهدفان إلى تحسين الأداء وتوفير الطاقة والموثوقية في التشغيل.

____
_____
# 25.3.4.1: Power Saving by Grouping the Edge/Level Detection

## البنية الأساسية للتجميع

### تنظيم الـ Gated Clocks

كل **GPIO module** ينفذ أربعة **gated clocks** مُستخدمة بواسطة منطق **edge/level detection** لتوفير الطاقة. هذا التصميم يعني أن الوحدة تحتوي على أربع مجموعات منفصلة من الساعات، كل مجموعة مسؤولة عن التحكم في جزء محدد من الـ **GPIO pins**.

### آلية التجميع في مجموعات الثمانية

كل مجموعة من ثمانية **input GPIO pins** تولد **separate enable signal** اعتماداً على إعداد **edge/level detection register**. هذا التنظيم يأتي من حقيقة أن المدخل عبارة عن 32 بت، لذلك يتم تعريف أربع مجموعات من ثمانية مدخلات لكل **GPIO module**:

- **المجموعة الأولى**: البتات 0-7
- **المجموعة الثانية**: البتات 8-15
- **المجموعة الثالثة**: البتات 16-23
- **المجموعة الرابعة**: البتات 24-31

### مبدأ توفير الطاقة

إذا كانت مجموعة لا تتطلب **edge/level detection**، فإن الساعة المقابلة يتم **gating** (قطعها). هذا المبدأ يسمح بتوفير استهلاك الطاقة بشكل ديناميكي حسب الاستخدام الفعلي للـ **GPIO pins**.

## تحليل السيناريوهات العملية

### الـ Registers المؤثرة

تجميع **edge/level enable** يعتمد على إعداد أي من الـ registers التالية:

- **GPIO_LEVELDETECT0**: للكشف عن المستوى المنخفض (0)
- **GPIO_LEVELDETECT1**: للكشف عن المستوى العالي (1)
- **GPIO_RISINGDETECT**: للكشف عن الحافة الصاعدة (0→1)
- **GPIO_FALLINGDETECT**: للكشف عن الحافة الهابطة (1→0)

### السيناريو الأول: استهلاك الطاقة العالي

#### القيمة: `0101 0101h`

عندما يتم تعيين أي من الـ registers أعلاه إلى `0101 0101h`، فإن جميع الساعات تكون نشطة.

#### التحليل البتّي:

- **التمثيل الثنائي**: `00000101 00000101 00000101 00000101`
- **البتات المفعلة**: 0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30

#### توزيع المجموعات:

- **المجموعة الأولى (0-7)**: البتات 0, 2, 4, 6 مفعلة → الساعة نشطة
- **المجموعة الثانية (8-15)**: البتات 8, 10, 12, 14 مفعلة → الساعة نشطة
- **المجموعة الثالثة (16-23)**: البتات 16, 18, 20, 22 مفعلة → الساعة نشطة
- **المجموعة الرابعة (24-31)**: البتات 24, 26, 28, 30 مفعلة → الساعة نشطة

#### النتيجة:

استهلاك الطاقة مرتفع لأن جميع الساعات الأربع نشطة.

### السيناريو الثاني: استهلاك الطاقة المنخفض

#### القيمة: `0000 00FFh`

عندما يتم تعيين أي من الـ registers إلى `0000 00FFh`، فإن ساعة واحدة فقط تكون نشطة.

#### التحليل البتّي:

- **التمثيل الثنائي**: `00000000 00000000 00000000 11111111`
- **البتات المفعلة**: 0, 1, 2, 3, 4, 5, 6, 7

#### توزيع المجموعات:

- **المجموعة الأولى (0-7)**: جميع البتات مفعلة → الساعة نشطة
- **المجموعة الثانية (8-15)**: لا توجد بتات مفعلة → الساعة مقطوعة (**gated**)
- **المجموعة الثالثة (16-23)**: لا توجد بتات مفعلة → الساعة مقطوعة (**gated**)
- **المجموعة الرابعة (24-31)**: لا توجد بتات مفعلة → الساعة مقطوعة (**gated**)

#### النتيجة:

ساعة واحدة فقط نشطة، مما يؤدي إلى توفير كبير في الطاقة.

## التوقيت وبدء الكشف

### فترة التأخير المطلوبة

عندما يتم تمكين الساعات بالكتابة إلى أي من الـ registers التالية:

- **GPIO_LEVELDETECT0**
- **GPIO_LEVELDETECT1**
- **GPIO_RISINGDETECT**
- **GPIO_FALLINGDETECT**

فإن الكشف يبدأ بعد **5 clock cycles**.

### سبب فترة التأخير

هذه الفترة مطلوبة لتنظيف **synchronization edge/level detection pipeline**. الـ **pipeline** هو سلسلة من المراحل التي تمر بها الإشارة قبل أن يتم كشفها بشكل صحيح:

1. **مرحلة أخذ العينات** (**Sampling Stage**)
2. **مرحلة التزامن** (**Synchronization Stage**)
3. **مرحلة المقارنة** (**Comparison Stage**)
4. **مرحلة توليد الحدث** (**Event Generation Stage**)
5. **مرحلة التأكيد** (**Confirmation Stage**)

### أهمية التنظيف

تنظيف الـ **pipeline** ضروري لضمان:

- عدم وجود **false detections** من البيانات القديمة
- دقة الكشف منذ اللحظة الأولى لتفعيل الكشف
- استقرار النظام وموثوقية العمل

## الاستقلالية والتحسين

### استقلالية كل مجموعة ساعة

الآلية مستقلة لكل **clock group**. هذا يعني أن كل مجموعة من الثمانية بتات تُدار بشكل منفصل تماماً عن المجموعات الأخرى. لا يوجد تداخل أو تأثير متبادل بين المجموعات.

### استراتيجية التحسين المُوصى بها

إذا تم تشغيل الساعة من قبل قبل تنفيذ إعداد جديد، فإن ما يُوصى به هو:

#### الخطوة الأولى: التعيين

تعيين الكشف الجديد المطلوب في الـ register المناسب.

#### الخطوة الثانية: التعطيل

تعطيل الإعداد السابق (إذا لزم الأمر) في نفس الـ register أو register آخر.

### فائدة هذه الاستراتيجية

بهذه الطريقة، الساعة المقابلة لا يتم **gating** والكشف يبدأ فوراً دون الحاجة إلى انتظار دورة التنظيف التي تستغرق 5 دورات ساعة.

## التأثير على الأداء

### تحسين استهلاك الطاقة

هذا النهج يحقق توفيراً كبيراً في الطاقة لأن:

- الساعات المُعطلة لا تستهلك طاقة ديناميكية
- منطق الكشف المُعطل لا يقوم بعمليات غير ضرورية
- الانتقال بين حالات التشغيل والإيقاف سريع وفعال

### مرونة التشغيل

النظام يوفر مرونة كاملة في:

- تفعيل مجموعات محددة فقط حسب الحاجة
- تغيير التكوين ديناميكياً أثناء التشغيل
- التحكم الدقيق في استهلاك الطاقة على مستوى المجموعة

### الكفاءة في التصميم

التصميم يحقق توازناً مثالياً بين:

- **الأداء**: عدم التأثير على سرعة الكشف للمجموعات النشطة
- **الطاقة**: توفير كبير عند عدم استخدام مجموعات معينة
- **المرونة**: القدرة على التحكم الدقيق في كل مجموعة على حدة

هذا التصميم يعكس فهماً عميقاً لمتطلبات الأنظمة المدمجة التي تحتاج إلى توازن دقيق بين الأداء واستهلاك الطاقة.

# 25.3.4.2: Set and Clear Instructions

## المفهوم الأساسي للـ Set-and-Clear Protocol

### طبيعة البروتوكول

وحدة **GPIO** تنفذ **set-and-clear protocol register update** للـ **data output** و **interrupt enable** و **wake-up enable registers**. هذا البروتوكول يشكل بديلاً للعمليات **atomic test and set operations**.

### تعريف البروتوكول

البروتوكول يتكون من عمليات كتابة في عناوين مخصصة:

- **عنوان واحد** لتعيين البت(ات) (**setting bit(s)**)
- **عنوان آخر** لمسح البت(ات) (**clearing bit(s)**)

### آلية البيانات

البيانات المُراد كتابتها تتكون من:

- **1** في موضع(مواضع) البت المُراد مسحه (أو تعيينه)
- **0** في البتات غير المتأثرة (**unaffected bit(s)**)

## طرق الوصول للـ Registers

### الطريقة المعيارية (Standard)

عمليات قراءة وكتابة كاملة للـ register في **primary register address** (العنوان الأساسي للـ register).

#### خصائص الطريقة المعيارية:

- **القراءة**: ترجع القيمة الكاملة للـ register
- **الكتابة**: تستبدل القيمة الكاملة للـ register
- **التعقيد**: تتطلب عمليات **read-modify-write** للتعديل الجزئي

### طريقة Set and Clear (الموصى بها)

عناوين منفصلة مُقدمة لتعيين (**set**) ومسح (**clear**) البتات في الـ registers.

#### خصائص طريقة Set and Clear:

- **الكتابة بـ 1**: تعيّن (أو تمسح) البت المقابل في الـ register المكافئ
- **الكتابة بـ 0**: ليس لها تأثير (**no effect**)
- **الأمان**: تتجنب مشاكل **race conditions**

## بنية العناوين

### التنظيم الثلاثي للعناوين

لهذه الـ registers، يتم تعريف **ثلاثة عناوين** لـ **register فيزيائي واحد فريد**:

1. **العنوان الأساسي** (**Primary Address**): للعمليات المعيارية
2. **عنوان الـ Set** (**Set Address**): لتعيين البتات
3. **عنوان الـ Clear** (**Clear Address**): لمسح البتات

### سلوك القراءة الموحد

قراءة هذه العناوين الثلاثة لها **نفس التأثير** وترجع **قيمة الـ register** نفسها. الاختلاف فقط في سلوك الكتابة.

---

## 25.3.4.2.1 Clear Instruction - تعليمات المسح

### 25.3.4.2.1.1 Clear Interrupt Enable Registers

#### الـ Registers المتأثرة:

- **GPIO_IRQSTATUS_CLR_0**
- **GPIO_IRQSTATUS_CLR_1**

#### عملية الكتابة (Write Operation):

عملية كتابة في **clear interrupt enable1** (أو **enable2**) register تؤدي إلى:

- **مسح البت المقابل** في **interrupt enable1** (أو **enable2**) register عندما يكون **البت المكتوب = 1**
- **عدم التأثير** عندما يكون **البت المكتوب = 0**

#### عملية القراءة (Read Operation):

قراءة **clear interrupt enable1** (أو **enable2**) register ترجع **قيمة** **interrupt enable1** (أو **enable2**) register.

### 25.3.4.2.1.2 Clear Wake-up Enable Register

#### الـ Register المتأثر:

- **GPIO_CLEARWKUENA**

#### عملية الكتابة (Write Operation):

عملية كتابة في **clear wake-up enable register** تؤدي إلى:

- **مسح البت المقابل** في **wake-up enable register** عندما يكون **البت المكتوب = 1**
- **عدم التأثير** عندما يكون **البت المكتوب = 0**

#### عملية القراءة (Read Operation):

قراءة **clear wake-up enable register** ترجع **قيمة** **wake-up enable register**.

### 25.3.4.2.1.3 Clear Data Output Register

#### الـ Register المتأثر:

- **GPIO_CLEARDATAOUT**

#### عملية الكتابة (Write Operation):

عملية كتابة في **clear data output register** تؤدي إلى:

- **مسح البت المقابل** في **data output register** عندما يكون **البت المكتوب = 1**
- **عدم التأثير** عندما يكون **البت المكتوب = 0**

#### عملية القراءة (Read Operation):

قراءة **clear data output register** ترجع **قيمة** **data output register**.

### 25.3.4.2.1.4 Clear Instruction Example

#### الحالة الابتدائية (Initial State):

افترض أن **data output register** (أو أحد **interrupt/wake-up enable registers**) يحتوي على القيمة الثنائية:

```
0000 0001 0000 0001h
```

#### الهدف (Objective):

مسح **البت 0**.

#### التنفيذ (Execution):

مع ميزة **clear instruction**، اكتب القيمة التالية:

```
0000 0000 0000 0001h
```

في عنوان **clear data output register** (أو في عنوان **clear interrupt/wake-up enable register**).

#### تحليل القيمة المكتوبة:

- **البت 0**: قيمته 1 → سيتم مسح البت 0 في الـ register الأساسي
- **البتات الأخرى**: قيمتها 0 → لن تتأثر

#### النتيجة (Result):

بعد عملية الكتابة هذه، قراءة **data output register** (أو **interrupt/wake-up enable register**) ترجع:

```
0000 0001 0000 0000h
```

#### التحليل:

- **البت 0**: تم مسحه من 1 إلى 0
- **البت 16**: بقي كما هو (1)
- **باقي البتات**: بقيت كما هي (0)

#### ملاحظة التمثيل:

رغم أن **general-purpose interface registers** عرضها **32 بت**، فقط الـ **16 بت الأقل أهمية** ممثلة في هذا المثال.

---

## 25.3.4.2.2 Set Instruction - تعليمات التعيين

### 25.3.4.2.2.1 Set Interrupt Enable Registers

#### الـ Registers المتأثرة:

- **GPIO_IRQSTATUS_SET_0**
- **GPIO_IRQSTATUS_SET_1**

#### عملية الكتابة (Write Operation):

عملية كتابة في **set interrupt enable1** (أو **enable2**) register تؤدي إلى:

- **تعيين البت المقابل** في **interrupt enable1** (أو **enable2**) register عندما يكون **البت المكتوب = 1**
- **عدم التأثير** عندما يكون **البت المكتوب = 0**

#### عملية القراءة (Read Operation):

قراءة **set interrupt enable1** (أو **enable2**) register ترجع **قيمة** **interrupt enable1** (أو **enable2**) register.

### 25.3.4.2.2.2 Set Wake-up Enable Register

#### الـ Register المتأثر:

- **GPIO_SETWKUENA**

#### عملية الكتابة (Write Operation):

عملية كتابة في **set wake-up enable register** تؤدي إلى:

- **تعيين البت المقابل** في **wake-up enable register** عندما يكون **البت المكتوب = 1**
- **عدم التأثير** عندما يكون **البت المكتوب = 0**

#### عملية القراءة (Read Operation):

قراءة **set wake-up enable register** ترجع **قيمة** **wake-up enable register**.

### 25.3.4.2.2.3 Set Data Output Register

#### الـ Register المتأثر:

- **GPIO_SETDATAOUT**

#### عملية الكتابة (Write Operation):

عملية كتابة في **set data output register** تؤدي إلى:

- **تعيين البت المقابل** في **data output register** عندما يكون **البت المكتوب = 1**
- **عدم التأثير** عندما يكون **البت المكتوب = 0**

#### عملية القراءة (Read Operation):

قراءة **set data output register** ترجع **قيمة** **data output register**.

### 25.3.4.2.2.4 Set Instruction Example

#### الحالة الابتدائية (Initial State):

افترض أن **interrupt enable1** (أو **enable2**) register (أو **data output register**) يحتوي على القيمة الثنائية:

```
0000 0001 0000 0000h
```

#### الهدف (Objective):

تعيين **البتات 15، 3، 2، و 1**.

#### التنفيذ (Execution):

مع ميزة **set instruction**، اكتب القيمة التالية:

```
1000 0000 0000 1110h
```

في عنوان **set interrupt enable1** (أو **enable2**) register (أو في عنوان **set data output register**).

#### تحليل القيمة المكتوبة:

- **البت 15**: قيمته 1 → سيتم تعيين البت 15 في الـ register الأساسي
- **البت 3**: قيمته 1 → سيتم تعيين البت 3 في الـ register الأساسي
- **البت 2**: قيمته 1 → سيتم تعيين البت 2 في الـ register الأساسي
- **البت 1**: قيمته 1 → سيتم تعيين البت 1 في الـ register الأساسي
- **البتات الأخرى**: قيمتها 0 → لن تتأثر

#### النتيجة (Result):

بعد عملية الكتابة هذه، قراءة **interrupt enable1** (أو **enable2**) register (أو **data output register**) ترجع:

```
1000 0001 0000 1110h
```

#### التحليل:

- **البت 15**: تم تعيينه من 0 إلى 1
- **البت 16**: بقي كما هو (1) - لم يتأثر
- **البت 3**: تم تعيينه من 0 إلى 1
- **البت 2**: تم تعيينه من 0 إلى 1
- **البت 1**: تم تعيينه من 0 إلى 1
- **باقي البتات**: بقيت كما هي

#### ملاحظة التمثيل:

رغم أن **general-purpose interface registers** عرضها **32 بت**، فقط الـ **16 بت الأقل أهمية** ممثلة في هذا المثال.

---

## المزايا التقنية للـ Set-and-Clear Protocol

### تجنب مشاكل Race Conditions

البروتوكول يتجنب المشاكل التي تحدث في العمليات التقليدية **read-modify-write**:

- **عدم الحاجة للقراءة**: لا توجد حاجة لقراءة القيمة الحالية
- **العملية الذرية**: كل عملية set أو clear هي عملية ذرية واحدة
- **الأمان في البيئات متعددة الخيوط**: متعدد المعالجات يمكنه الوصول الآمن

### الكفاءة في الأداء

- **سرعة أكبر**: عملية واحدة بدلاً من ثلاث عمليات (read-modify-write)
- **استهلاك طاقة أقل**: عدد أقل من العمليات على الناقل
- **موثوقية أعلى**: تقليل فرص الأخطاء

### المرونة في الاستخدام

- **تحكم دقيق**: إمكانية تعديل بتات محددة دون التأثير على الأخرى
- **بساطة البرمجة**: لا حاجة لحفظ القيم أو استخدام العمليات المنطقية
- **وضوح المقصد**: الكود يعبر بوضوح عن النية (set أو clear)

# 25.3.4.3: Data Input (Capture)/Output (Drive)

## دور Output Enable Register في التحكم

### وظيفة GPIO_OE Register

**Output enable register** (**GPIO_OE**) يتحكم في قدرة **output/input** لكل **pin**. عند الـ **reset**، جميع الـ **GPIO-related pins** تُظبط كـ **input** وقدرات الـ **output** تكون معطلة.

### أهمية عدم الاستخدام الداخلي

هذا الـ **register** **ليس مُستخدم داخل الوحدة**؛ وظيفته الوحيدة هي **حمل إعداد الـ pads** (**carry the pads configuration**). هذا يعني أن:

- الـ **GPIO module** نفسه لا يعتمد على هذا الـ register في عمله الداخلي
- الـ register يعمل كـ **interface** بين الـ **GPIO module** والـ **physical pads**
- الغرض منه هو إخبار الـ **pad control logic** بكيفية تظبيط كل **pin**

---

## تكوين الـ Output Mode

### شرط التكوين كـ Output

عندما يُظبط كـ **output** (البت المطلوب **reset** في **GPIO_OE**)، قيمة البت المقابل في **GPIO_DATAOUT register** يتم **driven** على الـ **GPIO pin** المقابل.

#### التحليل التفصيلي:

- **GPIO_OE bit = 0**: الـ pin يعمل كـ **output**
- **GPIO_DATAOUT** يحدد القيمة المُخرجة على الـ **pin**
- العملية تتم بشكل **synchronous** مع **interface clock**

### عملية كتابة البيانات

البيانات تُكتب إلى **data output register** بشكل **synchronous** مع **interface clock**. هذا يضمن:

- **التزامن المثالي** مع دورة الساعة
- **عدم وجود glitches** في الإخراج
- **الاستقرار** في التوقيت

### طرق الوصول للـ Data Output Register

هذا الـ **register** يمكن الوصول إليه بـ:

#### الطريقة التقليدية:

عمليات **read/write** عادية

#### الطريقة البديلة (المُوصى بها):

استخدام **alternate set and clear protocol register update feature**. هذه الميزة تسمح بـ **set** أو **clear** بتات محددة من هذا الـ register بـ **single write access** إلى:

- **Set data output register** (**GPIO_SETDATAOUT**)
- **Clear data output register** (**GPIO_CLEARDATAOUT**)

### اعتبارات الـ Interrupt/Wake-up

إذا كان التطبيق يستخدم **pin** كـ **output** ولا يريد **interrupt/wake-up generation** من هذا الـ **pin**، فإن التطبيق يجب أن يُظبط بشكل صحيح:

- **Wake-up enable register**
- **Interrupt enable registers**

هذا ضروري لأن الـ **pin** حتى لو كان **output** قد يولد **interrupts** أو **wake-up signals** إذا لم يُظبط بشكل صحيح.

---

## تكوين الـ Input Mode

### شرط التكوين كـ Input

عندما يُظبط كـ **input** (البت المطلوب **set to 1** في **GPIO_OE**)، حالة الـ **input** يمكن قراءتها من البت المقابل في **GPIO_DATAIN register**.

#### التحليل التفصيلي:

- **GPIO_OE bit = 1**: الـ pin يعمل كـ **input**
- **GPIO_DATAIN** يعكس الحالة الحقيقية للـ **pin**
- القراءة تعطي القيمة الفعلية الموجودة على الـ **pin**

### عملية أخذ العينات (Sampling Process)

**Input data** يتم أخذ عيناته (**sampled**) بشكل **synchronous** مع **interface clock** ثم يتم **captured** في **data input register** بشكل **synchronous** مع **interface clock**.

#### مراحل العملية:

1. **Sampling Stage**: أخذ عينة من الإشارة الخارجية
2. **Synchronization Stage**: تزامن العينة مع **interface clock**
3. **Capture Stage**: حفظ القيمة في **GPIO_DATAIN register**

### التوقيت والتأخير

عندما تتغير مستويات **GPIO pin**، يتم **captured** في هذا الـ **register** بعد **two interface clock cycles** (الدورات المطلوبة للتزامن وكتابة البيانات).

#### تحليل التأخير:

- **الدورة الأولى**: تزامن الإشارة الخارجية مع **interface clock**
- **الدورة الثانية**: كتابة القيمة المتزامنة في **GPIO_DATAIN register**
- **النتيجة**: تأخير إجمالي = **2 interface clock cycles**

### تأثير AUTOIDLE على الأداء

#### عندما AUTOIDLE bit مُفعل:

عندما يكون **AUTOIDLE bit** في **system configuration register** (**GPIO_SYSCONFIG**) **set**، فإن **GPIO_DATAIN read command** له **3 OCP cycle latency** بسبب **data in sample gating mechanism**.

#### عندما AUTOIDLE bit غير مُفعل:

عندما يكون **AUTOIDLE bit** **not set**، فإن **GPIO_DATAIN read command** له **2 OCP cycle latency**.

#### تحليل الفرق:

- **مع AUTOIDLE**: تأخير إضافي بسبب **gating mechanism** لتوفير الطاقة
- **بدون AUTOIDLE**: أداء أسرع لكن استهلاك طاقة أعلى

### اعتبارات الـ Interrupt/Wake-up للـ Input

إذا كان التطبيق يستخدم **pin** كـ **input**، فإن التطبيق يجب أن يُظبط بشكل صحيح:

- **Wake-up enable register**
- **Interrupt enable registers**

هذا الظبط يكون **to the interrupt and wake-up feature as needed** - أي حسب الحاجة للميزات هذه.

#### خيارات التظبيط:

1. **تفعيل الـ Interrupts**: للاستجابة السريعة لتغيرات الـ **input**
2. **تفعيل الـ Wake-up**: لتنبيه النظام من **sleep mode**
3. **تعطيل كليهما**: للـ **polling-based** reading فقط

---

## التفاعل بين Output وInput Modes

### الاستقلالية النسبية

رغم أن كل **pin** يُظبط إما كـ **input** أو **output**، فإن:

- **GPIO_DATAOUT register** موجود دائماً ويمكن كتابته
- **GPIO_DATAIN register** موجود دائماً ويمكن قراءته
- **GPIO_OE register** هو الذي يحدد أيهما نشط فعلياً على الـ **pin**

### اعتبارات التصميم

المصمم يجب أن يأخذ في الاعتبار:

- **تظبيط الـ direction** صحيح قبل استخدام الـ **pin**
- **إعداد الـ interrupt/wake-up registers** حسب الحاجة
- **فهم التأخيرات** المرتبطة بالقراءة والكتابة
- **تأثير الـ AUTOIDLE** على الأداء

### أهمية التزامن

جميع العمليات **synchronous** مع **interface clock** مما يضمن:

- **عدم وجود race conditions**
- **استقرار البيانات**
- **إمكانية التنبؤ بالتوقيت**
- **موثوقية العمل** في البيئات الصناعية

هذا التصميم يعكس الحاجة لتوازن مثالي بين **الأداء**، **استهلاك الطاقة**، و**الموثوقية** في الأنظمة المدمجة المتقدمة.


# 25.3.4.5: GPIO as a Keyboard Interface

## المفهوم الأساسي لواجهة لوحة المفاتيح

### إمكانية الاستخدام

الـ **general-purpose interface** يمكن استخدامه كـ **keyboard interface**. يمكن تخصيص **channels** حسب **keyboard matrix** (r × c).

### الإشارة إلى Figure 25-7

يُظهر **Figure 25-7** **row channels** مُظبطة كـ **inputs** مع تفعيل ميزة **input debounce**. الـ **row channels** مدفوعة عالياً (**driven high**) بواسطة **external pull-up**. **Column channels** مُظبطة كـ **outputs** وتدفع مستوى منخفض (**drive a low level**).

#### تحليل التكوين:

- **Row channels**:
    - مُظبطة كـ **inputs**
    - مع **input debounce feature enabled**
    - مدفوعة عالياً بـ **external pull-up resistors**
- **Column channels**:
    - مُظبطة كـ **outputs**
    - تدفع **low level** بشكل نشط

---

## آلية الكشف

### عملية الكشف عند الضغط

عندما يتم الضغط على مفتاح في **keyboard matrix**، الـ **row** و **column lines** المقابلة يتم **shorted together** وينتج **low level** على **row channel** المقابل.

#### التسلسل الفيزيائي:

1. **الحالة العادية**: **Row line** في حالة **high** بسبب **pull-up resistor**
2. **الضغط على المفتاح**: يحدث **short circuit** بين **row** و **column**
3. **Column** يدفع **low level** فيسحب **row** إلى **low level**
4. **النتيجة**: **row channel** يصبح **low level**

### توليد الـ Interrupt

هذا التغيير يولد **interrupt** حسب **proper configuration** (انظر **Section 25.3.3**).

#### متطلبات التكوين:

- تفعيل **falling edge detection** على **row channels**
- تظبيط **interrupt enable registers** للـ **row channels**
- تكوين **debounce settings** إذا لزم الأمر

---

## عملية المسح (Scanning Process)

### استقبال الـ Keyboard Interrupt

عندما يتم استقبال **keyboard interrupt**، المعالج يمكنه:

1. **تعطيل keyboard interrupt**
2. **مسح column channels** للحصول على **key coordinates**

### تسلسل المسح

**Scanning sequence** له عدد من الحالات يساوي عدد **column channels**: لكل خطوة في التسلسل، المعالج:

- **يدفع column channel واحد low**
- **يدفع الآخرين high**

#### تحليل كل خطوة:

1. **تفعيل column واحد**: تعيين **column channel** محدد إلى **low**
2. **تعطيل الباقي**: تعيين باقي **column channels** إلى **high**
3. **قراءة الـ rows**: فحص حالة جميع **row channels**
4. **التحليل**: تحديد أي **keys** في هذا **column** مضغوطة

### قراءة قيم الـ Row Channels

المعالج **يقرأ قيم row channels** وبالتالي **يكتشف أي keys** في **column** مضغوطة.

#### منطق الكشف:

- **Row channel = low**: المفتاح في تقاطع هذا **row** مع **column** النشط مضغوط
- **Row channel = high**: المفتاح في تقاطع هذا **row** مع **column** النشط غير مضغوط

---

## إنهاء دورة المسح

### إتمام التسلسل

في نهاية **scanning sequence**، المعالج **يحدد أي keys مضغوطة**.

#### المعلومات المستخرجة:

- **عدد المفاتيح المضغوطة**
- **مواقع المفاتيح** (row, column coordinates)
- **حالة كل مفتاح** في المصفوفة

### إعادة تكوين واجهة لوحة المفاتيح

**Keyboard interface** يمكن إعادة تكوينها بعد ذلك في **interrupt waiting state**.

#### خطوات إعادة التكوين:

1. **مسح interrupt status**
2. **إعادة تفعيل keyboard interrupt**
3. **تجهيز النظام** لـ **interrupt** التالي
4. **العودة** إلى **waiting state**

---

## تحليل تفصيلي للـ Figure 25-7

### مكونات النظام

حسب الوصف المرفق مع **Figure 25-7**:

#### الجهاز (Device):

- **General Purpose Interface** الرئيسي
- **L4 interconnect** للتواصل مع النظام
- **Interrupt generation** logic

#### المصفوفة الخارجية:

- **Keyboard matrix** فيزيائية
- **I/O pads** للتوصيل الخارجي
- **VDD** power supply
- **Pull-up resistors** للـ **row channels**

#### التوصيلات:

- **Row channels**: متصلة بـ **GPIO inputs** مع **pull-ups**
- **Column channels**: متصلة بـ **GPIO outputs**
- **Power and ground connections**

### التدفق الكهربائي

#### الحالة العادية (No Key Pressed):

1. **Column outputs**: يمكن أن تكون **high** أو **low**
2. **Row inputs**: **high** بسبب **pull-up resistors**
3. **لا يوجد current path** بين **rows** و **columns**

#### عند الضغط على مفتاح:

1. **Physical contact** يحدث بين **row** و **column**
2. **Current path** يتكون من **VDD** → **pull-up** → **row** → **key contact** → **column** → **ground**
3. **Row voltage** يصبح مساوياً لـ **column voltage**
4. إذا كان **column** في حالة **low**، فـ **row** يصبح **low**

---

## الاعتبارات التقنية

### أهمية الـ Debouncing

تفعيل **input debounce feature** على **row channels** ضروري لأن:

- **المفاتيح الميكانيكية** تعاني من **contact bounce**
- **البوقسة** يمكن أن تسبب **multiple interrupts** لضغطة واحدة
- **Debouncing** يضمن **interrupt** واحد لكل ضغطة فعلية

### توقيت المسح

**Scanning process** يجب أن يكون:

- **سريعاً** بما يكفي للاستجابة لضغطات المستخدم
- **بطيئاً** بما يكفي للسماح للـ **debouncing** بالعمل
- **منتظماً** لضمان **consistent response**

### معالجة المفاتيح المتعددة

النظام يجب أن يتعامل مع:

- **Single key presses**: الحالة العادية
- **Multiple key presses**: عدة مفاتيح مضغوطة في نفس الوقت
- **Key combinations**: مفاتيح خاصة كـ **Ctrl+Alt**
- **Ghosting prevention**: تجنب الكشف الخاطئ للمفاتيح

### تحسين الأداء

لتحسين أداء **keyboard interface**:

- **استخدام interrupts** بدلاً من **polling** لتوفير الطاقة
- **تحسين scanning frequency** حسب نوع التطبيق
- **استخدام debouncing** الصحيح لتجنب **false triggers**
- **تحسين pull-up resistor values** للحصول على أفضل أداء

هذا التصميم يوفر **keyboard interface** فعالة وموثوقة باستخدام **GPIO** العادي مع الحد الأدنى من **external components**.




_____
_____
_____
# الجزء العملى:
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