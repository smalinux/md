اخيراً اشتغل معايا sigrok لأول مره!

ايه هو sigrok؟ هو برنامج opensource بيخليك توصل اجهزه logic analyser وتشوف الـ signals

الاخطاء اللى انا عملتها خلتنى اتأخر فى تشغيله من أول مره
1. انى نسيت تماماً اضيف udev rules ودا ادى الأن الجهاز ما يظهرش
2. اشتريت جهاز ملهوش دعم كبير, بالرغم من انه موجود فى wiki, لكن مش حلو كبدايه


# خطوات الـ install:

```bash
# السطر الأول كفايه, لو ما اشتغلش معاك ممكن تستخدم السطر التانى, والثالث
sudo apt install sigrok-cli pulseview libsigrok4 libftdi1-2 libftdi1-dev sigrok

#
#sudo apt install libftdi1-2 libftdi1-dev python3-ftdi1
#sudo apt install ftdi-eeprom
```

اقفش الجاهز بـ lsusb
```bash
Ubuntu@barebox $ lsusb
#....
#....
Bus 001 Device 017: ID 0925:3881 Lakeview Research Saleae Logic
#....
#....
```
بعدين باقى الخطوات هى اجابه chatgpt

1. **Create the udev rules file:**

```bash
sudo vim /etc/udev/rules.d/99-saleae-logic.rules
```

2. **Add this rule to the file:**

```
SUBSYSTEM=="usb", ATTR{idVendor}=="0925", ATTR{idProduct}=="3881", MODE="0666", GROUP="plugdev", TAG+="uaccess"
```

I added the `TAG+="uaccess"` which is recommended for modern Ubuntu systems as it works with systemd-logind for better user session handling.

3. **Ensure you're in the plugdev group:**

```bash
sudo usermod -a -G plugdev $USER
```

4. **Reload the udev rules:**

```bash
sudo udevadm control --reload-rules
sudo udevadm trigger
```

5. **Unplug and replug the device** (or reboot if you had to add yourself to the plugdev group).
هنا انت تـ reboot مش بس تـ unplug !
6. **Verify the permissions:** After reconnecting, check that the device node has the correct permissions:
    

```bash
ls -la /dev/bus/usb/001/
```

Look for your device (it should show up with 666 permissions and be in the plugdev group).
The Saleae Logic software should now be able to access the device without requiring sudo privileges.


بعدين دى كانت النتيجه:

![](../assets/Pasted%20image%2020250624214437.png)

![](../assets/Pasted%20image%2020250624214456.png)


انا وصلت الـ logic analyser باردوينو وعلمت led بتعمل pwm واتأكد انى بشوف الـ pwm بعينى, بعدين وصلت بدل الـ led الـ logic analyser
ما تنساش توصل الـ ground بتاع الـ logic analyser


قبل ما تشترى اى جهاز اتأكد انه مدعوم كويس الأول: [Supported hardware - sigrok](https://sigrok.org/wiki/Supported_hardware#Logic_analyzers)

https://docs.arduino.cc/built-in-examples/basics/Fade/

https://docs.arduino.cc/learn/microcontrollers/analog-output/
https://docs.arduino.cc/tutorials/generic/secrets-of-arduino-pwm/



https://www.youtube.com/watch?v=rR5cEFRO9_s&ab_channel=Electronoobs
https://www.youtube.com/watch?v=u1DYs2I-_lU&ab_channel=element14presents
https://www.youtube.com/watch?v=z8Tdz7eQ8n4&ab_channel=GeekTillItHertz
https://www.youtube.com/watch?v=7x4h7Zq2NNU&ab_channel=Rudy%27sHobbyChannel
https://www.youtube.com/watch?v=wymRQRFFnFo&ab_channel=MycrostartElectronics
https://www.youtube.com/watch?v=lEUMJb0xpVU&ab_channel=FastbitEmbeddedBrainAcademy
https://www.youtube.com/@KumarAbhishekKakkar
