---
title: "Pinctrl subsystem"
source: "https://smalinux.github.io/p/pinctrl/"
author:
  - "[[smalinux]]"
published: 2025-04-19
created: 2025-04-29
description: "Cuted list of resources helped me to understand pinctrl"
tags:
  - "clippings"
---
- ~~[The pin control subsystem \[LWN.net\]](https://lwn.net/Articles/468759/)~~ useless

< use Linux kernel as a bootloader! ([https://linux.die.net/man/8/kexec](https://linux.die.net/man/8/kexec))

قارن بين الدبيان والـ yocto image بتاعتك, افهم الـ device tree بتاعك كويس واعرف ليه هم عندهم device tree اكتر منك
```
ls  /sys/kernel/debug/pinctrl
```

عايز اداة ترسمبى كل الـ pins وكل الـ pin mux 
لازم رسمه علشان اتخيل الدنيا كويس جداً

حدد كل الـ files اللى تخص الـ pinctrl اللى جوا الكيرنال واقرأهم كلهم


# TODO
- شوف كل الفيديوهات بتاعت الـ pinctrl
- جوجل pinctrl
- استخدم pinctrl جوا الـ barebox
- Google images: pinctrl linux

[https://developer.toradex.com/software/linux-resources/device-tree/pinmuxing-guide/](https://developer.toradex.com/software/linux-resources/device-tree/pinmuxing-guide/)  
[https://developer.toradex.com/torizon/os-customization/use-cases/pin-multiplexing-changing-pin-functionalities-in-the-linux-device-tree/](https://developer.toradex.com/torizon/os-customization/use-cases/pin-multiplexing-changing-pin-functionalities-in-the-linux-device-tree/)  
[https://software-dl.ti.com/jacinto7/esd/processor-sdk-linux-j721s2/08_06_00_10/exports/docs/linux/Foundational_Components/Tools/Pin_Mux_Tools.html](https://software-dl.ti.com/jacinto7/esd/processor-sdk-linux-j721s2/08_06_00_10/exports/docs/linux/Foundational_Components/Tools/Pin_Mux_Tools.html)
[https://community.nxp.com/t5/i-MX-Processors/how-to-integrate-pinmux-tool-C-code-into-Linux/m-p/599056](https://community.nxp.com/t5/i-MX-Processors/how-to-integrate-pinmux-tool-C-code-into-Linux/m-p/599056)
[https://software-dl.ti.com/jacinto7/esd/processor-sdk-linux-jacinto7/latest/exports/docs/linux/How_to_Guides/FAQ/How_to_Check_Device_Tree_Info.html](https://software-dl.ti.com/jacinto7/esd/processor-sdk-linux-jacinto7/latest/exports/docs/linux/How_to_Guides/FAQ/How_to_Check_Device_Tree_Info.html)
[https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/18842152/ZynqMP+Linux+Pin+Controller+Driver](https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/18842152/ZynqMP+Linux+Pin+Controller+Driver)
[https://www.linkedin.com/pulse/understanding-pinctrl-subsystem-linux-kernel-code-concrete-david-zhu-lcnkc](https://www.linkedin.com/pulse/understanding-pinctrl-subsystem-linux-kernel-code-concrete-david-zhu-lcnkc)
[https://genodians.org/nfeske/2022-05-03-pine-fun-trimming-drivers](https://genodians.org/nfeske/2022-05-03-pine-fun-trimming-drivers)
[https://www.beyondlogic.org/an-introduction-to-chardev-gpio-and-libgpiod-on-the-raspberry-pi/](https://www.beyondlogic.org/an-introduction-to-chardev-gpio-and-libgpiod-on-the-raspberry-pi/)
[https://www.kernel.org/doc/Documentation/devicetree/bindings/gpio/gpio.txt](https://www.kernel.org/doc/Documentation/devicetree/bindings/gpio/gpio.txt)
[https://www.linux4sam.org/bin/view/Linux4SAM/DriverModelInUBoot?skin=print.myskin](https://www.linux4sam.org/bin/view/Linux4SAM/DriverModelInUBoot?skin=print.myskin)
[https://www.linux4sam.org/bin/view/Linux4SAM/BootLogo](https://www.linux4sam.org/bin/view/Linux4SAM/BootLogo)
[https://www.linux4sam.org/bin/view/Linux4SAM/DemoArchiveSubsections](https://www.linux4sam.org/bin/view/Linux4SAM/DemoArchiveSubsections)
[https://www.linux4sam.org/bin/view/Linux4SAM/LinuxKernel?skin=print.myskin](https://www.linux4sam.org/bin/view/Linux4SAM/LinuxKernel?skin=print.myskin)
[https://www.linux4sam.org/bin/view/Linux4SAM/PmFaq?skin=print.myskin](https://www.linux4sam.org/bin/view/Linux4SAM/PmFaq?skin=print.myskin)
[https://www.linux4sam.org/bin/view/Linux4SAM/DemoArchive4_7](https://www.linux4sam.org/bin/view/Linux4SAM/DemoArchive4_7)
[https://www.linux4sam.org/bin/view/Linux4SAM/UsingUltraLowPowerMode1](https://www.linux4sam.org/bin/view/Linux4SAM/UsingUltraLowPowerMode1)
# Cheatsheet
