# Chapter 25: General-Purpose Input/Output


### 25.1 Introduction - المقدمة

#### 25.1.1 Purpose of the Peripheral - الغرض من الـ Peripheral

الـ **General-Purpose Interface** ده بيجمع أربع **GPIO modules**. كل **GPIO module** بيدي 32 **dedicated pins** مع إمكانيات **input** و **output**. يعني في المجموع عندنا 128 pin (4 × 32) ممكن نستخدمهم في:

- **Data input (capture)/output (drive)** - قراءة وكتابة البيانات
- **Keyboard interface** مع **debounce cell** - واجهة لوحة مفاتيح
- **Interrupt generation** في الـ **active mode** لما نكتشف **external events**
- **Wake-up request generation** في الـ **idle mode**

#### 25.1.2 GPIO Features - المميزات

كل **GPIO module** فيه 32 **identical channels**. كل **channel** ممكن يتظبط عشان يستخدم في:

- **Data input/output** - دخل وخرج البيانات
- **Keyboard interface** مع **de-bouncing cell**
- **Synchronous interrupt generation** عند اكتشاف **external events** (انتقالات الإشارة أو مستوياتها)
- **Wake-up request generation** في الـ **Idle mode**

**المميزات العامة للـ GPIO interface:**

- **Synchronous interrupt requests** من كل **channel** بتتعالج بواسطة اتنين **interrupt generation sub-modules** منفصلين للـ **ARM Subsystem**
- **Wake-up requests** من **input channels** بتتجمع عشان تبعت **wake-up signal** واحد للنظام
- **Shared registers** ممكن نوصلها بـ **"Set & Clear" protocol**

#### 25.1.3 Unsupported GPIO Features - المميزات الغير مدعومة

الـ **wake-up feature** بتاع الـ **GPIO modules** مدعوم بس في **GPIO0** فقط.

### 25.2 Integration - التكامل

الجهاز فيه أربع **GPIO_V2 modules**. كل **GPIO module** بيدعم 32 **dedicated pins** مع إمكانيات **input** و **output configuration**. إشارات الـ **Input** ممكن تستخدم عشان تولد **interruptions** و **wake-up signal**.

في اتنين **Interrupt lines** متاحين لـ **bi-processor operation**. الـ **Pins** ممكن تخصص عشان تستخدم كـ **keyboard controller**.

مع أربع **GPIO modules**، الجهاز يسمح بحد أقصى 128 **GPIO pins**. (العدد الدقيق المتاح بيختلف حسب إعداد الجهاز والـ **pin muxing**.)

**GPIO0** موجود في الـ **Wakeup domain** وممكن يستخدم عشان يصحي الجهاز عن طريق **external sources**. **GPIO[1:3]** موجودين في الـ **peripheral domain**.

#### 25.2.1 GPIO Connectivity Attributes - خصائص التوصيل

**GPIO0 Connectivity Attributes:**

- **Power Domain**: Wakeup Domain
- **Clock Domain**: PD_WKUP_L4_WKUP_GCLK (OCP), GPIO_0_GDBCLK (Debounce)
- **Reset Signals**: WKUP_DOM_RST_N
- **Idle/Wakeup Signals**: Smart Idle / Slave Wakeup
- **Interrupt Requests**: اتنين interrupts للـ MPU subsystem وغيرهم
- **DMA Requests**: 1 DMA request (GPIOEVT0)

**GPIO[1:3] Connectivity Attributes:**

- **Power Domain**: Peripheral Domain
- **Clock Domain**: PD_PER_L4LS_GCLK (OCP) مع debounce clocks منفصلة
- **Reset Signals**: PER_DOM_RST_N
- **Idle/Wakeup Signals**: Smart Idle
- **Interrupt Requests**: اتنين interrupts للـ MPU subsystem
- **DMA Requests**: DMA requests للـ GPIO1 و GPIO2 بس

#### 25.2.2 GPIO Clock and Reset Management - إدارة الساعة والـ Reset

الـ **GPIO modules** محتاجة اتنين **clocks**:

1. **De-bounce clock** - بتستخدم للـ **de-bouncing cells**
2. **Interface clock** - بتيجي من الـ **peripheral bus** وبتستخدم في كل الـ **GPIO module**

للـ **GPIO0**، الـ **debounce clock** بتتختار من تلات مصادر:

