---
title: "Sparse Semantic Parser"
source: "https://medium.com/@alessandrozanni.dev/sparse-semantic-parser-5b31a7c4ab54"
author:
  - "[[Alessandro Zanni]]"
published: 2024-10-29
created: 2025-06-20
description: "Sparse is a C language “semantic parser” originally written by Linus Torvalds to support his work on the Linux kernel. It was designed, according to the README file, to be “small — and simple” and…"
tags:
  - "clippings"
---
[Sitemap](https://medium.com/sitemap/sitemap.xml)

[Sparse](http://sparse.wiki.kernel.org/) is a C language “semantic parser” originally written by Linus Torvalds to support his work on the Linux kernel.

It was designed, according to the [README](http://git.kernel.org/cgit/devel/sparse/sparse.git/tree/README?id=66b24573e9cb5eaa0c41dc4164f81f3b83b9cb41) file, to be “small — and simple” and particularly to be “easy to use“. Reasons to use a simple C parser could include data mining (to summarize particular features of some code, for example), analysis (possibly to look for troublesome patterns), or visualization (to make it easier to understand or navigate around a large code set). In support of this reuse, sparse is licensed under the permissive MIT License and is structured as a library that other tools can easily incorporate. This library is accompanied by a number of tools that demonstrate some of those reuse possibilities.

Sparse provides functionality to simplify that AST so that particular features of the code can stand out, but keeps the focus fairly local. In particular, it doesn’t support any significant data-flow analysis to detect how values change across a sequence of code.

## Install it

If you have a Debian-like distro, you can install it simply with:

```c
sudo apt-get install sparse
```

If a precompiled package for sparse is not provided you can proceed with a manual installation from git repository:

```c
$ git clone git://git.kernel.org/pub/scm/devel/sparse/sparse.git
$ cd sparse
$ make
$ make install
```

## Getting started

To run sparse checks, we have to set the C argument when compiling the kernel:

```c
# To run sparse on files that get recompiled
$ make C=1

# To run sparse on all files whether they need to be recompiled or not 
$ make C=2

# To save the warnings to a file
$ make C=2 2>outfile

# Choose a folder to check sparse errors and warnings
$ make C=2 drivers/staging/
```

## Ouput

Sparse reports various errors and warnings while examining the code. A large class of the warnings and errors that Sparse generates come from extending the C language is various ways. In fact, Sparse defines the macro \_\_CHECKER\_\_ so that the use of these extensions can be made visible only to sparse, not to other C compilers.

Here an example of Sparse output

```c
drivers/gpu/drm/i915/i915_drm_client.c:92:9: warning: incorrect type in argument 1 (different address spaces)
drivers/gpu/drm/i915/i915_drm_client.c:92:9:    expected struct list_head const *list
drivers/gpu/drm/i915/i915_drm_client.c:92:9:    got struct list_head [noderef] __rcu *pos
drivers/gpu/drm/i915/i915_drm_client.c:92:9: error: incompatible types in comparison expression (different address spaces):
drivers/gpu/drm/i915/i915_drm_client.c:92:9:    struct list_head [noderef] __rcu *
drivers/gpu/drm/i915/i915_drm_client.c:92:9:    struct list_head *
drivers/gpu/drm/i915/i915_drm_client.c:92:9: error: incompatible types in comparison expression (different address spaces):
drivers/gpu/drm/i915/i915_drm_client.c:92:9:    struct list_head [noderef] __rcu *
drivers/gpu/drm/i915/i915_drm_client.c:92:9:    struct list_head *
```

Some of these extensions, like \_\_range\_\_, are new statements, but most are attributes that can be attached to variable and type declarations using the GCC [attribute syntax](https://gcc.gnu.org/onlinedocs/gcc/Attribute-Syntax.html) extension. These can provide extra information about how a variable or type should be used so sparse can warn when the expectations are not met.

For a more deep dive into Spase, please, refer to this [LWN.net article](https://lwn.net/Articles/689907/).

The list of warnings and errros Spase can raise is [available here](https://www.man7.org/linux/man-pages/man1/sparse.1.html).

## More from Alessandro Zanni

## Recommended from Medium

[

See more recommendations

](https://medium.com/?source=post_page---read_next_recirc--5b31a7c4ab54---------------------------------------)