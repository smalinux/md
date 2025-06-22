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

**بالعربي المصري:** فيه **خمس clock gating features** متاحة لتوفير الطاقة:

**1. System Interface Logic Clock Gating:**

- **الوظيفة**: Clock للـ system interface logic ممكن يتقفل لما الـ module مش متوصل
- **الشرط**: لو الـ **AUTOIDLE configuration bit** في الـ **GPIO_SYSCONFIG register** مضبوط
- **البديل**: لو مش مضبوط، الـ logic ده بيكون **free running** على الـ interface clock

**2. Input Data Sample Logic Clock Gating:**

- **الوظيفة**: Clock للـ input data sample logic ممكن يتقفل لما الـ **data in register** مش متوصل
- **الفايدة**: بيوفر طاقة لما مفيش قراءة للـ input data

**3. Synchronous Events Detection Logic Clock Groups:**

- **التنظيم**: **أربع clock groups** مستخدمة للـ logic في الـ synchronous events detection
- **التوزيع**: كل **8 input GPIO pins** لهم **separate enable signal** حسب الـ edge/level detection register setting
- **الشرط**: لو group مش محتاج detection، الـ clock المقابل هيتقفل
- **Clock Gating Scheme**: كل الـ channels كمان مقفولة باستخدام **'one out of N' scheme**
    - **N values**: 1, 2, 4, أو 8
    - **N = 1**: مفيش gating والـ logic **free running** على الـ interface clock
    - **N = 2-8**: الـ logic بيشتغل على تردد مكافئ لـ **interface clock frequency divided by N**

**4. Inactive Mode Clock Gating:**

- **التأثير**: **كل الـ internal clock paths مقفولة** في الـ Inactive mode
- **الاستثناء**: مفيش استثناءات

**5. Disabled Mode Clock Gating:**

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
#### OCP Hardware Reset Signal:

الـ **OCP hardware Reset signal** له **global reset action** على الـ GPIO:

**التأثير الشامل:**

- **كل الـ configuration registers** بترجع لحالتها الأولى
- **كل الـ DFFs** اللي متزامنة مع الـ **Interface clock** أو **Debouncing clock** بترجع لحالتها الأولى
- **كل الـ internal state machines** بترجع لحالتها الأولى
- **الشرط**: لما الـ OCP hardware Reset يكون **active (low level)**

#### RESETDONE Bit Monitoring:

الـ **RESETDONE bit** في الـ **GPIO_SYSSTATUS register**:

- **الوظيفة**: بيراقب الـ **internal reset status**
- **متى يتحط**: لما الـ **Reset يكمل على الـ OCP والـ Debouncing clock domains** سوا
- **الفايدة**: بيأكدلك إن الـ reset خلص بنجاح على كل النطاقات

#### Software Reset:

الـ **Software Reset** (**SOFTRESET bit** في الـ **GPIO_SYSCONFIG register**):

- **التأثير**: له **نفس تأثير** الـ **OCP hardware Reset signal**
- **التحديث**: الـ **RESETDONE bit** في الـ **GPIO_SYSSTATUS** بيتحدث في **نفس الشرط**
- **الاستخدام**: بيسمحلك تعمل reset بـ software بدل hardware signal
### الخلاصة والأهمية - Summary and Importance
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

#### شروط توليد الـ Interrupt Request:

**الخطوات المطلوبة:**

**1. تفعيل الـ Interrupts للـ GPIO Channel:**

```
GPIO_IRQSTATUS_SET_0 register  // للـ interrupt line 0
GPIO_IRQSTATUS_SET_1 register  // للـ interrupt line 1
```

**لايه مهم؟** عشان تقدر تختار أي interrupt line هيستقبل الـ event من الـ GPIO pin ده.

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

**ليه مفيد؟**

- **توفير معالج**: مش محتاج polling مستمر
- **استجابة سريعة**: فوري لما الحدث يحصل
- **مرونة**: ممكن تختار أنواع أحداث مختلفة

**In English:**

#### Understanding Interrupt and Wake-up Mechanism:

