### ملخص الفئات الرئيسية

**أخطاء الملفات والأذونات (1-41):**
- مشاكل الوصول، الصلاحيات، وجود الملفات
- أخطاء file descriptors والموارد
- مشاكل أنظمة الملفات والمساحة

**أخطاء IPC والاتصالات (42-87):**
- مشاكل message queues وshared memory
- أخطاء STREAMS وprotocols
- مشاكل الشبكة والاتصالات البعيدة

**أخطاء Sockets والشبكة (88-116):**
- مشاكل إنشاء واستخدام sockets
- أخطاء الاتصال والبروتوكولات
- مشاكل الشبكة والتوجيه

**أخطاء متخصصة (117-129):**
- مشاكل file systems والنظافة
- أخطاء الوسائط والأجهزة
- مشاكل المفاتيح والتشفير

كل رمز خطأ يحمل معلومات مهمة لتشخيص المشاكل في البرمجة والإدارة النظام، وفهمها يساعد في كتابة برامج أكثر قوة وموثوقية.

## أخطاء النظام الأساسية (1-41)

### EPERM (1) - Operation not permitted

**المعنى:** العملية غير مسموحة **التفسير:** المستخدم لا يملك الصلاحيات الكافية لتنفيذ العملية المطلوبة **مثال:** محاولة حذف ملف لا تملك صلاحية الكتابة عليه، أو محاولة تغيير كلمة مرور مستخدم آخر

### ENOENT (2) - No such file or directory

**المعنى:** الملف أو المجلد غير موجود **التفسير:** النظام لم يجد الملف أو المجلد المطلوب في المسار المحدد **مثال:** فتح ملف بمسار خاطئ، أو الوصول لمجلد محذوف

### ESRCH (3) - No such process

**المعنى:** العملية غير موجودة **التفسير:** محاولة الوصول لعملية (process) غير موجودة أو منتهية **مثال:** إرسال إشارة لعملية بـ PID غير صحيح

### EINTR (4) - Interrupted system call

**المعنى:** استدعاء النظام مقاطع **التفسير:** العملية تم مقاطعتها بواسطة إشارة (signal) قبل اكتمالها **مثال:** قراءة من الشبكة تم مقاطعتها بـ SIGINT (Ctrl+C)

### EIO (5) - I/O error

**المعنى:** خطأ في الإدخال/الإخراج **التفسير:** خطأ فيزيائي في القرص الصلب أو جهاز التخزين **مثال:** قراءة من قرص تالف، أو مشكلة في الأجهزة

### ENXIO (6) - No such device or address

**المعنى:** الجهاز أو العنوان غير موجود **التفسير:** محاولة الوصول لجهاز غير متصل أو عنوان غير صحيح **مثال:** فتح منفذ تسلسلي غير موجود

### E2BIG (7) - Arg list too long

**المعنى:** قائمة المعاملات طويلة جداً **التفسير:** عدد أو حجم المعاملات المرسلة لبرنامج تجاوز الحد المسموح **مثال:** تمرير آلاف الملفات كمعاملات لأمر واحد

### ENOEXEC (8) - Exec format error

**المعنى:** خطأ في صيغة التنفيذ **التفسير:** الملف ليس قابل للتنفيذ أو بصيغة غير صحيحة **مثال:** محاولة تشغيل ملف نصي كبرنامج تنفيذي

### EBADF (9) - Bad file number

**المعنى:** رقم الملف سيء **التفسير:** محاولة استخدام file descriptor غير صحيح أو مغلق **مثال:** الكتابة في ملف تم إغلاقه مسبقاً

### ECHILD (10) - No child processes

**المعنى:** لا توجد عمليات فرعية **التفسير:** العملية الأب تحاول انتظار عملية فرعية غير موجودة **مثال:** استدعاء wait() بدون وجود عمليات فرعية

### EAGAIN (11) - Try again

**المعنى:** حاول مرة أخرى **التفسير:** المورد مؤقتاً غير متاح، يمكن إعادة المحاولة لاحقاً **مثال:** قراءة من socket في وضع non-blocking وليس هناك بيانات

### ENOMEM (12) - Out of memory

**المعنى:** نفدت الذاكرة **التفسير:** النظام لا يستطيع تخصيص ذاكرة إضافية **مثال:** malloc() فشل في تخصيص ذاكرة

