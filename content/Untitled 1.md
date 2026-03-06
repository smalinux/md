# TL;DR

I've started my journey by building many Linux kernel modules and my own OS from scratch.
Then I contributed to open-source projects like Google Summer of Code[^12], Htop [^1],  Barebox [^25], PCP [^2], and Linux kernel [^3].

I needed to choose a Linux subsystem to focus on and to learn Linux through it. I chose the performance aspects of Linux. My experience with Htop and PCP made this decision for me.

I am passionate about performance engineering and monitoring, because it gave me the power to touch dark places in the system that nobody in other Linux subsystems could touch.

Currently, I'm living in Vienna and working as an embedded Linux engineer at Loytec (https://loytec.com).

[^12]:https://gist.github.com/smalinux/e869b376b5c77cacdcda4cb14f027632
[^1]: https://github.com/htop-dev/htop/commits?author=smalinux
[^2]: https://github.com/performancecopilot/pcp/commits?author=smalinux
[^3]: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/log/?qt=grep&q=sohaib
[^25]: https://github.com/barebox/barebox/commits?author=smalinux

# Future Projects

- Add barebox support for Amlogic (Le Potato AML-S905X-CC)
- ~~Board support for Kickpi k3~~
- ~~Board support for Avenger96~~
- WS2812B LED Matrix Control via the Linux Sound Subsystem
- Implement secure boot into one of my boards (BeaglePlay maybe)
- Deep dive into Linux eBPF subsystem.
- Implement a personal Hacker News filter.
- Create my own dream keyboard (similar to [dactyl-manuform](https://github.com/abstracthat/dactyl-manuform) with you modifications).
- Build Labgrid setup, so I can control my boards remotely from anywhere.
- Block Ads EVERYWHERE — Pi-hole + Tailscale VPN
- Play with nRF52840 DK
- pwn.college


# Previous Projects

## Board support for Kickpi k3

I wrote code[^24] for the barebox bootloader to support the Rockchip KickPi K3.  
This work helped me gain a much deeper understanding of the barebox bootloader, and I am now much better oriented within its source code. I also learned how to clean up device trees coming from downstream vendor kernels and downstream U-Boot versions.  
I made many mistakes along the way due to oversights, but I’m glad I did—they taught me a lot.

![https://lore.barebox.org/barebox/20260116-barebox-kickpi-v1-0-d11fbccd527a@gmail.com/T/](https://raw.githubusercontent.com/smalinux/smalinux.github.io/refs/heads/main/my_assets/imgs/kickpi-k3.jpg)

[^24]: https://lore.barebox.org/barebox/20260116-barebox-kickpi-v1-0-d11fbccd527a@gmail.com/T/#t

## Board support for Avenger96

Contributed a patch series [^23] written to Barebox bootloader for the Arrow STM32MP157A Avenger96 board. Implemented bootloader update handlers supporting both MMC and NOR flash storage devices for safe firmware update.

![https://lore.barebox.org/barebox/20251128-avenger96-v1-0-009b13bd8df7@gmail.com/T/](https://raw.githubusercontent.com/smalinux/smalinux.github.io/refs/heads/main/my_assets/imgs/Avenger96.jpg)

[^23]: https://lore.barebox.org/barebox/20251203-avenger96-v2-0-95f0cfa50aaa@gmail.com/

## Google Summer of Code 2022

This project is substantial, which is why I've dedicated a separate page to it:
[Google Summer of Code 2022 · GitHub](https://gist.github.com/smalinux/e869b376b5c77cacdcda4cb14f027632)

- I'd like to highlight that the lessons I've learned throughout this project are immeasurable.
- Participating in discussions with senior programmers has been a unique and exceptional experience for me, allowing me to gain invaluable insights.
- Additionally, working in an open-source environment has been an exceptional experience that has aided me in improving my skills.
- Before jumping into coding, I wrote a proposal[^22] that helped me organize my workflow and significantly enhanced my productivity.

— [LinkedIn](https://www.linkedin.com/in/smalinux/):
![https://www.linkedin.com/in/smalinux/](https://raw.githubusercontent.com/smalinux/smalinux.github.io/master/my_assets/imgs/Screenshot-recommentation-0.png)

[^22]: [PCP proposal - Google docs](https://docs.google.com/document/d/1p3I30ObcgUN60eSIvloHmSQkx71sIA_JIxFMAM2DzW4/edit?usp=sharing)

## Linux kernel modules

**I wrote 80+ simple Linux kernel modules** [^8] while working through the lkmc[^4] repository, the Linux device driver (LDD3) book and many other resources like "The Eudyptula Challenge".

> “If you didn't get angry and mad and frustrated, that means you don't care about the end result, and are doing something wrong.” — Greg KH

- I was able to overcome my fear of navigating a large codebase like Linux and gain a deeper understanding of the operating system by learning about kernel modules.
- Additionally, I learned how to use kernel APIs such as [hash tables](https://github.com/torvalds/linux/blob/master/include/linux/hashtable.h), which helped me acquire practical knowledge. This knowledge allowed me to make sense of the information I gained from the "operating system dinosaur" book.
- Ultimately, this understanding enabled me to contribute to the Linux community by submitting my own simple patches [^17].
- I helped to reproduce a memory leak issue [^18] :)
- My name is here[^19] with the most Tested-by people :)

— [Linux kernel mailing list](https://lore.kernel.org/linux-perf-users/CAP-5=fWLY2cF97P0oiMpnLzKjBJ-tC_jRyRNicSHjx6m73KrWg@mail.gmail.com/):
![https://lore.kernel.org/linux-perf-users/CAP-5=fWLY2cF97P0oiMpnLzKjBJ-tC_jRyRNicSHjx6m73KrWg@mail.gmail.com/](https://raw.githubusercontent.com/smalinux/smalinux.github.io/master/my_assets/imgs/Screenshot-from-mem-leak.png)

[^4]: https://github.com/cirosantilli/linux-kernel-module-cheat
[^8]: https://github.com/smalinux/linux-kernel-modules-lab - https://github.com/smalinux/ps-aux
[^17]: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/log/?qt=grep&q=sohaib
[^18]: https://lore.kernel.org/linux-perf-users/CAP-5=fWLY2cF97P0oiMpnLzKjBJ-tC_jRyRNicSHjx6m73KrWg@mail.gmail.com/
[^19]: https://lwn.net/Articles/880699/


## Linux From Scratch (LFS)

**I wrote bash scripts [^6] while working through the Linux From Scratch book.** These scripts are for building my own independent Linux distribution.

- I wrote this project with tears because a small mistake caused my machine to be completely erased while entering the Chroot environment.
- Fortunately, I have crontab[^20] scripts that back up everything on my system every half hour :)
- LFS is an intensive task that helped me gain a better understanding of how each component of Linux works, how they are interdependent, and how to configure each component according to their specific needs.

— YouTube Demo [^5] & Source code [^6]

![https://github.com/smalinux/LFS](https://raw.githubusercontent.com/smalinux/smalinux.github.io/master/my_assets/imgs/LFS-booting-0-50-screenshot.png)

[^5]: https://youtu.be/jrx1LhWCcnk
[^6]: https://github.com/smalinux/LFS
[^20]: [GitHub - smalinux/dotfiles](https://github.com/smalinux/dotfiles#crontab-backup)


## SimOS

Tiny operating system I wrote using pure Assembly only while working through osdev.org.
<br>
x86 architecture in 16-bit mode using BIOS interrupts.

— YouTube Demo[^21] & Source code [^7]

![https://github.com/smalinux/simOS](https://raw.githubusercontent.com/smalinux/smalinux.github.io/master/my_assets/imgs/SimOS-screenshot.png)

[^7]: https://github.com/smalinux/simOS
[^21]: https://www.youtube.com/watch?v=aUWQ_VIuKY4&ab_channel=smalinux


## RougeLike game

Classic ASCII game I wrote to improve my C language using ncurses library.
<br>
Fortunately, my experience with this library helped me later contribute to Htop. since this same library is used by Htop to create terminal GUI-based apps.

>  "These games were popularized among college students and computer programmers of the 1980s and 1990s" [^11]

— YouTube Demo [^13] & Source code [^14]

![https://github.com/smalinux/RougeLike](https://raw.githubusercontent.com/smalinux/smalinux.github.io/master/my_assets/imgs/Roguelike-0-56-screenshot.png)

[^11]: [Roguelike - Wikipedia](https://en.wikipedia.org/wiki/Roguelike)
[^13]: https://www.youtube.com/watch?v=4vNrjhPuxMM
[^14]: https://github.com/smalinux/RougeLike


## Chess bot

Python script allows me to cheat while I'm playing chess online on chess.com (just for fun) which allows me to beat even top-rated players.
<br>
I used Stockfish APIs[^9] and Selenium to implement this project.
<br>
— YouTube Demo [^10].

![https://youtu.be/vDjorA9yCEA](https://raw.githubusercontent.com/smalinux/smalinux.github.io/master/my_assets/imgs/chess-bot-4-46-screenshot.png)

[^9]: [Stockfish - Open Source Chess Engine](https://stockfishchess.org/) - [stockfishpy · PyPI](https://pypi.org/project/stockfishpy/)
[^10]: https://youtu.be/vDjorA9yCEA

## Others
- [GitHub - smalinux/TBSys](https://github.com/smalinux/TBSys)
Simple CLI project was written as part of my technical interview assessment.


# About Me

Hello, my name is 𝑺𝒐𝒉𝒂𝒊𝒃 and welcome!

Everyone has a hobby, and mine is exploring various life projects and challenges to improve myself. – from technical skills to fitness challenges. I was recently invited to participate in technical podcasts in Arabic, where I shared my insights on the low-level track[^15] and how to participate in Google Summer of Code[^16].

I'm always happy to hear from folks, and if you're ever in the city where I'm currently residing, I would love to meet up for coffee. Don't hesitate to reach out to me at sohaib.amhmd@gmail.com if you want to get in touch. I love meeting & connecting with people, so if you're ever in the neighborhood, feel free to reach out and say hello!

[^15]: https://www.youtube.com/live/JVdH_78oS50
[^16]: https://youtu.be/zsXe-T-bV5U

<!---
## اكتب وصف friendly اكتر كانك بتحكى لحد من اصحابك - بس ابداً اول سطرين هم اللى فيهم اهم معلومات بعدين 3 او اسطر رغى ..
-->