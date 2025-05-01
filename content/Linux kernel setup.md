
dotfiles: makeshift

- [dnsmasq](content/dnsmasq.md)


> flash buildroot sdcard.img FAST!

```
bmaptool create build/images/sdcard.img > build/images/sdcard.bmap
time sudo bmaptool copy build/images/sdcard.img /dev/sda
```

