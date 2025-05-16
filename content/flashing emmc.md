
# Option 1: [GitHub - jumpnow/meta-bbb: A Yocto meta-layer for BeagleBones](https://github.com/jumpnow/meta-bbb)

On host:

```
bitbake console-image
bitbake emmc-installer-image
sudo ./mk2parts.sh sda
./copy_boot.sh sda
./copy_rootfs.sh sda emmc-installer
./copy_emmc_install.sh sda console
```

On beaglebone:
```
emmc_installer.sh
```




___________
# Option 2: RAUC


____
# Option 3: