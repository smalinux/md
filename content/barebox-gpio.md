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
### ==25.3 Functional Description==
#### 25.3.1 Operating Modes - أوضاع التشغيل

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

**بالعربي المصري:**

#### كيفية تفعيل الأوضاع:

- **Idle و Inactive modes**: بتتكونفيجر جوه الـ module وبتتفعل على طلب من الـ host processor من خلال system interface sideband signals
- **Disabled mode**: بيتحط بواسطة software من خلال dedicated configuration bit
- الـ Disabled mode بيقفل الـ internal clock paths اللي مش مستخدمة للـ system interface **unconditionally**

#### خصائص مهمة:

- كل الـ module registers accessible كـ **8, 16 أو 32-bit** من خلال الـ **OCP compatible interface** (little endian encoding)
- في الـ Active mode، الـ event detection بتتم باستخدام الـ interface clock
- دقة الـ detection محددة بتردد الـ clock والـ internal gating scheme المختار

**In English:**

#### Mode Activation:

- **Idle and Inactive modes**: Configured within the module and activated on request by the host processor through system interface sideband signals
- **Disabled mode**: Set by software through a dedicated configuration bit
- Disabled mode **unconditionally gates** the internal clock paths not used for the system interface

#### Important Characteristics:

- All module registers are **8, 16 or 32-bit accessible** through the **OCP compatible interface** (little endian encoding)
- In Active mode, event detection is performed using the interface clock
- Detection precision is set by the frequency of this clock and the selected internal gating scheme

### أهمية فهم الأوضاع

**بالعربي المصري:** فهم الـ Operating Modes مهم جداً لأن:

- بيحدد امتى ممكن تستخدم الـ interrupt functionality
- بيحدد امتى ممكن تستخدم الـ wake-up functionality
- بيأثر على استهلاك الطاقة
- بيحدد إيه الوظائف المتاحة في كل وضع
- مهم لتصميم power management strategy صحيحة

**In English:** Understanding Operating Modes is crucial because it:

- Determines when interrupt functionality can be used
- Determines when wake-up functionality is available
- Affects power consumption
- Defines available functions in each mode
- Is essential for proper power management strategy design

الـ Operating Modes دي بتديك مرونة كبيرة في التحكم في استهلاك الطاقة والوظائف المطلوبة حسب حالة النظام.