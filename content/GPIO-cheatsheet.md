# AM335x GPIO Registers Cheatsheet

## GPIO Register Map Overview

```ascii
Base Address + Offset    Register Name           Purpose
─────────────────────────────────────────────────────────
0x00                    GPIO_REVISION           Module info
0x10                    GPIO_SYSCONFIG          System config
0x20                    GPIO_EOI                DMA event ack
0x24-0x48               IRQ Status/Control      Interrupt handling
0x114                   GPIO_SYSSTATUS          Reset status
0x130                   GPIO_CTRL               Clock control
0x134                   GPIO_OE                 Direction control
0x138                   GPIO_DATAIN             Input data
0x13C                   GPIO_DATAOUT            Output data
0x140-0x14C             Level/Edge Detect       Interrupt triggers
0x150-0x154             Debounce Control        Input filtering
0x190-0x194             Set/Clear Output        Atomic operations
```

الـ **GPIO_DATAOUT** هو **32-bit register** بيحدد قيم الـ **output pins** (0 أو 1) لكل pin في الـ GPIO module، وبيتحدث **synchronously** مع الـ interface clock.

الـ **GPIO_SYSCONFIG** هو register بيتحكم في **power management** و **system configuration** للـ GPIO module، زي الـ **AUTOIDLE** (clock gating)، **ENAWAKEUP** (wake-up capability)، **SOFTRESET** (software reset)، و **IDLEMODE** (idle behavior).
- الـ IDLEMODE اللى بيحدد ننيم الـ GPIO modules ولا لا. بمعنى آخر **IDLEMODE** هو **2-bit field** في الـ GPIO_SYSCONFIG register بيحدد سلوك الـ GPIO لما النظام يطلب **sleep mode**: **0=Force-Idle** (فوري مع منع wake-up)، **1=No-Idle** (مش بيدخل idle)، **2/3=Smart-Idle** (بيقيم الحالة الداخلية قبل دخول idle).
- الـ ENAWAKEUP لو مش معمولها set الجهاز مش يعرف يصحى ابداً. بمعنى آخر **ENAWAKEUP** هو **bit** في الـ GPIO_SYSCONFIG register بيفعل أو يمنع الـ **wake-up capability** للـ GPIO module **globally** - لو **0** الـ GPIO_IRQWAKEN مالوش تأثير، لو **1** الـ wake-up requests تشتغل عادي.
- الـ **SOFTRESET** هو **bit** في الـ GPIO_SYSCONFIG register بيعمل **software reset** للـ GPIO module بنفس تأثير الـ **hardware reset**، وبيتمسح **automatically** بعد الـ reset ويحدث الـ **RESETDONE bit** لما يخلص.

الـ **GPIO_SYSSTATUS** هو **read-only register** بيراقب **reset status** للـ GPIO module، والـ **RESETDONE bit** بيأكد إن الـ **reset اكتمل** على الـ **OCP** و **Debouncing clock domains** سوا.
- الـ **RESETDONE** هو **status bit** في الـ GPIO_SYSSTATUS register بيكون **0** أثناء الـ **reset process** وبيصير **1** لما الـ **reset يكتمل** على الـ **OCP** و **Debouncing clock domains** سوا.
- الـ **SOFTRESET** هو **bit** في الـ GPIO_SYSCONFIG register بيعمل **software reset** للـ GPIO module بنفس تأثير الـ **hardware reset**، وبيتمسح **automatically** بعد الـ reset ويحدث الـ **RESETDONE bit** لما يخلص.

الـ **GPIO_IRQSTATUS_SET_0** هو register بيفعل **interrupt generation** للـ **interrupt line 0** - كتابة **1** في أي bit بتفعل interrupt للـ pin المقابل، وكتابة **0** مالهاش تأثير.

## ملخص الـ Registers

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

## Quick Start Sequence

### Basic GPIO Setup Flow

1. **Check Reset Status** → GPIO_SYSSTATUS
2. **Configure System** → GPIO_SYSCONFIG
3. **Enable Module** → GPIO_CTRL
4. **Set Direction** → GPIO_OE
5. **Configure Interrupts** (if needed) → IRQ registers
6. **Read/Write Data** → GPIO_DATAIN/DATAOUT

---

## System Control Registers

### GPIO_REVISION (0x00) - READ ONLY

**Purpose**: Module identification and version info **Prerequisites**: None **Reset Value**: 0x50600801

|Field|Bits|Description|
|---|---|---|
|SCHEME|31-30|Version scheme (1h = current)|
|FUNC|27-16|Module family (60h)|
|RTL|15-11|RTL version|
|MAJOR|10-8|Major revision|
|MINOR|5-0|Minor revision|

### GPIO_SYSCONFIG (0x10)

**Purpose**: L4 interconnect parameters and power management **Prerequisites**: None **Reset Value**: 0x00000000

