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

# Logic analyser
sudo apt install sigrok-cli pulseview libsigrok4 libftdi1-2 libftdi1-dev sigrok
sudo apt install libftdi1-2 libftdi1-dev python3-ftdi1
sudo apt install ftdi-eeprom


======
sudo apt install git cmake qtbase5-dev libfftw3-dev libusb-1.0-0-dev
sudo apt install qttools5-dev-tools qttools5-dev qt5-qmake
sudo apt install libqt5opengl5-dev libgl1-mesa-dev

======

# Google: fritzing-beaglebone
sudo apt install fritzing
# AdaFruit Fritzing Library (includes many development boards)
git clone https://github.com/adafruit/Fritzing-Library.git

# SparkFun Fritzing Parts
git clone https://github.com/sparkfun/Fritzing_Parts.git

```

هنا تقدر تـ build كل الـ modules بتاعتك 😙
