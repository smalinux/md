# AM335x Watchdog Timer Cheatsheet

## 🔧 **Basic Architecture**

```
32-bit Counter + Prescaler (1:128) → RESET + IRQ
```

- **Functional Clock:** 32 kHz (WDTi_FCLK) - Always ON
- **Interface Clock:** 125 MHz (WDTi_ICLK) - Always ON
- **Default Reset Period:** 2 seconds
- **Counter Range:** 0x00000000 to 0xFFFFFFFF

## 📊 **Key Registers**

| Register   | Purpose               | Notes                     |
| ---------- | --------------------- | ------------------------- |
| `WDT_WCRR` | Current counter value | Read-only, special access |
| `WDT_WLDR` | Load register         | Default: 0xFFFFFFBE       |
| `WDT_WTGR` | Trigger reload        | Write any different value |
| `WDT_WDLY` | Delay interrupt value | Early warning trigger     |
| `WDT_WCLR` | Control/Prescaler     | PTV[4:2] + PRE[5]         |
| `WDT_WSPR` | Start/Stop            | Special sequences only    |

## ⚙️ **Prescaler Configuration**

|PRE|PTV|Clock Divider|Notes|
|---|---|---|---|
|0|X|1|No division|
|1|0|1|Enabled but no division|
|1|1|2|Divide by 2|
|1|2|4|Divide by 4|
|1|3|8|Divide by 8|
|1|4|16|Divide by 16|
|1|5|32|Divide by 32|
|1|6|64|Divide by 64|
|1|7|128|Divide by 128|

**Formula:** `Clock Divider = 2^PTV` (when PRE=1)

## 🚦 **Start/Stop Sequences**

### Stop Timer:

```c
WDT_WSPR = 0xAAAA;  // Step 1
// Poll WDT_WWPS.W_PEND_WSPR until clear
WDT_WSPR = 0x5555;  // Step 2  
// Poll WDT_WWPS.W_PEND_WSPR until clear
```

### Start Timer:

```c
WDT_WSPR = 0xBBBB;  // Step 1
// Poll WDT_WWPS.W_PEND_WSPR until clear
WDT_WSPR = 0x4444;  // Step 2
// Poll WDT_WWPS.W_PEND_WSPR until clear
```

## ⏱️ **Timing Calculations**

### Overflow Rate Formula:

```
OVF_Rate = (0xFFFFFFFF - WDT_WLDR + 1) × (1/32kHz) × Prescaler
```

### Example Reset Periods (32kHz, Prescaler=2):

|WDT_WLDR|Reset Period|
|---|---|
|0x00000000|74h 34min|
|0xFFFF0000|4 seconds|
|0xFFFFFFF0|1 ms|
|0xFFFFFFFF|62.5 µs|

## 🔔 **Interrupts**

### Interrupt Sources:

|Event|Flag|Enable|Disable|Purpose|
|---|---|---|---|---|
|Overflow|`WIRQSTAT[0]`|`WIRQENSET[0]=1`|`WIRQENCLR[0]=1`|Reset warning|
|Delay|`WIRQSTAT[1]`|`WIRQENSET[1]=1`|`WIRQENCLR[1]=1`|Early warning|

### ISR Template:

```c
void watchdog_isr(void) {
    uint32_t status = WDT_WIRQSTAT;
    
    if (status & 0x1) {
        // Handle overflow interrupt
        WDT_WIRQSTAT = 0x1;  // Clear by writing 1
    }
    
    if (status & 0x2) {
        // Handle delay interrupt
        WDT_WIRQSTAT = 0x2;  // Clear by writing 1
    }
}
```

## 🔄 **Reload Operations**

### Manual Reload (Pet the Dog):

```c
// Write any value different from previous
static uint32_t toggle = 0;
WDT_WTGR = toggle++;
```

### Reload with New Value:

```c
// Must stop timer first
// Stop sequence...
WDT_WLDR = new_value;
// Start sequence...
// Then trigger reload
WDT_WTGR = 0x1234;
```

## 📖 **Reading Counter Safely**

### 32-bit Coherent Read:

```c
uint32_t read_counter(void) {
    uint16_t low = *(volatile uint16_t*)(WDT_BASE + 0x08);   // LSB first
    uint16_t high = *(volatile uint16_t*)(WDT_BASE + 0x0A);  // MSB second
    return (high << 16) | low;
}
```

## ⚠️ **Critical Warnings**

- **Never set WDT_WLDR = 0xFFFFFFFF** - Causes immediate reset/interrupt
- **Write latency:** 1.5-2.5 functional clock cycles for WDT_WSPR
- **Clock domains:** Always consider synchronization between 32kHz and 125MHz
- **Posted writes:** Check WDT_WWPS for completion
- **Reset behavior:** Watchdog enabled after any system reset

## 🛠️ **Basic Configuration Sequence**