|Field|Bits|Values|Description|
|---|---|---|---|
|IDLEMODE|4-3|0=Force-idle, 1=No-idle, 2=Smart-idle, 3=Smart-idle wakeup|Power management control|
|ENAWAKEUP|2|0=Disabled, 1=Enabled|Wakeup capability|
|SOFTRESET|1|1=Reset module|Software reset (auto-clears)|
|AUTOIDLE|0|0=Free-running, 1=Auto-gated|Internal clock gating|

**⚠️ Important**: When AUTOIDLE=1, GPIO_DATAIN has 3 OCP cycle latency vs 2 cycles when AUTOIDLE=0

### GPIO_SYSSTATUS (0x114) - READ ONLY

**Purpose**: Reset completion status **Prerequisites**: After writing SOFTRESET **Reset Value**: 0x00000000

|Field|Bits|Description|
|---|---|---|
|RESETDONE|0|0=Reset ongoing, 1=Reset complete|

### GPIO_CTRL (0x130)

**Purpose**: Module-level clock gating control **Prerequisites**: None **Reset Value**: 0x00000000

|Field|Bits|Values|Description|
|---|---|---|---|
|GATINGRATIO|2-1|0=No div, 1=÷2, 2=÷4, 3=÷8|Event detection clock division|
|DISABLEMODULE|0|0=Enabled, 1=Disabled|Module enable/disable|

**Setup Steps**:

1. Clear DISABLEMODULE (bit 0) to enable module
2. Set GATINGRATIO as needed for event detection timing

---

## Data Direction and I/O

### GPIO_OE (0x134) - Output Enable

**Purpose**: Configure pin direction (input/output) **Prerequisites**: Module must be enabled (GPIO_CTRL) **Reset Value**: 0xFFFFFFFF (all inputs)

|Bit Value|Pin Configuration|
|---|---|
|0|Output|
|1|Input (default)|

**Setup Steps**:

1. Write 0 to bit N to make GPIO_N an output
2. Write 1 to bit N to make GPIO_N an input

### GPIO_DATAIN (0x138) - READ ONLY

**Purpose**: Read current pin states **Prerequisites**: None (always readable) **Reset Value**: 0x00000000

**Usage**: Direct read returns sampled input data

- Data synchronized with interface clock
- 2 clock cycle capture delay (3 cycles if AUTOIDLE=1)

### GPIO_DATAOUT (0x13C)

**Purpose**: Set output pin values **Prerequisites**: Pin must be configured as output (GPIO_OE) **Reset Value**: 0x00000000

**Usage**:

- Direct write sets output values
- Can also use GPIO_SETDATAOUT/GPIO_CLEARDATAOUT for atomic operations

---

## Atomic Output Control

### GPIO_SETDATAOUT (0x194)

**Purpose**: Atomically set output bits to 1 **Prerequisites**: Pin configured as output **Reset Value**: 0x00000000

|Write Value|Effect|
|---|---|
|0|No change|
|1|Set corresponding DATAOUT bit to 1|

### GPIO_CLEARDATAOUT (0x190)

**Purpose**: Atomically clear output bits to 0 **Prerequisites**: Pin configured as output  
**Reset Value**: 0x00000000

|Write Value|Effect|
|---|---|
|0|No change|
|1|Clear corresponding DATAOUT bit to 0|

**Advantage**: Atomic set/clear prevents race conditions in multi-threaded environments

---

## Interrupt System

### IRQ Status Registers

#### GPIO_IRQSTATUS_RAW_0/1 (0x24/0x28)

**Purpose**: Shows ALL interrupt events (enabled + disabled) **Use Case**: Debug - see all GPIO activity

|Write Value|Effect|
|---|---|
|0|No effect|
|1|Manually trigger IRQ (debug)|

#### GPIO_IRQSTATUS_0/1 (0x2C/0x30)

**Purpose**: Shows only ENABLED interrupt events **Use Case**: Main interrupt handling

|Write Value|Effect|
|---|---|
|0|No effect|
|1|Clear interrupt (acknowledge)|

### IRQ Control Registers

#### GPIO_IRQSTATUS_SET_0/1 (0x34/0x38)

**Purpose**: Enable interrupts for specific pins

|Write Value|Effect|
|---|---|
|0|No effect|
|1|Enable IRQ for this pin|

#### GPIO_IRQSTATUS_CLR_0/1 (0x3C/0x40)

**Purpose**: Disable interrupts for specific pins

|Write Value|Effect|
|---|---|
|0|No effect|
|1|Disable IRQ for this pin|

### Interrupt Setup Sequence

1. **Configure trigger type** → LEVELDETECT/RISINGDETECT/FALLINGDETECT
2. **Enable interrupt** → GPIO_IRQSTATUS_SET_0/1
3. **Enable wakeup** (optional) → GPIO_IRQWAKEN_0/1
4. **Handle in ISR** → Read GPIO_IRQSTATUS_0/1, then write 1 to clear

---

## Interrupt Trigger Configuration

### GPIO_LEVELDETECT0 (0x140)

