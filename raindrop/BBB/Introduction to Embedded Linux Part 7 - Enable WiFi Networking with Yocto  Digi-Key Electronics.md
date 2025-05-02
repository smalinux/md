---
raindrop_id: 1008864589

---

# Metadata
Source URL:: https://www.youtube.com/@digikey/playlists


---
# Introduction to Embedded Linux Part 7 - Enable WiFi Networking with Yocto | Digi-Key Electronics

Linux is a powerful operating system that can be compiled for a number of platforms and architectures. One of the biggest draws is its ability to be customized for an application. Tools like Buildroot, OpenWRT, and Yocto Project help us create custom Linux distributions for embedded systems.

In this video series, we will explore Buildroot and the Yocto Project. We also demonstrate how you might develop applications for embedded Linux. We will not dive into the specifics of how each of these systems work but give you a good starting place so you can read or watch more advanced material about working with embedded Linux.

See this written tutorial if you would like to review the commands issued in this tutorial for the Yocto Project: https://www.digikey.com/en/maker/projects/intro-to-embedded-linux-part-7-enable-wifi-networking-with-yocto/2e490a896a424a12b796ae60fef52937 

In the previous episode (https://youtu.be/DVlQZnFjO9o), we wrote a custom application that reads data from a temperature sensor over I2C. 

This episode, we enable WiFi networking. As the STM32MP157D-DK1 does not have an onboard wireless module, we must add our own module. We accomplish this by using a USB WiFi dongle. Additionally, we must include specific driver modules/drivers to work with the adapter.
We are using a TP-Link TL-WN725N WiFi adapter. Note that not all WiFi adapters will work with Linux! It will likely require some trial and error to find an adapter and specific drivers to make WiFi work correctly with your board.

This site allows you to look up chipsets and see if they might work with Linux: http://linux-wless.passys.nl/ 

We use the bitbake menuconfig option to select which modules we want to include in our image. We then copy this configuration file to our custom layer (that we created in Part 4 https://youtu.be/bTEdfwtPtNY). This allows us to include WiFi support for the rtl8188eu chipset any time we include our custom layer.
Note that we need to modify our .bbappend kernel recipe to include the new defconfig (default configuration) file as well as modify the IMAGE_INSTALL variable to tell bitbake to include a variety of packages (firmware, modules, networking tools) in our image.

Once we build our image, we flash it to an SD card and boot our STM32MP157D-DK1. We use the networking tools to connect to a local network (e.g. using ifconfig and wpa_supplicant). This forms the basis for creating a Linux-based IoT device!

Product Links:
https://www.digikey.com/en/products/detail/stmicroelectronics/STM32MP157D-DK1/13536964

Related Videos:
https://youtu.be/yD8M_UK4AgQ

Related Project Links:
https://www.digikey.com/en/maker/projects/intro-to-embedded-linux-part-7-enable-wifi-networking-with-yocto/2e490a896a424a12b796ae60fef52937 

Related Articles:
https://forum.digikey.com/c/eewiki/linux-guides/71 

Learn more:
Maker.io - https://www.digikey.com/en/maker
Digi-Key’s Blog – TheCircuit https://www.digikey.com/en/blog
Connect with Digi-Key on Facebook https://www.facebook.com/digikey.electronics/
And follow us on Twitter https://twitter.com/digikey

## Highlights