```c
// 1. Stop watchdog
// (Stop sequence above)

// 2. Configure prescaler
WDT_WCLR = (PTV_VALUE << 2) | (1 << 5);  // Set PTV and enable PRE

// 3. Set load value
WDT_WLDR = load_value;

// 4. Set delay interrupt (optional)
WDT_WDLY = delay_value;

// 5. Enable interrupts (optional)
WDT_WIRQENSET = 0x3;  // Enable both overflow and delay

// 6. Start watchdog
// (Start sequence above)
```

## 🎯 **Common Use Cases**

### Standard 10-second Watchdog:

```c
// 32kHz, prescaler=32, ~10 second timeout
WDT_WCLR = (5 << 2) | (1 << 5);  // PTV=5 (32), PRE=1
WDT_WLDR = 0xFFFF6000;           // ~10 seconds
```

### Early Warning System:

```c
WDT_WLDR = 0x00000000;           // Start from 0
WDT_WDLY = 0xFFFFF000;           // Interrupt at 97%
WDT_WIRQENSET = 0x2;             // Enable delay interrupt only
```

## 🔍 **Debug Configuration**

### Stop During Debug:

```c
WDT_WDSC &= ~(1 << 1);  // EMUFREE=0, allow debug suspend
// Configure Debug Subsystem Suspend_Control = 0x9
```

## 📋 **Register Addresses (Typical Base + Offset)**

| Register        | Offset | Access |                                                                                                                                                                                                                                                                                                                                                             |
| --------------- | ------ | ------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| WDT_WIDR        | 0x00   | R      | ID                                                                                                                                                                                                                                                                                                                                                          |
| WDT_WDSC        | 0x10   | RW     | SC = system control \| Watchdog System Control Register: Controls high-level system behavior like soft reset, idle modes, and emulation behavior. This is where you'd configure how the watchdog behaves during debugging or low-power states.                                                                                                              |
| WDT_WDST        | 0x14   | R      |                                                                                                                                                                                                                                                                                                                                                             |
| WDT_WISR        | 0x18   | R      | Interrupt status                                                                                                                                                                                                                                                                                                                                            |
| WDT_WIER        | 0x1C   | RW     | The Watchdog Interrupt Enable Register controls (enable/disable) the interrupt events.                                                                                                                                                                                                                                                                      |
| WDT_WCLR        | 0x24   | RW     | Control Register (change prescaler, )                                                                                                                                                                                                                                                                                                                       |
| WDT_WCRR        | 0x28   | R      | CR = Current \| This is the current counter value! <br>You can read this to see how much time is left before timeout. Since it's a 32-bit upward counter, it **starts** at the WLDR value and counts up toward 0xFFFFFFFF.                                                                                                                                  |
| WDT_WLDR        | 0x2C   | RW     | LD = load \| القيمه اللى بيبدأ يعد منها<br>WLDR => Starting point <br>0xFFFFFFFF => Ending point.<br>So we control the starting point actually.                                                                                                                                                                                                             |
| WDT_WTGR        | 0x30   | RW     | TGR = Trigger \| This is the "pet the dog" register. Writing any value here reloads the counter with the WLDR value, preventing timeout. This is what your software writes to periodically to keep the system running.<br>اكتب اي قيمه هنا, هتخلى الـ watchdog يعمل restart                                                                                 |
| WDT_WWPS        | 0x34   | R      | دا بيقولك لما تكتب حاجه فى register, هل فعلا خلص الكتابه, ولا لسه<br>Watchdog Write Posting Bits Register: This is important for synchronization. Since the watchdog runs on a 32kHz clock but the processor interface runs much faster, writes to certain registers need time to take effect. This register tells you when previous writes have completed. |
| WDT_WDLY        | 0x44   | RW     | Delay, ايه القيمه اللى تكتبها علشان ينبهك قبلها بشويه                                                                                                                                                                                                                                                                                                       |
| WDT_WSPR        | 0x48   | RW     | SP = Start/Stop<br>Watchdog Start/Stop Register: Controls whether the watchdog is running. You write specific sequences to this register to start/stop the watchdog timer.                                                                                                                                                                                  |
| WDT_WIRQSTATRAW | 0x54   | R      | W IRQ STAT Raw                                                                                                                                                                                                                                                                                                                                              |
| WDT_WIRQSTAT    | 0x58   | RW     | W IRQ STAT                                                                                                                                                                                                                                                                                                                                                  |
| WDT_WIRQENSET   | 0x5C   | RW     | IRQ Enable Set \| Watchdog Interrupt Enable **Set** Register                                                                                                                                                                                                                                                                                                |
| WDT_WIRQENCLR   | 0x60   | RW     | IRQ Enable Clear                                                                                                                                                                                                                                                                                                                                            |
[WDT_WIER vs WDT_WIRQENSET](WDT_WIER%20vs%20WDT_WIRQENSET.md)