

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
لزمتها انها بتعمل casting من unsigned int لـ void pointer من نوع iomem

**Purpose:** Convert hardware address to usable pointer
**Simple explanation:** "Make the hardware address usable by the software"
**What it does:**

- Takes the physical hardware address
- Converts it to a virtual address the CPU can use
- Returns a pointer for reading/writing registers
____
الـ memory mapped io بتختلف عن الـ memory العاديه (الاولى خاصه بـ hardware التانيه خاصه بـ RAM)
مثلا لو عندك 18 بايت عايز تقرأهم وانت على system 32 bit فغالبا barebox هيقرأ 4 بايت * 4 بايت وبعدين هيقرأ اخر 2 لوحدهم
بيقسمهم علشان يخلى الموضوع ذكى.
لو استخدمت memcpy بيفترض انك بتم استدعائها على RAM وعلى cached وبالتالى الذكاء هنا مفيهوش مشكله
تمام؟
اما تيجى تستدعى memcpy على iomem فانت مش عارف بالضبط memcpy هتستخدم access ايه
والهاردوير نفسه فيه limitation
ممكن الجاهز يرفض اصلا يرد عليك لو حاولت تعمل access لـ 2 بايت بس, لانه بيقرأ 4 بايت 
ممكن الجاهز يديك اصلا داتا غلط. او داتا كلها اصفار لو عملت access مش aligned صح
الجهاز حر يرد عليك او ما يردش عليك...
فانت بتريح نفسك تحط _ _ iomem وعندك sparse وبيعمل checking وبيتأكد انك انت ما بتاخدش mem متعلم عليها iomem وتحطه فى حاجه تانيه مش متعلم عليها iomem
ودا مجرد تعليم. زى بالضبط لو ضيفت const لـ pointer ممكن واحد تانى يعمل casting ويشيله
___
