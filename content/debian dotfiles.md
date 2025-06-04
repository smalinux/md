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

# خطوه نقل كل الملفات بتاعتى للـ target
بعد ما بتحط نظام جديد, الطبيعى انك بنقل كل ملفاتك المهمه ليه
```bash
./sync.sh push
./sync_uEnv.sh
```

وطول ما انت شغال بتطور طول الوقت انت بتكتب على الـ host وبتسحب backup
```bash
./sync.sh
```

# الخطوه الجايه apt update 
هنا لازم احط الـ kernel headers علشان اعرف ابنى modules على الـ target
```bash
apt update
apt install lsof
apt install u-boot-tools
apt install libubootenv-tool
apt install linux-headers-$(uname -r) build-essential
```

هنا تقدر تـ build كل الـ modules بتاعتك 😙