**Basic Concept:** Instead of processor continuously checking GPIO pins (polling), we can program GPIO to send **interrupt** or **wake-up signal** when specific events occur on pins.

#### Interrupt Request Generation Requirements:

**Required Steps:**

**1. Enable Interrupts for GPIO Channel:**

```
GPIO_IRQSTATUS_SET_0 register  // for interrupt line 0
GPIO_IRQSTATUS_SET_1 register  // for interrupt line 1
```

**Why Important?** To select which interrupt line will receive events from this GPIO pin.

**2. Select Expected Event Types:**

```
GPIO_LEVELDETECT0     // detect low level (0)
GPIO_LEVELDETECT1     // detect high level (1)
GPIO_RISINGDETECT     // detect rising edge (0→1)
GPIO_FALLINGDETECT    // detect falling edge (1→0)
```

#### Wake-up Request Generation Requirements:

**Required Steps:**

**1. Enable GPIO Channel for Wake-up:**

```
GPIO_IRQWAKEN register  // enable wake-up for specific pin
```

**2. Select Event Types:**

```
GPIO_RISINGDETECT     // rising transition only
GPIO_FALLINGDETECT    // falling transition only
```

**Important Note:** Wake-up **works only with transitions** (edges), **not with levels**.

#### Practical Example:

**In Arabic:** To generate interrupt on **rising and falling edges** on input pin number **k**:

```c
// Enable edge detection
GPIO_RISINGDETECT |= (1 << k);   // enable rising edge detection
GPIO_FALLINGDETECT |= (1 << k);  // enable falling edge detection

// Enable interrupt for this pin on interrupt line 0
GPIO_IRQSTATUS_SET_0 |= (1 << k);
```

**Why Useful?**

- **Processor Saving**: No continuous polling needed
- **Fast Response**: Immediate when event occurs
- **Flexibility**: Can select different event types

---

**تعليق على هذا القسم:**

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

---

### 25.3.3.2 Synchronous Path: Interrupt Request Generation - المسار المتزامن: توليد طلب المقاطعة

**بالعربي المصري:**

#### آلية العمل في الـ Active Mode:

**الفكرة الأساسية:** في الـ **Active mode**، الـ GPIO بيعمل **sample** للـ input signals باستخدام الـ **internally gated interface clock**. يعني بيشوف الـ signal في أوقات محددة بتردد الـ clock.

#### فهم الـ Sampling Process:

**إيه اللي بيحصل:**

1. الـ **interface clock** بيعمل "tick" كل فترة زمنية معينة
2. في كل "tick"، الـ GPIO بيقرأ قيمة الـ input pin
3. بيقارن القراءة الجديدة مع القراءة اللي فاتت
4. لو لقى الحدث المطلوب (level أو transition)، بيولد interrupt

#### Timing Requirements - المتطلبات الزمنية:

**1. Minimum Pulse Width للـ Synchronous Interrupt:**

- **المطلوب**: **ضعف فترة الـ internally gated interface clock**
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

**In English:**

#### Operation Mechanism in Active Mode:

**Basic Concept:** In **Active mode**, GPIO **samples** input signals using **internally gated interface clock**. It reads signals at specific times determined by clock frequency.

#### Understanding Sampling Process:

**What Happens:**

1. **Interface clock** "ticks" at regular intervals
2. At each "tick", GPIO reads input pin value
3. Compares new reading with previous reading
4. If required event (level or transition) found, generates interrupt

#### Timing Requirements:

**1. Minimum Pulse Width for Synchronous Interrupt:**

- **Required**: **Twice the internally gated interface clock period**
- **Reason**: To ensure signal is read at different sampling points

**Example:** If interface clock is 100 MHz (period = 10 ns):

- Internally gated clock might be slower (e.g., 25 MHz, period = 40 ns)
- Minimum pulse width = 2 × 40 ns = **80 ns**

**2. Level Detection Requirements:**

- **Required**: Selected level must be **stable** for at least **twice the internally gated interface clock period**
- **Reason**: To ensure it's not just noise or glitch

#### Understanding Latency:

**1. Without Debouncing:**

- **Time**: No more than **3 internally gated interface clock cycles + 2 interface clock cycles**
- **Reason**:
    - 3 cycles for detection and synchronization
    - 2 cycles for interrupt generation

**2. With Debouncing:**

- **Additional Time**:
    - Same previous latency
    - **+ GPIO_DEBOUNCINGTIME value** (in debouncing clock cycles)
    - **+ 3 debouncing clock cycles** (for synchronization)

---

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

---

### 25.3.3.3 Asynchronous Path: Wake-up Request Generation - المسار غير المتزامن: توليد طلب الإيقاظ

**بالعربي المصري:**

#### آلية العمل في الـ Idle Mode:

**الفكرة الأساسية:** في الـ **Idle mode**، الـ **interface clock مقفول** (عشان توفير الطاقة)، بس الـ GPIO لسه قادر يكشف **transitions** على الـ input pins ويولد **wake-up request** عشان يصحي النظام.

#### المقارنة مع الـ Synchronous Path:

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

**In English:**

#### Operation Mechanism in Idle Mode:

**Basic Concept:** In **Idle mode**, **interface clock is shut down** (for power saving), but GPIO can still detect **transitions** on input pins and generate **wake-up request** to wake the system.

#### Comparison with Synchronous Path:

|Feature|Synchronous Path|Asynchronous Path|
|---|---|---|
|**Clock Status**|Interface clock running|Interface clock shut down|
|**Detection Type**|Levels + Transitions|Transitions only|
|**Purpose**|Interrupt generation|Wake-up generation|
|**Mode**|Active mode|Idle mode|

#### Understanding Wake-up Configuration:

**Required Conditions:**

1. **GPIO configuration registers pre-programmed** (before entering Idle mode)
2. **Enable expected transitions**:
    
    ```
    GPIO_RISINGDETECT   // for rising edge detectionGPIO_FALLINGDETECT  // for falling edge detection
    ```
    
3. **Enable wake-up for specific pin**:
    
    ```
    GPIO_IRQWAKEN register
    ```
    

#### Important Wake-up Line Characteristics:

**Only One Wake-up Line:**

- **Reason**: All **wake-up sources are merged together**
- **Meaning**: Cannot identify which specific pin generated wake-up without reading status registers
- **Benefit**: Simplifies hardware design

#### Pulse Width Requirements:

**1. Without Debouncing:**

- **Required**: **No minimum input pulse width**
- **Reason**: **No sampling operation** (asynchronous detection)
- **Meaning**: Any pulse, no matter how fast, can generate wake-up

**2. With Debouncing:**

- **Required**: **Minimum pulse width set by debouncing specified time**
- **Reason**: Debouncing filter needs sufficient time to confirm signal is not noise

---

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

**بالعربي المصري:**

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

**In English:**

#### Understanding Interrupt Handling Mechanism:

**Basic Problem:** When interrupt occurs, interrupt line remains **active** until software **acknowledges** interrupt and clears status bit. If this doesn't happen, interrupt remains pending.

#### Interrupt Handling Steps:

**1. Receiving Interrupt:**

```c
// Processor receives interrupt request from GPIO module
// This happens automatically when hardware event occurs
```

**2. Identifying Interrupt Source:**

```c
// Read status register to identify which pin generated interrupt
uint32_t status_line0 = GPIO_IRQSTATUS_0;  // for interrupt line 0
uint32_t status_line1 = GPIO_IRQSTATUS_1;  // for interrupt line 1

// Example: if bit 5 is set, pin 5 generated interrupt
if (status_line0 & (1 << 5)) {
    // GPIO pin 5 generated interrupt
}
```

**3. Servicing Interrupt:**

```c
// Here we do what we're supposed to do in response to interrupt
// Example: read sensor, change LED, send message, etc.
handle_gpio_interrupt(pin_number);
```

**4. Clearing Status Bit (Critical Step):**

```c
// Must write 1 to corresponding bit to clear it
GPIO_IRQSTATUS_0 = (1 << 5);  // clear interrupt status for pin 5
// or
GPIO_IRQSTATUS_CLR_0 = (1 << 5);  // using clear register
```

---

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