بتحجز مساحه بتقبل القسمه على رقم power 2
مثال: انا عايز مساحه ذاكره حجمها 16 بايت ومتقطعه 4 اجزاء, كل جزء يكون 4 بايت:
```c
// Allocate 100 bytes aligned to 4-byte boundary
void *buffer = xmemalign(4, 16);
```
قيمه الـ pointer نفسه الـ address بتكون قابله القسمه على 4


الـ **`xmemalign`** هي دالة في نظام `barebox` تقوم بـ:

1. **تخصيص memory مُحاذي** - يعني أن عنوان الـ memory يكون قابل للقسمة على رقم الـ `alignment` المطلوب
2. **ضمان النجاح أو الإنهاء** - إما ترجع `pointer` صالح أو تنهي النظام بـ `panic()` دى علشان الـ x اللى فى أول التسميه xmemalign
3. **تبسيط الكود** - تلغي الحاجة لكتابة كود التحقق من `NULL` في كل مكان

**الهدف من هذا التحديث** كان إصلاح مشكلة أن الكثير من الكود كان يستخدم `memalign()` بدون التحقق من النتيجة، مما قد يسبب crashes خفية. بدلاً من إضافة كود التحقق في كل مكان، أضافوا `xmemalign()` التي تتعامل مع الفشل بشكل واضح ومباشر.

```c
// Allocate 100 bytes aligned to 4-byte boundary
void *buffer = xmemalign(4, 100);

// Allocate space for an integer array (20 integers)
int *int_array = (int*)xmemalign(4, 20 * sizeof(int));

// or (sohaib)
int *int_array = (int*)xmemalign(sizeof(int), 20 * sizeof(int));
```

```
ASCII Diagram: xmemalign(4, size) - 4-byte Memory Alignment

Memory Layout (each box = 1 byte):
Address:  0x1000   0x1001   0x1002   0x1003   0x1004   0x1005   0x1006   0x1007
         +--------+--------+--------+--------+--------+--------+--------+--------+
Memory:  |   XX   |   XX   |   XX   |   XX   |   YY   |   YY   |   YY   |   YY   |
         +--------+--------+--------+--------+--------+--------+--------+--------+
          ^                                   ^
          |                                   |
    4-byte aligned                      4-byte aligned
    (0x1000 ÷ 4 = 0)                  (0x1004 ÷ 4 = 0)

VALID 4-byte aligned addresses:
✓ 0x1000  ✓ 0x1004  ✓ 0x1008  ✓ 0x100C  ✓ 0x1010

INVALID unaligned addresses:
✗ 0x1001  ✗ 0x1002  ✗ 0x1003  ✗ 0x1005  ✗ 0x1006  ✗ 0x1007


Example: xmemalign(4, 12) 
┌─────────────────────────────────────────────────────────┐
│                 Allocated Memory Block                  │
│                     (12 bytes)                         │
├─────────┬─────────┬─────────┬─────────┬─────────┬───────┤
│  Byte 0 │  Byte 1 │  Byte 2 │  Byte 3 │  Byte 4 │  ...  │
├─────────┼─────────┼─────────┼─────────┼─────────┼───────┤
│ 0x1000  │ 0x1001  │ 0x1002  │ 0x1003  │ 0x1004  │  ...  │
└─────────┴─────────┴─────────┴─────────┴─────────┴───────┘
    ^
    |
  Returned pointer = 0x1000 (divisible by 4)


Regular malloc() might return:
┌─────────────────────────────────────────────────────────┐
│             Potentially Unaligned Memory               │
├─────────┬─────────┬─────────┬─────────┬─────────┬───────┤
│ 0x1001  │ 0x1002  │ 0x1003  │ 0x1004  │ 0x1005  │  ...  │
└─────────┴─────────┴─────────┴─────────┴─────────┴───────┘
    ^
    |
  Pointer = 0x1001 (NOT divisible by 4) ❌


Code Example:
┌──────────────────────────────────────────┐
│  void *ptr = xmemalign(4, 100);          │
│                                          │
│  Parameters:                             │
│  • alignment = 4 (align to 4 bytes)     │
│  • size = 100 (allocate 100 bytes)      │
│                                          │
│  Result:                                 │
│  • ptr will be 4-byte aligned           │
│  • OR system will panic() if no memory  │
└──────────────────────────────────────────┘

Alignment Check:
if (address % 4 == 0) {
    printf("✓ Properly aligned");
} else {
    printf("✗ Not aligned");
}
```