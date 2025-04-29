             └─1872361 /usr/sbin/dnsmasq -x /run/dnsmasq/dnsmasq.pid -u dnsmasq -r /run/dnsmasq/resolv.conf -7 /etc/dnsmasq.d,.dpkg-dist,.dpkg-old,.dpkg-new --local-service --trust-anchor=.,20326,8,2,E06D44B80B8>



change dns user


  15  __success__ = echo all good; cp build/images/barebox-am33xx-beaglebone.img /tftpboot/none-barebox-am335x-bone-black



add symlinks list of make shift
```
Ubuntu@barebox $ ln -s /src/build/barebox/bbb/images/barebox-beagleboard.img /tftpboot/none-barebox-am335x-bone-black

```