**Purpose**: Enable low-level (0) interrupt detection **Prerequisites**: Pin configured as input

|Bit Value|Effect|
|---|---|
|0|Disable low-level detection|
|1|Enable IRQ on low level|

### GPIO_LEVELDETECT1 (0x144)

**Purpose**: Enable high-level (1) interrupt detection  
**Prerequisites**: Pin configured as input

|Bit Value|Effect|
|---|---|
|0|Disable high-level detection|
|1|Enable IRQ on high level|

### GPIO_RISINGDETECT (0x148)

**Purpose**: Enable rising-edge (0→1) interrupt detection **Prerequisites**: Pin configured as input

|Bit Value|Effect|
|---|---|
|0|Disable rising-edge detection|
|1|Enable IRQ on rising edge|

### GPIO_FALLINGDETECT (0x14C)

**Purpose**: Enable falling-edge (1→0) interrupt detection **Prerequisites**: Pin configured as input

|Bit Value|Effect|
|---|---|
|0|Disable falling-edge detection|
|1|Enable IRQ on falling edge|

**⚠️ Warning**: Enabling both LEVELDETECT0 and LEVELDETECT1 for same pin creates constant interrupt!

---

## Input Debouncing

### GPIO_DEBOUNCENABLE (0x150)

**Purpose**: Enable/disable debouncing per pin **Prerequisites**: Pin configured as input **Reset Value**: 0x00000000

|Bit Value|Effect|
|---|---|
|0|Disable debouncing|
|1|Enable debouncing|

### GPIO_DEBOUNCINGTIME (0x154)

**Purpose**: Set global debounce time for all enabled pins **Prerequisites**: None **Reset Value**: 0x00000000

|Field|Bits|Formula|
|---|---|---|
|DEBOUNCETIME|7-0|Debounce = (VALUE + 1) × 31 μs|

**Examples**:

- 0x00 = 31 μs
- 0x01 = 62 μs
- 0xFF = 7.936 ms

**Setup Steps**:

1. Set DEBOUNCINGTIME register
2. Enable debouncing for specific pins in DEBOUNCENABLE

---

## Wakeup Control

### GPIO_IRQWAKEN_0/1 (0x44/0x48)

**Purpose**: Enable GPIO interrupts to wake system from idle **Prerequisites**:

- ENAWAKEUP bit set in GPIO_SYSCONFIG
- Not in Force-Idle mode
- Corresponding interrupt enabled

|Bit Value|Effect|
|---|---|
|0|Disable wakeup generation|
|1|Enable wakeup on interrupt|

---

## DMA Support

### GPIO_EOI (0x20)

**Purpose**: Acknowledge DMA event completion **Prerequisites**: DMA operation completed **Reset Value**: 0x00000000

**Usage**: Write 0 to bit 0 after DMA completes to enable next DMA event

---

## Common GPIO Usage Patterns

### Simple Output Control

```ascii
1. GPIO_CTRL[0] = 0        (Enable module)
2. GPIO_OE[pin] = 0        (Set as output)  
3. GPIO_DATAOUT[pin] = 1   (Set high)
   OR
   GPIO_SETDATAOUT[pin] = 1 (Atomic set)
```

### Simple Input Reading

```ascii
1. GPIO_CTRL[0] = 0        (Enable module)
2. GPIO_OE[pin] = 1        (Set as input - default)
3. value = GPIO_DATAIN[pin] (Read state)
```

### Interrupt-Driven Input

```ascii
1. GPIO_CTRL[0] = 0              (Enable module)
2. GPIO_OE[pin] = 1              (Set as input)
3. GPIO_RISINGDETECT[pin] = 1    (Enable rising edge)
4. GPIO_IRQSTATUS_SET_0[pin] = 1 (Enable interrupt)
5. In ISR: GPIO_IRQSTATUS_0[pin] = 1 (Clear interrupt)
```

### Debounced Input

```ascii
1. GPIO_CTRL[0] = 0               (Enable module)
2. GPIO_DEBOUNCINGTIME = 0x20     (Set debounce time)
3. GPIO_DEBOUNCENABLE[pin] = 1    (Enable for pin)
4. GPIO_OE[pin] = 1               (Set as input)
5. Configure interrupt triggers as needed
```

## Register Access Notes

- **Read-Only**: GPIO_REVISION, GPIO_SYSSTATUS, GPIO_DATAIN
- **Write-1-to-Clear**: GPIO_IRQSTATUS_0/1
- **Write-1-to-Set**: GPIO_IRQSTATUS_SET_0/1
- **Write-1-to-Clear**: GPIO_IRQSTATUS_CLR_0/1
- **Auto-Clear**: GPIO_SYSCONFIG[SOFTRESET]

## Performance Tips

1. Use atomic set/clear registers for thread-safe output control
2. Disable AUTOIDLE for faster GPIO_DATAIN reads
3. Use appropriate GATINGRATIO for power vs performance balance
4. Group related GPIO operations to minimize register accesses