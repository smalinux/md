# Linux Driver Subsystems

- **accel** - Hardware acceleration devices (AI/ML accelerators, crypto accelerators)
- **accessibility** - Assistive technology devices for users with disabilities
- **acpi** - Advanced Configuration and Power Interface for hardware discovery and power management
- **amba** - ARM Advanced Microcontroller Bus Architecture drivers
- **android** - Android-specific drivers and interfaces
- **ata** - Advanced Technology Attachment (SATA/PATA) storage device drivers
- **atm** - Asynchronous Transfer Mode networking drivers
- **auxdisplay** - Auxiliary display devices (small LCD/LED displays)
- **base** - Core driver infrastructure and base classes
- **bcma** - Broadcom-specific AMBA bus drivers
- **block** - Block device layer and generic block drivers
- **bluetooth** - Bluetooth wireless communication drivers
- **bus** - Various bus type drivers and infrastructure
- **cache** - CPU cache management and cache controller drivers
- **cdrom** - CD/DVD/Blu-ray optical drive drivers
- **cdx** - AMD CDX bus drivers for FPGA-based devices
- **char** - Character device drivers (serial ports, random number generators)
- **clk** - Clock framework and clock controller drivers
- **clocksource** - System timer and clocksource drivers
- **comedi** - Data acquisition and control hardware drivers
- **connector** - Kernel connector for userspace communication
- **counter** - Counter device drivers (encoders, timers)
- **cpufreq** - CPU frequency scaling and power management
- **cpuidle** - CPU idle state management drivers
- **crypto** - Cryptographic hardware acceleration drivers
- **cxl** - Compute Express Link interconnect drivers
- **dax** - Direct Access storage (persistent memory) drivers
- **dca** - Direct Cache Access for network performance
- **devfreq** - Device frequency scaling framework
- **dio** - DIO bus drivers (used in some embedded systems)
- **dma** - Direct Memory Access controller drivers
- **dma-buf** - DMA buffer sharing framework between devices
- **dpll** - Digital Phase-Locked Loop drivers
- **edac** - Error Detection and Correction memory drivers
- **eisa** - Extended Industry Standard Architecture bus drivers
- **extcon** - External connector detection drivers (USB, headphone jacks)
- **firewire** - IEEE 1394 FireWire interface drivers
- **firmware** - Firmware loading and management infrastructure
- **fpga** - Field-Programmable Gate Array programming and management
- **fsi** - Flexible Support Interface drivers (IBM POWER systems)
- **fwctl** - Firmware control interface drivers
- **gnss** - Global Navigation Satellite System (GPS) drivers
- **gpio** - General Purpose Input/Output pin control drivers
- **gpu** - Graphics Processing Unit drivers
- **greybus** - Greybus protocol drivers for modular hardware
- **hid** - Human Interface Device drivers (keyboards, mice, touchscreens)
- **hsi** - High Speed Interface drivers
- **hte** - Hardware Timestamping Engine drivers
- **hv** - Hypervisor and virtualization drivers
- **hwmon** - Hardware monitoring sensors (temperature, voltage, fan speed)
- **hwspinlock** - Hardware spinlock drivers for multicore systems
- **hwtracing** - Hardware tracing and debugging interfaces
- **i2c** - Inter-Integrated Circuit serial bus drivers
- **i3c** - Improved Inter-Integrated Circuit bus drivers
- **idle** - System idle management drivers
- **iio** - Industrial I/O framework for sensors and converters
- **infiniband** - InfiniBand high-performance networking drivers
- **input** - Input device drivers (keyboards, mice, joysticks)
- **interconnect** - System interconnect and bandwidth management
- **iommu** - Input/Output Memory Management Unit drivers
- **ipack** - IndustryPack bus drivers for industrial applications
- **irqchip** - Interrupt controller drivers
- **isdn** - Integrated Services Digital Network drivers
- **leds** - LED control and lighting drivers
- **macintosh** - Apple Macintosh hardware-specific drivers
- **mailbox** - Inter-processor communication mailbox drivers
- **mcb** - MEN Chameleon Bus drivers
- **md** - Multiple Device (software RAID) drivers
- **media** - Media framework drivers (cameras, video capture, radio)
- **memory** - Memory controller and memory technology drivers
- **memstick** - Sony MemoryStick flash memory drivers
- **message** - Message-based communication drivers
- **mfd** - Multi-Function Device drivers for complex integrated circuits
- **misc** - Miscellaneous character device drivers
- **mmc** - MultiMediaCard and SD card drivers
- **most** - Media Oriented Systems Transport drivers
- **mtd** - Memory Technology Device drivers (flash memory, NAND, NOR)
- **mux** - Multiplexer and demultiplexer drivers
- **net** - Network device drivers and networking infrastructure
- **nfc** - Near Field Communication drivers
- **ntb** - Non-Transparent Bridge drivers for PCIe
- **nubus** - NuBus drivers for old Macintosh systems
- **nvdimm** - Non-Volatile DIMM (persistent memory) drivers
- **nvme** - NVM Express storage interface drivers
- **nvmem** - Non-Volatile Memory framework drivers
- **of** - Open Firmware device tree support
- **opp** - Operating Performance Points framework for power management
- **parisc** - PA-RISC architecture-specific drivers
- **parport** - Parallel port drivers
- **pci** - PCI bus drivers and infrastructure
- **pcmcia** - PC Card and CardBus drivers
- **peci** - Platform Environment Control Interface drivers
- **perf** - Performance monitoring and profiling drivers
- **phy** - Physical layer drivers for various interfaces
- **pinctrl** - Pin control and GPIO multiplexing drivers
- **platform** - Platform-specific device drivers
- **pmdomain** - Power management domain drivers
- **pnp** - Plug and Play device drivers
- **power** - Power supply and battery management drivers
- **powercap** - Power capping framework drivers
- **pps** - Pulse Per Second timing drivers
- **ps3** - Sony PlayStation 3 hardware drivers
- **ptp** - Precision Time Protocol drivers
- **pwm** - Pulse Width Modulation drivers
- **rapidio** - RapidIO interconnect drivers
- **ras** - Reliability, Availability, Serviceability drivers
- **regulator** - Voltage and current regulator drivers
- **remoteproc** - Remote processor management drivers
- **reset** - Hardware reset controller drivers
- **rpmsg** - Remote Processor Messaging drivers
- **rtc** - Real-Time Clock drivers
- **s390** - IBM System/390 and z/Architecture specific drivers
- **sbus** - SBus drivers for SPARC systems
- **scsi** - Small Computer System Interface storage drivers
- **sh** - SuperH architecture-specific drivers
- **siox** - Serial Input/Output Extension drivers
- **slimbus** - SLIMbus serial interface drivers
- **soc** - System-on-Chip specific drivers
- **soundwire** - MIPI SoundWire audio interface drivers
- **spi** - Serial Peripheral Interface bus drivers
- **spmi** - System Power Management Interface drivers
- **ssb** - Sonics Silicon Backplane drivers
- **staging** - Staging area for drivers under development
- **target** - SCSI target framework drivers
- **tc** - TURBOchannel bus drivers
- **tee** - Trusted Execution Environment drivers
- **thermal** - Thermal management and cooling drivers
- **thunderbolt** - Intel Thunderbolt interface drivers
- **tty** - Terminal and serial communication drivers
- **ufs** - Universal Flash Storage drivers
- **uio** - Userspace I/O framework drivers
- **usb** - Universal Serial Bus drivers and infrastructure
- **vdpa** - Virtual Data Path Acceleration drivers
- **vfio** - Virtual Function I/O drivers for device passthrough
- **vhost** - Virtual host drivers for virtualization
- **video** - Video output and framebuffer drivers
- **virt** - Virtualization support drivers
- **virtio** - VirtIO paravirtualized device drivers
- **w1** - 1-Wire bus drivers
- **watchdog** - Watchdog timer drivers for system monitoring
- **xen** - Xen hypervisor drivers
- **zorro** - Zorro bus drivers for Amiga systems

____
# Watchdog
32-bit Counter
Programmable Divider: The divider can be set to 2^n where n=0-7, so you can divide the 32 kHz clock by 1, 2, 4, 8, 16, 32, 64, or 128 to get different timeout granularities.
اذن قيمه العداد ممكن اخليها اسرع او ابطأ فى العد التنازلى

**On-the-fly Access**: You can read and write registers while the counter is running, which is important for feeding the watchdog.
اذن انا ممكن اقرأ القيمه دى عادى بـ kernel modules

## System Integration Architecture

**Clock Sources**: The watchdog gets its functional clock from two possible sources:

- **CLK_RC32K**: An on-chip 32.768 kHz RC oscillator
- **CLK_32KHZ**: A 32.768 kHz clock from the PER PLL (Phase-Locked Loop)

The PRCM (Power, Reset, and Clock Management) module selects between these using the CLKSEL_WDT1_CLK register. This gives you flexibility between using an internal RC oscillator (less accurate but always available) or a PLL-derived clock (more accurate).

## Key Signal Connections

**PO_RSTCMD_N**: This is the reset output that goes to the PRCM module. When the watchdog overflows and is configured for reset mode, this signal triggers a warm reset of the system.

**PO_INT_PEND**: This is the interrupt output that connects to both the MPU Subsystem and WakeM3 processor, allowing either to handle watchdog events.

## Security and Configuration Signals

The diagram shows several interesting configuration inputs:

- **PI_FREQ_RATIO, PI_SECURE_MODE, PI_SECURE_WD**: These suggest the watchdog has security features and frequency scaling capabilities
- **PI_SECURE_WDA, PI_AUTO_START_DIS**: Additional security and auto-start control
- **PI_PTV_RESET_VALUE, PI_WLDR_RESET_VALUE**: These allow configuring default prescaler and load values

## Power Management Integration

**Power Domain**: Operates in the Wakeup Domain, meaning it stays powered even in low-power states - crucial for a watchdog's function.

**Clock Domain**: Uses both OCP (On-Chip Peripheral) functional clock and the wakeup domain clocking.

**Wakeup Capability**: Can generate wakeup events through the L4 Wakeup Interconnect, allowing it to wake the system from sleep states.

## Important Observations

The **0xFFFFB0000 (10s)** notation suggests there's a default 10-second timeout value, which would make sense for typical watchdog applications.

The connection to both MPU and WakeM3 indicates this watchdog can serve multiple processors in the system, which is common in modern SoCs where you have both application processors and dedicated power management cores.

What aspects of this integration would you like to explore further? Are you particularly interested in the clock configuration, the reset/interrupt handling, or the power management aspects?

____

## 20.4.4 Watchdog Registers

This register map shows the complete programming interface for the AM335x watchdog timer. Let me break down what each register does and how they work together:

## Identification and System Control

**WDT_WIDR (0x00) - Watchdog Identification Register**: Contains the IP revision information, peripheral ID, and other identification data. Useful for software to verify it's talking to the correct hardware version.

**WDT_WDSC (0x10) - Watchdog System Control Register**: Controls high-level system behavior like soft reset, idle modes, and emulation behavior. This is where you'd configure how the watchdog behaves during debugging or low-power states.

## Status and Current State

**WDT_WDST (0x14) - Watchdog Status Register**: Shows the current operational status of the watchdog timer - whether it's running, stopped, or in reset state.

**WDT_WCRR (0x28) - Watchdog Counter Register**: This is the current counter value! 
You can read this to see how much time is left before timeout. Since it's a 32-bit upward counter, it starts at the WLDR value and counts up toward 0xFFFFFFFF.

## Interrupt Control (Different from the previous set)

**WDT_WISR (0x18) - Watchdog Interrupt Status Register**: Shows which interrupt conditions are currently active.

**WDT_WIER (0x1C) - Watchdog Interrupt Enable Register**: Controls which interrupt sources are enabled.
## Control Register

**WDT_WCLR (0x24) - Watchdog Control Register**: This likely contains the main operational control bits - things like prescaler settings, reset vs interrupt mode selection, and other behavioral controls.

## Complete Programming Model

Now with the full register set, the typical sequence would be:

1. **Check ID**: Read WIDR to verify hardware
2. **Configure System**: Set up WDSC for desired system behavior
3. **Set Control**: Configure WCLR with prescaler, mode settings
4. **Load Timeout**: Write timeout value to WLDR
5. **Enable Interrupts**: Set up WIER/WIRQENSET as needed
6. **Start Timer**: Write start sequence to WSPR
7. **Monitor**: Read WCRR to see current counter value
8. **Service**: Write to WTGR to reload counter
9. **Check Status**: Use WDST, WISR, WIRQSTAT to monitor state

The ability to read the current counter value (WCRR) is particularly useful for determining how much time remains before timeout, which can help in debugging timing issues.

What would you like to explore next? The detailed bit fields of any specific register, or how these registers work together in practice?

**WDT_WLDR (0x2C) - Watchdog Load Register**: This is where you set the timeout value. When the watchdog is triggered or restarted, the counter gets loaded with this value and counts up from there.

**WDT_WTGR (0x30) - Watchdog Trigger Register**: This is the "pet the dog" register. Writing any value here reloads the counter with the WLDR value, preventing timeout. This is what your software writes to periodically to keep the system running.

**WDT_WSPR (0x48) - Watchdog Start/Stop Register**: Controls whether the watchdog is running. You write specific sequences to this register to start/stop the watchdog timer.

## Timing and Configuration

**WDT_WWPS (0x34) - Watchdog Write Posting Bits Register**: This is important for synchronization. Since the watchdog runs on a 32kHz clock but the processor interface runs much faster, writes to certain registers need time to take effect. This register tells you when previous writes have completed.

**WDT_WDLY (0x44) - Watchdog Delay Configuration Register**: Configures delays, likely related to the reset pulse width or other timing parameters.

## Interrupt Management

**WDT_WIRQSTATRAW (0x54) - Raw Interrupt Status**: Shows the raw interrupt status before masking - useful for debugging.

**WDT_WIRQSTAT (0x58) - Interrupt Status**: Shows the actual interrupt status after enable/disable masking.

**WDT_WIRQENSET (0x5C) - Interrupt Enable Set**: Write 1 to bits here to enable specific watchdog interrupts.

**WDT_WIRQENCLR (0x60) - Interrupt Enable Clear**: Write 1 to bits here to disable specific watchdog interrupts.

## Typical Usage Flow

1. **Configure**: Set up WLDR with your desired timeout value
2. **Enable Interrupts** (optional): Use WIRQENSET if you want interrupt notification before reset
3. **Start**: Write the start sequence to WSPR
4. **Service**: Periodically write to WTGR to prevent timeout
5. **Monitor**: Check WWPS to ensure writes have taken effect

## Important Notes

The **Write Posting** concept (WWPS register) is crucial - you must check this register after writing to WLDR, WTGR, or WSPR to ensure the write has actually taken effect in the 32kHz clock domain before proceeding.

The interrupt registers suggest you can get a warning interrupt before the actual reset occurs, giving your software a last chance to save critical data or attempt recovery.

Would you like me to explain any specific register in more detail, or are you interested in seeing how these would be used in actual code sequences?

___