- **CLK_RC32K** - الـ on-chip ~32.768 KHz oscillator
- **CLK_32KHZ** - الـ PER PLL generated 32.768 KHz clock
- **CLK_32K_RTC** - الـ external 32.768 KHz oscillator/clock

### 25.3 Functional Description - الوصف الوظيفي

#### 25.3.1 Operating Modes - أوضاع التشغيل

في أربع **operating modes** للـ **module**:

1. **Active mode**: الـ **module** شغال بتزامن مع الـ **interface clock**، ممكن يولد **interrupt** حسب الإعداد والإشارات الخارجية
    
2. **Idle mode**: الـ **module** في حالة انتظار، الـ **interface clock** ممكن يتوقف، مش ممكن يولد **interrupt**، بس ممكن يولد **wake-up signal**
    
3. **Inactive mode**: الـ **module** مالوش نشاط، الـ **interface clock** ممكن يتوقف، مش ممكن يولد **interrupt** أو **wake-up**
    
4. **Disabled mode**: الـ **module** مش مستخدم، **internal clock paths** مقفولة، مش ممكن يولد **interrupt** أو **wake-up request**
    

#### 25.3.2 Clocking and Reset Strategy - استراتيجية الساعة والـ Reset

##### 25.3.2.1 Clocks - الساعات

الـ **GPIO module** بيشتغل بـ اتنين **clocks**:

- **Debouncing clock** - للـ **debouncing sub-module logic**
- **Interface clock** - للـ **OCP interface** وكل الـ **internal logic**

##### 25.3.2.2 Clock Gating Features - مميزات إغلاق الساعة

في خمس **clock gating features** متاحة:

1. ساعة الـ **system interface logic** ممكن تتقفل لما الـ **module** مش بيتوصل ليه
2. ساعة الـ **input data sample logic** ممكن تتقفل لما الـ **data in register** مش بيتوصل ليه
3. أربع **clock groups** للـ **synchronous events detection**
4. في الـ **Inactive mode**، كل الـ **internal clock paths** بتتقفل
5. في الـ **Disabled mode**، كل الـ **internal clock paths** اللي مش مستخدمة للـ **system interface** بتتقفل

#### 25.3.3 Interrupt and Wake-up Features - مميزات الـ Interrupt والـ Wake-up

##### 25.3.3.1 Functional Description - الوصف الوظيفي

عشان تولد **interrupt request** للـ **host processor** عند حدوث **defined event** على **GPIO pin**، لازم تظبط الـ **GPIO configuration registers** كالآتي:

- تفعيل **Interrupts** للـ **GPIO channel** في **GPIO_IRQSTATUS_SET_0** و/أو **GPIO_IRQSTATUS_SET_1**
- اختيار الـ **expected event(s)** في **GPIO_LEVELDETECT0**, **GPIO_LEVELDETECT1**, **GPIO_RISINGDETECT**, و **GPIO_FALLINGDETECT**

##### 25.3.3.2 Synchronous Path: Interrupt Request Generation

في الـ **Active mode**، لما الـ **GPIO configuration registers** تتظبط لتفعيل **interrupt generation**، **synchronous path** بيعاين **transitions** و **levels** على **input GPIO** بالـ **internally gated interface clock**.

لما **event** يطابق الـ **programmed settings**، الـ **bit** المقابل في **GPIO_IRQSTATUS_RAW_n registers** بيتظبط على 1، وفي الـ **interface clock cycle** التالية، **interrupt lines** 1 و/أو 2 بتتفعل.

**الحد الأدنى لعرض النبضة** على **input GPIO** عشان تحفز **synchronous interrupt request** هو مرتين **internally gated interface clock period**.

##### 25.3.3.3 Asynchronous Path: Wake-up Request Generation

في الـ **Idle mode** (الـ **interface clock** مقفول)، **asynchronous path** بيكتشف **expected transition(s)** على **input GPIO** ويفعل **asynchronous wake-up request** لو **wakeup enable register** مفعل.

لما النظام يصحى، الـ **interface clock** يبدأ تاني، وحسب **input GPIO pin** اللي حفز الـ **wake-up request**، الـ **bits** المقابلة في **GPIO_IRQSTATUS_RAW_n registers** بتتظبط على 1 بشكل متزامن.