### EACCES (13) - Permission denied

**المعنى:** الإذن مرفوض **التفسير:** المستخدم لا يملك الصلاحية المناسبة للوصول للمورد **مثال:** محاولة قراءة ملف بدون صلاحية القراءة

### EFAULT (14) - Bad address

**المعنى:** عنوان سيء **التفسير:** المؤشر يشير لعنوان ذاكرة غير صحيح **مثال:** تمرير NULL pointer أو عنوان خارج نطاق البرنامج

### ENOTBLK (15) - Block device required

**المعنى:** جهاز كتلة مطلوب **التفسير:** العملية تتطلب جهاز كتلة (مثل قرص صلب) **مثال:** محاولة mount جهاز ليس block device

### EBUSY (16) - Device or resource busy

**المعنى:** الجهاز أو المورد مشغول **التفسير:** المورد قيد الاستخدام ولا يمكن الوصول إليه **مثال:** محاولة unmount نظام ملفات قيد الاستخدام

### EEXIST (17) - File exists

**المعنى:** الملف موجود **التفسير:** محاولة إنشاء ملف موجود مسبقاً **مثال:** إنشاء ملف بـ O_CREAT | O_EXCL وهو موجود

### EXDEV (18) - Cross-device link

**المعنى:** رابط عبر الأجهزة **التفسير:** محاولة إنشاء hard link بين file systems مختلفة **مثال:** link() بين ملف في /home وآخر في /tmp

### ENODEV (19) - No such device

**المعنى:** الجهاز غير موجود **التفسير:** محاولة الوصول لجهاز غير مثبت أو معرف **مثال:** فتح /dev/xyz لجهاز غير موجود

### ENOTDIR (20) - Not a directory

**المعنى:** ليس مجلد **التفسير:** استخدام مسار كمجلد وهو في الواقع ملف عادي **مثال:** cd إلى ملف عادي بدلاً من مجلد

### EISDIR (21) - Is a directory

**المعنى:** هو مجلد **التفسير:** محاولة فتح مجلد كملف عادي **مثال:** فتح مجلد للكتابة

### EINVAL (22) - Invalid argument

**المعنى:** معامل غير صحيح **التفسير:** تم تمرير معامل بقيمة غير صالحة لدالة النظام **مثال:** seek إلى موقع سالب في الملف

### ENFILE (23) - File table overflow

**المعنى:** فيض في جدول الملفات **التفسير:** النظام وصل للحد الأقصى من الملفات المفتوحة **مثال:** فتح ملفات أكثر من system limit

### EMFILE (24) - Too many open files

**المعنى:** ملفات مفتوحة كثيرة جداً **التفسير:** العملية وصلت للحد الأقصى من الملفات المفتوحة **مثال:** فتح أكثر من ulimit -n ملف

### ENOTTY (25) - Not a typewriter

**المعنى:** ليس آلة كاتبة (terminal) **التفسير:** محاولة عملية terminal على جهاز ليس terminal **مثال:** ioctl خاص بـ terminal على ملف عادي

### ETXTBSY (26) - Text file busy

**المعنى:** الملف النصي مشغول **التفسير:** محاولة الكتابة في ملف قيد التنفيذ **مثال:** تعديل برنامج أثناء تشغيله

### EFBIG (27) - File too large

**المعنى:** الملف كبير جداً **التفسير:** محاولة إنشاء ملف أكبر من الحد المسموح **مثال:** الكتابة في ملف تجاوز file size limit

### ENOSPC (28) - No space left on device

**المعنى:** لا توجد مساحة متبقية على الجهاز **التفسير:** القرص ممتلئ ولا يمكن الكتابة **مثال:** نسخ ملف إلى قرص ممتلئ

### ESPIPE (29) - Illegal seek

**المعنى:** seek غير قانوني **التفسير:** محاولة seek في ملف لا يدعم هذه العملية **مثال:** seek في pipe أو socket

### EROFS (30) - Read-only file system

**المعنى:** نظام ملفات للقراءة فقط **التفسير:** محاولة الكتابة في نظام ملفات مقروء فقط **مثال:** تعديل ملف في file system محمي

### EMLINK (31) - Too many links

**المعنى:** روابط كثيرة جداً **التفسير:** الملف وصل للحد الأقصى من hard links **مثال:** إنشاء link() أكثر من LINK_MAX

### EPIPE (32) - Broken pipe

**المعنى:** أنبوب مكسور **التفسير:** الكتابة في pipe والطرف الآخر مغلق **مثال:** الكتابة لعملية انتهت وأغلقت stdin

### EDOM (33) - Math argument out of domain

**المعنى:** معامل رياضي خارج النطاق **التفسير:** تمرير قيمة غير صحيحة لدالة رياضية **مثال:** sqrt(-1) أو log(-5)

### ERANGE (34) - Math result not representable

**المعنى:** النتيجة الرياضية غير قابلة للتمثيل **التفسير:** نتيجة العملية خارج نطاق نوع البيانات **مثال:** overflow في عملية حسابية

### EDEADLK (35) - Resource deadlock would occur

**المعنى:** سيحدث deadlock للمورد **التفسير:** العملية المطلوبة ستؤدي لحلقة انتظار مميتة **مثال:** lock ملف سيؤدي لـ deadlock

### ENAMETOOLONG (36) - File name too long

**المعنى:** اسم الملف طويل جداً **التفسير:** اسم الملف أو المسار تجاوز الحد المسموح **مثال:** إنشاء ملف باسم أطول من NAME_MAX

### ENOLCK (37) - No record locks available

**المعنى:** لا توجد record locks متاحة **التفسير:** النظام وصل للحد الأقصى من file locks **مثال:** fcntl() للقفل فشل لعدم توفر locks

### ENOSYS (38) - Function not implemented

**المعنى:** الدالة غير منفذة **التفسير:** استدعاء system call غير مدعوم **مثال:** استدعاء دالة نظام غير موجودة في kernel

### ENOTEMPTY (39) - Directory not empty

**المعنى:** المجلد ليس فارغاً **التفسير:** محاولة حذف مجلد يحتوي على ملفات **مثال:** rmdir على مجلد به ملفات

### ELOOP (40) - Too many symbolic links encountered

**المعنى:** روابط رمزية كثيرة جداً **التفسير:** سلسلة طويلة من symbolic links أو حلقة **مثال:** symlink يشير لنفسه أو سلسلة طويلة

### EWOULDBLOCK (41) - Operation would block

**المعنى:** العملية ستؤدي للحجب **التفسير:** مرادف لـ EAGAIN، العملية ستتوقف في non-blocking mode **مثال:** قراءة من socket فارغ في non-blocking mode

---

## أخطاء IPC والرسائل (42-51)

### ENOMSG (42) - No message of desired type

**المعنى:** لا توجد رسالة من النوع المطلوب **التفسير:** message queue فارغة من النوع المطلوب **مثال:** msgrcv() مع نوع محدد وليس موجود

### EIDRM (43) - Identifier removed

**المعنى:** المعرف تم حذفه **التفسير:** IPC object (shared memory, semaphore, etc.) تم حذفه **مثال:** الوصول لـ shared memory segment محذوف

### ECHRNG (44) - Channel number out of range

**المعنى:** رقم القناة خارج النطاق **التفسير:** رقم قناة غير صحيح في communication **مثال:** استخدام channel number غير مدعوم

### EL2NSYNC (45) - Level 2 not synchronized

**المعنى:** المستوى 2 غير متزامن **التفسير:** خطأ في OSI layer 2 protocol **مثال:** مشاكل في data link layer

### EL3HLT (46) - Level 3 halted

**المعنى:** المستوى 3 متوقف **التفسير:** OSI layer 3 توقف **مثال:** مشاكل في network layer

### EL3RST (47) - Level 3 reset

**المعنى:** المستوى 3 أعيد تعيينه **التفسير:** إعادة تعيين network layer **مثال:** reset في network protocol

### ELNRNG (48) - Link number out of range

**المعنى:** رقم الرابط خارج النطاق **التفسير:** رقم connection غير صحيح **مثال:** استخدام link number غير موجود

### EUNATCH (49) - Protocol driver not attached

**المعنى:** driver البروتوكول غير متصل **التفسير:** الـ driver المطلوب للبروتوكول غير محمل **مثال:** محاولة استخدام protocol بدون driver

### ENOCSI (50) - No CSI structure available

**المعنى:** لا توجد CSI structure متاحة **التفسير:** Control Set Identifier غير متاح **مثال:** مشاكل في STREAMS protocol

### EL2HLT (51) - Level 2 halted

