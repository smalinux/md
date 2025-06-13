---
title: "Linux Kernel Development for Neovim"
source: "https://medium.com/@lsig/linux-kernel-development-for-neovim-a783beede29b"
author:
  - "[[lsig]]"
published: 2024-11-18
created: 2025-06-13
description: "This fall, I started Kernel hacking due to my OS class. The first thing I wanted to do was set up my Neovim environment to make the experience as pleasant as possible. Initially, I hoped that my…"
tags:
  - "clippings"
---
[Sitemap](https://medium.com/sitemap/sitemap.xml)

![](https://miro.medium.com/v2/resize:fit:640/format:webp/1*rBv5p7xiIbtS3i24qnU8Zw.jpeg)

This fall, I started Kernel hacking due to my OS class. The first thing I wanted to do was set up my Neovim environment to make the experience as pleasant as possible.

Initially, I hoped that my Clangd setup was enough, but to my surprise, a couple of extra steps were needed to set up Neovim for kernel development.

The first step is to install Clangd, either manually or through Mason. This is the minimum setup required inside your LSP config file.

```c
require("lspconfig").clangd.setup({})
```

This is how my configuration looks after scouring reddit and adjusting to my needs.

```c
require("lspconfig").clangd.setup({
        cmd = {
          "clangd",
          "--header-insertion=never",
          "-j",
          nproc,
          "--completion-style=detailed",
          "--function-arg-placeholders",
          "--rename-file-limit=0",
          "--background-index",
          "--background-index-priority=normal",
        },
        filetypes = { "c", "cpp", "objc", "objcpp" },
})
```

The next step is to install clang this can be done in a variety of ways and is dependant on your OS. On Ubuntu you can run:

```c
sudo apt install clang
```

Then before you compile the kernel run:

```c
python3 scripts/clang-tools/gen_compile_commands.py
```

The last magic step to this journey, which eluded me for quite some time (thanks u/Signal\_Classroom\_525 for pointing this out), is to compile the kernel with clang.

```c
make CC=clang-18 -j$(nproc)
```

Where CC equals your clang executable (clang, clang-18, …). And thats it! Now you should have all the tools necessary within Neovim to start your kernel development journey.

For a guide on how to compile the kernel check out:## [Kernel compilation in Ubuntu Linux](https://w4118.github.io/guides/kernel-compilation.html?source=post_page-----a783beede29b---------------------------------------)

First, update the package repository cache by running the following command: Then, install the following dependencies…

w4118.github.io

[View original](https://w4118.github.io/guides/kernel-compilation.html?source=post_page-----a783beede29b---------------------------------------)

## Recommended from Medium

[

See more recommendations

](https://medium.com/?source=post_page---read_next_recirc--a783beede29b---------------------------------------)