قرأت الـ docs بتاعت [barebox watchdog](https://www.barebox.org/doc/latest/user/watchdog.html)
تعليقى الوحيد: كل الـ internal vars مالكش دعوه بيها, مش مهمه, الأداه الوحيده اللى ليها لزمه فى التحكم فى الـ watchdog هو امر wd وامر devinfo wdogX
ماتلعبش فى اى قيم تانيه

_____

## 20.4.3 Functional Description
### 20.4.3.1 Power Management
**إدارة الطاقة في Watchdog Timer:**

الـ watchdog timer بتاعنا ده شغال بـ **clock domains** مختلفة - فيه **اتنين clock domains** أساسيين:

**الأول - Functional Clock Domain:**

- الـ clock ده اسمه `WDTi_FCLK` وده بيشتغل بتردد **32 kHz**
- ده الـ clock الأساسي اللي بيخلي الـ watchdog timer يشتغل من جوا
- كل العمليات الداخلية للـ timer زي العد والـ prescaler بتعتمد على الـ clock ده
- التردد ده بطيء نسبياً (32 ألف دورة في الثانية) عشان كده الـ timer يقدر يعد لفترات طويلة

**التاني - Interface Clock Domain:**

- الـ clock ده اسمه `WDTi_ICLK` وده بيشتغل بتردد **125 MHz**
- ده مسؤول عن ربط الـ watchdog timer بالـ **L4 interconnect**
- كل الـ register accesses (القراءة والكتابة في الregisters) بتحصل متزامنة مع الـ clock ده
- التردد ده سريع جداً (125 مليون دورة في الثانية) عشان يضمن سرعة الوصول للـ registers

**النقطة المهمة جداً:** في الـ AM335x، الـ clocks دي **مش بتقفل خالص** - يعني always ON. زى نبض القلب. مش زي peripherals تانية اللي ممكن نوقف الـ clock بتاعها لتوفير الطاقة. الـ watchdog timer لازم يفضل شغال دايماً عشان يقدر يعمل reset للنظام لو حصلت مشكلة.

---
### ايه هو L4 

الـ **L4 Interconnect** ده زي **الطرق السريعة** جوا الـ chip اللي بتربط كل حاجة ببعض!

**إيه هو L4 Interconnect:**

- ده نوع من الـ **system bus architecture** اللي Texas Instruments بتستخدمه
- اسمه جاي من "**Level 4**" في هرمية الـ interconnect
- هو عبارة عن **شبكة مواصلات داخلية** بتخلي كل الـ components في الـ SoC تتكلم مع بعض

**إزاي الموضوع بيشتغل:**

- الـ **CPU** عايز يوصل لأي **peripheral** (زي الـ watchdog timer)
- بدل ما يروح مباشرة، بيعدي من خلال الـ **L4 interconnect**
- الـ L4 ده بيعمل زي **المرور المروري** - بينظم مين يوصل لمين وإمتى

**ليه مهم للـ Watchdog Timer:**

- الـ watchdog timer عنده **interface clock** سريعة (125 MHz)
- الـ clock دي متزامنة مع الـ L4 interconnect
- لما الـ CPU يعوز يكتب في register زي `WDT_WSPR`، الكلام ده بيعدي من الـ L4
____
### هل فيه حاجه المفروض اعرفها عن WDTi_FCLK وعن WDTi_ICLK زياده؟

==**الـ WDTi_FCLK (32 kHz) - الـ Functional Clock:**==

**مصدرها إيه:**

- مش بتجي من الـ main system clock
- بتجي من الـ **32 kHz RTC oscillator** اللي في الـ AM335x
- ده oscillator منفصل ومستقل عن باقي الـ clocks في النظام
- **ليه 32 kHz؟** عشان ده تردد الـ crystal اللي بيُستخدم في الـ Real-Time Clock

**خصائص مهمة:**

- **مستقرة جداً** ومش بتتأثر بتغييرات الـ CPU frequency
- **بتفضل شغالة** حتى لو النظام دخل في power saving modes
- **مش بتتوقف** حتى لو الـ main system clock اتوقف
- **دقيقة جداً** في التوقيت عشان كده مناسبة للـ watchdog timing

==**الـ WDTi_ICLK (125 MHz) - الـ Interface Clock:**==

**مصدرها إيه:**

- بتجي من الـ **CORE_CLKOUTM4** أو **PER_CLKOUTM2**
- دي مشتقة من الـ **DPLL (Digital Phase-Locked Loop)**
- مربوطة بالـ **L4 peripheral clock domain**

**ليه 125 MHz تحديداً:**

- ده التردد الأمثل للـ **L4 interconnect** في الـ AM335x
- يضمن **single cycle access** للـ registers
- متوافق مع باقي الـ **L4 peripherals** في النظام
___
## 20.4.3.2 Interrupts
**الـ Watchdog Timer بيقدر يولد نوعين interrupts:**

**النوع الأول - Overflow Interrupt (EVENT_OVF):**

- ده بيحصل لما الـ **counter يوصل لآخره** (يعمل overflow)
- الـ flag بتاعه في الـ `WDT_WIRQSTAT[0]`
- بيتفعل/يتلغى من خلال `WDT_WIRQENSET[0]` أو `WDT_WIRQENCLR[0]`
- **الفكرة:** ده تحذير إن الـ system هيتعمله reset دلوقتي

**النوع التاني - Delay Interrupt (EVENT_DLY):**

- ده بيحصل لما الـ **counter يوصل لقيمة معينة** قبل الـ overflow
- الـ flag بتاعه في الـ `WDT_WIRQSTAT[1]`
- بيتفعل/يتلغى من خلال `WDT_WIRQENSET[1]` أو `WDT_WIRQENCLR[1]`
- **الفكرة:** ده تحذير مبكر إن الـ reset قريب يحصل

**إزاي الـ Interrupt Mechanism بيشتغل:**

1. لما الـ **event** يحصل، الـ flag في الـ `WDT_WIRQSTAT` بتبقى **1**
2. لو الـ **enable bit** في الـ `WDT_WIRQENSET` كمان **1**
3. الـ **WDTi_IRQ line** بيتفعل (active low)
4. عشان تشيل الـ interrupt، لازم تكتب **1** في الـ flag بتاع الـ `WDT_WIRQSTAT`
### English Technical Analysis:

**Watchdog Timer Interrupt Architecture:**

**Two Independent Interrupt Sources:**

**1. Overflow Interrupt (EVENT_OVF):**

- **Trigger Condition:** Counter reaches 0xFFFFFFFF and overflows
- **Status Register:** `WDT_WIRQSTAT[0] EVENT_OVF`
- **Control Registers:**
    - Enable: `WDT_WIRQENSET[0] OVF_IT_ENA = 1`
    - Disable: `WDT_WIRQENCLR[0] OVF_IT_ENA = 1`
- **IRQ Line:** WDTINT
- **Purpose:** Notification that system reset is imminent

**2. Delay Interrupt (EVENT_DLY):**

- **Trigger Condition:** Counter value matches `WDT_WDLY` register value
- **Status Register:** `WDT_WIRQSTAT[1] EVENT_DLY`
- **Control Registers:**
    - Enable: `WDT_WIRQENSET[1] DLY_IT_ENA = 1`
    - Disable: `WDT_WIRQENCLR[1] DLY_IT_ENA = 1`
- **IRQ Line:** WDTINT (same line as overflow)
- **Purpose:** Early warning system before actual reset occurs

**Interrupt Generation Logic:**

```
IRQ_OUTPUT = (EVENT_OVF & OVF_IT_ENA) | (EVENT_DLY & DLY_IT_ENA)
```

**Critical Implementation Details:**

**Interrupt Handling Sequence:**

1. **Event occurs** → Status bit set to 1
2. **If enabled** → IRQ line asserted (active low)
3. **ISR execution** → Read `WDT_WIRQSTAT` to identify source
4. **Clear interrupt** → Write 1 to the specific status bit
5. **IRQ line deasserted** → Interrupt cleared

**Register Programming Model:**

c

```c
// Enable overflow interrupt
WDT_WIRQENSET |= (1 << 0);  // OVF_IT_ENA = 1

// Enable delay interrupt  
WDT_WIRQENSET |= (1 << 1);  // DLY_IT_ENA = 1

// In ISR - check and clear interrupts
uint32_t status = WDT_WIRQSTAT;
if (status & (1 << 0)) {
    // Handle overflow interrupt
    WDT_WIRQSTAT = (1 << 0);  // Clear by writing 1
}
if (status & (1 << 1)) {
    // Handle delay interrupt  
    WDT_WIRQSTAT = (1 << 1);  // Clear by writing 1
}
```

**Key Design Considerations:**

**Shared IRQ Line:**

- Both interrupts use the **same IRQ line (WDTINT)**
- Software must **read status register** to determine interrupt source
- **Prioritization** is software-controlled

**Clock Domain Synchronization:**

- Interrupt events generated in **functional clock domain** (32 kHz)
- Status register updates in **interface clock domain** (125 MHz)
- **Synchronization latency** exists between event and status bit update

**Critical Timing Notes:**

- **Write-to-clear mechanism:** Writing 0 has no effect, only writing 1 clears
- **Order independence:** Enable and status bits can be set in any order
- **Fast acknowledge:** Reading status and writing back enables quick ISR processing

**Practical Use Cases:**

**Delay Interrupt Strategy:**

```
WDT_WLDR = 0x00000000;     // Start from 0
WDT_WDLY = 0xFFFFF000;     // Trigger at ~97% of full count
// This gives early warning with ~3% time remaining before reset
```

This interrupt architecture provides both **early warning capability** (delay interrupt) and **final notification** (overflow interrupt) for robust watchdog timer management.

____
## 20.4.3.3 General Watchdog Timer Operation

**الفكرة العامة لشغل الـ Watchdog Timer:**

الـ watchdog timer ده مبني على **32-bit upward counter** (عداد بيعد لفوق) مع **prescaler**. لما العداد يوصل لآخره، بيبعت **إشارتين منفصلتين**:

- **Reset signal** - عشان يعمل reset للنظام (active low)
- **Interrupt signal** - عشان ينبه البرنامج (active low)

**مكونات النظام:**

**1. الـ Prescaler:**

- بيقسم الـ clock من 1 لحد 128
- بيتحكم فيه من الـ `WDT_WCLR[4:2] PTV` و `WDT_WCLR[5] PRE`
- يعني لو عندك 32 kHz، ممكن تخليها تبقى 32kHz ÷ 128 = 250 Hz

**2. الـ 32-bit Counter:**

- بيعد من القيمة اللي في `WDT_WLDR` لحد 0xFFFFFFFF
- لما يوصل للآخر، بيعمل **overflow** و **reset pulse**
- بعدها بيرجع تاني للقيمة اللي في `WDT_WLDR` ويبدأ من جديد

**3. طرق التحكم:**

- **قراءة العداد:** من `WDT_WCRR` (بس محتاج طريقة خاصة)
- **تغيير القيمة المبدئية:** `WDT_WLDR`
- **إعادة تحميل يدوي:** `WDT_WTGR`
- **تشغيل/إيقاف:** `WDT_WSPR` (بتسلسل معين)

### English Technical Analysis:

**Comprehensive Watchdog Timer Operation:**

The AM335x watchdog timer implements a **hardware-based system monitoring architecture** using a simple but robust design principle: a continuously running counter that generates system reset when it overflows.

**Core Architecture Components:**

**1. 32-bit Upward Counter:**

- **Starting Value:** Loaded from `WDT_WLDR` register
- **Count Direction:** Always upward (incrementing)
- **Overflow Condition:** When counter reaches 0xFFFFFFFF
- **Post-overflow Behavior:** Automatically reloads from `WDT_WLDR` and continues
- **Clock Source:** Prescaled functional clock (32 kHz divided by prescaler)

**2. Prescaler Stage:**

- **Purpose:** Clock division to extend timeout periods
- **Range:** 1:1 to 1:128 division ratios
- **Control:** `WDT_WCLR[5] PRE` (enable) + `WDT_WCLR[4:2] PTV` (ratio)
- **Implementation:** Binary counter providing power-of-2 divisions

**3. Dual Output Generation:**

```
Counter Overflow → { Reset Pulse (to PRCM)
                  { Interrupt Signal (to INTC)
```

**Operational Flow Diagram:**

```
WDT_WLDR → Counter → Prescaler → 32kHz Clock
    ↑         ↓
    └─── Auto Reload ←─── Overflow Detection
                              ↓
                         { RESET Pulse
                         { IRQ Signal
```

**Register Interaction Model:**

**Real-time Monitoring:**

- `WDT_WCRR` provides **current counter value**
- Updated every prescaled clock cycle
- **Special read procedure required** for coherent 32-bit access

**Manual Control Operations:**

- `WDT_WLDR` modification: Changes reload value (effective after next overflow/trigger)
- `WDT_WTGR` write: Immediate reload without reset generation
- `WDT_WSPR` sequences: Start/stop timer operation

**Interrupt Generation Mechanism:**

The watchdog uses **two independent interrupt sources**:

- **Overflow interrupt:** Generated simultaneously with reset pulse
- **Delay interrupt:** Generated when counter matches `WDT_WDLY` value

**Control Logic:**

c

```c
// Interrupt generation
IRQ_ACTIVE = (OVERFLOW_EVENT & OVF_ENABLE) | (DELAY_EVENT & DLY_ENABLE)

// Reset generation  
RESET_PULSE = OVERFLOW_EVENT & TIMER_ENABLED
```

**Key Operational Characteristics:**

**1. Continuous Operation:**

- Timer runs **independently of CPU state**
- **Cannot be paused** by software (except debug mode)
- **Survives most power management transitions**

**2. Reload Mechanisms:**

c

```c
// Automatic reload (with reset)
// Happens on overflow - no software intervention

// Manual reload (without reset)  
WDT_WTGR = any_value_different_from_previous;

// Programmed reload (change load value)
// Stop timer → Modify WDT_WLDR → Start timer → Trigger reload
```

**3. Timing Precision:**

- **Base accuracy:** Determined by 32 kHz crystal (typically ±20 ppm)
- **Prescaler precision:** Exact binary division (no drift)
- **Software reload latency:** 1.5-2.5 functional clock cycles

**Critical Design Implications:**

**Safety-Critical Behavior:**

- **Default state:** Enabled after reset with 2-second timeout
- **Fail-safe operation:** Hardware reset if software becomes unresponsive
- **Independent timing:** Not affected by CPU frequency changes or hangs

**Programming Model Considerations:**

- **Register synchronization:** Some operations require polling `WDT_WWPS`
- **Clock domain crossing:** Interface (125 MHz) vs. Functional (32 kHz) timing
- **Write ordering:** Certain register updates have specific sequencing requirements

**Practical Implementation Example:**

c

```c
// Typical watchdog service routine
void service_watchdog(void) {
    static uint32_t reload_value = 0;
    
    // "Pet the dog" - reload counter
    WDT_WTGR = reload_value++;
    
    // This resets the counter to WDT_WLDR value
    // without generating reset pulse
}

// Called periodically by main application
// Frequency must be < watchdog timeout period
```

This architecture provides **hardware-enforced system reliability** while maintaining **software control flexibility** for normal operation.






























### 20.4.3.4 Reset Context
**وضع الـ Watchdog Timer بعد الـ Reset:**

**نقطة مهمة جداً:** الـ watchdog timers بتكون **مفعلة automatically** بعد أي reset! مش زي peripherals تانية اللي بتكون مقفولة.

**القيم الافتراضية بعد الـ Reset:**

حسب الجدول في الدوكيومنت:

- **WDT_WLDR Reset Value:** `0xFFFF FFBE`
- **PTV Reset Value:** `0` (يعني prescaler = 1، مفيش تقسيم)

**يعني إيه الكلام ده:**

- الـ counter هيبدأ من `0xFFFF FFBE`
- هيعد لفوق لحد `0xFFFF FFFF`
- الفرق = `0xFFFF FFFF - 0xFFFF FFBE + 1 = 66` counts
- with 32 kHz clock: `66 × (1/32000) = 2.0625 ms`

**بس انتبه!** ده مش الـ reset period الحقيقي اللي هو **2 ثانية**. ده معناه إن فيه حاجة تانية بتأثر في الحسبة.

**أهمية قراءة الـ Configuration:**

```c
// عشان تعرف الإعدادات الحالية للـ module
uint32_t ptv_value = (WDT_WCLR >> 2) & 0x7;  // PTV[4:2]
uint32_t load_value = WDT_WLDR;              // Load register
```

---

### English Technical Analysis:

**Reset Context Behavior and Implications:**

**Critical Reset Behavior:** The watchdog timers are **automatically enabled** following any system reset. This is a fundamental safety feature - unlike most peripherals that start in a disabled state, the watchdog immediately begins countdown operation to ensure system reliability from the moment of startup.

**Default Reset Configuration Analysis:**

**Register Reset Values:**

```c
WDT_WLDR = 0xFFFF_FFBE  // Load register
PTV      = 0            // Prescaler value (no division)
PRE      = 0            // Prescaler disabled initially
```

**Initial Countdown Calculation:**

```
Counter Range: 0xFFFF_FFBE to 0xFFFF_FFFF
Count Steps: 0xFFFF_FFFF - 0xFFFF_FFBE + 1 = 0x42 = 66 decimal
Time Period: 66 × (1/32kHz) = 2.0625 ms
```

**Wait - This Doesn't Match the 2-Second Default!**

The discrepancy suggests there are additional factors:

1. **Prescaler Configuration:** The actual default might include prescaler settings
2. **Different Load Value:** The documented table might be simplified
3. **Additional Reset Logic:** There may be initialization sequences that modify these values

**Real Default Reset Period:** According to Table 20-105: **2 seconds** with 32 kHz clock source

**Reverse Engineering the Real Configuration:**

```c
// For 2-second timeout with 32 kHz clock:
// Required counts = 2 seconds × 32000 Hz = 64000 counts
// With counter range: 0xFFFF_FFFF - Load_Value + 1 = 64000
// Therefore: Load_Value = 0xFFFF_FFFF - 64000 + 1 = 0xFFFF_0401

// OR with prescaler:
// If prescaler = 2 (PTV=1, PRE=1):
// Required counts = 64000 / 2 = 32000
// Load_Value = 0xFFFF_FFFF - 32000 + 1 = 0xFFFF_8301
```

**Configuration Reading Strategy:**

**Software Must Read Actual Configuration:**

```c
typedef struct {
    uint32_t load_value;
    uint8_t  ptv_value;
    bool     prescaler_enabled;
    uint32_t effective_timeout;
} watchdog_config_t;

watchdog_config_t read_watchdog_config(void) {
    watchdog_config_t config;
    
    // Read current configuration
    config.load_value = WDT_WLDR;
    config.ptv_value = (WDT_WCLR >> 2) & 0x7;
    config.prescaler_enabled = (WDT_WCLR >> 5) & 0x1;
    
    // Calculate effective timeout
    uint32_t prescaler = config.prescaler_enabled ? (1 << config.ptv_value) : 1;
    uint32_t counts = (0xFFFFFFFF - config.load_value + 1);
    config.effective_timeout = (counts * prescaler) / 32000; // seconds
    
    return config;
}
```

**Reset Context Programming Implications:**

**1. Immediate Action Required:**

```c
void early_boot_watchdog_handle(void) {
    // System just reset - watchdog already counting!
    
    // Option 1: Service immediately to buy time
    WDT_WTGR = 0x1234;  // Pet the dog
    
    // Option 2: Disable if not needed yet
    // (Stop sequence)
    
    // Option 3: Reconfigure quickly
    // (Stop, configure, start sequence)
}
```

**2. Boot Loader Considerations:**

- **Boot time constraint:** Must complete initialization within 2 seconds
- **Handoff protocol:** Boot loader must either service or reconfigure watchdog
- **Reset loop prevention:** Ensure boot process completes faster than watchdog timeout

**3. System Initialization Sequence:**

```c
void system_init(void) {
    // 1. Read current watchdog configuration
    watchdog_config_t current = read_watchdog_config();
    
    // 2. Service watchdog to prevent reset during init
    WDT_WTGR = 0x5555;
    
    // 3. Continue with system initialization...
    // (Keep servicing periodically)
    
    // 4. Configure final watchdog settings
    configure_production_watchdog();
}
```

**Critical Design Considerations:**

**Power-On Reset Behavior:**

- **Immediate activation:** No grace period for software setup
- **Conservative timeout:** Default 2 seconds provides reasonable boot time
- **Non-volatile configuration:** Reset values are hardware-defined, not software-programmable

**Software Architecture Impact:**

- **Early initialization:** Watchdog handling must be among first boot tasks
- **Interrupt service:** Consider enabling early interrupt handling for watchdog events
- **Fail-safe design:** System must handle watchdog reset gracefully

**Debug and Development:**

```c
// Check if reset was caused by watchdog
void check_reset_source(void) {
    // Implementation depends on PRCM reset status registers
    // Typically involves reading reset reason flags
    if (reset_was_watchdog_caused()) {
        // Handle watchdog reset scenario
        log_watchdog_reset_event();
        // Potentially adjust watchdog timeout
    }
}
```

This reset context behavior ensures **immediate system protection** while requiring **proactive software management** from the earliest stages of system operation.

## 20.4.3.5 Overflow/Reset Generation 
**إيه اللي بيحصل لما الـ Counter يعمل Overflow:**

**لحظة الـ Overflow:** لما الـ watchdog timer counter (`WDT_WCRR`) يوصل للآخر ويعمل overflow، بيحصل الآتي **في نفس اللحظة:**

1. **الـ Reset Pulse بيتولد:**
    
    - ده **active-low pulse** يعني الإشارة بتنزل من HIGH لـ LOW
    - بيروح للـ **PRCM module** (Power, Reset, Clock Management)
    - عرض الـ pulse ده = **واحد prescaled timer clock cycle**

2. **الـ PRCM بيستقبل الـ Pulse:**
    
    - الـ PRCM module بياخد الـ reset pulse ده
    - يحوله لـ **global WARM reset** للجهاز كله
    - الـ **nRESETIN_OUT pin** بيطلع من الـ device عشان يعمل reset للنظام الخارجي

**بعد توليد الـ Reset:**

**Automatic Reload:**

- الـ counter بيترجع تلقائياً للقيمة اللي في `WDT_WLDR`
- الـ prescaler بيتعمله reset (بس الـ ratio يفضل زي ما هو)
- الـ timer بيبدأ يعد تاني من جديد **فوراً**

**مثال توضيحي:**

```
Counter: 0xFFFFFFFE → 0xFFFFFFFF → OVERFLOW!
                                     ↓
                               Reset Pulse → PRCM → System Reset
                                     ↓
Counter: WDT_WLDR → Start counting again...
```

---

### English Technical Analysis:

**Overflow/Reset Generation Mechanism:**

**Precise Overflow Sequence:**

When the watchdog timer counter register (`WDT_WCRR`) reaches its maximum value (0xFFFFFFFF) and increments, several **simultaneous hardware events** occur:

**1. Reset Pulse Generation:**

- **Signal Type:** Active-low pulse (HIGH → LOW → HIGH)
- **Pulse Width:** Exactly **one prescaled timer clock cycle**
- **Target:** PRCM (Power, Reset, Clock Management) module
- **Timing:** Occurs at the **exact moment** of counter overflow

**2. PRCM Reset Processing:**

```
WDT Reset Pulse → PRCM Module → Global WARM Reset → nRESETIN_OUT Pin
```

**Reset Signal Path:**

- **Input:** Watchdog reset pulse (internal)
- **Processing:** PRCM generates system-wide warm reset
- **Output:** `nRESETIN_OUT` pin driven LOW externally
- **Scope:** Affects entire device and external system components

**3. Automatic Recovery Sequence:**

**Immediate Actions (Hardware-Controlled):**

```c
// These happen automatically in hardware:
WDT_WCRR = WDT_WLDR;           // Counter reloaded
prescaler_counter = 0;          // Prescaler reset
timer_enabled = previous_state; // Timer continues if was enabled
```

**Post-Reset Behavior:**

- **Counter reload:** Immediate, no software intervention
- **Prescaler reset:** Counter portion only, ratio preserved
- **Continuous operation:** Timer immediately resumes counting
- **No configuration loss:** Control register settings maintained

**Timing Analysis:**

**Pulse Width Calculation:**

```c
// Pulse width = 1 prescaled clock cycle
// If functional clock = 32 kHz, prescaler = 64:
effective_clock = 32000 / 64 = 500 Hz
pulse_width = 1 / 500 = 2 ms

// If no prescaler (divider = 1):
pulse_width = 1 / 32000 = 31.25 μs
```

**Reset Propagation Timing:**

1. **Overflow detection:** < 1 functional clock cycle
2. **Pulse generation:** Immediate (combinatorial logic)
3. **PRCM processing:** 1-2 PRCM clock cycles
4. **External pin assertion:** 1-2 interface clock cycles
5. **Total delay:** Typically < 100 μs from overflow to external reset

**Critical Implementation Details:**

**Warm Reset vs Cold Reset:**

- **Warm Reset:** Preserves some system state, faster recovery
- **Scope:** CPU, peripherals, some registers
- **Preservation:** Clock configurations, some control registers
- **Boot time:** Faster than full power-on reset

**Reset Loop Prevention:**

```c
// Potential reset loop scenario:
// 1. System starts
// 2. Initialization takes > 2 seconds  
// 3. Watchdog resets system
// 4. Back to step 1 → infinite loop

void prevent_reset_loop(void) {
    // Service watchdog early in boot
    WDT_WTGR = 0x1234;  // Immediate reload
    
    // Continue initialization...
    // Service periodically during long init
}
```

**Reset Source Identification:**

```c
// Check if reset was caused by watchdog
bool was_watchdog_reset(void) {
    // Read PRCM reset status registers
    // Implementation specific to AM335x PRCM
    uint32_t reset_status = PRM_RSTST;
    return (reset_status & WATCHDOG_RESET_FLAG) != 0;
}
```

**Design Considerations:**

**Hardware Reset vs Software Reset:**

- **Hardware advantage:** Works even if CPU is hung
- **Software limitation:** Cannot reset if CPU is non-responsive
- **Reliability:** Hardware reset provides ultimate system recovery

**External System Impact:**

```
Watchdog Reset → nRESETIN_OUT → External Components Reset
                                      ↓
                               Power supplies, peripherals,
                               companion chips all reset
```

**Development and Debug Implications:**

**Debug Mode Handling:**

```c
// Configure watchdog for debug sessions
void setup_debug_watchdog(void) {
    // Allow debugger to stop watchdog during breakpoints
    WDT_WDSC &= ~(1 << 1);  // EMUFREE = 0
    
    // Configure debug subsystem suspend control
    // (See Section 20.4.3.12 for details)
}
```

**Production Monitoring:**

```c
// Log watchdog resets for system health monitoring
void log_watchdog_reset(void) {
    if (was_watchdog_reset()) {
        // Increment reset counter in non-volatile storage
        // Log timestamp and system state
        // Potentially adjust watchdog timeout
        
        // Clear reset status flags
        clear_reset_status_flags();
    }
}
```

**Figure 20-98 Functional View Explanation:** The document references a functional view showing the complete cycle:

- **Load register (`WDT_WLDR`)** → **Counter register (`WDT_WCRR`)**
- **Trigger register (`WDT_WTGR`)** for manual reload
- **Delay register (`WDT_WDLY`)** for early warning interrupt
- **Overflow condition** generates both reset pulse and continues operation

This mechanism ensures **continuous system monitoring** with **automatic recovery** while maintaining **predictable timing behavior** for reliable system operation.


## 20.4.3.6 Prescaler Value/Timer Reset Frequency - شرح مفصل
**إعدادات الـ Prescaler وحساب معدل الـ Reset:**

**جدول الـ Prescaler الكامل:**

الـ prescaler بيتحكم فيه من الـ `WDT_WCLR` register:

- **PRE bit [5]:** يفعل/يلغي الـ prescaler
- **PTV bits [4:2]:** يحدد نسبة التقسيم

|PRE|PTV|Clock Divider|ناتج التقسيم من 32 kHz|
|---|---|---|---|
|0|X|1|32,000 Hz|
|1|0|1|32,000 Hz|
|1|1|2|16,000 Hz|
|1|2|4|8,000 Hz|
|1|3|8|4,000 Hz|
|1|4|16|2,000 Hz|
|1|5|32|1,000 Hz|
|1|6|64|500 Hz|
|1|7|128|250 Hz|

**معادلة التقسيم:**

```
Clock Divider = 2^PTV (when PRE = 1)
Effective Clock = 32kHz / Clock Divider
```

**حساب Reset Frequency:**

**المعادلة الأساسية:**

```
OVF_Rate = (0xFFFFFFFF - WDT_WLDR + 1) × (1/Effective_Clock)
```

**أمثلة عملية:**

مع `WDT_WLDR = 0x00000000` (بداية من صفر):

|PTV|Prescaler|Effective Clock|Reset Period|
|---|---|---|---|
|0|1|32 kHz|37.27 ساعة|
|1|2|16 kHz|74.54 ساعة|
|2|4|8 kHz|149.1 ساعة|
|3|8|4 kHz|298.3 ساعة|
|4|16|2 kHz|596.5 ساعة|
|5|32|1 kHz|1193 ساعة|
|6|64|500 Hz|2386 ساعة|
|7|128|250 Hz|4772 ساعة|

---

### English Technical Analysis:

**Prescaler Configuration and Reset Frequency Calculations:**

**Complete Prescaler Truth Table:**

The prescaler is controlled by two fields in the `WDT_WCLR` register:

- **PRE [bit 5]:** Prescaler enable/disable
- **PTV [bits 4:2]:** Prescaler value (3-bit field)

|PRE|PTV|Clock Divider|Formula|Effective Clock|
|---|---|---|---|---|
|0|X|1|-|32.000 kHz|
|1|0|1|2^0|32.000 kHz|
|1|1|2|2^1|16.000 kHz|
|1|2|4|2^2|8.000 kHz|
|1|3|8|2^3|4.000 kHz|
|1|4|16|2^4|2.000 kHz|
|1|5|32|2^5|1.000 kHz|
|1|6|64|2^6|500 Hz|
|1|7|128|2^7|250 Hz|

**Mathematical Foundation:**

**Divider Calculation:**

```c
uint32_t calculate_prescaler_divider(uint8_t pre, uint8_t ptv) {
    if (pre == 0) return 1;
    return (1 << ptv);  // 2^PTV
}
```

**Effective Clock Frequency:**

```c
uint32_t calculate_effective_clock(uint8_t pre, uint8_t ptv) {
    uint32_t divider = calculate_prescaler_divider(pre, ptv);
    return 32000 / divider;  // 32 kHz base clock
}
```

**Reset Frequency/Period Calculations:**

**Core Formula:**

```
Counter_Range = 0xFFFFFFFF - WDT_WLDR + 1
Reset_Period_Seconds = Counter_Range / Effective_Clock_Hz
```

**Complete Range Analysis (WDT_WLDR = 0x00000000):**

|PTV|Divider|Eff. Clock|Counter Range|Reset Period|
|---|---|---|---|---|
|0|1|32000 Hz|4294967296|134,217.7 sec (37.3 hrs)|
|1|2|16000 Hz|4294967296|268,435.5 sec (74.5 hrs)|
|2|4|8000 Hz|4294967296|536,870.9 sec (149.1 hrs)|
|3|8|4000 Hz|4294967296|1,073,741.8 sec (298.3 hrs)|
|4|16|2000 Hz|4294967296|2,147,483.6 sec (596.5 hrs)|
|5|32|1000 Hz|4294967296|4,294,967.3 sec (1193 hrs)|
|6|64|500 Hz|4294967296|8,589,934.6 sec (2386 hrs)|
|7|128|250 Hz|4294967296|17,179,869.2 sec (4772 hrs)|

**Practical Configuration Examples:**

**1. Standard Application Timeouts:**

```c
// 10-second timeout
// Required counts = 10 × 32000 = 320000
// WDT_WLDR = 0xFFFFFFFF - 320000 + 1 = 0xFFFB1E01
WDT_WCLR = (0 << 5) | (0 << 2);  // PRE=0, PTV=0 (no prescaler)
WDT_WLDR = 0xFFFB1E01;

// 1-minute timeout using prescaler
// With PTV=5 (prescaler=32): effective_clock = 1000 Hz
// Required counts = 60 × 1000 = 60000
// WDT_WLDR = 0xFFFFFFFF - 60000 + 1 = 0xFFFF1561
WDT_WCLR = (1 << 5) | (5 << 2);  // PRE=1, PTV=5
WDT_WLDR = 0xFFFF1561;
```

**2. High-Precision Short Timeouts:**

```c
// 100ms timeout (no prescaler for precision)
// Required counts = 0.1 × 32000 = 3200
// WDT_WLDR = 0xFFFFFFFF - 3200 + 1 = 0xFFFFF381
WDT_WCLR = (0 << 5) | (0 << 2);  // No prescaler
WDT_WLDR = 0xFFFFF381;
```

**3. Very Long Timeouts:**

```c
// 24-hour timeout using maximum prescaler
// With PTV=7 (prescaler=128): effective_clock = 250 Hz
// Required counts = 24×3600×250 = 21,600,000
// WDT_WLDR = 0xFFFFFFFF - 21600000 + 1 = 0xFEB49601
WDT_WCLR = (1 << 5) | (7 << 2);  // PRE=1, PTV=7
WDT_WLDR = 0xFEB49601;
```

**Advanced Calculation Functions:**

```c
typedef struct {
    uint32_t load_value;
    uint8_t pre;
    uint8_t ptv;
    double period_seconds;
} watchdog_config_t;

watchdog_config_t calculate_optimal_config(double desired_seconds) {
    watchdog_config_t config;
    
    // Try different prescaler values to find best fit
    for (uint8_t ptv = 0; ptv <= 7; ptv++) {
        uint32_t divider = (1 << ptv);
        uint32_t effective_clock = 32000 / divider;
        uint32_t required_counts = (uint32_t)(desired_seconds * effective_clock);
        
        // Check if fits in counter range
        if (required_counts <= 0xFFFFFFFF) {
            config.pre = 1;
            config.ptv = ptv;
            config.load_value = 0xFFFFFFFF - required_counts + 1;
            config.period_seconds = (double)required_counts / effective_clock;
            return config;
        }
    }
    
    // Use maximum prescaler if nothing fits
    config.pre = 1;
    config.ptv = 7;
    config.load_value = 0x00000000;  // Maximum possible period
    config.period_seconds = 17179869.2;  // ~4772 hours
    return config;
}
```

**Precision and Accuracy Considerations:**

**Clock Source Accuracy:**

- **32 kHz crystal tolerance:** Typically ±20 ppm
- **Temperature drift:** ±5-10 ppm over operating range
- **Aging:** ±1-2 ppm per year

**Calculation Precision:**

```c
// High-precision period calculation
double calculate_exact_period(uint32_t load_value, uint8_t pre, uint8_t ptv) {
    uint32_t divider = (pre == 0) ? 1 : (1 << ptv);
    double effective_clock = 32768.0 / divider;  // Use exact 32.768 kHz
    uint64_t counts = 0x100000000ULL - load_value;  // Avoid overflow
    return (double)counts / effective_clock;
}
```

**Register Programming Sequence:**

```c
void configure_prescaler(uint8_t pre, uint8_t ptv) {
    // Must stop timer first
    stop_watchdog_timer();
    
    // Configure prescaler
    uint32_t wclr_value = (pre << 5) | (ptv << 2);
    WDT_WCLR = wclr_value;
    
    // Poll for completion
    while (WDT_WWPS & W_PEND_WCLR);
    
    // Restart timer
    start_watchdog_timer();
}
```

This prescaler architecture provides **flexible timeout ranges** from **microseconds to thousands of hours** while maintaining **precise mathematical relationships** for predictable system behavior.

### طيب لو عايز الـ reset يحصل بعد 60 ثانية

**طريقة الحساب:**

**الهدف:** Reset بعد 60 ثانية بالضبط

**الخطوات:**

**1. حساب الـ Counts المطلوبة:**

```
Required_Counts = Time × Effective_Clock
Required_Counts = 60 seconds × Effective_Clock
```

**2. اختيار الـ Prescaler المناسب:**

عندنا خيارات مختلفة:

**الخيار الأول - بدون Prescaler:**

```
Effective_Clock = 32,000 Hz
Required_Counts = 60 × 32,000 = 1,920,000
WDT_WLDR = 0xFFFFFFFF - 1,920,000 + 1 = 0xFFE2C001
```

**الخيار التاني - مع Prescaler=32:**

```
PTV = 5, PRE = 1
Effective_Clock = 32,000 ÷ 32 = 1,000 Hz
Required_Counts = 60 × 1,000 = 60,000
WDT_WLDR = 0xFFFFFFFF - 60,000 + 1 = 0xFFFF1561
```

**الكود العملي:**

```c
void configure_60_second_watchdog(void) {
    // توقيف الـ watchdog الأول
    stop_watchdog_timer();
    
    // الطريقة الأولى: بدون prescaler (دقة أعلى)
    WDT_WCLR = (0 << 5) | (0 << 2);    // PRE=0, PTV=0
    while (WDT_WWPS & W_PEND_WCLR);    // انتظار للكتابة
    
    WDT_WLDR = 0xFFE2C001;             // 60 seconds
    while (WDT_WWPS & W_PEND_WLDR);    // انتظار للكتابة
    
    // تشغيل الـ watchdog
    start_watchdog_timer();
    
    // أول reload عشان يبدأ العد
    WDT_WTGR = 0x1234;
    while (WDT_WWPS & W_PEND_WTGR);
}
```

**أو الطريقة الأسهل (مع prescaler):**

```c
void configure_60_second_watchdog_easy(void) {
    stop_watchdog_timer();
    
    // استخدام prescaler=32 عشان الرقم يبقى أبسط
    WDT_WCLR = (1 << 5) | (5 << 2);    // PRE=1, PTV=5 (prescaler=32)
    while (WDT_WWPS & W_PEND_WCLR);
    
    WDT_WLDR = 0xFFFF1561;             // 60 seconds مع prescaler
    while (WDT_WWPS & W_PEND_WLDR);
    
    start_watchdog_timer();
    WDT_WTGR = 0x5678;                 // Pet the dog
    while (WDT_WWPS & W_PEND_WTGR);
}
```

---

### English Implementation:

**60-Second Watchdog Configuration:**

**Calculation Method:**

**Option 1: No Prescaler (Higher Precision)**

```c
// Configuration values
#define WDT_60SEC_NO_PRESCALER_WCLR  0x00    // PRE=0, PTV=0
#define WDT_60SEC_NO_PRESCALER_WLDR  0xFFE2C001

// Calculation:
// Clock = 32,000 Hz
// Counts = 60 × 32,000 = 1,920,000
// WLDR = 0xFFFFFFFF - 1,920,000 + 1 = 0xFFE2C001
```

**Option 2: With Prescaler=32 (Easier Numbers)**

```c
// Configuration values  
#define WDT_60SEC_PRESCALER_WCLR     0x34    // PRE=1, PTV=5 (32x)
#define WDT_60SEC_PRESCALER_WLDR     0xFFFF1561

// Calculation:
// Clock = 32,000 ÷ 32 = 1,000 Hz  
// Counts = 60 × 1,000 = 60,000
// WLDR = 0xFFFFFFFF - 60,000 + 1 = 0xFFFF1561
```

**Complete Implementation:**

```c
#include <stdint.h>
#include <stdbool.h>

// Register definitions (example addresses)
#define WDT_BASE        0x44E35000
#define WDT_WCLR        (*(volatile uint32_t*)(WDT_BASE + 0x24))
#define WDT_WLDR        (*(volatile uint32_t*)(WDT_BASE + 0x2C))
#define WDT_WTGR        (*(volatile uint32_t*)(WDT_BASE + 0x30))
#define WDT_WWPS        (*(volatile uint32_t*)(WDT_BASE + 0x34))
#define WDT_WSPR        (*(volatile uint32_t*)(WDT_BASE + 0x48))

// WWPS bits
#define W_PEND_WCLR     (1 << 0)
#define W_PEND_WLDR     (1 << 2)
#define W_PEND_WTGR     (1 << 3)
#define W_PEND_WSPR     (1 << 4)

bool configure_60_second_watchdog(bool use_prescaler) {
    // Stop watchdog timer
    WDT_WSPR = 0xAAAA;
    while (WDT_WWPS & W_PEND_WSPR);
    
    WDT_WSPR = 0x5555;
    while (WDT_WWPS & W_PEND_WSPR);
    
    if (use_prescaler) {
        // Method 2: With prescaler (cleaner numbers)
        WDT_WCLR = (1 << 5) | (5 << 2);  // PRE=1, PTV=5
        while (WDT_WWPS & W_PEND_WCLR);
        
        WDT_WLDR = 0xFFFF1561;  // 60,000 counts at 1kHz = 60 sec
        while (WDT_WWPS & W_PEND_WLDR);
        
    } else {
        // Method 1: No prescaler (higher precision)
        WDT_WCLR = (0 << 5) | (0 << 2);  // PRE=0, PTV=0
        while (WDT_WWPS & W_PEND_WCLR);
        
        WDT_WLDR = 0xFFE2C001;  // 1,920,000 counts at 32kHz = 60 sec
        while (WDT_WWPS & W_PEND_WLDR);
    }
    
    // Start watchdog timer
    WDT_WSPR = 0xBBBB;
    while (WDT_WWPS & W_PEND_WSPR);
    
    WDT_WSPR = 0x4444;
    while (WDT_WWPS & W_PEND_WSPR);
    
    // Initial reload to start counting
    WDT_WTGR = 0x1234;
    while (WDT_WWPS & W_PEND_WTGR);
    
    return true;
}

// Function to service/pet the watchdog
void service_watchdog(void) {
    static uint32_t reload_value = 0;
    WDT_WTGR = reload_value++;
    while (WDT_WWPS & W_PEND_WTGR);
}

// Verification function
double calculate_actual_timeout(void) {
    uint32_t wclr = WDT_WCLR;
    uint32_t wldr = WDT_WLDR;
    
    bool pre_enabled = (wclr >> 5) & 1;
    uint8_t ptv = (wclr >> 2) & 0x7;
    
    uint32_t divider = pre_enabled ? (1 << ptv) : 1;
    double effective_clock = 32000.0 / divider;
    
    uint64_t counts = 0x100000000ULL - wldr;
    return (double)counts / effective_clock;
}
```

**Usage Example:**

```c
int main(void) {
    // Configure for 60-second timeout
    configure_60_second_watchdog(true);  // Use prescaler method
    
    // Verify configuration
    double timeout = calculate_actual_timeout();
    printf("Actual timeout: %.2f seconds\n", timeout);
    
    while (1) {
        // Main application loop
        
        // Service watchdog every 30 seconds (50% margin)
        service_watchdog();
        
        // Do other work...
        delay_ms(30000);
    }
}
```

**Verification:**

```c
// Test both methods
printf("Method 1 (no prescaler): %.6f seconds\n", 
       1920000.0 / 32000.0);  // = 60.000000

printf("Method 2 (prescaler=32): %.6f seconds\n", 
       60000.0 / 1000.0);     // = 60.000000
```

**أنصح باستخدام الطريقة التانية (مع prescaler)** لأن الأرقام أبسط والكود أوضح، والدقة كافية جداً للتطبيقات العادية.

## 20.4.3.7 Triggering a Timer Reload
**إيه معنى Timer Reload وإزاي نعمله:**

**الفكرة الأساسية:** الـ **Timer Reload** ده معناه إننا نخلي الـ counter يرجع لقيمة البداية (اللي في `WDT_WLDR`) **من غير ما يحصل reset**. ده اللي بنسميه **"Pet the Dog"** - يعني نطعم الكلب عشان ميعضناش!

**طرق عمل Reload:**

**الطريقة الأولى - Manual Reload:**

- نكتب **أي قيمة** في الـ `WDT_WTGR` register
- **شرط مهم:** القيمة الجديدة لازم تكون **مختلفة** عن اللي كتبناها قبل كده
- الـ hardware بيشوف إن القيمة اتغيرت، فبيعمل reload فوراً

**مثال:**

```c
// أول مرة
WDT_WTGR = 0x1234;  // أي قيمة

// تاني مرة لازم تكون مختلفة
WDT_WTGR = 0x5678;  // قيمة مختلفة

// تالت مرة
WDT_WTGR = 0xABCD;  // قيمة مختلفة تاني
```

**الطريقة التانية - Toggle Method:**

```c
static uint32_t toggle_value = 0;

void pet_watchdog(void) {
    WDT_WTGR = toggle_value++;  // قيمة جديدة كل مرة
    // انتظار لحد ما الكتابة تخلص
    while (WDT_WWPS & W_PEND_WTGR);
}
```

**اللي بيحصل جوا الـ Hardware:**

1. كتابة قيمة جديدة في `WDT_WTGR`
2. الـ hardware بيقارن القيمة الجديدة بالقديمة
3. لو مختلفة، بيعمل reload للـ counter من `WDT_WLDR`
4. الـ counter بيبدأ العد من جديد
5. **مفيش reset pulse** - ده الفرق المهم

**Write Synchronization:** عشان الـ clocks مختلفة (125 MHz interface vs 32 kHz functional)، لازم ننتظر:

```c
WDT_WTGR = new_value;
while (WDT_WWPS & W_PEND_WTGR);  // انتظار لحد ما الكتابة تخلص
```

---

### English Technical Analysis:

**Triggering Timer Reload Mechanism:**

**Core Concept:** Timer reload is the process of **resetting the counter to its initial value** (`WDT_WLDR`) **without generating a system reset**. This is the fundamental "watchdog servicing" or "pet the dog" operation.

**Hardware Implementation:**

**Write Detection Logic:**

```
Previous_WTGR_Value ≠ New_WTGR_Value → Trigger Reload
```

The hardware implements a **change detection circuit** that monitors writes to `WDT_WTGR`:

- **Comparator:** Compares new write value with previously stored value
- **Edge Detection:** Triggers reload pulse on value change
- **Storage:** Updates stored value for next comparison

**Reload Sequence:**

```
Write WDT_WTGR → Value Comparison → Reload Trigger → Counter = WDT_WLDR
     (125MHz)      (32kHz sync)      (Hardware)      (Immediate)
```

**Clock Domain Synchronization:**

**Write Timing Analysis:**

- **Interface Write:** WDT_WTGR written at 125 MHz interface clock
- **Functional Processing:** Change detection occurs in 32 kHz domain
- **Synchronization Delay:** 1.5-2.5 functional clock cycles
- **Completion Detection:** WDT_WWPS.W_PEND_WTGR indicates completion

**Critical Implementation Details:**

**1. Value Change Requirement:**

```c
// CORRECT - Different values
WDT_WTGR = 0x1234;  // First write
WDT_WTGR = 0x5678;  // Second write - triggers reload

// INCORRECT - Same value  
WDT_WTGR = 0x1234;  // First write
WDT_WTGR = 0x1234;  // Second write - NO reload triggered!
```

**2. Robust Reload Implementation:**

```c
#define WDT_WTGR_REG    (*(volatile uint32_t*)(WDT_BASE + 0x30))
#define WDT_WWPS_REG    (*(volatile uint32_t*)(WDT_BASE + 0x34))
#define W_PEND_WTGR     (1 << 3)

static uint32_t reload_counter = 0;

bool service_watchdog_robust(void) {
    // Generate unique value each time
    uint32_t new_value = ++reload_counter;
    
    // Write trigger register
    WDT_WTGR_REG = new_value;
    
    // Wait for write completion
    uint32_t timeout = 1000000;  // Prevent infinite loop
    while ((WDT_WWPS_REG & W_PEND_WTGR) && (--timeout > 0));
    
    return (timeout > 0);  // Return success/failure
}
```

**3. Alternative Implementation Methods:**

**Toggle Bit Method:**

```c
static bool toggle_bit = false;

void service_watchdog_toggle(void) {
    toggle_bit = !toggle_bit;
    WDT_WTGR_REG = toggle_bit ? 0xAAAAAAAA : 0x55555555;
    while (WDT_WWPS_REG & W_PEND_WTGR);
}
```

**Timestamp Method:**

```c
void service_watchdog_timestamp(void) {
    // Use system tick or RTC for unique values
    uint32_t timestamp = get_system_tick();
    WDT_WTGR_REG = timestamp;
    while (WDT_WWPS_REG & W_PEND_WTGR);
}
```

**Advanced Reload Strategies:**

**Periodic Service with Margin:**

```c
typedef struct {
    uint32_t timeout_period_ms;
    uint32_t service_interval_ms;
    uint32_t last_service_time;
    double safety_margin;
} watchdog_service_t;

void initialize_watchdog_service(watchdog_service_t* wd, 
                               uint32_t timeout_ms, 
                               double margin_percent) {
    wd->timeout_period_ms = timeout_ms;
    wd->safety_margin = margin_percent / 100.0;
    wd->service_interval_ms = (uint32_t)(timeout_ms * wd->safety_margin);
    wd->last_service_time = get_system_time_ms();
}

bool should_service_watchdog(watchdog_service_t* wd) {
    uint32_t current_time = get_system_time_ms();
    uint32_t elapsed = current_time - wd->last_service_time;
    return (elapsed >= wd->service_interval_ms);
}

void service_if_needed(watchdog_service_t* wd) {
    if (should_service_watchdog(wd)) {
        service_watchdog_robust();
        wd->last_service_time = get_system_time_ms();
    }
}
```

**Reload Verification:**

**Counter Monitoring:**

```c
uint32_t read_counter_safe(void) {
    // Read LSB first, then MSB for coherent 32-bit read
    uint16_t lsb = *(volatile uint16_t*)(WDT_BASE + 0x28);
    uint16_t msb = *(volatile uint16_t*)(WDT_BASE + 0x2A);
    return ((uint32_t)msb << 16) | lsb;
}

bool verify_reload_occurred(uint32_t expected_load_value) {
    uint32_t current_counter = read_counter_safe();
    uint32_t load_value = WDT_WLDR_REG;
    
    // Counter should be close to load value after reload
    uint32_t difference = (current_counter > load_value) ? 
                         (current_counter - load_value) : 
                         (load_value - current_counter);
    
    // Allow small difference due to timing
    return (difference < 100);  // Adjust threshold as needed
}
```

**Error Handling:**

**Reload Failure Detection:**

```c
typedef enum {
    RELOAD_SUCCESS,
    RELOAD_TIMEOUT,
    RELOAD_VERIFICATION_FAILED
} reload_result_t;

reload_result_t service_watchdog_with_verification(void) {
    uint32_t old_counter = read_counter_safe();
    
    // Attempt reload
    if (!service_watchdog_robust()) {
        return RELOAD_TIMEOUT;
    }
    
    // Verify reload occurred
    if (!verify_reload_occurred(WDT_WLDR_REG)) {
        return RELOAD_VERIFICATION_FAILED;
    }
    
    return RELOAD_SUCCESS;
}
```

**Integration with Real-Time Systems:**

**RTOS Task Implementation:**

```c
void watchdog_service_task(void* parameters) {
    watchdog_service_t* wd = (watchdog_service_t*)parameters;
    
    while (1) {
        // Wait for service interval
        vTaskDelay(pdMS_TO_TICKS(wd->service_interval_ms));
        
        // Service watchdog
        reload_result_t result = service_watchdog_with_verification();
        
        if (result != RELOAD_SUCCESS) {
            // Log error and potentially take corrective action
            log_watchdog_service_error(result);
        }
    }
}
```

**Key Design Considerations:**

**Timing Constraints:**

- **Service frequency:** Must be faster than watchdog timeout
- **Synchronization delay:** Account for clock domain crossing
- **System responsiveness:** Don't service too frequently (waste CPU)

**Reliability Features:**

- **Change detection:** Ensures reload actually occurs
- **Write completion:** WDT_WWPS provides synchronization
- **Verification capability:** Can read counter to confirm reload

**Safety Implications:**

- **Fail-safe behavior:** If service fails, system resets (intended)
- **Deterministic timing:** Hardware-based, not dependent on software timing
- **Recovery mechanism:** System can recover from any software hang

This reload mechanism provides the **core safety function** of the watchdog timer while maintaining **precise control** over system reset timing.

## 20.4.3.8 Start/Stop Sequence for Watchdog Timers
**الـ Start/Stop Sequences للـ Watchdog Timer:**

**نقطة مهمة جداً:** الـ watchdog timer مش بيتوقف أو يبدأ بكتابة bit واحد عادي. لازم نكتب **تسلسل معين من القيم** في الـ `WDT_WSPR` register عشان نضمن الأمان.

**ليه التسلسل ده مهم:**

- عشان **نمنع الإيقاف بالغلط** لو حصل software corruption
- عشان نضمن إن **الإيقاف مقصود** مش خطأ
- عشان نحمي النظام من **accidental disable**

**Stop Sequence (إيقاف الـ Timer):**

```c
// خطوة 1: كتابة 0xAAAA
WDT_WSPR = 0xAAAA;
while (WDT_WWPS & W_PEND_WSPR);  // انتظار للكتابة

// خطوة 2: كتابة 0x5555  
WDT_WSPR = 0x5555;
while (WDT_WWPS & W_PEND_WSPR);  // انتظار للكتابة

// دلوقتي الـ timer متوقف
```

**Start Sequence (تشغيل الـ Timer):**

```c
// خطوة 1: كتابة 0xBBBB
WDT_WSPR = 0xBBBB;
while (WDT_WWPS & W_PEND_WSPR);  // انتظار للكتابة

// خطوة 2: كتابة 0x4444
WDT_WSPR = 0x4444;
while (WDT_WWPS & W_PEND_WSPR);  // انتظار للكتابة

// دلوقتي الـ timer شغال
```

**نقاط مهمة:**

- **الترتيب مهم جداً** - لازم نكتب القيم بالترتيب الصحيح
- **انتظار بين الخطوات** - لازم ننتظر الكتابة تخلص قبل الخطوة التالية
- **لو كتبنا قيمة غلط** - التسلسل بيتلغى ومش هيشتغل

**الدوال الكاملة:**

```c
bool stop_watchdog_timer(void) {
    // Stop sequence
    WDT_WSPR = 0xAAAA;
    if (!wait_for_write_completion(W_PEND_WSPR)) return false;
    
    WDT_WSPR = 0x5555;
    if (!wait_for_write_completion(W_PEND_WSPR)) return false;
    
    return true;  // Timer stopped successfully
}

bool start_watchdog_timer(void) {
    // Start sequence  
    WDT_WSPR = 0xBBBB;
    if (!wait_for_write_completion(W_PEND_WSPR)) return false;
    
    WDT_WSPR = 0x4444;
    if (!wait_for_write_completion(W_PEND_WSPR)) return false;
    
    return true;  // Timer started successfully
}
```

---

### English Technical Analysis:

**Start/Stop Sequence Architecture:**

**Security-Based Design:** The AM335x watchdog timer implements a **two-step security sequence** for start/stop operations to prevent accidental or malicious disabling of the watchdog function. This is a **safety-critical design feature**.

**Hardware State Machine:**

The `WDT_WSPR` register implements an internal state machine that requires **exact sequence compliance**:

```
IDLE State → Write 0xAAAA → Intermediate State → Write 0x5555 → STOPPED
IDLE State → Write 0xBBBB → Intermediate State → Write 0x4444 → STARTED
```

**Stop Sequence Detailed Analysis:**

**Step 1: Write 0xAAAA**

```c
WDT_WSPR = 0xAAAA;  // Magic value 1
// Hardware enters "stop_sequence_pending" state
// Timer continues running during this step
```

**Step 2: Write 0x5555**

```c
WDT_WSPR = 0x5555;  // Magic value 2  
// Hardware completes stop sequence
// Timer is now disabled
```

**Start Sequence Detailed Analysis:**

**Step 1: Write 0xBBBB**

```c
WDT_WSPR = 0xBBBB;  // Magic value 1
// Hardware enters "start_sequence_pending" state
```

**Step 2: Write 0x4444**

```c
WDT_WSPR = 0x4444;  // Magic value 2
// Hardware completes start sequence  
// Timer is now enabled and counting
```

**Critical Implementation Requirements:**

**1. Exact Value Matching:**

```c
// CORRECT sequences
#define WDT_STOP_SEQ1   0xAAAA
#define WDT_STOP_SEQ2   0x5555
#define WDT_START_SEQ1  0xBBBB  
#define WDT_START_SEQ2  0x4444

// INCORRECT - Will not work
#define WRONG_VALUE     0xAAA0  // Even 1 bit difference fails
```

**2. Mandatory Synchronization:**

```c
#define WDT_WSPR_REG    (*(volatile uint32_t*)(WDT_BASE + 0x48))
#define WDT_WWPS_REG    (*(volatile uint32_t*)(WDT_BASE + 0x34))
#define W_PEND_WSPR     (1 << 4)

bool wait_for_wspr_completion(uint32_t timeout_cycles) {
    while ((WDT_WWPS_REG & W_PEND_WSPR) && (timeout_cycles-- > 0));
    return (timeout_cycles > 0);
}

bool stop_watchdog_secure(void) {
    // Step 1: First magic value
    WDT_WSPR_REG = 0xAAAA;
    if (!wait_for_wspr_completion(100000)) {
        return false;  // Timeout error
    }
    
    // Step 2: Second magic value
    WDT_WSPR_REG = 0x5555;
    if (!wait_for_wspr_completion(100000)) {
        return false;  // Timeout error
    }
    
    return true;  // Successfully stopped
}
```

**3. Complete Function Implementation:**

```c
typedef enum {
    WDT_OP_SUCCESS,
    WDT_OP_TIMEOUT_STEP1,
    WDT_OP_TIMEOUT_STEP2,
    WDT_OP_VERIFICATION_FAILED
} wdt_operation_result_t;

wdt_operation_result_t stop_watchdog_timer(void) {
    // Step 1: Write first stop sequence value
    WDT_WSPR_REG = 0xAAAA;
    if (!wait_for_wspr_completion(100000)) {
        return WDT_OP_TIMEOUT_STEP1;
    }
    
    // Step 2: Write second stop sequence value
    WDT_WSPR_REG = 0x5555;
    if (!wait_for_wspr_completion(100000)) {
        return WDT_OP_TIMEOUT_STEP2;
    }
    
    // Optional: Verify timer is actually stopped
    // This would require reading timer state or monitoring counter
    
    return WDT_OP_SUCCESS;
}

wdt_operation_result_t start_watchdog_timer(void) {
    // Step 1: Write first start sequence value
    WDT_WSPR_REG = 0xBBBB;
    if (!wait_for_wspr_completion(100000)) {
        return WDT_OP_TIMEOUT_STEP1;
    }
    
    // Step 2: Write second start sequence value  
    WDT_WSPR_REG = 0x4444;
    if (!wait_for_wspr_completion(100000)) {
        return WDT_OP_TIMEOUT_STEP2;
    }
    
    return WDT_OP_SUCCESS;
}
```

**State Machine Error Handling:**

**Sequence Violations:**

- **Wrong value written:** State machine returns to IDLE, sequence must restart
- **Timeout between steps:** Hardware may timeout and return to IDLE
- **Interrupt during sequence:** Must restart the complete sequence

**Robust Implementation:**

```c
bool robust_stop_watchdog(uint8_t max_attempts) {
    for (uint8_t attempt = 0; attempt < max_attempts; attempt++) {
        wdt_operation_result_t result = stop_watchdog_timer();
        
        if (result == WDT_OP_SUCCESS) {
            return true;
        }
        
        // Log the failure reason
        log_wdt_operation_failure(result, attempt);
        
        // Brief delay before retry
        delay_microseconds(100);
    }
    
    return false;  // All attempts failed
}
```

**Configuration Change Sequence:**

**Typical Reconfiguration Pattern:**

```c
bool reconfigure_watchdog(uint32_t new_load_value, uint8_t new_prescaler) {
    // 1. Stop the timer
    if (!robust_stop_watchdog(3)) {
        return false;
    }
    
    // 2. Modify configuration registers
    WDT_WLDR_REG = new_load_value;
    while (WDT_WWPS_REG & W_PEND_WLDR);
    
    WDT_WCLR_REG = new_prescaler;
    while (WDT_WWPS_REG & W_PEND_WCLR);
    
    // 3. Restart the timer
    if (!robust_start_watchdog(3)) {
        return false;
    }
    
    // 4. Initial trigger to start counting
    WDT_WTGR_REG = 0x1234;
    while (WDT_WWPS_REG & W_PEND_WTGR);
    
    return true;
}
```

**Security Implications:**

**Protection Against Attacks:**

- **Buffer overflow protection:** Random values cannot accidentally disable watchdog
- **Code corruption protection:** Corrupted code unlikely to generate correct sequence
- **Malware protection:** Intentional disabling requires knowledge of exact sequence

**Debug and Development Considerations:**

**Debugger Interaction:**

```c
#ifdef DEBUG_MODE
void setup_debug_watchdog(void) {
    // Allow debugger to suspend watchdog during breakpoints
    // Configure EMUFREE bit in WDT_WDSC register
    WDT_WDSC_REG &= ~(1 << 1);  // EMUFREE = 0
}
#endif
```

**Production Monitoring:**

```c
void monitor_watchdog_state_changes(void) {
    static bool last_known_state = true;  // Assume started
    
    // Check if state changed (implementation specific)
    bool current_state = is_watchdog_running();
    
    if (current_state != last_known_state) {
        log_watchdog_state_change(last_known_state, current_state);
        last_known_state = current_state;
    }
}
```

**Key Safety Principles:**

1. **Fail-Safe Default:** Timer starts enabled after reset
2. **Intentional Operation:** Requires deliberate two-step sequence
3. **Synchronization Required:** Must wait for each step completion
4. **No Shortcuts:** Cannot bypass or shortcut the sequence
5. **State Verification:** Should verify operation success

This dual-step security mechanism ensures that **watchdog disabling is always intentional** and **cannot occur accidentally**, maintaining system safety and reliability.


## 20.4.3.9 Modifying Timer Count/Load Values and Prescaler Setting

**تعديل قيم الـ Timer والـ Prescaler:**

==**القاعدة الذهبية:**== لازم **نوقف الـ timer الأول** قبل ما نغير أي إعدادات! مش ممكن نغير الإعدادات والـ timer شغال.

**الخطوات الصحيحة:**

**1. إيقاف الـ Timer:**

```c
// Stop sequence
WDT_WSPR = 0xAAAA;
while (WDT_WWPS & W_PEND_WSPR);

WDT_WSPR = 0x5555;
while (WDT_WWPS & W_PEND_WSPR);
```

**2. تغيير الإعدادات:**

```c
// تغيير الـ Load Value
WDT_WLDR = new_load_value;
while (WDT_WWPS & W_PEND_WLDR);

// تغيير الـ Prescaler
WDT_WCLR = (PRE << 5) | (PTV << 2);
while (WDT_WWPS & W_PEND_WCLR);

// تغيير الـ Delay Value (لو عايزين interrupt مبكر)
WDT_WDLY = delay_value;
while (WDT_WWPS & W_PEND_WDLY);
```

**3. تشغيل الـ Timer تاني:**

```c
// Start sequence
WDT_WSPR = 0xBBBB;
while (WDT_WWPS & W_PEND_WSPR);

WDT_WSPR = 0x4444;
while (WDT_WWPS & W_PEND_WSPR);
```

**4. تفعيل الـ Counter (أول reload):**

```c
WDT_WTGR = 0x1234;  // أي قيمة
while (WDT_WWPS & W_PEND_WTGR);
```

**مثال كامل - تغيير Timeout لـ 30 ثانية:**

```c
bool configure_30_second_timeout(void) {
    // 1. Stop timer
    if (!stop_watchdog_timer()) return false;
    
    // 2. Configure for 30 seconds
    // Using prescaler=16: 32kHz/16 = 2kHz
    // Counts needed = 30 × 2000 = 60000
    // WLDR = 0xFFFFFFFF - 60000 + 1 = 0xFFFF1561
    
    WDT_WCLR = (1 << 5) | (4 << 2);  // PRE=1, PTV=4 (prescaler=16)
    while (WDT_WWPS & W_PEND_WCLR);
    
    WDT_WLDR = 0xFFFF1561;
    while (WDT_WWPS & W_PEND_WLDR);
    
    // 3. Start timer
    if (!start_watchdog_timer()) return false;
    
    // 4. Initial reload
    WDT_WTGR = 0x5678;
    while (WDT_WWPS & W_PEND_WTGR);
    
    return true;
}
```

---

### English Technical Analysis:

**Modifying Timer Configuration During Runtime:**

**Critical Safety Requirement:** The watchdog timer configuration registers **cannot be modified while the timer is running**. This is a fundamental safety constraint to prevent accidental misconfiguration that could compromise system reliability.

**Complete Configuration Change Procedure:**

**Phase 1: Timer Disable**

```c
typedef enum {
    CONFIG_SUCCESS,
    CONFIG_STOP_FAILED,
    CONFIG_REGISTER_TIMEOUT,
    CONFIG_START_FAILED,
    CONFIG_VERIFICATION_FAILED
} config_result_t;

config_result_t disable_timer_for_config(void) {
    // Execute stop sequence
    WDT_WSPR = 0xAAAA;
    if (!wait_for_register_completion(W_PEND_WSPR, 10000)) {
        return CONFIG_STOP_FAILED;
    }
    
    WDT_WSPR = 0x5555;
    if (!wait_for_register_completion(W_PEND_WSPR, 10000)) {
        return CONFIG_STOP_FAILED;
    }
    
    return CONFIG_SUCCESS;
}
```

**Phase 2: Register Modification**

```c
config_result_t modify_timer_registers(uint32_t load_value, 
                                     uint8_t pre_enable, 
                                     uint8_t ptv_value,
                                     uint32_t delay_value) {
    // Modify load register
    WDT_WLDR = load_value;
    if (!wait_for_register_completion(W_PEND_WLDR, 10000)) {
        return CONFIG_REGISTER_TIMEOUT;
    }
    
    // Modify prescaler settings
    uint32_t wclr_value = (pre_enable << 5) | (ptv_value << 2);
    WDT_WCLR = wclr_value;
    if (!wait_for_register_completion(W_PEND_WCLR, 10000)) {
        return CONFIG_REGISTER_TIMEOUT;
    }
    
    // Modify delay register (optional)
    if (delay_value != 0) {
        WDT_WDLY = delay_value;
        if (!wait_for_register_completion(W_PEND_WDLY, 10000)) {
            return CONFIG_REGISTER_TIMEOUT;
        }
    }
    
    return CONFIG_SUCCESS;
}
```

**Phase 3: Timer Re-enable**

```c
config_result_t enable_timer_after_config(void) {
    // Execute start sequence
    WDT_WSPR = 0xBBBB;
    if (!wait_for_register_completion(W_PEND_WSPR, 10000)) {
        return CONFIG_START_FAILED;
    }
    
    WDT_WSPR = 0x4444;
    if (!wait_for_register_completion(W_PEND_WSPR, 10000)) {
        return CONFIG_START_FAILED;
    }
    
    // Initial trigger to load new values
    WDT_WTGR = 0x12345678;
    if (!wait_for_register_completion(W_PEND_WTGR, 10000)) {
        return CONFIG_START_FAILED;
    }
    
    return CONFIG_SUCCESS;
}
```

**Complete Configuration Change Function:**

```c
typedef struct {
    uint32_t timeout_seconds;
    uint8_t  prescaler_ptv;
    uint8_t  prescaler_enable;
    uint32_t delay_interrupt_value;
    bool     enable_delay_interrupt;
} watchdog_config_t;

config_result_t reconfigure_watchdog(const watchdog_config_t* config) {
    config_result_t result;
    
    // Calculate register values
    uint32_t prescaler_divider = config->prescaler_enable ? 
                                (1 << config->prescaler_ptv) : 1;
    uint32_t effective_clock = 32000 / prescaler_divider;
    uint32_t required_counts = config->timeout_seconds * effective_clock;
    uint32_t load_value = 0xFFFFFFFF - required_counts + 1;
    
    // Validate configuration
    if (required_counts > 0xFFFFFFFF) {
        return CONFIG_PARAMETER_ERROR;
    }
    
    // Phase 1: Disable timer
    result = disable_timer_for_config();
    if (result != CONFIG_SUCCESS) return result;
    
    // Phase 2: Modify registers
    result = modify_timer_registers(load_value,
                                  config->prescaler_enable,
                                  config->prescaler_ptv,
                                  config->delay_interrupt_value);
    if (result != CONFIG_SUCCESS) return result;
    
    // Phase 3: Re-enable timer
    result = enable_timer_after_config();
    if (result != CONFIG_SUCCESS) return result;
    
    // Phase 4: Verification (optional but recommended)
    return verify_configuration(config);
}
```

**Advanced Configuration Examples:**

**Example 1: High-Precision Short Timeout**

```c
void configure_100ms_precision_timeout(void) {
    watchdog_config_t config = {
        .timeout_seconds = 0.1,          // 100ms
        .prescaler_enable = 0,           // No prescaler for precision
        .prescaler_ptv = 0,              // Not used
        .delay_interrupt_value = 0,      // No early warning
        .enable_delay_interrupt = false
    };
    
    // Calculate: 0.1 × 32000 = 3200 counts
    // WLDR = 0xFFFFFFFF - 3200 + 1 = 0xFFFFF381
    
    config_result_t result = reconfigure_watchdog(&config);
    handle_config_result(result);
}
```

**Example 2: Long Timeout with Early Warning**

```c
void configure_10_minute_timeout_with_warning(void) {
    watchdog_config_t config = {
        .timeout_seconds = 600,          // 10 minutes
        .prescaler_enable = 1,           // Use prescaler for range
        .prescaler_ptv = 6,              // Divide by 64
        .delay_interrupt_value = 0xFFFFF000,  // Warning at ~97%
        .enable_delay_interrupt = true
    };
    
    // Calculate: 600 × (32000/64) = 300000 counts
    // WLDR = 0xFFFFFFFF - 300000 + 1 = 0xFFFB6E01
    
    config_result_t result = reconfigure_watchdog(&config);
    handle_config_result(result);
}
```

**Runtime Modification Safety:**

**Atomic Configuration Change:**

```c
// Critical section to prevent interruption during config
void atomic_watchdog_reconfigure(const watchdog_config_t* new_config) {
    // Disable interrupts during critical reconfiguration
    uint32_t saved_interrupt_state = disable_interrupts();
    
    config_result_t result = reconfigure_watchdog(new_config);
    
    // Restore interrupts
    restore_interrupts(saved_interrupt_state);
    
    if (result != CONFIG_SUCCESS) {
        // Handle configuration failure
        handle_critical_config_failure(result);
    }
}
```

**Configuration Validation:**

```c
bool validate_watchdog_config(const watchdog_config_t* config) {
    // Check timeout range
    if (config->timeout_seconds < 0.001 || config->timeout_seconds > 100000) {
        return false;
    }
    
    // Check prescaler values
    if (config->prescaler_ptv > 7) {
        return false;
    }
    
    // Validate that timeout is achievable
    uint32_t max_prescaler = config->prescaler_enable ? 
                            (1 << config->prescaler_ptv) : 1;
    uint32_t min_effective_clock = 32000 / 128;  // Minimum possible
    double max_timeout = (double)0xFFFFFFFF / min_effective_clock;
    
    if (config->timeout_seconds > max_timeout) {
        return false;
    }
    
    return true;
}
```

**Error Recovery:**

```c
void handle_config_failure_recovery(config_result_t failure_reason) {
    switch (failure_reason) {
        case CONFIG_STOP_FAILED:
            // Timer might still be running - try emergency reset
            emergency_system_reset();
            break;
            
        case CONFIG_REGISTER_TIMEOUT:
            // Clock domain issue - try again with longer timeout
            retry_config_with_extended_timeout();
            break;
            
        case CONFIG_START_FAILED:
            // Critical failure - system may be unprotected
            log_critical_error("Watchdog start failed");
            attempt_fallback_protection();
            break;
            
        default:
            log_error("Unknown config failure");
            break;
    }
}
```

**Register Write Synchronization:**

```c
#define MAX_REGISTER_WAIT_CYCLES 100000

bool wait_for_register_completion(uint32_t pending_bit, uint32_t timeout) {
    volatile uint32_t wait_cycles = timeout;
    
    while ((WDT_WWPS & pending_bit) && (wait_cycles-- > 0)) {
        // Prevent compiler optimization
        __asm__ volatile ("nop");
    }
    
    return (wait_cycles > 0);
}
```

**Best Practices Summary:**

1. **Always stop before modify:** Never change config while running
2. **Verify register writes:** Check WWPS for completion
3. **Atomic operations:** Prevent interruption during reconfiguration
4. **Validate parameters:** Check bounds before applying
5. **Error handling:** Implement robust failure recovery
6. **Documentation:** Log all configuration changes
7. **Testing:** Verify timeout accuracy after changes

This modification procedure ensures **safe runtime reconfiguration** while maintaining **system protection integrity** throughout the process.

## 20.4.3.10 Watchdog Counter Register Access Restriction
**قيود قراءة الـ WDT_WCRR Register:**

**المشكلة الأساسية:** الـ `WDT_WCRR` register ده بيحتوي على قيمة الـ counter الحالية (32-bit)، بس **مش ممكن نقراه بشكل عادي** زي باقي الـ registers!

**ليه فيه مشكلة:**

- الـ counter بيتحدث بسرعة في الـ **32 kHz domain**
- الـ CPU بيقرا في الـ **125 MHz domain**
- لو قرينا الـ 32-bit كله مرة واحدة، ممكن نلاقي **قيمة مختلطة** (جزء قديم + جزء جديد)

**الحل - Coherent Reading:**

**الطريقة الصحيحة:**

```c
uint32_t read_watchdog_counter_safe(void) {
    // قراءة الـ LSB الأول (الـ 16 bit السفلية)
    uint16_t lsb = *(volatile uint16_t*)(WDT_BASE + 0x28);
    
    // قراءة الـ MSB بعدها (الـ 16 bit العلوية)  
    uint16_t msb = *(volatile uint16_t*)(WDT_BASE + 0x2A);
    
    // تجميع القيمة الكاملة
    return ((uint32_t)msb << 16) | lsb;
}
```

**ليه الطريقة دي شغالة:**

- الـ Hardware مصمم إنه **يجمد الـ MSB** لما نقرا الـ LSB
- بعد ما نقرا الـ MSB، الـ register بيرجع يتحدث عادي
- كده نضمن إن الـ 32-bit كلهم من **نفس اللحظة الزمنية**

**مثال للمشكلة لو قرينا غلط:**

```c
// طريقة خاطئة - ممكن تدي قيمة مختلطة
uint32_t wrong_read = WDT_WCRR;  // ممكن نلاقي: MSB جديد + LSB قديم

// مثال: Counter = 0x12345678
// لو اتغير لـ 0x12345679 أثناء القراءة
// ممكن نلاقي: 0x12345678 أو 0x12345679 أو حاجة مختلطة زي 0x12346678
```

**دالة كاملة مع Error Handling:**

```c
typedef enum {
    COUNTER_READ_SUCCESS,
    COUNTER_READ_TIMEOUT,
    COUNTER_READ_INVALID
} counter_read_result_t;

counter_read_result_t read_counter_with_verification(uint32_t* counter_value) {
    uint32_t read1, read2;
    uint8_t attempts = 0;
    
    do {
        // قراءة أولى
        uint16_t lsb1 = *(volatile uint16_t*)(WDT_BASE + 0x28);
        uint16_t msb1 = *(volatile uint16_t*)(WDT_BASE + 0x2A);
        read1 = ((uint32_t)msb1 << 16) | lsb1;
        
        // قراءة تانية للتأكد
        uint16_t lsb2 = *(volatile uint16_t*)(WDT_BASE + 0x28);
        uint16_t msb2 = *(volatile uint16_t*)(WDT_BASE + 0x2A);
        read2 = ((uint32_t)msb2 << 16) | lsb2;
        
        attempts++;
        
    } while ((read1 != read2) && (attempts < 5));
    
    if (attempts >= 5) {
        return COUNTER_READ_TIMEOUT;
    }
    
    *counter_value = read1;
    return COUNTER_READ_SUCCESS;
}
```

---

### English Technical Analysis:

**WDT_WCRR Access Restriction and Coherent Reading:**

**Fundamental Challenge:** The `WDT_WCRR` register presents a **clock domain crossing problem** where a 32-bit value updating in the 32 kHz functional domain must be read coherently from the 125 MHz interface domain.

**Hardware Implementation Details:**

**Clock Domain Architecture:**

```
32 kHz Counter → Shadow Register → 125 MHz Interface → CPU Read
(Continuous)     (Synchronized)   (On-demand)       (32-bit access)
```

**Coherent Read Mechanism:** The AM335x implements a **hardware coherency mechanism** specifically for the WDT_WCRR register:

1. **LSB Read Trigger:** Reading address `WDT_BASE + 0x28` captures both LSB and MSB
2. **Shadow Register Lock:** MSB is frozen in shadow register during LSB read
3. **MSB Read Completion:** Reading address `WDT_BASE + 0x2A` releases the lock
4. **Atomic Guarantee:** Both 16-bit halves represent the same counter snapshot

**Detailed Implementation:**

**Memory Map:**

```c
#define WDT_WCRR_LSB    (WDT_BASE + 0x28)  // Lower 16 bits
#define WDT_WCRR_MSB    (WDT_BASE + 0x2A)  // Upper 16 bits
#define WDT_WCRR_FULL   (WDT_BASE + 0x28)  // Full 32-bit (problematic)
```

**Correct Reading Procedure:**

```c
uint32_t read_counter_coherent(void) {
    // Step 1: Read LSB first (triggers shadow register capture)
    uint16_t lsb = *(volatile uint16_t*)WDT_WCRR_LSB;
    
    // Step 2: Read MSB (from captured shadow register)
    uint16_t msb = *(volatile uint16_t*)WDT_WCRR_MSB;
    
    // Step 3: Combine into full 32-bit value
    return ((uint32_t)msb << 16) | lsb;
}
```

**Why 32-bit Direct Access Fails:**

```c
// PROBLEMATIC - Race condition possible
uint32_t direct_read = *(volatile uint32_t*)WDT_WCRR_FULL;

// The above may result in:
// - MSB from time T, LSB from time T+1 (or vice versa)
// - Inconsistent 32-bit value
// - Unpredictable behavior in calculations
```

**Advanced Reading Strategies:**

**1. Verification-Based Reading:**

```c
uint32_t read_counter_verified(uint8_t max_attempts) {
    uint32_t prev_read = 0;
    uint32_t curr_read = 0;
    uint8_t attempts = 0;
    
    do {
        prev_read = curr_read;
        curr_read = read_counter_coherent();
        attempts++;
        
        // Allow for reasonable counter progression
        uint32_t diff = (curr_read > prev_read) ? 
                       (curr_read - prev_read) : 
                       (prev_read - curr_read);
        
        // If difference is reasonable, accept the reading
        if (attempts > 1 && diff < 1000) {  // Adjust threshold
            break;
        }
        
    } while (attempts < max_attempts);
    
    return curr_read;
}
```

**2. Statistical Filtering:**

```c
uint32_t read_counter_filtered(void) {
    uint32_t readings[5];
    
    // Take multiple readings
    for (int i = 0; i < 5; i++) {
        readings[i] = read_counter_coherent();
    }
    
    // Sort readings
    for (int i = 0; i < 4; i++) {
        for (int j = i + 1; j < 5; j++) {
            if (readings[i] > readings[j]) {
                uint32_t temp = readings[i];
                readings[i] = readings[j];
                readings[j] = temp;
            }
        }
    }
    
    // Return median value
    return readings[2];
}
```

**3. Timestamp-Based Validation:**

```c
typedef struct {
    uint32_t counter_value;
    uint32_t timestamp_ms;
    bool valid;
} counter_reading_t;

counter_reading_t read_counter_timestamped(void) {
    counter_reading_t reading;
    
    reading.timestamp_ms = get_system_time_ms();
    reading.counter_value = read_counter_coherent();
    reading.valid = true;
    
    // Validate against expected counter progression
    static counter_reading_t last_reading = {0, 0, false};
    
    if (last_reading.valid) {
        uint32_t time_diff = reading.timestamp_ms - last_reading.timestamp_ms;
        uint32_t expected_counter_diff = calculate_expected_progression(time_diff);
        uint32_t actual_counter_diff = reading.counter_value - last_reading.counter_value;
        
        // Check if progression is reasonable
        if (abs((int32_t)(actual_counter_diff - expected_counter_diff)) > 1000) {
            reading.valid = false;
        }
    }
    
    if (reading.valid) {
        last_reading = reading;
    }
    
    return reading;
}
```

**Performance Considerations:**

**Read Timing Analysis:**

```c
void benchmark_counter_reads(void) {
    uint32_t start_time = get_high_res_timer();
    
    for (int i = 0; i < 1000; i++) {
        volatile uint32_t counter = read_counter_coherent();
        (void)counter;  // Prevent optimization
    }
    
    uint32_t end_time = get_high_res_timer();
    uint32_t avg_read_time = (end_time - start_time) / 1000;
    
    printf("Average coherent read time: %u cycles\n", avg_read_time);
}
```

**Memory Barrier Considerations:**

```c
uint32_t read_counter_with_barriers(void) {
    // Ensure no instruction reordering
    __asm__ volatile ("dmb" ::: "memory");
    
    uint16_t lsb = *(volatile uint16_t*)WDT_WCRR_LSB;
    
    __asm__ volatile ("dmb" ::: "memory");
    
    uint16_t msb = *(volatile uint16_t*)WDT_WCRR_MSB;
    
    __asm__ volatile ("dmb" ::: "memory");
    
    return ((uint32_t)msb << 16) | lsb;
}
```

**Error Detection and Recovery:**

**Sanity Check Implementation:**

```c
bool validate_counter_reading(uint32_t current, uint32_t previous, uint32_t load_value) {
    // Check if counter is within expected range
    if (current < load_value) {
        return false;  // Counter below reload value
    }
    
    // Check for reasonable progression
    if (current < previous) {
        // Counter wrapped or was reloaded
        return true;
    }
    
    // Check for excessive jump
    uint32_t diff = current - previous;
    if (diff > 10000) {  // Adjust based on read frequency
        return false;  // Unreasonable jump
    }
    
    return true;
}
```

**Production Usage Pattern:**

```c
typedef struct {
    uint32_t counter_value;
    bool read_successful;
    uint8_t read_attempts;
    uint32_t read_time_us;
} counter_info_t;

counter_info_t get_watchdog_counter_info(void) {
    counter_info_t info = {0};
    uint32_t start_time = get_microsecond_timer();
    
    for (info.read_attempts = 1; info.read_attempts <= 3; info.read_attempts++) {
        info.counter_value = read_counter_coherent();
        
        // Validate reading
        if (validate_counter_reading(info.counter_value, 
                                   get_last_known_counter(), 
                                   get_current_load_value())) {
            info.read_successful = true;
            break;
        }
    }
    
    info.read_time_us = get_microsecond_timer() - start_time;
    return info;
}
```

**Key Takeaways:**

1. **Never use 32-bit direct access** to WDT_WCRR
2. **Always read LSB first, then MSB** for coherent reading
3. **Implement validation** for critical applications
4. **Consider read frequency** vs. system performance
5. **Use barriers** in multi-threaded environments
6. **Handle read failures** gracefully

This restriction exists to **ensure data coherency** across **clock domain boundaries** while maintaining **real-time counter accuracy**.

## 20.4.3.11 Watchdog Timer Interrupt Generation

### بالعربى المصرى:

**فهم عميق لآلية إنتاج الـ Interrupts:**

**السؤال الأساسي: إزاي الـ Hardware بيولد الـ Interrupts؟**

**الآلية الداخلية:**

- الـ Watchdog Counter بينزل من قيمة عالية لـ صفر
- فيه **مقارنين (Comparators)** جوا الـ Hardware بيراقبوا القيمة دي
- **المقارن الأول** بيشوف لو الـ Counter وصل للـ `WDT_WDLY` value
- **المقارن التاني** بيشوف لو الـ Counter وصل صفر

**تفاصيل الـ Clock Domains:** المشكلة إن الـ Counter بيشتغل في الـ **32kHz domain** والـ CPU في الـ **125MHz domain**. عشان كده:

- الـ Interrupt signals لازم تعدي عبر **Clock Domain Crossing circuits**
- فيه **Synchronization delay** بين حدوث الـ event والـ interrupt الفعلي
- الـ delay ده حوالي **2-3 cycles** من الـ 32kHz clock (حوالي 60-90 microseconds)

**الـ Delay Interrupt - التحذير المبكر:**

**متى بيحصل بالضبط:** لما الـ Counter بينزل ويوصل **تماماً** لنفس قيمة الـ `WDT_WDLY` register، في اللحظة دي:

1. الـ Hardware بيقارن: `WDT_WCRR == WDT_WDLY`
2. لو الشرط صح، بيرفع الـ **internal delay flag**
3. الـ flag ده بيتـ sync مع الـ CPU clock domain
4. الـ CPU بيستقبل الـ interrupt

**نقطة مهمة جداً:** الـ Delay interrupt **بيحصل مرة واحدة فقط** لما الـ counter يمر بالقيمة دي، مش كل مرة يكون فيها الـ counter أقل من الـ WDLY!

**الـ Overflow Interrupt - الإنذار النهائي:**

**اللحظة الحرجة:** لما الـ Counter يوصل **صفر بالضبط**:

1. الـ**Overflow condition** بيحصل
2. الـ Counter بيـ reload تلقائياً بقيمة الـ `WDT_WLDR`
3. **في نفس الوقت** بيتولد overflow interrupt
4. **بعدها بـ cycles قليلة** بيحصل system reset (لو مفيش trigger)

**التوقيت الزمني الحرج:** من لحظة الـ overflow interrupt لحظة الـ reset فيه **فترة زمنية قصيرة جداً** (حوالي 100-200 microseconds). الـ interrupt handler لازم يكون **سريع جداً** عشان يقدر يعمل حاجة مفيدة.

**سلوك الـ Hardware مع الـ Interrupts:**

**الـ Interrupt Flags (WISR Register):**

- فيه **bit للـ overflow** و **bit للـ delay**
- الـ bits دي بتتـ **set تلقائياً** بواسطة الـ Hardware
- لازم الـ Software **يمسحها بنفسه** بكتابة `1` في الـ bit المطلوب مسحه
- لو مسحناش الـ flag، الـ interrupt **مش هيحصل تاني** حتى لو الـ condition اتكرر

**تفاعل الـ Interrupts مع الـ Reset:**

**الـ Race Condition الخطيرة:** لو حصل overflow interrupt ومسحناش الـ flag، إيه اللي هيحصل؟

1. الـ Timer هيعمل overflow تاني بعد timeout period كامل
2. بس الـ interrupt **مش هيتولد** لأن الـ flag لسه مرفوع
3. الـ system هيعمل reset **بدون أي تحذير**

**لو فيه مشكلة في الـ Interrupt Handler:** لو الـ handler علق أو خد وقت كتير:

1. الـ Timer **مش هيستنى** - هيفضل يعد عادي
2. لو مجاش trigger قبل الـ timeout الجاي، **reset مؤكد**
3. مفيش حاجة تقدر توقف الـ reset غير الـ trigger

**الفرق بين الـ Interrupt والـ Reset:**

**مراحل الـ Watchdog Operation:**

1. **Normal Operation:** Counter بينزل عادي
2. **Delay Interrupt:** تحذير مبكر (لو مفعل)
3. **Overflow Interrupt:** إنذار أخير
4. **Hardware Reset:** reset تلقائي للنظام

**النقطة المهمة:** الـ Hardware Reset **مستقل تماماً** عن الـ interrupts. حتى لو مفعلناش أي interrupts، الـ reset هيحصل لوحده.

**تأثير الـ Prescaler على الـ Interrupts:**

**دقة التوقيت:** لو استعملنا prescaler كبير (مثلاً /128):

- كل **step** في الـ counter يمثل `128/32000 = 4ms`
- الـ delay interrupt ممكن يكون **غير دقيق** بـ ±4ms
- ده مهم في التطبيقات اللي محتاجة **timing precision عالي**

**الـ Interrupt Latency:**

**من الـ Hardware للـ Software:**

1. **Hardware detection:** ~1 counter cycle (31 μs)
2. **Clock domain sync:** ~2-3 cycles (60-90 μs)
3. **NVIC processing:** ~10-20 CPU cycles (80-160 ns @ 125MHz)
4. **Context switch:** ~50-200 CPU cycles (400ns-1.6μs)
5. **Handler execution:** depends on code

**إجمالي الـ latency:** حوالي **150-200 microseconds** من لحظة الـ event لبداية تنفيذ الـ handler.

**سلوك الـ Interrupts مع الـ Power Management:**

**في حالة الـ Sleep Modes:**

- الـ Watchdog **بيفضل شغال** حتى في الـ deep sleep
- الـ Interrupts **تقدر تصحي** النظام من الـ sleep
- ده مفيد للـ **periodic wake-up** أو **emergency wake-up**

**الـ Interrupt Priority والـ Nesting:**

**أولوية الـ Watchdog Interrupts:**

- لازم تكون **عالية جداً** (priority 0 أو 1)
- مش مسموح للـ interrupts التانية تقاطعها
- الـ handler لازم يكون **قصير وسريع**

**أمثلة على الـ Timing الحقيقي:**

**مثال: timeout 10 ثواني مع warning عند 9 ثواني:**

- الـ Load value: يخلي الـ counter يعد 10 ثواني
- الـ Delay value: يخلي الـ warning يحصل عند 9 ثواني
- لو جه trigger عند الثانية الـ8: **مشكلة مفيش**
- لو جه trigger عند الثانية الـ9.5: **warning حصل خلاص**، بس النظام **اتنقذ**
- لو مجاش trigger خالص: **overflow interrupt** عند الثانية الـ10، **reset** بعدها بـ microseconds

**الـ Hardware Limitations:**

**قيود مهمة:**

- مفيش طريقة **نوقف الـ reset** بعد الـ overflow interrupt
- مفيش طريقة **نمدد الـ timeout** من جوا الـ interrupt handler
- الـ **trigger** هو الطريقة الوحيدة لإعادة ضبط الـ timer

**الخلاصة العملية:** الـ Watchdog interrupts مش مجرد **notifications** - دي **فرص أخيرة** للنظام إنه ينقذ نفسه أو على الأقل **يحفظ البيانات المهمة** قبل الـ reset الحتمي.


## 20.4.3.12 Watchdog Timers Under Emulation
**سلوك الـ Watchdog في بيئة الـ Debugging:**

**المشكلة الأساسية:** لما بنعمل debug للكود بتاعنا ونحط **breakpoints**، إيه اللي بيحصل للـ Watchdog Timer؟ لو فضل شغال عادي، هيعمل **reset للنظام** في نص الـ debugging session!

**الحل - EMUFREE Control:**

**إيه هو الـ EMUFREE؟** دي **control bit** في الـ `WDT_WDSC` register (bit 1) بتتحكم في سلوك الـ Watchdog لما يكون فيه **emulator/debugger** متصل بالنظام.

**وضعين للتشغيل:**

**1. EMUFREE = 0 (Default):**

- الـ Watchdog **بيتوقف تماماً** لما الـ debugger يوقف الـ CPU
- لما نحط breakpoint، الـ timer **مبيفضلش يعد**
- مفيد جداً أثناء الـ **development والـ debugging**

**2. EMUFREE = 1:**

- الـ Watchdog **بيفضل شغال** حتى لو الـ debugger وقف الـ CPU
- الـ timer **بيفضل يعد** والـ reset **ممكن يحصل** أثناء الـ debugging
- مفيد للـ **final testing** والتأكد إن النظام يشتغل زي ما هو مطلوب في الـ production

**التفاصيل التقنية العميقة:**

**إزاي الـ Hardware بيعرف إن فيه Emulator؟** الـ ARM processor فيه **debug interface** (JTAG/SWD) لما يكون فيه debugger متصل:

- الـ processor بيرفع إشارة **DBGACK** (Debug Acknowledge)
- الـ Watchdog Hardware **بيستقبل الإشارة دي**
- لو EMUFREE = 0، بيوقف الـ counter لما يشوف DBGACK عالي

**الـ Clock Domain الخاص بالـ Emulation:**

- الـ Debug signals بتيجي من الـ **ARM Core domain**
- الـ Watchdog بيشتغل في الـ **32kHz always-on domain**
- فيه **cross-domain logic** عشان تنقل إشارة الـ debug stop

**حالات الاستخدام المختلفة:**

**أثناء Development:**

```c
// إعداد للـ development - الـ watchdog يتوقف مع الـ debugger
void setup_debug_friendly_watchdog(void) {
    // أوقف الـ timer الأول
    stop_watchdog_timer();
    
    // اضبط EMUFREE = 0 (debug-friendly)
    WDT_WDSC &= ~(1 << 1);  // Clear EMUFREE bit
    while (WDT_WWPS & W_PEND_WDSC);
    
    // شغل الـ timer تاني
    start_watchdog_timer();
}
```

**للـ Production Testing:**

```c
// إعداد للـ production - الـ watchdog مبيتوقفش
void setup_production_watchdog(void) {
    stop_watchdog_timer();
    
    // اضبط EMUFREE = 1 (production mode)
    WDT_WDSC |= (1 << 1);  // Set EMUFREE bit
    while (WDT_WWPS & W_PEND_WDSC);
    
    start_watchdog_timer();
}
```

**سيناريوهات مختلفة:**

**Scenario 1: Breakpoint في الـ Main Loop**

- EMUFREE = 0: الـ timer **يتوقف**، debugging عادي
- EMUFREE = 1: الـ timer **يفضل يعد**، reset بعد timeout

**Scenario 2: Single Step Debugging**

- EMUFREE = 0: كل step، الـ timer **يتوقف ويكمل**
- EMUFREE = 1: الـ timer **مبيتأثرش** بالـ stepping

**التأثير على Different Debug Operations:**

**الـ Halt Mode:** لما الـ debugger يعمل "halt" للـ processor:

- الـ CPU **بيتوقف تماماً**
- EMUFREE = 0: Watchdog **يتوقف** كمان
- EMUFREE = 1: Watchdog **يفضل شغال** ويعمل reset للنظام حتى لو الـ CPU واقف

**الـ Step-by-Step Execution:**

- كل خطوة، الـ CPU بيتوقف لفترة قصيرة
- EMUFREE = 0: الـ Watchdog **مبيحسبش** الفترات دي
- EMUFREE = 1: الـ Watchdog **بيحسب** كل حاجة

**الـ Real-Time Debugging Challenges:**

**المعضلة الأساسية:** إزاي نعمل debug لـ real-time system والـ watchdog شغال؟

**الـ Limited Debug Window:** لو EMUFREE = 1، بقى عندنا **timeout period بس** نعمل فيها debugging. بعدها النظام هيعمل reset.

**الـ Debugging Strategy:**

1. **أول مرحلة:** EMUFREE = 0 للـ basic debugging
2. **تاني مرحلة:** EMUFREE = 1 للـ real-time testing
3. **آخر مرحلة:** مفيش debugger خالص (production)

**تأثير الـ EMUFREE على Performance Profiling:**

**الـ Timing Measurements:**

- لو EMUFREE = 0: الـ timing measurements **مش دقيقة** لأن الـ breakpoints بتأثر على الوقت
- لو EMUFREE = 1: نقدر نقيس **real-time performance** بس صعب نوقف عند نقاط معينة

**الـ Interrupt Behavior Under Emulation:**

**الـ Watchdog Interrupts:**

- EMUFREE = 0: الـ delay وال overflow interrupts **مبيحصلوش** أثناء الـ halt
- EMUFREE = 1: الـ interrupts **بتحصل عادي** حتى لو الـ debugger شغال

**تفاعل الـ EMUFREE مع Power Management:**

**الـ Sleep Modes:** لو النظام في sleep mode والـ debugger متصل:

- EMUFREE = 0: الـ sleep **ممكن يتقاطع** بواسطة الـ debug interface
- EMUFREE = 1: الـ sleep **بيفضل طبيعي** والـ watchdog **يقدر يصحي** النظام

**الـ Multi-Core Debugging:** في الأنظمة اللي فيها أكتر من core:

- كل core ممكن يكون له **debug state مختلف**
- الـ Watchdog **بيشوف الـ system-level debug state**
- لو **أي core** في debug mode، الـ EMUFREE بيتأثر

**الـ Debugger Detection Hardware:**

**الـ Debug Authentication:** الـ ARM processor فيه **debug authentication mechanism**:

- لازم الـ debugger يكون **authenticated** عشان يقدر يوقف الـ processor
- لو مفيش authentication، الـ EMUFREE **مبيتأثرش**

**الـ Debug Monitor Mode:** فيه mode اسمه **Debug Monitor Mode**:

- الـ processor **مبيتوقفش** تماماً
- بس بيعمل **debug events** كـ interrupts
- في الحالة دي، EMUFREE **مبيكون له تأثير** لأن الـ processor فضل شغال

**Best Practices للـ Development:**

**المرحلة الأولى - Initial Development:**

- استعمل EMUFREE = 0
- ركز على **functional correctness**
- متقلقش من الـ real-time behavior دلوقتي

**المرحلة التانية - Integration Testing:**

- استعمل EMUFREE = 1
- اختبر الـ **real-time behavior**
- شوف إيه اللي بيحصل لو فيه **timing violations**

**المرحلة الأخيرة - Production:**

- شيل الـ debugger تماماً
- اتأكد إن النظام **يشتغل لوحده**
- اعتمد على **logging** و **telemetry** بدل الـ debugging

**الخلاصة العملية:** الـ EMUFREE control بيديك **flexibility** تختار بين:

- **Development-friendly mode:** سهولة الـ debugging
- **Production-like mode:** سلوك حقيقي للنظام

الفكرة إنك **تستعمل الوضعين** في مراحل مختلفة من التطوير عشان تضمن إن الكود يشتغل صح في البيئتين.

---

### English Technical Analysis:

**Emulation Control Architecture:**

**Debug Interface Integration:** The AM335x Watchdog Timer has sophisticated **debug-aware hardware** that interfaces directly with the ARM processor's debug subsystem through the **EMUFREE control mechanism**.

**Hardware Debug Detection:**

- **JTAG/SWD Interface:** Physical debug connection detection
- **DBGACK Signal:** ARM core debug acknowledgment signal
- **Debug Monitor:** Hardware monitors processor debug state
- **Cross-Domain Logic:** Bridges 125MHz debug domain to 32kHz watchdog domain

**Clock Domain Synchronization:** The debug control signal must traverse **multiple clock domains**:

1. **ARM Core Domain** (125MHz) - Debug events originate here
2. **Interface Domain** (125MHz) - Register access domain
3. **Functional Domain** (32kHz) - Watchdog counter operation
4. **Always-On Domain** (32kHz) - Reset generation logic

**EMUFREE Implementation Details:**

**Bit-Level Control:**

- **Register:** WDT_WDSC[1] (EMUFREE bit)
- **Default State:** 0 (Debug-friendly)
- **Write Access:** Requires proper WWPS synchronization
- **Effect Latency:** 2-3 functional clock cycles for activation

**Debug State Machine:**

```
Normal Operation → Debug Request → EMUFREE Check → Counter Action
     ↓                ↓              ↓              ↓
  Count Down      DBGACK=1      Bit Value?    Pause/Continue
```

**Emulation Modes Deep Dive:**

**Mode 0 (EMUFREE = 0) - Debug Suspend:**

- **Counter Behavior:** Freezes during debug halt
- **Interrupt Generation:** Suspended during halt
- **Reset Generation:** Disabled during debug session
- **Use Case:** Development and functional debugging

**Mode 1 (EMUFREE = 1) - Free Running:**

- **Counter Behavior:** Continues regardless of debug state
- **Interrupt Generation:** Occurs even during halt
- **Reset Generation:** Will reset system during debug
- **Use Case:** Production testing and real-time validation

**Advanced Debug Scenarios:**

**Breakpoint Impact Analysis:** When processor hits breakpoint with EMUFREE = 0:

1. **CPU Halts:** Instruction execution stops
2. **DBGACK Assertion:** Debug acknowledge signal rises
3. **Cross-Domain Sync:** Signal propagates to watchdog domain
4. **Counter Freeze:** Watchdog counter stops incrementing
5. **Time Suspension:** No timeout progression during halt

**Multi-Core Debug Considerations:** In multi-core systems:

- **Individual Core Debug:** Each core can be debugged independently
- **System-Level Impact:** Watchdog responds to any core in debug state
- **Debug Arbitration:** Hardware arbitrates multiple debug requests
- **Coherency Maintenance:** Ensures consistent debug behavior

**Real-Time Testing Implications:**

**Production Simulation:** EMUFREE = 1 allows **authentic real-time testing**:

- **Timing Constraints:** Real timeout pressure maintained
- **Interrupt Latency:** Actual interrupt response measured
- **Reset Recovery:** System reset behavior validated
- **Performance Profiling:** True execution timing captured

**Debug Window Limitations:** With EMUFREE = 1, debugging becomes **time-constrained**:

- **Limited Inspection Time:** Must complete debug within timeout
- **Strategic Breakpoints:** Only critical points can be examined
- **Quick Analysis:** Rapid problem identification required
- **Tool Limitations:** Some debug features become impractical

**Debugger Tool Integration:**

**IDE Integration:** Modern debuggers provide **automatic EMUFREE management**:

- **Session Start:** Automatically sets EMUFREE = 0
- **Testing Mode:** Option to enable EMUFREE = 1
- **Breakpoint Handling:** Intelligent timeout management
- **Session End:** Restores production settings

**Debug Monitor Mode:** ARM processors support **non-intrusive debugging**:

- **Monitor Mode:** Debug via interrupts instead of halts
- **Background Operation:** Processor continues execution
- **EMUFREE Independence:** Less impact on watchdog behavior
- **Real-Time Friendly:** Minimal timing disruption

**Power Management Interaction:**

**Sleep Mode Debugging:** EMUFREE affects **sleep state debugging**:

- **EMUFREE = 0:** Debug can prevent sleep entry/exit
- **EMUFREE = 1:** Sleep behavior remains natural
- **Wake-up Events:** Watchdog can wake from debug session
- **Power Profiling:** Accurate power measurements possible

**Clock Gating Effects:** Debug state can affect **system clock management**:

- **Debug Clock:** Separate clock domain for debug operations
- **Functional Clocks:** May be gated during debug
- **Watchdog Clock:** 32kHz oscillator typically unaffected
- **Synchronization Delays:** Cross-domain delays increase

**Security Implications:**

**Debug Authentication:** ARM processors implement **debug security**:

- **Secure Debug:** Authenticated access required
- **Production Lockdown:** Debug can be permanently disabled
- **EMUFREE Access:** Security affects configuration capability
- **Tamper Detection:** Unauthorized debug attempts logged

**Production Hardening:** Final products should consider:

- **Debug Disable:** Permanently disable debug interface
- **EMUFREE Lock:** Prevent runtime modification
- **Watchdog Protection:** Ensure watchdog cannot be circumvented
- **Reset Verification:** Validate reset behavior without debug

**Development Methodology:**

**Phase-Based Approach:**

**Phase 1 - Functional Development (EMUFREE = 0):**

- Focus on **algorithm correctness**
- Ignore timing constraints temporarily
- Use full debugging capabilities
- Validate logic flow and data processing

**Phase 2 - Timing Validation (EMUFREE = 1):**

- Introduce **real-time constraints**
- Measure actual execution timing
- Validate timeout settings
- Test interrupt response

**Phase 3 - Production Testing (No Debug):**

- Remove debugger completely
- Test **autonomous operation**
- Validate reset recovery
- Confirm field behavior

**Debugging Strategy Patterns:**

**Selective Instrumentation:** Instead of traditional breakpoints:

- **Trace Buffers:** Capture execution flow
- **Performance Counters:** Monitor timing
- **Status Registers:** Check system health
- **Telemetry Output:** External monitoring

**Conditional Debugging:** Smart debug activation:

- **Error Conditions:** Debug only on specific failures
- **Periodic Windows:** Debug during safe periods
- **External Triggers:** Debug based on external events
- **Timeout Extensions:** Temporarily extend watchdog timeout

**Key Architectural Insights:**

1. **Debug-Production Gap:** EMUFREE bridges development and production environments
2. **Real-Time Fidelity:** Mode selection affects timing accuracy
3. **Tool Integration:** Modern tools must understand EMUFREE behavior
4. **Security Considerations:** Debug capabilities affect system security
5. **Methodology Impact:** Development process must account for mode differences

The EMUFREE mechanism represents a **sophisticated balance** between **development convenience** and **production fidelity**, enabling effective debugging while maintaining real-time system integrity.

## 20.4.3.13 Accessing Watchdog Timer Registers
**التحديات العميقة في الوصول لـ Registers:**

**المشكلة الأساسية - Clock Domain Crossing:** الـ Watchdog Timer مش مجرد registers عادية! فيه **مشكلة معقدة** في الـ hardware design:

- الـ CPU بيشتغل على **125 MHz**
- الـ Watchdog بيشتغل على **32 kHz**
- الفرق **حوالي 4000 مرة** في السرعة!

**إزاي الـ Hardware بيحل المشكلة دي؟**

**الـ Posted Write Architecture:** الـ AM335x مصمم بنظام اسمه **"==Posted Writes=="**:

1. لما تكتب في أي watchdog register، الـ write **مبيحصلش فوراً**
2. الـ write بيتحط في **internal buffer** (زي queue)
3. الـ hardware بيـ **schedule** الـ write في الـ 32kHz domain
4. بعدها بيـ **execute** الـ write فعلياً
5. وأخيراً بيـ **clear** الـ pending flag

**تفاصيل الـ WWPS Register:**

**إيش معنى كل bit في الـ WWPS؟**

```
WWPS[4] = W_PEND_WSPR  → WSPR register write pending
WWPS[3] = W_PEND_WDLY  → WDLY register write pending  
WWPS[2] = W_PEND_WTGR  → WTGR register write pending
WWPS[1] = W_PEND_WCLR  → WCLR register write pending
WWPS[0] = W_PEND_WLDR  → WLDR register write pending
```

**الـ Write Sequence بالتفصيل الممل:**

**الخطوة 1 - CPU Write:**

```c
WDT_WLDR = 0x12345678;  // CPU كتب القيمة في الـ interface domain
```

في اللحظة دي:

- القيمة **اتكتبت** في register في الـ 125MHz domain
- الـ WWPS[0] **اترفع** فوراً (W_PEND_WLDR = 1)
- القيمة **لسه مووصلتش** للـ functional domain (32kHz)

**الخطوة 2 - Cross-Domain Transfer:** الـ hardware بيعمل **synchronization process**:

- **Clock domain crossing circuit** بيشتغل
- القيمة بتـ **traverse** من الـ fast domain للـ slow domain
- ده بياخد **2-3 cycles** من الـ 32kHz clock

**الخطوة 3 - Functional Domain Write:**

- القيمة **وصلت** للـ actual watchdog logic
- الـ register **اتحدث** فعلياً
- الـ WWPS[0] **اتمسح** تلقائياً (W_PEND_WLDR = 0)

**التوقيت الزمني الدقيق:**

**الـ write بياخد كام وقت؟**

- **Minimum time:** 2 × (1/32000) = 62.5 μs
- **Maximum time:** 3 × (1/32000) = 93.75 μs
- **Average time:** حوالي 78 μs

**ليه فيه variation في الوقت؟** عشان الـ **synchronization timing** يعتمد على:

- **Timing of CPU write** relative to 32kHz clock edge
- **Internal synchronizer delays**
- **Clock jitter** and variations

**مشاكل الـ Register Access:**

**المشكلة الأولى - Write Conflicts:** لو كتبت في register **قبل ما الـ previous write يخلص**:

```c
WDT_WLDR = 0x11111111;          // Write 1
WDT_WLDR = 0x22222222;          // Write 2 - قبل ما Write 1 يخلص!
```

**النتيجة:** Write 2 **هيتضيع** تماماً! مفيش error message ومفيش indication.

**المشكلة التانية - Read-After-Write Hazard:**

```c
WDT_WLDR = 0x12345678;
uint32_t value = WDT_WLDR;      // هقرا إيه؟
```

**الإجابة:** هتقرا القيمة **القديمة** مش الجديدة! لأن الـ write لسه ماخلصش.

**المشكلة التالتة - Interrupt Timing:** لو بتكتب في registers من جوا **interrupt handler**:

- الـ interrupt ممكن يخلص **قبل ما الـ write يخلص**
- لو حصل interrupt تاني، ممكن **يتداخل** مع الـ pending write
- النتيجة: **غير متوقعة** وممكن تكون خطيرة

**الـ Read Operations - بساطة خادعة:**

**الـ Reads مختلفة:** معظم registers الـ **read بيحصل فوراً** - مفيش pending bits للـ reads.

**إستثناء واحد - WDT_WCRR:** زي ما شفنا قبل كده، الـ counter register محتاج **special handling** عشان الـ coherency.

**الحل العملي - Robust Write Function:**

**دالة آمنة للكتابة:**

```c
typedef enum {
    WDT_WRITE_SUCCESS,
    WDT_WRITE_TIMEOUT,
    WDT_WRITE_BUSY
} wdt_write_result_t;

wdt_write_result_t safe_wdt_write(volatile uint32_t* reg, 
                                 uint32_t value, 
                                 uint32_t pending_bit,
                                 uint32_t timeout_us) {
    // 1. تأكد إن مفيش write pending
    uint32_t wait_cycles = timeout_us * (CPU_FREQ_MHZ);
    while ((WDT_WWPS & pending_bit) && (wait_cycles-- > 0));
    
    if (wait_cycles == 0) {
        return WDT_WRITE_TIMEOUT;  // Previous write never completed
    }
    
    // 2. اكتب القيمة الجديدة
    *reg = value;
    
    // 3. انتظر لحد ما الـ write يخلص
    wait_cycles = timeout_us * (CPU_FREQ_MHZ);
    while ((WDT_WWPS & pending_bit) && (wait_cycles-- > 0));
    
    if (wait_cycles == 0) {
        return WDT_WRITE_TIMEOUT;  // Current write never completed
    }
    
    return WDT_WRITE_SUCCESS;
}
```

**الـ Atomic Operations:**

**مشكلة الـ Atomicity:** في الأنظمة متعددة الـ cores أو اللي فيها **preemptive interrupts**، ممكن يحصل:

```c
// Thread/Task 1
WDT_WLDR = value1;

// Thread/Task 2 interrupts here!
WDT_WLDR = value2;  // هيتضيع write الأول!
```

**الحل - Critical Sections:**

```c
void atomic_wdt_write(volatile uint32_t* reg, uint32_t value, uint32_t pending_bit) {
    uint32_t interrupt_state = disable_interrupts();
    
    // Wait for any pending write
    while (WDT_WWPS & pending_bit);
    
    // Write new value
    *reg = value;
    
    // Wait for write completion
    while (WDT_WWPS & pending_bit);
    
    restore_interrupts(interrupt_state);
}
```

**تأثير الـ Posted Writes على الـ Performance:**

**الـ CPU Stalls:** لو استعملت **polling** لانتظار الـ write completion:

- الـ CPU **مش بيعمل حاجة مفيدة** لمدة 78 μs
- ده **waste للـ CPU cycles** (حوالي 10,000 cycles @ 125MHz!)

**الحل الأفضل - Interrupt-Driven:**

```c
// Start write and continue with other work
WDT_WLDR = new_value;
set_wdt_write_completion_callback(handle_write_complete);

// CPU can do other work while waiting
perform_other_tasks();

// Callback when write completes
void handle_write_complete(void) {
    // Write is now complete, safe to proceed
    configure_next_register();
}
```

**Register Access Patterns:**

**الـ Burst Writes - خطر كبير:**

```c
// خطأ شائع - multiple writes without waiting
WDT_WLDR = load_value;
WDT_WCLR = clr_value;     // هيتضيع!
WDT_WDLY = delay_value;   // هيتضيع!
```

**الطريقة الصحيحة:**

```c
WDT_WLDR = load_value;
while (WDT_WWPS & W_PEND_WLDR);

WDT_WCLR = clr_value;
while (WDT_WWPS & W_PEND_WCLR);

WDT_WDLY = delay_value;
while (WDT_WWPS & W_PEND_WDLY);
```

**الـ Error Handling العميق:**

**لو الـ Write عمل Timeout:**

```c
if (safe_wdt_write(&WDT_WLDR, value, W_PEND_WLDR, 1000) == WDT_WRITE_TIMEOUT) {
    // إيه السبب المحتمل؟
    // 1. الـ 32kHz clock واقف
    // 2. مشكلة في الـ power domain
    // 3. الـ hardware في reset state
    // 4. corruption في الـ clock domain crossing logic
    
    handle_critical_hardware_failure();
}
```

**الـ Debug والـ Troubleshooting:**

**إزاي أتأكد إن الـ Register اتكتب فعلاً؟**

```c
// Write value
WDT_WLDR = expected_value;
while (WDT_WWPS & W_PEND_WLDR);

// Read back and verify
uint32_t actual_value = WDT_WLDR;
if (actual_value != expected_value) {
    // Houston, we have a problem!
    log_register_mismatch(expected_value, actual_value);
}
```

**مراقبة الـ Write Performance:**

```c
uint32_t measure_write_time(void) {
    uint32_t start_time = get_high_res_timer();
    
    WDT_WLDR = 0x12345678;
    while (WDT_WWPS & W_PEND_WLDR);
    
    uint32_t end_time = get_high_res_timer();
    return (end_time - start_time);  // في CPU cycles
}
```

**الخلاصة العملية:**

**القواعد الذهبية:**

1. **أبداً ماتكتبش** في register قبل ما تتأكد إن الـ previous write خلص
2. **استعمل الـ WWPS** دايماً للتأكد من completion
3. **احمي الـ critical sections** من الـ interrupts
4. **تعامل مع الـ timeouts** كـ critical errors
5. **اقرا back** القيم المهمة للتأكد إنها اتكتبت صح

**النقطة الأهم:** الـ Posted Write architecture ده **مش bug** - ده **design feature** لحل مشكلة الـ clock domain crossing. بس لازم **نفهمه ونتعامل معاه** صح.

---

### English Technical Analysis:

**Posted Write Architecture Deep Dive:**

**Clock Domain Crossing Problem:** The fundamental challenge lies in the **massive frequency differential** between domains:

- **Interface Domain:** 125 MHz (8 ns period)
- **Functional Domain:** 32 kHz (31.25 μs period)
- **Frequency Ratio:** ~3906:1

**Synchronization Hardware Architecture:**

**Multi-Stage Synchronizer:**

```
CPU Write → Interface Buffer → Clock Domain Crossing → Functional Register
(125MHz)    (125MHz)          (Async Logic)        (32kHz)
    ↓           ↓                    ↓                 ↓
Immediate    Buffered         2-3 32kHz cycles    Actual Update
```

**Posted Write Implementation:**

1. **Write Buffering:** CPU writes go to high-speed buffer
2. **Pending Flag Set:** WWPS bit immediately asserted
3. **Asynchronous Transfer:** Data crosses clock domains
4. **Functional Update:** Target register updated in 32kHz domain
5. **Completion Signal:** WWPS bit automatically cleared

**WWPS Register Detailed Analysis:**

**Bit-by-Bit Functionality:**

```c
#define W_PEND_WLDR    (1 << 0)  // Load register write pending
#define W_PEND_WCLR    (1 << 1)  // Control register write pending  
#define W_PEND_WTGR    (1 << 2)  // Trigger register write pending
#define W_PEND_WDLY    (1 << 3)  // Delay register write pending
#define W_PEND_WSPR    (1 << 4)  // Start/stop register write pending
```

**Hardware State Machine:** Each WWPS bit represents an **independent state machine**:

```
IDLE → WRITE_REQUEST → PENDING → CROSS_DOMAIN → COMPLETE → IDLE
 ↑                      ↓                        ↑
 └─────────── CLEAR_PENDING ←──────────────────┘
```

**Timing Analysis:**

**Write Completion Time Calculation:**

- **Minimum:** 2 × (1/32768) = 61.035 μs
- **Maximum:** 3 × (1/32768) = 91.553 μs
- **Jitter Source:** CPU write timing relative to 32kHz clock edge

**Worst-Case Scenarios:**

- **Back-to-back writes:** Second write lost if attempted too early
- **Interrupt preemption:** Context switch during pending write
- **Clock instability:** 32kHz oscillator frequency variations

**Advanced Access Patterns:**

**Write Hazard Detection:**

```c
typedef struct {
    uint32_t register_address;
    uint32_t pending_bit;
    uint32_t last_write_timestamp;
    bool write_in_progress;
} register_state_t;

static register_state_t wdt_registers[] = {
    {(uint32_t)&WDT_WLDR, W_PEND_WLDR, 0, false},
    {(uint32_t)&WDT_WCLR, W_PEND_WCLR, 0, false},
    // ... other registers
};

bool check_write_hazard(volatile uint32_t* reg) {
    for (int i = 0; i < NUM_WDT_REGISTERS; i++) {
        if ((uint32_t)reg == wdt_registers[i].register_address) {
            return (WDT_WWPS & wdt_registers[i].pending_bit) != 0;
        }
    }
    return false;
}
```

**Optimized Write Sequence:**

```c
typedef struct {
    volatile uint32_t* register_ptr;
    uint32_t value;
    uint32_t pending_bit;
} write_operation_t;

void batch_write_operations(write_operation_t* ops, int count) {
    for (int i = 0; i < count; i++) {
        // Wait for previous operation
        while (WDT_WWPS & ops[i].pending_bit);
        
        // Execute write
        *(ops[i].register_ptr) = ops[i].value;
        
        // Optionally interleave other work here
        if (i < count - 1) {
            perform_interleaved_work();
        }
    }
    
    // Wait for final operation
    while (WDT_WWPS & ops[count-1].pending_bit);
}
```

**Memory Coherency Considerations:**

**Cache Implications:** Watchdog registers are typically in **device memory space**:

- **Non-cacheable:** Prevents cache coherency issues
- **Strongly-ordered:** Guarantees write ordering
- **Memory barriers:** May still be required for optimization prevention

**Compiler Optimizations:**

```c
// Problematic - compiler may optimize away
WDT_WLDR = value1;
WDT_WLDR = value2;  // Compiler might eliminate first write

// Correct - volatile prevents optimization
volatile uint32_t* wdt_ldr = &WDT_WLDR;
*wdt_ldr = value1;
while (WDT_WWPS & W_PEND_WLDR);
*wdt_ldr = value2;
```

**Multi-Threading Synchronization:**

**Thread-Safe Access Pattern:**

```c
static pthread_mutex_t wdt_mutex = PTHREAD_MUTEX_INITIALIZER;

int thread_safe_wdt_write(volatile uint32_t* reg, uint32_t value, uint32_t pending_bit) {
    int result = 0;
    
    if (pthread_mutex_lock(&wdt_mutex) != 0) {
        return -1;
    }
    
    // Critical section - exclusive access
    while (WDT_WWPS & pending_bit);  // Wait for previous write
    *reg = value;                    // Execute write
    while (WDT_WWPS & pending_bit);  // Wait for completion
    
    pthread_mutex_unlock(&wdt_mutex);
    return result;
}
```

**Real-Time Considerations:**

**Deterministic Write Timing:** For real-time systems, **worst-case write time** must be accounted for:

```c
#define MAX_WDT_WRITE_TIME_US    100  // Conservative estimate

void rt_safe_wdt_write(volatile uint32_t* reg, uint32_t value, uint32_t pending_bit) {
    uint32_t deadline = get_rt_time_us() + MAX_WDT_WRITE_TIME_US;
    
    // Wait with deadline monitoring
    while ((WDT_WWPS & pending_bit) && (get_rt_time_us() < deadline));
    
    if (get_rt_time_us() >= deadline) {
        handle_rt_deadline_miss();
        return;
    }
    
    *reg = value;
    
    // Update deadline for completion wait
    deadline = get_rt_time_us() + MAX_WDT_WRITE_TIME_US;
    while ((WDT_WWPS & pending_bit) && (get_rt_time_us() < deadline));
    
    if (get_rt_time_us() >= deadline) {
        handle_rt_deadline_miss();
    }
}
```

**Error Detection and Recovery:**

**Write Verification Strategy:**

```c
typedef enum {
    VERIFY_SUCCESS,
    VERIFY_TIMEOUT,
    VERIFY_READBACK_FAIL,
    VERIFY_HARDWARE_ERROR
} verification_result_t;

verification_result_t verify_register_write(volatile uint32_t* reg, 
                                          uint32_t expected_value,
                                          uint32_t pending_bit) {
    uint32_t timeout = 1000000;  // 1 second @ 1MHz timer
    
    // Wait for write completion
    while ((WDT_WWPS & pending_bit) && (timeout-- > 0));
    
    if (timeout == 0) {
        return VERIFY_TIMEOUT;
    }
    
    // Verify readback value
    uint32_t actual_value = *reg;
    if (actual_value != expected_value) {
        return VERIFY_READBACK_FAIL;
    }
    
    return VERIFY_SUCCESS;
}
```

**Performance Optimization:**

**Asynchronous Write Management:**

```c
typedef struct {
    volatile uint32_t* reg;
    uint32_t value;
    uint32_t pending_bit;
    void (*completion_callback)(void);
    uint32_t start_timestamp;
} async_write_t;

static async_write_t pending_writes[MAX_PENDING_WRITES];
static int pending_write_count = 0;

void start_async_write(volatile uint32_t* reg, uint32_t value, 
                      uint32_t pending_bit, void (*callback)(void)) {
    // Initiate write
    *reg = value;
    
    // Record pending operation
    pending_writes[pending_write_count] = (async_write_t){
        .reg = reg,
        .value = value,
        .pending_bit = pending_bit,
        .completion_callback = callback,
        .start_timestamp = get_timestamp()
    };
    pending_write_count++;
}

void poll_write_completions(void) {
    for (int i = 0; i < pending_write_count; i++) {
        if (!(WDT_WWPS & pending_writes[i].pending_bit)) {
            // Write completed
            if (pending_writes[i].completion_callback) {
                pending_writes[i].completion_callback();
            }
            
            // Remove from pending list
            memmove(&pending_writes[i], &pending_writes[i+1], 
                   (pending_write_count - i - 1) * sizeof(async_write_t));
            pending_write_count--;
            i--;  // Re-check this index
        }
    }
}
```

**Hardware Failure Detection:**

**Clock Domain Health Monitoring:**

```c
typedef struct {
    uint32_t total_writes;
    uint32_t timeout_count;
    uint32_t max_write_time;
    uint32_t min_write_time;
    uint32_t avg_write_time;
} wdt_access_stats_t;

static wdt_access_stats_t access_stats = {0};

void monitor_write_performance(uint32_t write_duration) {
    access_stats.total_writes++;
    
    if (write_duration > access_stats.max_write_time) {
        access_stats.max_write_time = write_duration;
    }
    
    if (access_stats.min_write_time == 0 || write_duration < access_stats.min_write_time) {
        access_stats.min_write_time = write_duration;
    }
    
    // Update rolling average
    access_stats.avg_write_time = 
        ((access_stats.avg_write_time * (access_stats.total_writes - 1)) + write_duration) 
        / access_stats.total_writes;
    
    // Detect anomalies
    if (write_duration > EXPECTED_MAX_WRITE_TIME) {
        log_performance_anomaly(write_duration);
    }
}
```

**Key Architectural Insights:**

1. **Posted writes are not bugs** - they're sophisticated solutions to clock domain crossing
2. **WWPS polling is mandatory** - no exceptions for reliable operation
3. **Write ordering matters** - concurrent access requires careful synchronization
4. **Performance impact is real** - ~100μs per write affects real-time behavior
5. **Error handling is critical** - timeouts indicate serious hardware issues

The register access architecture represents a **carefully engineered compromise** between **performance**, **reliability**, and **hardware complexity** in mixed clock domain systems.

## 20.4.3.14 Low-Level Programming Model
**موضوع السكشن الأساسي - الـ Programming Model:**

السكشن ده بيقدم **نموذج برمجي متكامل** لإدارة الـ Watchdog Timer على مستوى منخفض. بيوضح إزاي تتعامل مع الـ hardware بشكل مباشر وإيه هي الـ sequences الصحيحة للعمليات المختلفة.

**الـ Basic Programming Principles:**

**1. الـ Register Access Model:**

**الـ Write Protocol:** كل عملية كتابة في أي watchdog register لازم تتبع الـ pattern ده:

```c
// النموذج الأساسي لكل كتابة
void write_wdt_register(volatile uint32_t* reg, uint32_t value, uint32_t pending_bit) {
    // انتظار أي عملية سابقة
    while (WDT_WWPS & pending_bit);
    
    // تنفيذ الكتابة
    *reg = value;
    
    // انتظار اكتمال الكتابة
    while (WDT_WWPS & pending_bit);
}
```

**الـ Read Protocol:** القراءة بسيطة لمعظم الـ registers:

```c
uint32_t read_wdt_register(volatile uint32_t* reg) {
    return *reg;  // قراءة مباشرة
}
```

**الاستثناء - WDT_WCRR Counter:** الـ counter register محتاج handling خاص:

```c
uint32_t read_wdt_counter(void) {
    // قراءة مرتين للتأكد من الـ coherency
    uint32_t count1 = WDT_WCRR;
    uint32_t count2 = WDT_WCRR;
    
    // لو القيمتين مختلفتين، اقرا مرة تالتة
    if (count1 != count2) {
        return WDT_WCRR;
    }
    return count1;
}
```

**2. الـ Initialization Sequence:**

**الـ Complete Startup Process:**

```c
void initialize_watchdog(uint32_t timeout_ms) {
    // 1. إيقاف الـ watchdog الأول
    stop_watchdog();
    
    // 2. تكوين الـ timeout value
    uint32_t load_value = calculate_load_value(timeout_ms);
    write_wdt_register(&WDT_WLDR, load_value, W_PEND_WLDR);
    
    // 3. تكوين الـ delay value (اختياري)
    write_wdt_register(&WDT_WDLY, delay_value, W_PEND_WDLY);
    
    // 4. مسح أي interrupts سابقة
    write_wdt_register(&WDT_WCLR, WDT_WCLR_PTV(7) | WDT_WCLR_PRE, W_PEND_WCLR);
    
    // 5. تشغيل الـ watchdog
    start_watchdog();
}
```

**3. الـ Runtime Operations:**

**الـ Watchdog Refresh (Pet/Kick):**

```c
void refresh_watchdog(void) {
    // إعادة تحميل الـ counter بالقيمة الأصلية
    write_wdt_register(&WDT_WTGR, WDT_TRIGGER_VALUE, W_PEND_WTGR);
}
```

**الـ Timeout Value Update:**

```c
void update_timeout(uint32_t new_timeout_ms) {
    // 1. إيقاف الـ watchdog
    stop_watchdog();
    
    // 2. تحديث الـ load value
    uint32_t new_load = calculate_load_value(new_timeout_ms);
    write_wdt_register(&WDT_WLDR, new_load, W_PEND_WLDR);
    
    // 3. إعادة تشغيل الـ watchdog
    start_watchdog();
}
```

**4. الـ Control Operations:**

**Start Watchdog:**

```c
void start_watchdog(void) {
    write_wdt_register(&WDT_WSPR, WDT_START_SEQUENCE, W_PEND_WSPR);
}
```

**Stop Watchdog:**

```c
void stop_watchdog(void) {
    write_wdt_register(&WDT_WSPR, WDT_STOP_SEQUENCE, W_PEND_WSPR);
}
```

**5. الـ Status Monitoring:**

**Check Watchdog Status:**

```c
typedef struct {
    bool is_running;
    bool interrupt_pending;
    uint32_t current_count;
    uint32_t load_value;
} watchdog_status_t;

watchdog_status_t get_watchdog_status(void) {
    watchdog_status_t status = {0};
    
    // حالة التشغيل
    uint32_t wspr = WDT_WSPR;
    status.is_running = (wspr == WDT_RUNNING_STATE);
    
    // حالة الـ interrupt
    uint32_t wisr = WDT_WISR;
    status.interrupt_pending = (wisr & WDT_WISR_OVF_IT_FLAG) != 0;
    
    // القيم الحالية
    status.current_count = read_wdt_counter();
    status.load_value = WDT_WLDR;
    
    return status;
}
```

**الـ Interrupt Handling Model:**

**1. الـ Interrupt Service Routine:**

```c
void watchdog_interrupt_handler(void) {
    // قراءة سبب الـ interrupt
    uint32_t interrupt_status = WDT_WISR;
    
    if (interrupt_status & WDT_WISR_OVF_IT_FLAG) {
        // Overflow interrupt حصل
        handle_watchdog_overflow();
        
        // مسح الـ interrupt flag
        WDT_WISR = WDT_WISR_OVF_IT_FLAG;
    }
    
    if (interrupt_status & WDT_WISR_DLY_IT_FLAG) {
        // Delay interrupt حصل
        handle_watchdog_delay();
        
        // مسح الـ interrupt flag
        WDT_WISR = WDT_WISR_DLY_IT_FLAG;
    }
}
```

**2. الـ Interrupt Configuration:**

```c
void configure_watchdog_interrupts(bool enable_overflow, bool enable_delay) {
    uint32_t wclr_value = WDT_WCLR;
    
    if (enable_overflow) {
        wclr_value |= WDT_WCLR_OVF_IT_ENA;
    }
    
    if (enable_delay) {
        wclr_value |= WDT_WCLR_DLY_IT_ENA;
    }
    
    write_wdt_register(&WDT_WCLR, wclr_value, W_PEND_WCLR);
}
```

**الـ Error Handling Model:**

**1. الـ Timeout Protection:**

```c
typedef enum {
    WDT_SUCCESS,
    WDT_TIMEOUT,
    WDT_HARDWARE_ERROR
} wdt_result_t;

wdt_result_t safe_wdt_write(volatile uint32_t* reg, uint32_t value, uint32_t pending_bit) {
    uint32_t timeout_counter = WDT_TIMEOUT_CYCLES;
    
    // انتظار العملية السابقة مع timeout
    while ((WDT_WWPS & pending_bit) && (timeout_counter-- > 0));
    if (timeout_counter == 0) {
        return WDT_TIMEOUT;
    }
    
    // تنفيذ الكتابة
    *reg = value;
    
    // انتظار اكتمال العملية مع timeout
    timeout_counter = WDT_TIMEOUT_CYCLES;
    while ((WDT_WWPS & pending_bit) && (timeout_counter-- > 0));
    if (timeout_counter == 0) {
        return WDT_TIMEOUT;
    }
    
    return WDT_SUCCESS;
}
```

**2. الـ Hardware Verification:**

```c
bool verify_watchdog_hardware(void) {
    // اختبار الكتابة والقراءة
    uint32_t test_value = 0x12345678;
    uint32_t original_value = WDT_WLDR;
    
    // كتابة قيمة اختبار
    if (safe_wdt_write(&WDT_WLDR, test_value, W_PEND_WLDR) != WDT_SUCCESS) {
        return false;
    }
    
    // قراءة القيمة للتحقق
    uint32_t read_value = WDT_WLDR;
    
    // استرجاع القيمة الأصلية
    safe_wdt_write(&WDT_WLDR, original_value, W_PEND_WLDR);
    
    return (read_value == test_value);
}
```

**الـ Performance Optimization Model:**

**1. الـ Batch Operations:**

```c
void configure_watchdog_batch(uint32_t load_val, uint32_t delay_val, uint32_t control_val) {
    // إيقاف الـ watchdog أولاً
    stop_watchdog();
    
    // تكوين جميع القيم
    write_wdt_register(&WDT_WLDR, load_val, W_PEND_WLDR);
    write_wdt_register(&WDT_WDLY, delay_val, W_PEND_WDLY);
    write_wdt_register(&WDT_WCLR, control_val, W_PEND_WCLR);
    
    // تشغيل الـ watchdog
    start_watchdog();
}
```

**2. الـ Minimal Write Strategy:**

```c
// تجنب الكتابات غير الضرورية
void smart_refresh_watchdog(void) {
    static uint32_t last_refresh_time = 0;
    uint32_t current_time = get_system_time();
    
    // تحديث فقط لو مر وقت كافي
    if ((current_time - last_refresh_time) >= MIN_REFRESH_INTERVAL) {
        refresh_watchdog();
        last_refresh_time = current_time;
    }
}
```

**الـ Debug and Diagnostics Model:**

**1. الـ Register Dump Function:**

```c
void dump_watchdog_registers(void) {
    printf("WDT Register Dump:\n");
    printf("WLDR: 0x%08X\n", WDT_WLDR);
    printf("WCRR: 0x%08X\n", read_wdt_counter());
    printf("WCLR: 0x%08X\n", WDT_WCLR);
    printf("WDLY: 0x%08X\n", WDT_WDLY);
    printf("WSPR: 0x%08X\n", WDT_WSPR);
    printf("WWPS: 0x%08X\n", WDT_WWPS);
    printf("WISR: 0x%08X\n", WDT_WISR);
}
```

**2. الـ Performance Monitoring:**

```c
typedef struct {
    uint32_t write_count;
    uint32_t total_write_time;
    uint32_t max_write_time;
    uint32_t timeout_count;
} wdt_performance_stats_t;

static wdt_performance_stats_t perf_stats = {0};

void monitor_write_performance(uint32_t write_duration) {
    perf_stats.write_count++;
    perf_stats.total_write_time += write_duration;
    
    if (write_duration > perf_stats.max_write_time) {
        perf_stats.max_write_time = write_duration;
    }
    
    if (write_duration > EXPECTED_MAX_WRITE_TIME) {
        perf_stats.timeout_count++;
    }
}
```

**الـ State Machine Model:**

**Watchdog State Management:**

```c
typedef enum {
    WDT_STATE_UNINITIALIZED,
    WDT_STATE_INITIALIZED,
    WDT_STATE_RUNNING,
    WDT_STATE_STOPPED,
    WDT_STATE_ERROR
} watchdog_state_t;

static watchdog_state_t current_state = WDT_STATE_UNINITIALIZED;

void update_watchdog_state(watchdog_state_t new_state) {
    // التحقق من صحة الانتقال
    if (is_valid_state_transition(current_state, new_state)) {
        current_state = new_state;
    } else {
        // انتقال غير صحيح
        handle_invalid_state_transition(current_state, new_state);
    }
}
```

**الـ Critical Section Model:**

**Thread-Safe Operations:**

```c
void thread_safe_refresh_watchdog(void) {
    // حماية من المقاطعات
    uint32_t interrupt_state = disable_interrupts();
    
    // تنفيذ العملية
    refresh_watchdog();
    
    // استعادة حالة المقاطعات
    restore_interrupts(interrupt_state);
}
```

**الخلاصة العملية للنموذج البرمجي:**

**القواعد الأساسية:**

1. **Always use WWPS:** كل كتابة تحتاج checking للـ pending status
2. **Serialize operations:** العمليات لازم تتم بشكل متتالي مش متوازي
3. **Handle timeouts:** حماية من infinite loops في حالة hardware failure
4. **Verify operations:** تأكد إن العمليات نجحت فعلاً
5. **Optimize batching:** اجمع العمليات المتعلقة مع بعض

**النموذج المتكامل:**

```c
// مثال شامل لاستخدام الـ programming model
int main(void) {
    // 1. التحقق من الـ hardware
    if (!verify_watchdog_hardware()) {
        return ERROR_HARDWARE_FAIL;
    }
    
    // 2. التهيئة
    initialize_watchdog(WATCHDOG_TIMEOUT_MS);
    
    // 3. تكوين الـ interrupts
    configure_watchdog_interrupts(true, false);
    
    // 4. الحلقة الرئيسية
    while (system_running) {
        // تنفيذ مهام النظام
        perform_system_tasks();
        
        // تحديث الـ watchdog
        smart_refresh_watchdog();
        
        // مراقبة الحالة
        watchdog_status_t status = get_watchdog_status();
        if (!status.is_running) {
            handle_watchdog_stopped();
        }
    }
    
    // 5. إيقاف نظيف
    stop_watchdog();
    return SUCCESS;
}
```

**النقطة المحورية:** السكشن بيقدم **framework متكامل** للتعامل مع الـ Watchdog Timer على المستوى المنخفض، مع التركيز على **الموثوقية والأداء والأمان**.

---

### English Technical Analysis:

**Section Focus - Comprehensive Programming Framework:**

This section presents a **complete low-level programming model** for the AM335x Watchdog Timer, establishing the fundamental patterns and practices for reliable hardware interaction.

**Core Programming Principles:**

**1. Register Access Abstraction:**

**Standardized Write Pattern:** The programming model establishes a **uniform write protocol** for all watchdog registers:

```c
wdt_result_t wdt_register_write(volatile uint32_t* reg, uint32_t value, uint32_t pending_bit) {
    // Pre-write synchronization
    while (WDT_WWPS & pending_bit);
    
    // Execute write operation
    *reg = value;
    
    // Post-write synchronization  
    while (WDT_WWPS & pending_bit);
    
    return WDT_SUCCESS;
}
```

**Read Operation Handling:** Different read behaviors based on register characteristics:

```c
// Standard immediate read
uint32_t wdt_register_read(volatile uint32_t* reg) {
    return *reg;
}

// Counter-specific coherent read
uint32_t wdt_counter_read(void) {
    uint32_t val1 = WDT_WCRR;
    uint32_t val2 = WDT_WCRR;
    return (val1 == val2) ? val1 : WDT_WCRR;
}
```

**2. Initialization Framework:**

**Complete Startup Sequence:**

```c
typedef struct {
    uint32_t timeout_ms;
    uint32_t delay_ms;
    bool enable_interrupts;
    bool auto_start;
} wdt_config_t;

wdt_result_t wdt_initialize(const wdt_config_t* config) {
    // Step 1: Ensure stopped state
    if (wdt_stop() != WDT_SUCCESS) {
        return WDT_ERROR_STOP_FAILED;
    }
    
    // Step 2: Configure load value
    uint32_t load_val = calculate_load_value(config->timeout_ms);
    if (wdt_register_write(&WDT_WLDR, load_val, W_PEND_WLDR) != WDT_SUCCESS) {
        return WDT_ERROR_LOAD_FAILED;
    }
    
    // Step 3: Configure delay if specified
    if (config->delay_ms > 0) {
        uint32_t delay_val = calculate_delay_value(config->delay_ms);
        if (wdt_register_write(&WDT_WDLY, delay_val, W_PEND_WDLY) != WDT_SUCCESS) {
            return WDT_ERROR_DELAY_FAILED;
        }
    }
    
    // Step 4: Configure control register
    uint32_t control_val = build_control_value(config);
    if (wdt_register_write(&WDT_WCLR, control_val, W_PEND_WCLR) != WDT_SUCCESS) {
        return WDT_ERROR_CONTROL_FAILED;
    }
    
    // Step 5: Start if requested
    if (config->auto_start) {
        return wdt_start();
    }
    
    return WDT_SUCCESS;
}
```

**3. Runtime Operation Patterns:**

**Refresh Operation Model:**

```c
wdt_result_t wdt_refresh(void) {
    static uint32_t last_refresh_time = 0;
    uint32_t current_time = get_system_time_ms();
    
    // Prevent excessive refresh rate
    if ((current_time - last_refresh_time) < MIN_REFRESH_INTERVAL_MS) {
        return WDT_SUCCESS; // Skip redundant refresh
    }
    
    wdt_result_t result = wdt_register_write(&WDT_WTGR, WDT_TRIGGER_VALUE, W_PEND_WTGR);
    if (result == WDT_SUCCESS) {
        last_refresh_time = current_time;
    }
    
    return result;
}
```

**Dynamic Reconfiguration:**

```c
wdt_result_t wdt_update_timeout(uint32_t new_timeout_ms) {
    // Capture current state
    bool was_running = wdt_is_running();
    
    // Stop for reconfiguration
    wdt_result_t result = wdt_stop();
    if (result != WDT_SUCCESS) {
        return result;
    }
    
    // Update load value
    uint32_t new_load = calculate_load_value(new_timeout_ms);
    result = wdt_register_write(&WDT_WLDR, new_load, W_PEND_WLDR);
    if (result != WDT_SUCCESS) {
        return result;
    }
    
    // Restore running state if previously active
    if (was_running) {
        result = wdt_start();
    }
    
    return result;
}
```

**4. Control State Management:**

**State Machine Implementation:**

```c
typedef enum {
    WDT_STATE_UNINITIALIZED,
    WDT_STATE_CONFIGURED,
    WDT_STATE_RUNNING,
    WDT_STATE_STOPPED,
    WDT_STATE_ERROR
} wdt_state_t;

static wdt_state_t current_state = WDT_STATE_UNINITIALIZED;

wdt_result_t wdt_start(void) {
    if (current_state != WDT_STATE_CONFIGURED && current_state != WDT_STATE_STOPPED) {
        return WDT_ERROR_INVALID_STATE;
    }
    
    wdt_result_t result = wdt_register_write(&WDT_WSPR, WDT_START_SEQUENCE, W_PEND_WSPR);
    if (result == WDT_SUCCESS) {
        current_state = WDT_STATE_RUNNING;
    }
    
    return result;
}

wdt_result_t wdt_stop(void) {
    wdt_result_t result = wdt_register_write(&WDT_WSPR, WDT_STOP_SEQUENCE, W_PEND_WSPR);
    if (result == WDT_SUCCESS) {
        current_state = WDT_STATE_STOPPED;
    }
    
    return result;
}
```

**5. Status and Monitoring Framework:**

**Comprehensive Status Retrieval:**

```c
typedef struct {
    wdt_state_t state;
    uint32_t current_count;
    uint32_t load_value;
    uint32_t time_remaining_ms;
    bool overflow_interrupt_pending;
    bool delay_interrupt_pending;
    uint32_t pending_writes;
} wdt_status_t;

wdt_status_t wdt_get_status(void) {
    wdt_status_t status = {0};
    
    // State determination
    status.state = current_state;
    
    // Current counter value
    status.current_count = wdt_counter_read();
    
    // Configuration values
    status.load_value = WDT_WLDR;
    
    // Time calculations
    status.time_remaining_ms = calculate_time_remaining(status.current_count);
    
    // Interrupt status
    uint32_t wisr = WDT_WISR;
    status.overflow_interrupt_pending = (wisr & WDT_WISR_OVF_IT_FLAG) != 0;
    status.delay_interrupt_pending = (wisr & WDT_WISR_DLY_IT_FLAG) != 0;
    
    // Pending operations
    status.pending_writes = WDT_WWPS;
    
    return status;
}
```

**6. Interrupt Service Model:**

**Structured Interrupt Handling:**

```c
typedef struct {
    void (*overflow_handler)(void);
    void (*delay_handler)(void);
    void* user_context;
} wdt_interrupt_handlers_t;

static wdt_interrupt_handlers_t interrupt_handlers = {0};

void wdt_interrupt_service_routine(void) {
    uint32_t interrupt_status = WDT_WISR;
    
    // Handle overflow interrupt
    if (interrupt_status & WDT_WISR_OVF_IT_FLAG) {
        if (interrupt_handlers.overflow_handler) {
            interrupt_handlers.overflow_handler();
        }
        
        // Clear interrupt flag
        WDT_WISR = WDT_WISR_OVF_IT_FLAG;
    }
    
    // Handle delay interrupt
    if (interrupt_status & WDT_WISR_DLY_IT_FLAG) {
        if (interrupt_handlers.delay_handler) {
            interrupt_handlers.delay_handler();
        }
        
        // Clear interrupt flag
        WDT_WISR = WDT_WISR_DLY_IT_FLAG;
    }
}
```

**7. Error Handling and Recovery:**

**Timeout Protection Mechanism:**

```c
#define WDT_OPERATION_TIMEOUT_US    200
#define WDT_MAX_RETRY_COUNT         3

wdt_result_t wdt_register_write_protected(volatile uint32_t* reg, uint32_t value, uint32_t pending_bit) {
    for (int retry = 0; retry < WDT_MAX_RETRY_COUNT; retry++) {
        uint32_t timeout_counter = WDT_OPERATION_TIMEOUT_US * CPU_FREQ_MHZ;
        
        // Wait for previous operation
        while ((WDT_WWPS & pending_bit) && (timeout_counter-- > 0));
        if (timeout_counter == 0) {
            continue; // Retry
        }
        
        // Execute write
        *reg = value;
        
        // Wait for completion
        timeout_counter = WDT_OPERATION_TIMEOUT_US * CPU_FREQ_MHZ;
        while ((WDT_WWPS & pending_bit) && (timeout_counter-- > 0));
        if (timeout_counter == 0) {
            continue; // Retry
        }
        
        return WDT_SUCCESS;
    }
    
    return WDT_ERROR_TIMEOUT;
}
```

**Hardware Verification:**

```c
wdt_result_t wdt_verify_hardware(void) {
    // Test register access
    uint32_t test_patterns[] = {0x12345678, 0x87654321, 0xAAAA5555, 0x5555AAAA};
    uint32_t original_load = WDT_WLDR;
    
    for (int i = 0; i < sizeof(test_patterns)/sizeof(test_patterns[0]); i++) {
        // Write test pattern
        wdt_result_t result = wdt_register_write_protected(&WDT_WLDR, test_patterns[i], W_PEND_WLDR);
        if (result != WDT_SUCCESS) {
            return WDT_ERROR_HARDWARE_WRITE;
        }
        
        // Read back and verify
        uint32_t readback = WDT_WLDR;
        if (readback != test_patterns[i]) {
            return WDT_ERROR_HARDWARE_READBACK;
        }
    }
    
    // Restore original value
    wdt_register_write_protected(&WDT_WLDR, original_load, W_PEND_WLDR);
    
    return WDT_SUCCESS;
}
```

**8. Performance Optimization Framework:**

**Batch Operation Support:**

```c
typedef struct {
    volatile uint32_t* register_ptr;
    uint32_t value;
    uint32_t pending_bit;
} wdt_batch_operation_t;

wdt_result_t wdt_execute_batch(const wdt_batch_operation_t* operations, int count) {
    // Stop watchdog for atomic batch update
    wdt_result_t result = wdt_stop();
    if (result != WDT_SUCCESS) {
        return result;
    }
    
    // Execute all operations
    for (int i = 0; i < count; i++) {
        result = wdt_register_write_protected(
            operations[i].register_ptr,
            operations[i].value,
            operations[i].pending_bit
        );
        
        if (result != WDT_SUCCESS) {
            // Attempt to restore previous state
            wdt_start();
            return result;
        }
    }
    
    // Restart watchdog
    return wdt_start();
}
```

**Intelligent Refresh Strategy:**

```c
typedef struct {
    uint32_t min_interval_ms;
    uint32_t max_interval_ms;
    uint32_t adaptive_threshold;
    bool adaptive_mode;
} wdt_refresh_policy_t;

static wdt_refresh_policy_t refresh_policy = {
    .min_interval_ms = 100,
    .max_interval_ms = 5000,
    .adaptive_threshold = 75, // Percentage of timeout
    .adaptive_mode = true
};

wdt_result_t wdt_intelligent_refresh(void) {
    static uint32_t last_refresh = 0;
    uint32_t current_time = get_system_time_ms();
    
    if (refresh_policy.adaptive_mode) {
        wdt_status_t status = wdt_get_status();
        uint32_t time_used_percent = ((status.load_value - status.current_count) * 100) / status.load_value;
        
        if (time_used_percent >= refresh_policy.adaptive_threshold) {
            // Force refresh when approaching timeout
            return wdt_refresh();
        }
    }
    
    // Standard interval-based refresh
    if ((current_time - last_refresh) >= refresh_policy.min_interval_ms) {
        last_refresh = current_time;
        return wdt_refresh();
    }
    
    return WDT_SUCCESS;
}
```

**Programming Model Key Characteristics:**

1. **Abstraction Layer:** Hides low-level register access complexity
2. **Error Handling:** Comprehensive timeout and retry mechanisms
3. **State Management:** Clear state machine with validation
4. **Performance Optimization:** Batching and intelligent refresh strategies
5. **Hardware Verification:** Built-in self-test capabilities
6. **Interrupt Integration:** Structured callback-based interrupt handling
7. **Thread Safety:** Protection mechanisms for multi-threaded environments

The programming model provides a **complete abstraction framework** that enables **reliable, efficient, and maintainable** watchdog timer implementations while handling all the low-level hardware complexities transparently.

## 20.4.3.14.1.2 Main Sequence – Watchdog Timer Module Global Initialization
**موضوع السكشن - التهيئة الأولية للوحدة:**

السكشن ده بيقدم **خطوات التهيئة الأولى** للـ Watchdog Timer module لما نستعمله **لأول مرة** في النظام. دي عملية one-time initialization بتحصل عند بداية تشغيل النظام.

**تحليل Table 20-107 - خطوات التهيئة العامة:**

**Step 1: Execute Software Reset**

```
Register: WDT_WDSC[1] SOFTRESET
Value: 1
```

**الهدف:**

- **إعادة تعيين شاملة** للـ watchdog module
- **مسح جميع الحالات السابقة** والإعدادات
- **إرجاع جميع الـ registers** لحالتها الافتراضية

**التنفيذ العملي:**

```c
void wdt_global_reset(void) {
    // تنفيذ software reset
    WDT_WDSC |= WDT_WDSC_SOFTRESET;
}
```

**Step 2: Wait Until Reset Release**

```
Register: WDT_WDSC[1] SOFTRESET  
Value: 0
```

**الهدف:**

- **انتظار اكتمال عملية الـ reset**
- التأكد إن الـ module **جاهز للاستخدام**
- **الـ hardware بيمسح الـ bit تلقائياً** لما الـ reset يخلص

**التنفيذ العملي:**

```c
void wdt_wait_reset_complete(void) {
    // انتظار اكتمال الـ reset
    while (WDT_WDSC & WDT_WDSC_SOFTRESET) {
        // مستني لحد ما الـ bit يترجع 0
    }
}
```

**Step 3: Enable Delay Interrupt**

```
Register: WDT_WIRQENSET[1] ENABLE_DLY
Value: 1
```

**الهدف:**

- **تفعيل delay interrupt** على مستوى النظام
- ده **مختلف** عن تفعيل الـ interrupt في الـ WDT_WCLR register
- بيتحكم في **إرسال الـ interrupt signal** للـ interrupt controller

**التنفيذ العملي:**

```c
void wdt_enable_delay_interrupt_global(void) {
    // تفعيل delay interrupt على مستوى النظام
    WDT_WIRQENSET = WDT_WIRQENSET_ENABLE_DLY;
}
```

**Step 4: Enable Overflow Interrupt**

```
Register: WDT_WIRQENSET[0] ENABLE_OVF
Value: 1
```

**الهدف:**

- **تفعيل overflow interrupt** على مستوى النظام
- بيضمن إن الـ overflow events **تصل للـ CPU**
- **مكمل للإعداد المحلي** في WDT_WCLR

**التنفيذ العملي:**

```c
void wdt_enable_overflow_interrupt_global(void) {
    // تفعيل overflow interrupt على مستوى النظام
    WDT_WIRQENSET = WDT_WIRQENSET_ENABLE_OVF;
}
```

**الـ Complete Global Initialization Function:**

```c
wdt_result_t wdt_global_initialization(void) {
    // Step 1: Execute software reset
    WDT_WDSC |= WDT_WDSC_SOFTRESET;
    
    // Step 2: Wait until reset release
    uint32_t timeout = WDT_RESET_TIMEOUT_CYCLES;
    while ((WDT_WDSC & WDT_WDSC_SOFTRESET) && (timeout-- > 0)) {
        // Wait for reset completion
    }
    
    if (timeout == 0) {
        return WDT_ERROR_RESET_TIMEOUT;
    }
    
    // Step 3: Enable delay interrupt globally
    WDT_WIRQENSET = WDT_WIRQENSET_ENABLE_DLY;
    
    // Step 4: Enable overflow interrupt globally  
    WDT_WIRQENSET = WDT_WIRQENSET_ENABLE_OVF;
    
    return WDT_SUCCESS;
}
```

---

## 20.4.3.14.2 Operational Mode Configuration

### 20.4.3.14.2.1 Main Sequence – Watchdog Timer Basic Configuration

**موضوع السكشن - التكوين الأساسي للعمليات:**

السكشن ده بيوضح **خطوات التكوين الأساسي** للـ watchdog timer للاستخدام العادي. دي العملية اللي بتحصل **قبل كل تشغيل** للـ watchdog.

**تحليل Table 20-108 - خطوات التكوين الأساسي:**

**Step 1: Disable the Watchdog Timer**

```
Action: See Section 20.4.3.14.2.2
```

**الهدف:**

- **إيقاف الـ watchdog** قبل التكوين
- **ضمان الأمان** أثناء تغيير الإعدادات
- **منع تداخل العمليات** أثناء التكوين

**Step 2: Set Prescaler Value**

```
Register: WDT_WCLR[4:2] PTV
Value: xxx (حسب التطبيق)
```

**الهدف:**

- **تحديد معامل القسمة** للـ clock
- **التحكم في دقة التوقيت** والـ resolution
- **تحديد المدى الزمني** المتاح للـ timeout

**قيم الـ Prescaler:**

```c
typedef enum {
    WDT_PRESCALER_1   = 0,  // /1   - أسرع وأدق
    WDT_PRESCALER_2   = 1,  // /2
    WDT_PRESCALER_4   = 2,  // /4
    WDT_PRESCALER_8   = 3,  // /8
    WDT_PRESCALER_16  = 4,  // /16
    WDT_PRESCALER_32  = 5,  // /32
    WDT_PRESCALER_64  = 6,  // /64
    WDT_PRESCALER_128 = 7   // /128 - أبطأ ومدى أطول
} wdt_prescaler_t;
```

**Step 3: Enable Prescaler**

```
Register: WDT_WCLR[5] PRE
Value: 1
```

**الهدف:**

- **تفعيل الـ prescaler** المحدد في الخطوة السابقة
- **بدون تفعيل الـ prescaler** مش هيشتغل
- **لازم يتفعل** حتى لو الـ prescaler value = 0

**Step 4: Load Delay Configuration Value**

```
Register: WDT_WDLY
Value: xxx (حسب التطبيق)
```

**الهدف:**

- **تحديد فترة التأخير** بين الـ overflow والـ reset
- **إعطاء فرصة للـ software** يتعامل مع الـ overflow
- **تكوين الـ delay interrupt** timing

**Step 5: Load Timer Counter Value**

```
Register: WDT_WCRR  
Value: xxx (حسب التطبيق)
```

**الهدف:**

- **تحديد القيمة الابتدائية** للـ counter
- **تحديد timeout period** للـ watchdog
- **ده اللي بيحدد** قد إيه الوقت المتاح قبل الـ overflow

**Step 6: Enable the Watchdog Timer**

```
Action: See Section 20.4.3.14.2.3
```

**الهدف:**

- **تشغيل الـ watchdog** بعد اكتمال التكوين
- **بداية العد التنازلي** والمراقبة
- **تفعيل الحماية** الفعلية للنظام

**الـ Complete Basic Configuration Function:**

```c
typedef struct {
    wdt_prescaler_t prescaler;
    uint32_t delay_value;
    uint32_t counter_value;
    bool enable_delay_interrupt;
    bool enable_overflow_interrupt;
} wdt_basic_config_t;

wdt_result_t wdt_basic_configuration(const wdt_basic_config_t* config) {
    wdt_result_t result;
    
    // Step 1: Disable watchdog timer
    result = wdt_disable(); // Reference to section 20.4.3.14.2.2
    if (result != WDT_SUCCESS) {
        return result;
    }
    
    // Step 2: Set prescaler value
    uint32_t wclr_value = WDT_WCLR;
    wclr_value &= ~WDT_WCLR_PTV_MASK; // Clear existing PTV bits
    wclr_value |= WDT_WCLR_PTV(config->prescaler);
    
    // Step 3: Enable prescaler (combined with step 2)
    wclr_value |= WDT_WCLR_PRE;
    
    // Add interrupt enables if requested
    if (config->enable_delay_interrupt) {
        wclr_value |= WDT_WCLR_DLY_IT_ENA;
    }
    if (config->enable_overflow_interrupt) {
        wclr_value |= WDT_WCLR_OVF_IT_ENA;
    }
    
    // Write control register with posted write handling
    result = wdt_register_write(&WDT_WCLR, wclr_value, W_PEND_WCLR);
    if (result != WDT_SUCCESS) {
        return result;
    }
    
    // Step 4: Load delay configuration value
    result = wdt_register_write(&WDT_WDLY, config->delay_value, W_PEND_WDLY);
    if (result != WDT_SUCCESS) {
        return result;
    }
    
    // Step 5: Load timer counter value  
    result = wdt_register_write(&WDT_WCRR, config->counter_value, W_PEND_WCRR);
    if (result != WDT_SUCCESS) {
        return result;
    }
    
    // Step 6: Enable watchdog timer
    result = wdt_enable(); // Reference to section 20.4.3.14.2.3
    
    return result;
}
```

**مثال عملي للاستخدام:**

```c
int main(void) {
    // Global initialization (one time only)
    wdt_result_t result = wdt_global_initialization();
    if (result != WDT_SUCCESS) {
        handle_initialization_error(result);
        return -1;
    }
    
    // Basic configuration for application
    wdt_basic_config_t config = {
        .prescaler = WDT_PRESCALER_64,          // Divide by 64
        .delay_value = 0x1000,                  // Delay before reset
        .counter_value = 0x8000,                // Initial counter value
        .enable_delay_interrupt = true,         // Enable delay interrupt
        .enable_overflow_interrupt = true       // Enable overflow interrupt
    };
    
    result = wdt_basic_configuration(&config);
    if (result != WDT_SUCCESS) {
        handle_configuration_error(result);
        return -1;
    }
    
    // Main application loop
    while (system_running) {
        perform_application_tasks();
        
        // Refresh watchdog periodically
        wdt_refresh();
    }
    
    return 0;
}
```

**الفرق بين Global Initialization وBasic Configuration:**

**Global Initialization:**

- **يحصل مرة واحدة** عند بداية النظام
- **على مستوى الـ module** ككل
- **يتعامل مع الـ system-level settings**
- **مطلوب قبل أي استخدام** للـ watchdog

**Basic Configuration:**

- **يحصل قبل كل استخدام** للـ watchdog
- **على مستوى الـ operation** المحددة
- **يتعامل مع الـ application-specific settings**
- **يمكن تكراره** حسب الحاجة

**النقاط المهمة:**

1. **التسلسل مهم:** لازم تتم الخطوات بالترتيب المحدد
2. **Posted writes:** كل الـ register writes محتاجة WWPS handling
3. **Error handling:** كل خطوة محتاجة verification
4. **State management:** لازم tracking لحالة الـ watchdog
5. **Reference sections:** بعض الخطوات محتاجة تفاصيل إضافية من sections تانية

**الخلاصة:** السكشن ده بيقدم **roadmap واضح** للتهيئة والتكوين، مع التركيز على **الترتيب الصحيح** والـ **dependencies** بين الخطوات المختلفة.

---

### English Technical Analysis:

**Section Focus - Systematic Initialization Framework:**

These sections establish the **complete initialization and configuration workflow** for the AM335x Watchdog Timer, differentiating between **one-time global setup** and **per-operation configuration**.

**Global Initialization Analysis (Table 20-107):**

**Step 1 - Software Reset Execution:**

```
WDT_WDSC[1] SOFTRESET = 1
```

**Purpose:** Complete module reset to known state **Implementation:**

```c
static inline void wdt_execute_software_reset(void) {
    WDT_WDSC |= (1 << 1);  // Set SOFTRESET bit
}
```

**Step 2 - Reset Completion Wait:**

```
WDT_WDSC[1] SOFTRESET = 0 (hardware cleared)
```

**Purpose:** Synchronization point for reset completion **Implementation:**

```c
wdt_result_t wdt_wait_reset_completion(uint32_t timeout_ms) {
    uint32_t start_time = get_system_time_ms();
    
    while (WDT_WDSC & (1 << 1)) {
        if ((get_system_time_ms() - start_time) > timeout_ms) {
            return WDT_ERROR_RESET_TIMEOUT;
        }
    }
    return WDT_SUCCESS;
}
```

**Step 3 - Global Delay Interrupt Enable:**

```
WDT_WIRQENSET[1] ENABLE_DLY = 1
```

**Purpose:** System-level interrupt routing enablement **Implementation:**

```c
static inline void wdt_enable_delay_interrupt_routing(void) {
    WDT_WIRQENSET |= (1 << 1);  // Enable delay interrupt routing
}
```

**Step 4 - Global Overflow Interrupt Enable:**

```
WDT_WIRQENSET[0] ENABLE_OVF = 1
```

**Purpose:** System-level overflow interrupt routing **Implementation:**

```c
static inline void wdt_enable_overflow_interrupt_routing(void) {
    WDT_WIRQENSET |= (1 << 0);  // Enable overflow interrupt routing
}
```

**Complete Global Initialization Framework:**

```c
typedef struct {
    uint32_t reset_timeout_ms;
    bool enable_delay_interrupt_routing;
    bool enable_overflow_interrupt_routing;
} wdt_global_init_config_t;

wdt_result_t wdt_global_initialize(const wdt_global_init_config_t* config) {
    // Step 1: Execute software reset
    wdt_execute_software_reset();
    
    // Step 2: Wait for reset completion with timeout
    wdt_result_t result = wdt_wait_reset_completion(config->reset_timeout_ms);
    if (result != WDT_SUCCESS) {
        return result;
    }
    
    // Step 3: Configure delay interrupt routing
    if (config->enable_delay_interrupt_routing) {
        wdt_enable_delay_interrupt_routing();
    }
    
    // Step 4: Configure overflow interrupt routing
    if (config->enable_overflow_interrupt_routing) {
        wdt_enable_overflow_interrupt_routing();
    }
    
    return WDT_SUCCESS;
}
```

**Basic Configuration Analysis (Table 20-108):**

**Step 1 - Watchdog Disable:** References external section for disable procedure, emphasizing **safe configuration state**.

**Step 2 - Prescaler Value Configuration:**

```
WDT_WCLR[4:2] PTV = xxx
```

**Purpose:** Clock division factor setting for timeout range control **Implementation:**

```c
typedef enum {
    WDT_PRESCALER_DIV_1   = 0,  // 32 kHz / 1   = 32 kHz
    WDT_PRESCALER_DIV_2   = 1,  // 32 kHz / 2   = 16 kHz
    WDT_PRESCALER_DIV_4   = 2,  // 32 kHz / 4   = 8 kHz
    WDT_PRESCALER_DIV_8   = 3,  // 32 kHz / 8   = 4 kHz
    WDT_PRESCALER_DIV_16  = 4,  // 32 kHz / 16  = 2 kHz
    WDT_PRESCALER_DIV_32  = 5,  // 32 kHz / 32  = 1 kHz
    WDT_PRESCALER_DIV_64  = 6,  // 32 kHz / 64  = 512 Hz
    WDT_PRESCALER_DIV_128 = 7   // 32 kHz / 128 = 256 Hz
} wdt_prescaler_value_t;

wdt_result_t wdt_set_prescaler_value(wdt_prescaler_value_t prescaler) {
    uint32_t wclr_value = WDT_WCLR;
    wclr_value &= ~(0x7 << 2);  // Clear PTV field
    wclr_value |= (prescaler << 2);  // Set new PTV value
    
    return wdt_register_write(&WDT_WCLR, wclr_value, W_PEND_WCLR);
}
```

**Step 3 - Prescaler Enable:**

```
WDT_WCLR[5] PRE = 1
```

**Purpose:** Activation of prescaler function **Implementation:**

```c
wdt_result_t wdt_enable_prescaler(void) {
    uint32_t wclr_value = WDT_WCLR;
    wclr_value |= (1 << 5);  // Set PRE bit
    
    return wdt_register_write(&WDT_WCLR, wclr_value, W_PEND_WCLR);
}
```

**Step 4 - Delay Configuration Load:**

```
WDT_WDLY = xxx
```

**Purpose:** Reset delay timer value configuration **Implementation:**

```c
wdt_result_t wdt_load_delay_value(uint32_t delay_value) {
    return wdt_register_write(&WDT_WDLY, delay_value, W_PEND_WDLY);
}
```

**Step 5 - Counter Value Load:**

```
WDT_WCRR = xxx
```

**Purpose:** Initial countdown value establishment **Implementation:**

```c
wdt_result_t wdt_load_counter_value(uint32_t counter_value) {
    return wdt_register_write(&WDT_WCRR, counter_value, W_PEND_WCRR);
}
```

**Step 6 - Watchdog Enable:** References external section for enable procedure.

**Integrated Configuration Framework:**

```c
typedef struct {
    wdt_prescaler_value_t prescaler;
    bool enable_prescaler;
    uint32_t delay_value;
    uint32_t initial_counter_value;
    bool enable_delay_interrupt;
    bool enable_overflow_interrupt;
} wdt_basic_config_t;

wdt_result_t wdt_configure_basic(const wdt_basic_config_t* config) {
    wdt_result_t result;
    
    // Step 1: Disable watchdog for safe configuration
    result = wdt_disable();
    if (result != WDT_SUCCESS) return result;
    
    // Steps 2-3: Configure prescaler (atomic operation)
    uint32_t wclr_value = WDT_WCLR;
    
    // Clear and set prescaler value
    wclr_value &= ~(0x7 << 2);
    wclr_value |= (config->prescaler << 2);
    
    // Enable/disable prescaler
    if (config->enable_prescaler) {
        wclr_value |= (1 << 5);
    } else {
        wclr_value &= ~(1 << 5);
    }
    
    // Configure interrupts
    if (config->enable_delay_interrupt) {
        wclr_value |= WDT_WCLR_DLY_IT_ENA;
    }
    if (config->enable_overflow_interrupt) {
        wclr_value |= WDT_WCLR_OVF_IT_ENA;
    }
    
    result = wdt_register_write(&WDT_WCLR, wclr_value, W_PEND_WCLR);
    if (result != WDT_SUCCESS) return result;
    
    // Step 4: Load delay configuration
    result = wdt_register_write(&WDT_WDLY, config->delay_value, W_PEND_WDLY);
    if (result != WDT_SUCCESS) return result;
    
    // Step 5: Load initial counter value
    result = wdt_register_write(&WDT_WCRR, config->initial_counter_value, W_PEND_WCRR);
    if (result != WDT_SUCCESS) return result;
    
    // Step 6: Enable watchdog
    result = wdt_enable();
    
    return result;
}
```

**Timeout Calculation Framework:**

```c
uint32_t wdt_calculate_timeout_ms(wdt_prescaler_value_t prescaler, uint32_t counter_value) {
    const uint32_t base_freq_hz = 32000;  // 32 kHz base frequency
    const uint32_t prescaler_values[] = {1, 2, 4, 8, 16, 32, 64, 128};
    
    uint32_t effective_freq = base_freq_hz / prescaler_values[prescaler];
    uint32_t timeout_ms = (counter_value * 1000) / effective_freq;
    
    return timeout_ms;
}

uint32_t wdt_calculate_counter_value(wdt_prescaler_value_t prescaler, uint32_t timeout_ms) {
    const uint32_t base_freq_hz = 32000;
    const uint32_t prescaler_values[] = {1, 2, 4, 8, 16, 32, 64, 128};
    
    uint32_t effective_freq = base_freq_hz / prescaler_values[prescaler];
    uint32_t counter_value = (timeout_ms * effective_freq) / 1000;
    
    return counter_value;
}
```

**Usage Example:**

```c
int application_watchdog_setup(void) {
    // One-time global initialization
    wdt_global_init_config_t global_config = {
        .reset_timeout_ms = 100,
        .enable_delay_interrupt_routing = true,
        .enable_overflow_interrupt_routing = true
    };
    
    wdt_result_t result = wdt_global_initialize(&global_config);
    if (result != WDT_SUCCESS) {
        return -1;
    }
    
    // Application-specific configuration
    wdt_basic_config_t basic_config = {
        .prescaler = WDT_PRESCALER_DIV_64,
        .enable_prescaler = true,
        .delay_value = 0x800,
        .initial_counter_value = wdt_calculate_counter_value(WDT_PRESCALER_DIV_64, 5000), // 5 second timeout
        .enable_delay_interrupt = true,
        .enable_overflow_interrupt = true
    };
    
    result = wdt_configure_basic(&basic_config);
    if (result != WDT_SUCCESS) {
        return -1;
    }
    
    return 0;
}
```

**Key Architectural Insights:**

1. **Two-Phase Initialization:** Global setup separate from operational configuration
2. **Dependencies:** Clear sequence requirements with external section references
3. **Posted Write Integration:** All register updates require WWPS synchronization
4. **Atomic Configuration:** Control register updates combined for efficiency
5. **Calculation Framework:** Systematic timeout and counter value computation
6. **Error Propagation:** Comprehensive result checking at each step

The framework establishes a **systematic approach** to watchdog timer initialization that ensures **correct hardware state** and **reliable operation** through **well-defined configuration sequences**.
# .
# .


____
|