**المعنى:** المستوى 2 متوقف **التفسير:** توقف في data link layer **مثال:** مشاكل في ethernet driver

---

## أخطاء التبادل والطلبات (52-59)

### EBADE (52) - Invalid exchange

**المعنى:** تبادل غير صحيح **التفسير:** مشكلة في data exchange **مثال:** خطأ في تبادل البيانات بين processes

### EBADR (53) - Invalid request descriptor

**المعنى:** وصف الطلب غير صحيح **التفسير:** request descriptor تالف أو غير صحيح **مثال:** استخدام descriptor غير صالح

### EXFULL (54) - Exchange full

**المعنى:** التبادل ممتلئ **التفسير:** buffer التبادل وصل للحد الأقصى **مثال:** امتلاء exchange buffer

### ENOANO (55) - No anode

**المعنى:** لا يوجد anode **التفسير:** مشكلة في file system structure **مثال:** خطأ في inode allocation

### EBADRQC (56) - Invalid request code

**المعنى:** كود الطلب غير صحيح **التفسير:** request code غير مدعوم **مثال:** استخدام ioctl code خاطئ

### EBADSLT (57) - Invalid slot

**المعنى:** الفتحة غير صحيحة **التفسير:** slot number خارج النطاق **مثال:** استخدام slot غير موجود

### EDEADLOCK (58) - File locking deadlock error

**المعنى:** خطأ deadlock في قفل الملف **التفسير:** مشابه لـ EDEADLK، deadlock في file locking **مثال:** دورة في file locks

### EBFONT (59) - Bad font file format

**المعنى:** صيغة ملف الخط سيئة **التفسير:** ملف الخط تالف أو بصيغة خاطئة **مثال:** تحميل font file تالف

---

## أخطاء الـ Streams والشبكة (60-87)

### ENOSTR (60) - Device not a stream

**المعنى:** الجهاز ليس stream **التفسير:** العملية تتطلب STREAM device **مثال:** STREAM operation على جهاز عادي

### ENODATA (61) - No data available

**المعنى:** لا توجد بيانات متاحة **التفسير:** لا توجد بيانات للقراءة **مثال:** read() من stream فارغ

### ETIME (62) - Timer expired

**المعنى:** انتهت مهلة المؤقت **التفسير:** timeout في عملية محددة بوقت **مثال:** انتهاء timeout في STREAM operation

### ENOSR (63) - Out of streams resources

**المعنى:** نفدت موارد الـ streams **التفسير:** النظام نفدت منه STREAMS resources **مثال:** عدم توفر STREAMS buffers

### ENONET (64) - Machine is not on the network

**المعنى:** الجهاز ليس على الشبكة **التفسير:** فقدان اتصال الشبكة **مثال:** انقطاع network interface

### ENOPKG (65) - Package not installed

**المعنى:** الحزمة غير مثبتة **التفسير:** software package مطلوب غير موجود **مثال:** محاولة استخدام library غير مثبت

### EREMOTE (66) - Object is remote

**المعنى:** الكائن بعيد **التفسير:** محاولة الوصول لمورد على جهاز آخر **مثال:** الوصول لملف على NFS server

### ENOLINK (67) - Link has been severed

**المعنى:** الرابط تم قطعه **التفسير:** فقدان الاتصال مع جهاز بعيد **مثال:** انقطاع NFS connection

### EADV (68) - Advertise error

**المعنى:** خطأ إعلان **التفسير:** مشكلة في network advertising **مثال:** خطأ في RFS advertising

### ESRMNT (69) - Srmount error

**المعنى:** خطأ Srmount **التفسير:** مشكلة في remote mounting **مثال:** فشل في remote file system mount

### ECOMM (70) - Communication error on send

**المعنى:** خطأ اتصال في الإرسال **التفسير:** فشل إرسال البيانات **مثال:** خطأ في network transmission

### EPROTO (71) - Protocol error

**المعنى:** خطأ بروتوكول **التفسير:** انتهاك في network protocol **مثال:** تلف في protocol header

### EMULTIHOP (72) - Multihop attempted

**المعنى:** محاولة multihop **التفسير:** محاولة routing متعدد القفزات **مثال:** تجاوز عدد hops في network

### EDOTDOT (73) - RFS specific error

**المعنى:** خطأ خاص بـ RFS **التفسير:** مشكلة في Remote File System **مثال:** خطأ في RFS protocol

