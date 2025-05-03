What I want?
1. عايز cheat sheet
2. عايز list بكل الحاجات الممكنه اللى ممكن تتعمل فى الدنيا بالـ systemd
3. عايز اتفرج على جهاز موجود فى الـ production واعرف كل الحاجات اللى بيعملها
4. عايز اشوف الـ host machine بتاعتى فيها services ايه
_____

[29-Day-14\_Understanding\_Systemd - YouTube](https://youtu.be/KnPd955zBcE?si=xlSGD1YZWC0Gk2pS)

| systemd          | init                  |
| ---------------- | --------------------- |
| units (readable) | shell scripts (sucks) |
| parallel         | -                     |
| $ jornald        | syslog & rsyslog      |


```bash
$ systemctrl
$ jornald
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

> Link

- [how-to-list-all-enabled-services-from-systemctl](https://askubuntu.com/questions/795226/how-to-list-all-enabled-services-from-systemctl)


## journal

Show logs from 6 am to 7 pm
```shell
jornalctrl 
```

Show logs for ssh only
```shell
jornalctrl
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