#### 25.3.4 General-Purpose Interface Basic Programming Model

##### 25.3.4.1 Power Saving by Grouping the Edge/Level Detection

كل **GPIO module** بيطبق أربع **gated clocks** للـ **edge/level detection logic** عشان يوفر الطاقة. كل مجموعة من تمان **input GPIO pins** بتولد **enable signal** منفصل حسب **edge/level detection register setting**.

##### 25.3.4.2 Set and Clear Instructions

الـ **GPIO module** بيطبق **set-and-clear protocol register update** للـ **data output** و **interrupt enable** و **wake-up enable registers**. الـ **protocol** ده بديل للـ **atomic test and set operations**.

**Registers** ممكن توصل بطريقتين:

- **Standard**: عمليات قراءة وكتابة كاملة على **primary register address**
- **Set and clear (recommended)**: عناوين منفصلة لتظبيط ومسح **bits** في **registers**

---

## English Explanation 🇺🇸

### 25.1 Introduction

#### 25.1.1 Purpose of the Peripheral

The **General-Purpose Interface** combines four **GPIO modules**, each providing 32 dedicated pins with input/output capabilities, supporting up to 128 pins total. These pins can be configured for:

- **Data input (capture)/output (drive)** operations
- **Keyboard interface** with debounce functionality
- **Interrupt generation** in active mode upon external event detection
- **Wake-up request generation** in idle mode upon external event detection

#### 25.1.2 GPIO Features

Each **GPIO module** consists of 32 identical channels configurable for:

- **Data input/output** operations
- **Keyboard interface** with **de-bouncing cell**
- **Synchronous interrupt generation** upon detection of external events
- **Wake-up request generation** in Idle mode upon signal transitions

**Global GPIO interface features:**

- **Dual interrupt generation sub-modules** for independent ARM Subsystem operation
- **Merged wake-up requests** from input channels to issue unified wake-up signals
- **Set & Clear protocol** access for shared registers

#### 25.1.3 Unsupported GPIO Features

The **wake-up feature** is only supported on **GPIO0**.

### 25.2 Integration

The device instantiates four **GPIO_V2 modules**, each supporting 32 dedicated pins with configurable input/output capabilities. Input signals can generate interruptions and wake-up signals through two available interrupt lines for bi-processor operation.

**GPIO0** resides in the **Wakeup domain** for external wake-up functionality, while **GPIO[1:3]** are located in the **peripheral domain**.

#### 25.2.1 GPIO Connectivity Attributes

**GPIO0 Connectivity:**

- **Power Domain**: Wakeup Domain
- **Clock Domain**: PD_WKUP_L4_WKUP_GCLK (OCP) and GPIO_0_GDBCLK (Debounce)
- **Reset Signals**: WKUP_DOM_RST_N
- **Interrupt Requests**: Two interrupts to MPU subsystem, PRU-ICSS, and WakeM3
- **DMA Requests**: One DMA request (GPIOEVT0)

**GPIO[1:3] Connectivity:**

- **Power Domain**: Peripheral Domain
- **Clock Domain**: PD_PER_L4LS_GCLK (OCP) with individual debounce clocks
- **Reset Signals**: PER_DOM_RST_N
- **Interrupt Requests**: Two interrupts to MPU subsystem
- **DMA Requests**: Available for GPIO1 and GPIO2 only

#### 25.2.2 GPIO Clock and Reset Management

**GPIO modules** require two clocks:

1. **De-bounce clock** for de-bouncing cells (32.768 KHz)
2. **Interface clock** from peripheral bus for OCP interface and internal logic

For **GPIO0**, the debounce clock can be selected from three sources:

- **CLK_RC32K**: On-chip ~32.768 KHz oscillator
- **CLK_32KHZ**: PER PLL generated 32.768 KHz clock
- **CLK_32K_RTC**: External 32.768 KHz oscillator/clock

### 25.3 Functional Description

#### 25.3.1 Operating Modes

Four operating modes are defined:

1. **Active mode**: Module runs synchronously on interface clock, can generate interrupts
2. **Idle mode**: Module in waiting state, interface clock can be stopped, can generate wake-up signals
3. **Inactive mode**: Module has no activity, interface clock can be stopped, wake-up feature inhibited
4. **Disabled mode**: Module unused, internal clock paths gated, no interrupt/wake-up generation