### EBADMSG (74) - Not a data message

**المعنى:** ليست رسالة بيانات **التفسير:** الرسالة ليست من النوع المتوقع **مثال:** تلقي control message بدلاً من data

### EOVERFLOW (75) - Value too large for defined data type

**المعنى:** القيمة كبيرة جداً لنوع البيانات المحدد **التفسير:** overflow في نوع البيانات **مثال:** قيمة أكبر من int في 32-bit

### ENOTUNIQ (76) - Name not unique on network

**المعنى:** الاسم ليس فريداً على الشبكة **التفسير:** تضارب في network names **مثال:** تكرار hostname في الشبكة

### EBADFD (77) - File descriptor in bad state

**المعنى:** file descriptor في حالة سيئة **التفسير:** الـ descriptor في حالة غير صالحة **مثال:** استخدام fd بعد close() جزئي

### EREMCHG (78) - Remote address changed

**المعنى:** العنوان البعيد تغير **التفسير:** تغيير في remote address **مثال:** IP address للخادم تغير

### ELIBACC (79) - Can not access a needed shared library

**المعنى:** لا يمكن الوصول للمكتبة المشتركة المطلوبة **التفسير:** shared library غير متاح **مثال:** libssl.so غير موجود

### ELIBBAD (80) - Accessing a corrupted shared library

**المعنى:** الوصول لمكتبة مشتركة تالفة **التفسير:** shared library تالف **مثال:** libc.so معطوب

### ELIBSCN (81) - .lib section in a.out corrupted

**المعنى:** قسم .lib في a.out تالف **التفسير:** مشكلة في executable format **مثال:** تلف في binary file

### ELIBMAX (82) - Attempting to link in too many shared libraries

**المعنى:** محاولة ربط مكتبات مشتركة كثيرة جداً **التفسير:** تجاوز حد المكتبات المحملة **مثال:** تحميل أكثر من MAX_SHARED_LIBS

### ELIBEXEC (83) - Cannot exec a shared library directly

**المعنى:** لا يمكن تنفيذ مكتبة مشتركة مباشرة **التفسير:** محاولة تشغيل .so كبرنامج **مثال:** ./libmath.so بدلاً من برنامج

### EILSEQ (84) - Illegal byte sequence

**المعنى:** تسلسل بايتات غير قانوني **التفسير:** invalid character encoding **مثال:** UTF-8 غير صحيح في النص

### ERESTART (85) - Interrupted system call should be restarted

**المعنى:** استدعاء النظام المقاطع يجب إعادة تشغيله **التفسير:** system call يمكن إعادة تشغيله بعد signal **مثال:** SA_RESTART في signal handler

### ESTRPIPE (86) - Streams pipe error

**المعنى:** خطأ في streams pipe **التفسير:** مشكلة في STREAMS pipe **مثال:** خطأ في STREAMS piping

### EUSERS (87) - Too many users

**المعنى:** مستخدمون كثر جداً **التفسير:** تجاوز عدد المستخدمين المسموح **مثال:** النظام وصل لحد المستخدمين

---

## أخطاء الشبكة والـ Sockets (88-116)

### ENOTSOCK (88) - Socket operation on non-socket

**المعنى:** عملية socket على غير socket **التفسير:** استخدام socket function على file descriptor عادي **مثال:** send() على ملف عادي

### EDESTADDRREQ (89) - Destination address required

**المعنى:** عنوان الوجهة مطلوب **التفسير:** عملية تتطلب destination address **مثال:** sendto() بدون عنوان

### EMSGSIZE (90) - Message too long

**المعنى:** الرسالة طويلة جداً **التفسير:** حجم الرسالة يتجاوز الحد المسموح **مثال:** UDP packet أكبر من MTU

### EPROTOTYPE (91) - Protocol wrong type for socket

**المعنى:** نوع البروتوكول خاطئ للـ socket **التفسير:** protocol غير متوافق مع socket type **مثال:** TCP protocol مع SOCK_DGRAM

### ENOPROTOOPT (92) - Protocol not available

**المعنى:** البروتوكول غير متاح **التفسير:** socket option غير مدعوم **مثال:** setsockopt() بـ option غير موجود

### EPROTONOSUPPORT (93) - Protocol not supported

