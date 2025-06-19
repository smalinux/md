

```bash
git checkout smalinux main branch
```


```bash
nv net.server=192.168.0.134
reset
boot bnet
```




____
## Memory Management Functions

### `dev_request_mem_resource(dev, 0)`

**Purpose:** Get the hardware address and reserve memory
**Simple explanation:** "Where is the watchdog hardware located in memory? Get the answer from device tree"

**What it does:**

- Looks up the watchdog hardware address from device tree
- Reserves that memory area so no other driver can use it
- Returns information about the memory region

---

### `IOMEM(iores->start)`

**Purpose:** Convert hardware address to usable pointer
**Simple explanation:** "Make the hardware address usable by the software"
**What it does:**

- Takes the physical hardware address
- Converts it to a virtual address the CPU can use
- Returns a pointer for reading/writing registers
____
# `asm-generic/io.h` Cheatsheet

## 📖 Basic Read Functions

### Single Value Reads

```c
u8  readb(addr)     // Read 1 byte  (8-bit)
u16 readw(addr)     // Read 2 bytes (16-bit) 
u32 readl(addr)     // Read 4 bytes (32-bit)
u64 readq(addr)     // Read 8 bytes (64-bit) [64-bit systems only]
```

### Raw Reads (No Endian Conversion)

```c
u8  __raw_readb(addr)   // Raw 8-bit read
u16 __raw_readw(addr)   // Raw 16-bit read  
u32 __raw_readl(addr)   // Raw 32-bit read
u64 __raw_readq(addr)   // Raw 64-bit read [64-bit only]
```

### Relaxed Reads (Less Memory Barriers)
Barriers? Relaxed?

```c
u8  readb_relaxed(addr)
u16 readw_relaxed(addr) 
u32 readl_relaxed(addr)
u64 readq_relaxed(addr)
```

## ✏️ Basic Write Functions

### Single Value Writes

```c
writeb(value, addr)    // Write 1 byte
writew(value, addr)    // Write 2 bytes
writel(value, addr)    // Write 4 bytes  
writeq(value, addr)    // Write 8 bytes [64-bit only]
```

### Raw Writes (No Endian Conversion)

```c
__raw_writeb(value, addr)   // Raw 8-bit write
__raw_writew(value, addr)   // Raw 16-bit write
__raw_writel(value, addr)   // Raw 32-bit write
__raw_writeq(value, addr)   // Raw 64-bit write [64-bit only]
```

### Relaxed Writes (Less Memory Barriers)

```c
writeb_relaxed(value, addr)
writew_relaxed(value, addr)
writel_relaxed(value, addr) 
writeq_relaxed(value, addr)
```

## 🔄 Bulk Transfer Functions

### Multiple Reads from Same Address

```c
readsb(addr, buffer, count)    // Read count bytes into buffer
readsw(addr, buffer, count)    // Read count 16-bit words  
readsl(addr, buffer, count)    // Read count 32-bit words
readsq(addr, buffer, count)    // Read count 64-bit words [64-bit only]
```

### Multiple Writes to Same Address

```c
writesb(addr, buffer, count)   // Write count bytes from buffer
writesw(addr, buffer, count)   // Write count 16-bit words
writesl(addr, buffer, count)   // Write count 32-bit words  
writesq(addr, buffer, count)   // Write count 64-bit words [64-bit only]
```

## 🔌 Port I/O Functions (x86 Style)

### Single Port Operations

```c
u8  inb(port)          // Read byte from I/O port
u16 inw(port)          // Read word from I/O port  
u32 inl(port)          // Read long from I/O port

outb(value, port)      // Write byte to I/O port
outw(value, port)      // Write word to I/O port
outl(value, port)      // Write long to I/O port
```

### Port Operations with Delay (_p versions)

```c
u8  inb_p(port)        // Read byte with pause
u16 inw_p(port)        // Read word with pause
u32 inl_p(port)        // Read long with pause

outb_p(value, port)    // Write byte with pause  
outw_p(value, port)    // Write word with pause
outl_p(value, port)    // Write long with pause
```

### Bulk Port Operations

```c
insb(port, buffer, count)    // Read count bytes from port
insw(port, buffer, count)    // Read count words from port
insl(port, buffer, count)    // Read count longs from port

outsb(port, buffer, count)   // Write count bytes to port
outsw(port, buffer, count)   // Write count words to port  
outsl(port, buffer, count)   // Write count longs to port
```

## 🔀 Alternative I/O Functions

### Generic I/O (Same as read/write)

```c
u8  ioread8(addr)      // = readb(addr)
u16 ioread16(addr)     // = readw(addr)  
u32 ioread32(addr)     // = readl(addr)
u64 ioread64(addr)     // = readq(addr) [64-bit only]

iowrite8(value, addr)  // = writeb(value, addr)
iowrite16(value, addr) // = writew(value, addr)
iowrite32(value, addr) // = writel(value, addr)  
iowrite64(value, addr) // = writeq(value, addr) [64-bit only]
```

### Big-Endian I/O Functions

```c
u16 ioread16be(addr)   // Read 16-bit big-endian
u32 ioread32be(addr)   // Read 32-bit big-endian
u64 ioread64be(addr)   // Read 64-bit big-endian [64-bit only]

iowrite16be(value, addr) // Write 16-bit big-endian  
iowrite32be(value, addr) // Write 32-bit big-endian
iowrite64be(value, addr) // Write 64-bit big-endian [64-bit only]
```

### Repeated I/O Operations

