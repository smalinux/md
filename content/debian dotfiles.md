# أولاً لازم تفتح ssh للـ root
**Edit the SSH config file:**
```bash
sudo vim /etc/ssh/sshd_config
```
**Find and modify these lines:**
```bash
# Change this line from:
PermitRootLogin no
# To:
PermitRootLogin yes
# Also ensure password authentication is enabled if needed:
PasswordAuthentication yes
```
**Restart the SSH service:**
```bash
sudo systemctl restart ssh
```


# دلوقتى تقدر تغير الكيرنال:
```bash
# Kernel hacking
Ubuntu@bb-kernel $ ./tools/rebuild.sh
# deploy to beaglebone
# this command need ssh root@ first before...
Ubuntu@beaglebone-debian-dev $ ./sync_kernel.sh
```

```
[INFO] Testing SSH connection to root@192.168.0.98...
[SUCCESS] SSH connection OK
[INFO] Checking kernel build artifacts...
[SUCCESS] All kernel files found
[INFO] Pushing kernel files to BeagleBone...
[INFO] Creating backup of current kernel...
[INFO] Pushing: 5.10.233-bone79.zImage -> /boot/zImage
sending incremental file list
5.10.233-bone79.zImage
      7,094,784 100%    2.96MB/s    0:00:02 (xfr#1, to-chk=0/1)

sent 7,085,287 bytes  received 35 bytes  2,024,377.71 bytes/sec
total size is 7,094,784  speedup is 1.00
[SUCCESS] ✓ 5.10.233-bone79.zImage
[INFO] Setting kernel permissions...
[INFO] Pushing: 5.10.233-bone79-modules.tar.gz -> /tmp/modules.tar.gz
sending incremental file list
5.10.233-bone79-modules.tar.gz
     23,527,929 100%    3.92MB/s    0:00:05 (xfr#1, to-chk=0/1)

sent 23,533,391 bytes  received 35 bytes  3,620,527.08 bytes/sec
total size is 23,527,929  speedup is 1.00
[SUCCESS] ✓ 5.10.233-bone79-modules.tar.gz
[INFO] Extracting kernel modules...
[SUCCESS] Modules installed
[INFO] Pushing: 5.10.233-bone79-dtbs.tar.gz -> /tmp/dtbs.tar.gz
sending incremental file list
5.10.233-bone79-dtbs.tar.gz
        712,781 100%  324.26MB/s    0:00:00 (xfr#1, to-chk=0/1)

sent 693,095 bytes  received 35 bytes  1,386,260.00 bytes/sec
total size is 712,781  speedup is 1.03
[SUCCESS] ✓ 5.10.233-bone79-dtbs.tar.gz
[INFO] Extracting device tree blobs...
[SUCCESS] DTBs installed
[INFO] Pushing: config-5.10.233-bone79 -> /boot/config-5.10.233-bone79
sending incremental file list
config-5.10.233-bone79
        186,259 100%  146.38MB/s    0:00:00 (xfr#1, to-chk=0/1)

sent 47,834 bytes  received 35 bytes  95,738.00 bytes/sec
total size is 186,259  speedup is 3.89
[SUCCESS] ✓ config-5.10.233-bone79

[SUCCESS] Kernel deployment complete: 4/4 files transferred
[INFO] Updating boot environment...

[SUCCESS] ==========================================
[SUCCESS] Kernel deployment successful!
[SUCCESS] ==========================================
[WARNING] IMPORTANT: Reboot BeagleBone to use new kernel:
  ssh root@192.168.0.98 'reboot'
[WARNING] ==========================================
```