**المعنى:** البروتوكول غير مدعوم **التفسير:** البروتوكول المطلوب غير موجود في النظام **مثال:** socket(AF_INET, SOCK_STREAM, IPPROTO_SCTP)

### ESOCKTNOSUPPORT (94) - Socket type not supported

**المعنى:** نوع الـ socket غير مدعوم **التفسير:** socket type غير مدعوم بالـ protocol family **مثال:** SOCK_SEQPACKET مع AF_INET

### EOPNOTSUPP (95) - Operation not supported

**المعنى:** العملية غير مدعومة **التفسير:** العملية غير مدعومة على هذا النوع من الـ socket **مثال:** accept() على SOCK_DGRAM

### EPFNOSUPPORT (96) - Protocol family not supported

**المعنى:** عائلة البروتوكول غير مدعومة **التفسير:** protocol family غير مدعوم في النظام **مثال:** socket(AF_DECnet, ...) على نظام بدون DECnet

### EAFNOSUPPORT (97) - Address family not supported by protocol

**المعنى:** عائلة العناوين غير مدعومة بواسطة البروتوكول **التفسير:** address family غير متوافق مع البروتوكول **مثال:** IPv6 address مع IPv4 socket

### EADDRINUSE (98) - Address already in use

**المعنى:** العنوان قيد الاستخدام **التفسير:** محاولة bind() لعنوان مستخدم مسبقاً **مثال:** bind() لنفس port مرتين

### EADDRNOTAVAIL (99) - Cannot assign requested address

**المعنى:** لا يمكن تعيين العنوان المطلوب **التفسير:** العنوان المطلوب غير متاح على هذا الجهاز **مثال:** bind() لـ IP address غير موجود محلياً

### ENETDOWN (100) - Network is down

**المعنى:** الشبكة متوقفة **التفسير:** واجهة الشبكة غير نشطة أو معطلة **مثال:** ethernet interface في حالة down

### ENETUNREACH (101) - Network is unreachable

**المعنى:** الشبكة غير قابلة للوصول **التفسير:** لا يوجد مسار للوصول للشبكة المطلوبة **مثال:** محاولة الاتصال بشبكة بدون route

### ENETRESET (102) - Network dropped connection because of reset

**المعنى:** الشبكة قطعت الاتصال بسبب إعادة تعيين **التفسير:** الاتصال انقطع بسبب network reset **مثال:** TCP connection reset بواسطة intermediate router

### ECONNABORTED (103) - Software caused connection abort

**المعنى:** البرنامج تسبب في إجهاض الاتصال **التفسير:** الاتصال انقطع بواسطة البرنامج المحلي **مثال:** close() على socket أثناء عملية نقل

### ECONNRESET (104) - Connection reset by peer

**المعنى:** الاتصال أعيد تعيينه بواسطة الطرف الآخر **التفسير:** الطرف البعيد أغلق الاتصال فجأة **مثال:** TCP RST من الخادم

### ENOBUFS (105) - No buffer space available

**المعنى:** لا توجد مساحة buffer متاحة **التفسير:** النظام نفدت منه network buffers **مثال:** امتلاء socket buffers

### EISCONN (106) - Transport endpoint is already connected

**المعنى:** نقطة النقل متصلة مسبقاً **التفسير:** محاولة connect() على socket متصل **مثال:** connect() على TCP socket متصل

### ENOTCONN (107) - Transport endpoint is not connected

**المعنى:** نقطة النقل غير متصلة **التفسير:** محاولة عملية تتطلب اتصال على socket غير متصل **مثال:** send() على TCP socket غير متصل

### ESHUTDOWN (108) - Cannot send after transport endpoint shutdown

**المعنى:** لا يمكن الإرسال بعد إغلاق نقطة النقل **التفسير:** محاولة الإرسال بعد shutdown(SHUT_WR) **مثال:** send() بعد shutdown() للكتابة

### ETOOMANYREFS (109) - Too many references: cannot splice

**المعنى:** مراجع كثيرة جداً: لا يمكن التوصيل **التفسير:** تجاوز عدد المراجع المسموح **مثال:** splice() مع مراجع كثيرة جداً

### ETIMEDOUT (110) - Connection timed out

**المعنى:** انتهت مهلة الاتصال **التفسير:** الاتصال انتهت مهلته الزمنية **مثال:** connect() timeout أو TCP keepalive timeout