#### 25.3.2 Clocking and Reset Strategy

##### 25.3.2.1 Clocks

**GPIO module** operates with two clocks:

- **Debouncing clock**: For debouncing sub-module logic
- **Interface clock**: For OCP interface and internal logic throughout the module

##### 25.3.2.2 Clock Gating Features

Five clock gating features are available:

1. **System interface logic clock** gating when module not accessed (AUTOIDLE)
2. **Input data sample logic clock** gating when data in register not accessed
3. **Four clock groups** for synchronous events detection (8-pin groups)
4. **Inactive mode**: All internal clock paths gated
5. **Disabled mode**: All internal clock paths not used for system interface gated

#### 25.3.3 Interrupt and Wake-up Features

##### 25.3.3.1 Configuration Requirements

To generate **interrupt requests** upon defined events on GPIO pins:

**Interrupt Configuration:**

- Enable interrupts in **GPIO_IRQSTATUS_SET_0** and/or **GPIO_IRQSTATUS_SET_1**
- Select expected events in **GPIO_LEVELDETECT0**, **GPIO_LEVELDETECT1**, **GPIO_RISINGDETECT**, **GPIO_FALLINGDETECT**

**Wake-up Configuration:**

- Enable GPIO channel in **GPIO_IRQWAKEN** register
- Select expected events in **GPIO_RISINGDETECT** and **GPIO_FALLINGDETECT** (transitions only)

##### 25.3.3.2 Synchronous Path: Interrupt Request Generation

In **Active mode**, the synchronous path samples transitions and levels on input GPIO with the internally gated interface clock. When events match programmed settings, corresponding bits in **GPIO_IRQSTATUS_RAW_n** registers are set, activating interrupt lines on the next clock cycle.

**Minimum pulse width** for triggering synchronous interrupt: 2 × internally gated interface clock period.

##### 25.3.3.3 Asynchronous Path: Wake-up Request Generation

In **Idle mode** (interface clock shut down), the asynchronous path detects expected transitions on input GPIO and activates asynchronous wake-up requests if wakeup enable register is set.

Upon system wake-up, interface clock restarts and corresponding bits in **GPIO_IRQSTATUS_RAW_n** registers are synchronously set based on the triggering GPIO pin.

#### 25.3.4 Programming Model

##### 25.3.4.1 Power Saving through Edge/Level Detection Grouping

Each **GPIO module** implements four gated clocks for edge/level detection logic. Each group of eight input GPIO pins generates separate enable signals based on edge/level detection register settings, enabling power savings when groups require no detection.

##### 25.3.4.2 Set and Clear Instructions

The **GPIO module** implements **set-and-clear protocol** for data output, interrupt enable, and wake-up enable registers. This provides an alternative to atomic test-and-set operations through dedicated addresses for setting and clearing specific bits.

**Register Access Methods:**

- **Standard**: Full register read/write operations at primary addresses
- **Set and Clear**: Separate addresses for setting/clearing bits (recommended)

This protocol defines three addresses for each physical register, with identical read behavior but different write effects for set/clear operations.

---

## Register Summary - ملخص الـ Registers

### Key GPIO Registers:

- **GPIO_REVISION**: Module revision information
- **GPIO_SYSCONFIG**: System configuration and power management
- **GPIO_IRQSTATUS_RAW_0/1**: Raw interrupt status (all events)
- **GPIO_IRQSTATUS_0/1**: Enabled interrupt status
- **GPIO_IRQSTATUS_SET_0/1**: Interrupt enable registers
- **GPIO_IRQSTATUS_CLR_0/1**: Interrupt disable registers
- **GPIO_OE**: Output enable register (0=output, 1=input)
- **GPIO_DATAIN**: Input data register (read-only)
- **GPIO_DATAOUT**: Output data register
- **GPIO_LEVELDETECT0/1**: Level detection enable (low/high)
- **GPIO_RISINGDETECT**: Rising edge detection enable
- **GPIO_FALLINGDETECT**: Falling edge detection enable
- **GPIO_DEBOUNCENABLE**: Debounce feature enable
- **GPIO_DEBOUNCINGTIME**: Debounce timing configuration
- **GPIO_CLEARDATAOUT**: Clear data output register
- **GPIO_SETDATAOUT**: Set data output register