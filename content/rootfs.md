
initrd/initramfs is optional. You only need it if you need to run user code before mounting rootfs

----------
Yes, this can't work. A kernel is useless without userspace and you didn't specify which rootfs to use
That's why the exampe mentions an initrd, so you have some userspace :)

-----