### ECONNREFUSED (111) - Connection refused

**المعنى:** الاتصال مرفوض **التفسير:** الخادم رفض الاتصال **مثال:** connect() لـ port مغلق

### EHOSTDOWN (112) - Host is down

**المعنى:** المضيف متوقف **التفسير:** الجهاز المقصد غير نشط **مثال:** ping لجهاز مغلق

### EHOSTUNREACH (113) - No route to host

**المعنى:** لا يوجد مسار للمضيف **التفسير:** لا يوجد طريق للوصول للجهاز المقصد **مثال:** محاولة الاتصال بـ IP بدون route

### EALREADY (114) - Operation already in progress

**المعنى:** العملية قيد التقدم مسبقاً **التفسير:** العملية بدأت مسبقاً ولم تكتمل بعد **مثال:** connect() ثاني على non-blocking socket

### EINPROGRESS (115) - Operation now in progress

**المعنى:** العملية قيد التقدم الآن **التفسير:** العملية بدأت وستكتمل لاحقاً **مثال:** connect() على non-blocking socket

### ESTALE (116) - Stale NFS file handle

**المعنى:** مقبض ملف NFS قديم **التفسير:** file handle لم يعد صالحاً في NFS **مثال:** الوصول لملف محذوف على NFS server

---

## أخطاء النظافة والهيكل (117-122)

### EUCLEAN (117) - Structure needs cleaning

**المعنى:** الهيكل يحتاج تنظيف **التفسير:** data structure تحتاج إصلاح أو تنظيف **مثال:** file system corruption يحتاج fsck

### ENOTNAM (118) - Not a XENIX named type file

**المعنى:** ليس ملف نوع XENIX named **التفسير:** الملف ليس من نوع XENIX named file **مثال:** محاولة XENIX operation على ملف عادي

### ENAVAIL (119) - No XENIX semaphores available

**المعنى:** لا توجد XENIX semaphores متاحة **التفسير:** نفدت XENIX semaphores من النظام **مثال:** تجاوز حد XENIX semaphores

### EISNAM (120) - Is a named type file

**المعنى:** هو ملف نوع named **التفسير:** الملف من نوع named type file **مثال:** عملية غير مناسبة على named file

### EREMOTEIO (121) - Remote I/O error

**المعنى:** خطأ I/O بعيد **التفسير:** خطأ في عملية I/O على جهاز بعيد **مثال:** خطأ قراءة من NFS server

### EDQUOT (122) - Quota exceeded

**المعنى:** الحصة تم تجاوزها **التفسير:** تجاوز disk quota المخصص للمستخدم **مثال:** كتابة ملف والمستخدم وصل لحد المساحة

---

## أخطاء الوسائط والمفاتيح (123-129)

### ENOMEDIUM (123) - No medium found

**المعنى:** لا توجد وسيطة **التفسير:** لا يوجد قرص أو وسيط في الجهاز **مثال:** قراءة من CD drive فارغ

### EMEDIUMTYPE (124) - Wrong medium type

**المعنى:** نوع الوسيطة خاطئ **التفسير:** نوع القرص أو الوسيط غير مناسب **مثال:** DVD في CD-ROM drive

### ECANCELED (125) - Operation Canceled

**المعنى:** العملية ألغيت **التفسير:** العملية تم إلغاؤها بواسطة المستخدم أو النظام **مثال:** pthread_cancel() على thread

### ENOKEY (126) - Required key not available

**المعنى:** المفتاح المطلوب غير متاح **التفسير:** مفتاح التشفير المطلوب غير موجود **مثال:** فك تشفير ملف بدون المفتاح الصحيح

### EKEYEXPIRED (127) - Key has expired

**المعنى:** المفتاح انتهت صلاحيته **التفسير:** مفتاح التشفير انتهت مدة صلاحيته **مثال:** استخدام SSL certificate منتهي الصلاحية

### EKEYREVOKED (128) - Key has been revoked

**المعنى:** المفتاح تم إلغاؤه **التفسير:** مفتاح التشفير تم سحبه أو إلغاؤه **مثال:** استخدام certificate تم revoke

### EKEYREJECTED (129) - Key was rejected by service

**المعنى:** المفتاح رُفض بواسطة الخدمة **التفسير:** الخدمة رفضت المفتاح المقدم **مثال:** authentication key مرفوض من الخادم

---

