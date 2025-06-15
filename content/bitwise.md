# Masking

```c
# wdt
readl(wdev->base + OMAP_WATCHDOG_REV) & 0xFF)
```

بطبع اول خانتين على اليمين. ويـ mask الباقى

#### ازاى بيحصل حسابياً:
Let's say `readl()` returns the value `0x12345678`:

```
Original value (32-bit): 0x12345678
In binary:               00010010001101000101011001111000

Mask 0xFF (32-bit):      0x000000FF  
In binary:               00000000000000000000000011111111

Bitwise AND operation:
  00010010001101000101011001111000  (original)
& 00000000000000000000000011111111  (mask)
  --------------------------------
  00000000000000000000000001111000  (result)

Result in hex: 0x00000078   ---> aka 0x78
Result in decimal: 120
```

____
