# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Structure

This repository is a personal knowledge base/digital garden containing markdown notes on embedded Linux, hardware, and system administration topics. It appears to be maintained using Obsidian or a similar tool.

Key directories:
- `/content/`: Main directory containing markdown files on various technical topics
- `/assets/`: Images used in the notes
- `/Clippings/`: Contains specific reference notes
- `/raindrop/`: Contains categorized links and bookmarks

## Commands

The repository uses a simple Makefile with these commands:

```bash
# Add all files, commit with date-based message, and push to remote
make push
```

## Repository Purpose

This repository serves as a personal knowledge management system focusing on:

- Embedded Linux development (Yocto, kernel setup)
- Hardware interfaces (SPI, GPIO, PWM)
- Bootloaders (U-boot, barebox, fastboot)
- BeagleBone Black and similar hardware platforms
- System services (systemd, RAUC for updates)
- Network services (SSH, HTTP, TFTP, NFS)

## Future Plans

According to the README, there are plans to convert this repository to a static website using a tool similar to blogit (https://pedantic.software/git/blogit).