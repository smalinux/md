الـ repo دى هى اللى بتنبى image كامله لدبيان, جاهزه انها يتعملها flash لذلك تستاهل انها تتقرأ سطر سطر وافهم هى بتشتغل ازاى.
____

```bash
sudo apt-get install dosfstools git kpartx wget tree parted
```

اعملى image base on debian وحطلى فيها كل الـ packages:
```bash
./RootStock-NG.sh -c bb.org-debian-bookworm-iot-v5.10-ti-armhf-am335x.conf
```

اعملى file.img من الـ image اللى انا بنيتها:
```bash
Ubuntu@debian-12.11-iot-armhf-2025-05-25 $ sudo ./setup_sdcard.sh --img-4gb beaglebone-image --dtb beaglebone
```

اثناء الامر اللى فات حصل انه حمل حاجات من النت, لو انا عايز كله يحصل offline:
```bash
sudo ./setup_sdcard.sh --img-4gb beaglebone-image --dtb beaglebone --distro-bootloader
```

```bash
sudo dd if=beaglebone-image-4gb.img of=/dev/sdX bs=4M status=progress conv=fsync
```

