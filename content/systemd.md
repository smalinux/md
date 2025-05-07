انا عايز ايه؟
 - [x] عايز cheat sheet
- [ ] عايز list بكل الحاجات الممكنه اللى ممكن تتعمل فى الدنيا بالـ systemd
- [ ] عايز اتفرج على جهاز موجود فى الـ production واعرف كل الحاجات اللى بيعملها
- [ ] عايز اشوف الـ host machine بتاعتى فيها services ايه
   عيب لما تبقى مش عارف, لو مش عارف, هتضطر تخترع العجله.
- [ ] how to add default list for all ur enabled units
_____

[29-Day-14\_Understanding\_Systemd - YouTube](https://youtu.be/KnPd955zBcE?si=xlSGD1YZWC0Gk2pS)

| systemd          | init                  |
| ---------------- | --------------------- |
| units (readable) | shell scripts (sucks) |
| parallel         | -                     |
| $ jornald        | syslog & rsyslog      |



| systemd active               | systemd enabled                      |
| ---------------------------- | ------------------------------------ |
| means it is active right now | means it will be enable at boot time |


```bash
$ systemctrl -h
$ journalctrl -h
```


```shell
systemctl <tab><tab>
```

ملفات الـ units كلها هنا:
```
ls /usr/lib/systemd
```
 لو عملت لاى منهم enable بيتعملها symlink تحت:
```
/etc/systemd/system 
```


# [Systemd cheatsheet](https://gist.github.com/mbodo/8f87c96ce11e91f80fbf6175412a2206#linux---systemd-cheatsheet)

## systemctl

Activates a service immediately:

```shell
systemctl start foo.service
```

Deactivates a service immediately:

```shell
systemctl stop foo.service
```

Restarts a service:

```shell
systemctl restart foo.service
```

Shows status of a service including whether it is running or not:

```shell
systemctl status foo.service
```

Enables a service to be started on bootup:

```shell
systemctl enable foo.service
```

Disables a service to not start during bootup:

```shell
systemctl disable foo.service
```

Check whether a service is already enabled or not:
0 indicates that it is enabled. 1 indicates that it is disabled

```shell
systemctl is-enabled foo.service; echo $?
```

الامر دا هيعمل block تماماً, مهما تحاول تشغل الـ service هتفضل مقفوله, حتى لو قولها start
دا بيحميك تغلط وتفتح service مش مسموحلها انها تشتغل, بسبب ان فيه service تانيه شغاله على نفس الـ port وعايز تعمل block علشان حتى لو نسيت وحاولت تشغلها ما تشتغلش
مثلا apache & nginx بسبب انهم شغالين على نفس الـ port

```shell
systemctl mask crond
```

عايز اشيل البلوك:
```shell
systemctl unmask crond
```


Change ad-hoc runlevel with systemctl isolate command:

> Switch to another target (in this case multi-user/runlevel 3 in old SysV):

```shell
systemctl isolate multi-user.target
```

> Switch to graphical target (in this case graphical/runlevel 5 in old SysV):

```shell
systemctl isolate graphical.target
```

Change permanently change default.target:

> Remove configured default target

```shell
rm /etc/systemd/system/default.target
```

> Create default.target as symbolic link to multi-user.target

```shell
ln -sf /lib/systemd/system/multi-user.target /etc/systemd/system/default.target
```

> Set default target through systemctl

```
To find a [new target]:

- To get active targets, 
  systemctl --type=target list-units
- To get all targets, (active/inactive)
  systemctl --type=target --all list-units
- To list available targets, (ls -l /usr/lib/systemd/system/*.target)
  systemctl --type=target list-unit-files


systemctl set-default [new target]
```

List-units by pattern:

```shell
systemctl list-units ssh*
```

Display a content of unit file

```shell
systemctl cat network.service
```

Suppress non zero exit code (service after stop will be displayed as inactive, not failed):

```shell
[Service]
SuccessExitStatus=143
```

> Link:

- [services-remain-in-failed-state-after-stopped-with-systemctl] ([https://serverfault.com/questions/695849/services-remain-in-failed-state-after-stopped-with-systemctl](https://serverfault.com/questions/695849/services-remain-in-failed-state-after-stopped-with-systemctl))

How to put PID of service as variable to service systemd file:

```shell
ExecReload=/bin/kill -s HUP $MAINPID
```

> Link

- [you-should-be-using-pidfile-and-mainpid-instead-of-pkill-1935e4531931](https://medium.com/@jbriggs_24705/you-should-be-using-pidfile-and-mainpid-instead-of-pkill-1935e4531931)
- [https://www.freedesktop.org/software/systemd/man/systemd.service.html#ExecStop=](https://www.freedesktop.org/software/systemd/man/systemd.service.html#ExecStop=)

List all services with pattern

```
<pattern> - httpd e.g

systemctl list-units -t service --full | grep <pattern> | sed 's/^\s*//g' | cut -d " " -f1 | while read s; do systemctl status $s; done
```

> Link

- [systemd-list-units-cuts-service-names](https://serverfault.com/questions/734130/systemd-list-units-cuts-service-names)

List all enable units

```
systemctl list-unit-files | grep enabled

smartd.service                                enabled 
sshd.service                                  enabled 
sysstat.service                               enabled 
...
```
systemctl list-unit-files == for listing files under */usr/lib/systemd/system*

> Link

- [how-to-list-all-enabled-services-from-systemctl](https://askubuntu.com/questions/795226/how-to-list-all-enabled-services-from-systemctl)

==systemctl list-unit-files==

لو عدلت فى ملفات target لازم تعمل reload لكل ملفات الـ configuration بتاعت systemd
```shell
systemctl daemon-reload
```

## target
اظن التسميه الأحلى هو الاسم القديمه: runlevel
احلى شرح هو شرح باشمهندس مصطفى حموده.

لو قارنّاها بـ `runlevels` في النظام القديم (SysVinit):

| SysV Runlevel | systemd Target    |
| ------------- | ----------------- |
| 1             | rescue.target     |
| 3             | multi-user.target |
| 5             | graphical.target  |
| 0             | poweroff.target   |
| 6             | reboot.target     |

- `multi-user.target` ⇠ هو وضع النظام الذي يشغّل الخدمات الأساسية + الشبكة + تسجيل الدخول عن طريق الطرفية (بدون واجهة رسومية).

- `graphical.target` ⇠ نفس `multi-user` بالإضافة إلى واجهة رسومية (GUI).

- `rescue.target` ⇠ وضع الإنقاذ (وضع صيانة، يشغّل أقل عدد ممكن من الخدمات).

- `default.target` ⇠ هو الرابط الرمزي (`symlink`) الذي يحدد أي Target يتم تشغيله عند الإقلاع (boot).

الـ tricks فى الموضوع:
لو عايز تقفل حاجه اعملها mask

عرض التارجت الحالي:
```
systemctl get-default
```
تغييره:
```
sudo systemctl set-default multi-user.target
```
التبديل إليه حالًا:
```
sudo systemctl isolate multi-user.target
```

عرض كل التارجتس:
```
systemctl list-units --type=target --all
```

✅ مثال عملي
لو أردت تشغيل نظام بدون واجهة رسومية (مثلاً على BeagleBone أو سيرفر):

```
sudo systemctl set-default multi-user.target
```

ولو أردت إعادة الواجهة الرسومية بعدين:

```
sudo systemctl set-default graphical.target
```

### ازاى تعمل target خاص بيك فى مشروع:
العنوان دا مش دقيق. الصح: ازاى تضيف unit او service علشان تشتغل تحت target معين
فى الـ SysVinit كام Sxxname و Kxxname

### ✅ **متى تحتاج `target` مخصص؟**

- لو عندك مجموعة من الخدمات تعمل معًا لمهمة واحدة.
- لو عايز تقلّل وقت الإقلاع بتشغيل الضروري فقط.
- لو عايز تبني نظام صغير (مثل kiosk، أو جهاز ذكي).

### 🛠️ **خطوات إنشاء `target` مخصص**

#### 1. **أنشئ ملف الـ target**

مثلاً نعمل واحد اسمه `myproject.target`:

```ini
# /etc/systemd/system/myproject.target
[Unit]
Description=My Custom Project Target
Requires=myapp.service
After=network.target

[Install]
WantedBy=multi-user.target
```

- `Requires=` ⇠ يحدد الوحدات الضرورية (يتم إيقاف التشغيل إن فشلت).
- `After=` ⇠ الترتيب الزمني.
- `WantedBy=multi-user.target` ⇠ يعني إنه ممكن تفعيله ضمن الإقلاع العادي.

#### 2. **أضف الخدمات الخاصة بك**

مثلاً `myapp.service`:

```ini
# /etc/systemd/system/myapp.service
[Unit]
Description=My App Service
After=network.target

[Service]
ExecStart=/usr/local/bin/myapp
Restart=always

[Install]
WantedBy=myproject.target
```

#### 3. **فعّل الـ target الجديد**

```bash
sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl enable myproject.target
```
#### 4. **اجعله الهدف الافتراضي (اختياري)**

```bash
sudo systemctl set-default myproject.target
```
### ✅ **تشغيله يدويًا للتجربة**

```bash
sudo systemctl isolate myproject.target
```


## journal

Show logs from 6 am to 7 pm
```shell
jornalctrl 
```

Show logs for ssh only
```shell
jornalctrl
```

## 🧠 ما هو `journal` في systemd؟

`journal` هو نظام تسجيل (Logging system) مدمج في `systemd`. وظيفته الأساسية هي:

> **تخزين وعرض كل رسائل السجل (logs)** التي تنتجها الخدمات (services)، النواة (kernel)، والمكونات الأخرى للنظام.

هو بديل حديث لـ `rsyslog` أو `syslog` التقليدي.


### ✅ مميزات `systemd-journald`

- يدمج كل أنواع الرسائل: `kernel logs` + `stdout/stderr` من الخدمات + رسائل النظام.
- يُخزَّن بشكل ثنائي (binary) وليس نص عادي.
- يدعم الفلترة القوية (حسب الخدمة، الوقت، الأولوية، ...).
- يمكن إرساله إلى syslog أو ملفات نصية لو تحب.


## 🛠️ أهم الأوامر مع `journalctl`

|الأمر|الوظيفة|
|---|---|
|`journalctl`|عرض كل السجلات|
|`journalctl -b`|عرض سجلات الإقلاع الحالي فقط|
|`journalctl -xe`|عرض الأخطاء الأخيرة بتفاصيل موسعة|
|`journalctl -u myservice.service`|عرض السجل الخاص بخدمة معينة|
|`journalctl --since "10 minutes ago"`|عرض السجل من وقت معين|
|`journalctl -f`|متابعة السجل لحظة بلحظة (مثل `tail -f`)|


## 📁 أين يُخزَّن السجل؟

1. إذا كان التخزين الدائم مفعلًا:

    ```bash
    /var/log/journal/
    ```

2. إذا لم يكن مفعلًا، يُخزَّن مؤقتًا في:

    ```bash
    /run/log/journal/
    ```


> التخزين المؤقت يختفي عند إعادة التشغيل.

### ⚙️ كيف أفعل التخزين الدائم؟

```bash
sudo mkdir -p /var/log/journal
sudo systemd-tmpfiles --create --prefix /var/log/journal
sudo systemctl restart systemd-journald
```

### ✅ مثال عملي

لو عندك خدمة اسمها `myapp.service` وتريد تشوف سجلها:

```bash
journalctl -u myapp.service -f
```


# 🧾 `journalctl` Cheat Sheet

## 📦 الأساسيات

|الأمر|المعنى|
|---|---|
|`journalctl`|عرض كل السجلات|
|`journalctl -b`|سجلات جلسة الإقلاع الحالية|
|`journalctl -b -1`|سجلات الإقلاع السابق|
|`journalctl -f`|متابعة السجل مباشرة (مثل `tail -f`)|
|`journalctl -r`|عرض السجلات بترتيب عكسي (الأحدث أولًا)|

## 🔍 فلترة حسب خدمة

|الأمر|المعنى|
|---|---|
|`journalctl -u myservice`|سجلات خدمة محددة|
|`journalctl -u myservice -b`|سجلات الخدمة منذ الإقلاع الحالي فقط|
|`journalctl -u myservice -f`|متابعة حيّة لسجلات الخدمة|

## ⏰ فلترة حسب الوقت

|الأمر|المعنى|
|---|---|
|`journalctl --since "2025-05-01 12:00"`|من وقت معين|
|`journalctl --until "2025-05-01 13:00"`|إلى وقت معين|
|`journalctl --since "1 hour ago"`|من آخر ساعة|
|`journalctl --since yesterday`|من البارحة|

## ⚠️ فلترة حسب الأولوية (Priority)

| الأمر                   | المعنى                      |
| ----------------------- | --------------------------- |
| `journalctl -p err`     | فقط الأخطاء (`err` فما فوق) |
| `journalctl -p warning` | التحذيرات فما فوق           |
| `journalctl -p debug`   | كل شيء حتى `debug`          |

|القيمة|المعنى|
|---|---|
|0|emerg (كارثة)|
|1|alert|
|2|crit|
|3|err (خطأ)|
|4|warning|
|5|notice|
|6|info|
|7|debug|

## 🧰 خيارات مفيدة

|الأمر|المعنى|
|---|---|
|`journalctl -xe`|عرض الأخطاء الموسعة (مفيد عند فشل خدمة)|
|`journalctl --no-pager`|عرض بدون شاشة تمرير (`less`)|
|`journalctl --disk-usage`|معرفة حجم السجل على القرص|
|`journalctl --list-boots`|عرض جميع جلسات الإقلاع المتاحة|

## 💾 تمكين التخزين الدائم

```bash
sudo mkdir -p /var/log/journal
sudo systemd-tmpfiles --create --prefix /var/log/journal
sudo systemctl restart systemd-journald
```


----

Reference links:

- [systemd.service man](https://www.freedesktop.org/software/systemd/man/systemd.service.html)
- [Useful SystemD commands](http://www.dynacont.net/documentation/linux/Useful_SystemD_commands/)
- [Archlinux systemd wiki](https://wiki.archlinux.org/index.php/Systemd)
- [Red Hat RHEL 7 systemd documentation](https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/7/html/System_Administrators_Guide/chap-Managing_Services_with_systemd.html)
- [difference-between-systemd-and-terminal-starting-program](https://unix.stackexchange.com/questions/339638/difference-between-systemd-and-terminal-starting-program/339645#339645)
- [where-do-i-put-my-systemd-unit-file](https://unix.stackexchange.com/questions/224992/where-do-i-put-my-systemd-unit-file)
- [trouble-creating-pid-file-in-systemd-service-script](https://serverfault.com/questions/824543/trouble-creating-pid-file-in-systemd-service-script)
- [Fedora - Packaging:Systemd](https://fedoraproject.org/wiki/Packaging:Systemd)
- [controlling-a-multi-service-application-with-systemd](http://alesnosek.com/blog/2016/12/04/controlling-a-multi-service-application-with-systemd/)
- [rhel7-use-systemd-timers](https://www.certdepot.net/rhel7-use-systemd-timers/)
- [how-to-remove-systemd-services](https://superuser.com/questions/513159/how-to-remove-systemd-services)
- [systemd-containers-introduction-systemd-nspawn](https://blog.selectel.com/systemd-containers-introduction-systemd-nspawn/)
- [archlinux systemd-nspawn](https://wiki.archlinux.org/index.php/systemd-nspawn)
- [sd_notify python watchdog implementation](https://gist.github.com/Spindel/1d07533ef94a4589d348)
- [sd_notify python service notify implemetation](https://github.com/bb4242/sdnotify)
- [python sdnotify library](https://pypi.org/project/sdnotify/)
- [creating-a-linux-service-with-systemd](https://medium.com/@benmorel/creating-a-linux-service-with-systemd-611b5c8b91d6)
- [systemd.io](https://systemd.io/)
- [systemd-ignores-return-code-while-starting-service](https://serverfault.com/questions/751030/systemd-ignores-return-code-while-starting-service)
- [how-do-i-override-or-configure-systemd-services](https://askubuntu.com/questions/659267/how-do-i-override-or-configure-systemd-services)
- [creating-a-linux-service-with-systemd](https://medium.com/@benmorel/creating-a-linux-service-with-systemd-611b5c8b91d6)
- [An example network service with systemd-activated socket in Python](https://gist.github.com/kylemanna/d193aaa6b33a89f649524ad27ce47c4b)
- [how-can-i-send-a-message-to-the-systemd-journal-from-the-command-line](https://serverfault.com/questions/573946/how-can-i-send-a-message-to-the-systemd-journal-from-the-command-line)
- [systemd-forking-vs-simple](https://superuser.com/questions/1274901/systemd-forking-vs-simple/1274913)
- [how-can-a-systemd-service-flag-that-is-is-ready-so-that-other-services-can-wait](https://unix.stackexchange.com/questions/331693/how-can-a-systemd-service-flag-that-is-is-ready-so-that-other-services-can-wait)

Pid Eins:

- [systemd-for-admins-I] ([http://0pointer.net/blog/projects/systemd-for-admins-1.html](http://0pointer.net/blog/projects/systemd-for-admins-1.html))
- [systemd-for-admins-II] ([http://0pointer.net/blog/projects/systemd-for-admins-2.html](http://0pointer.net/blog/projects/systemd-for-admins-2.html))
- [systemd-for-admins-II] ([http://0pointer.net/blog/projects/systemd-for-admins-3.html](http://0pointer.net/blog/projects/systemd-for-admins-3.html))
- [systemd-for-admins-IV] ([http://0pointer.net/blog/projects/systemd-for-admins-4.html](http://0pointer.net/blog/projects/systemd-for-admins-4.html))
- [systemd-for-admins-V] ([http://0pointer.net/blog/projects/three-levels-of-off.html](http://0pointer.net/blog/projects/three-levels-of-off.html))
- [systemd-for-admins-VI] ([http://0pointer.net/blog/projects/changing-roots.html](http://0pointer.net/blog/projects/changing-roots.html))
- [systemd-for-admins-VII] ([http://0pointer.net/blog/projects/blame-game.html](http://0pointer.net/blog/projects/blame-game.html))
- [systemd-for-admins-VIII] ([http://0pointer.net/blog/projects/the-new-configuration-files.html](http://0pointer.net/blog/projects/the-new-configuration-files.html))
- [systemd-for-admins-IX] ([http://0pointer.net/blog/projects/on-etc-sysinit.html](http://0pointer.net/blog/projects/on-etc-sysinit.html))
- [systemd-for-admins-X] ([http://0pointer.net/blog/projects/instances.html](http://0pointer.net/blog/projects/instances.html))
- [systemd-for-admins-XI] ([http://0pointer.net/blog/projects/inetd.html](http://0pointer.net/blog/projects/inetd.html))
- [systemd-for-admins-XII] ([http://0pointer.net/blog/projects/security.html](http://0pointer.net/blog/projects/security.html))
- [systemd-for-admins-XIII] ([http://0pointer.net/blog/projects/systemctl-journal.html](http://0pointer.net/blog/projects/systemctl-journal.html))
- [systemd-for-admins-XIV] ([http://0pointer.net/blog/projects/self-documented-boot.html](http://0pointer.net/blog/projects/self-documented-boot.html))
- [systemd-for-admins-XV] ([http://0pointer.net/blog/projects/watchdog.html](http://0pointer.net/blog/projects/watchdog.html))
- [systemd-for-admins-XVI] ([http://0pointer.net/blog/projects/serial-console.html](http://0pointer.net/blog/projects/serial-console.html))
- [systemd-for-admins-XVII] ([http://0pointer.net/blog/projects/journalctl.html](http://0pointer.net/blog/projects/journalctl.html))
- [systemd-for-admins-XVIII] ([http://0pointer.net/blog/projects/resources.html](http://0pointer.net/blog/projects/resources.html))
- [systemd-for-admins-XIX] ([http://0pointer.net/blog/projects/detect-virt.html](http://0pointer.net/blog/projects/detect-virt.html))
- [systemd-for-admins-XX] ([http://0pointer.net/blog/projects/socket-activated-containers.html](http://0pointer.net/blog/projects/socket-activated-containers.html))

Digital Ocean:

- [systemd-essentials-working-with-services-units-and-the-journal] ([https://www.digitalocean.com/community/tutorials/systemd-essentials-working-with-services-units-and-the-journal](https://www.digitalocean.com/community/tutorials/systemd-essentials-working-with-services-units-and-the-journal))
- [How-to-use-systemctl-to-manage-systemd-services-and-units] ([https://www.digitalocean.com/community/tutorials/how-to-use-systemctl-to-manage-systemd-services-and-units](https://www.digitalocean.com/community/tutorials/how-to-use-systemctl-to-manage-systemd-services-and-units))
- [Understanding-systemd-units-and-unit-files] [https://www.digitalocean.com/community/tutorials/understanding-systemd-units-and-unit-files](https://www.digitalocean.com/community/tutorials/understanding-systemd-units-and-unit-files)




_____
# فرغ اللينكات دى
- [ ] [systemctl cheat sheet - Linux Audit](https://linux-audit.com/cheat-sheets/systemctl/)
- [ ] [access.redhat.com/sites/default/files/attachments/12052018\_systemd\_6.pdf](https://access.redhat.com/sites/default/files/attachments/12052018_systemd_6.pdf)
- [ ] [systemd embedded - YouTube](https://www.youtube.com/results?search_query=systemd+embedded)
- [ ] 