```c
ioread8_rep(addr, buffer, count)    // = readsb()
ioread16_rep(addr, buffer, count)   // = readsw() 
ioread32_rep(addr, buffer, count)   // = readsl()
ioread64_rep(addr, buffer, count)   // = readsq() [64-bit only]

iowrite8_rep(addr, buffer, count)   // = writesb()
iowrite16_rep(addr, buffer, count)  // = writesw()
iowrite32_rep(addr, buffer, count)  // = writesl() 
iowrite64_rep(addr, buffer, count)  // = writesq() [64-bit only]
```

## 🧠 Memory Operations

### Block Memory Operations

```c
memset_io(addr, value, size)           // Set I/O memory to value
memcpy_fromio(buffer, io_addr, size)   // Copy from I/O to RAM
memcpy_toio(io_addr, buffer, size)     // Copy from RAM to I/O
```

### Address Conversion
??
```c
unsigned long virt_to_phys(virt_addr)  // Virtual → Physical address
void *phys_to_virt(phys_addr)          // Physical → Virtual address  
```

### Address Mapping Macro
??
```c
IOMEM(addr)    // Convert address to __iomem pointer
```
____
## 🔧 Key Concepts

### **Endianness**

- **Regular functions** (`readw`, `writel`) → Handle little-endian conversion
- **Raw functions** (`__raw_readw`) → No endian conversion
- **Big-endian functions** (`ioread32be`) → Handle big-endian conversion

### **Memory Barriers**

- **Regular functions** → Include memory barriers for ordering
- **Relaxed functions** → Fewer barriers, better performance, less ordering

### **Function Families**

1. **read/write** → Standard memory-mapped I/O
2. **in/out** → Port-based I/O (mainly x86)
3. **ioread/iowrite** → Generic I/O (same as read/write)
4. **__raw_** → Direct hardware access, no conversions

### **Usage Patterns**

```c
// Typical device register access
void __iomem *base = ioremap(phys_addr, size);
u32 status = readl(base + STATUS_REG);
writel(0x1, base + CONTROL_REG);

// Bulk data transfer  
readsl(base + DATA_REG, buffer, count);

// Port I/O (x86)
outb(0x80, 0x3f8);  // Write to serial port
u8 data = inb(0x3f8);  // Read from serial port
```


## ⚠️ Important Notes

- Use `volatile void __iomem *` for I/O memory pointers
- Always use proper functions for hardware access (never direct pointer dereference)
- Choose function based on your endianness and ordering requirements
- `_p` versions add delays for slow hardware
- 64-bit functions only available on 64-bit systems
👍👍👍
_____
















































https://www.barebox.org/demo/


```
$ magicvar
```

لو عايز تعمل manual, هنا تقدر توصف الـ partitions:
```
global.fastboot.partitions = auto
global.usbgadget.autorun = yes
```

الطريقه الافضل انك تعمل المتغيرات وقت الـ compile & build

- للأسف مافيش USB Ethernet Gadget Support في barebox
  يا إما تركب USB Ethernet Adapter يا تستخدم ال Ethernet العادي


الratp بيعرف يعمل حاجات ظريفة زي انك تعمل mount لfile system عبر الserial
مفيد لو ما عندكش Ethernet مثلا



----
عن دعم Allwinner فى barebox

There is initial support upstream and some more support here:
https://github.com/jmaselbas/barebox
You can reach out to the author on the barebox IRC
More hardware support is always welcome

--------

uboot:
	user nv.user=none
	server: netserver ip
	nfs: server port, use env vars to fix this port number, and choose high number of nfs
	global.nfsserver


### misc barebox config

```
[10:02 pm, 17/03/2025] Ahmed Fatoum: mkdir -p barebox/env/nv
[10:02 pm, 17/03/2025] Ahmed Fatoum: echo mmc1 > barebox/env/nv/boot.default
```

```
bootm /mnt/mmc1.1/boot/zImage -o /mnt/mmc1.1/boot/am335-beagleboneblack.dtb
```


> am335x-boneblack.conf
```
# /loader/entries/am335x-boneblack.conf 

title		poky am335x-boneblack
version		v6.12
options		rootwait rw
linux		/boot/zImage
devicetree	/boot/am335x-boneblack.dtb
linux-appendroot	true
```

> boot.default
```
# $bareboxenv/nv/boot.default

mmc1
```

==barebox will then check inside mmc1 for all files matching /loader/entries/*.conf==

----

echo $global.boot.default will tell you that there is only one boot target: net

> https://www.barebox.org/doc/latest/user/booting-linux.html
____

[10:15 pm, 17/03/2025] Ahmed Fatoum: NFS boot options are a left-over from the failed NFS boot
[10:15 pm, 17/03/2025] Ahmed Fatoum: You can set global.bootm.root_dev=mmc1.1 and it should boot to shell
[10:15 pm, 17/03/2025] Ahmed Fatoum: or mmc0.1 or whatever
This will only generate root= option, not rootwait/rw. You may need rootwait though

[10:16 pm, 17/03/2025] Ahmed Fatoum: alternatively, hardcode the command line argument:

global.linux.bootargs.rootopts="root=/dev/mmcblk0p2 rootwait rw"

____
global linux.bootargs.rootopts="root=/dev/mmcblk0p2 rootwait rw"
____
[10:24 pm, 17/03/2025] Ahmed Fatoum: don't use setenv
[10:24 pm, 17/03/2025] Ahmed Fatoum: setenv is only needed if your variable has strange symbols e.g. -

my-device.param=something # error
setenv my-device.param=something # ok

____
echo $nv.boot.default

___
