# أولاً لازم تفتح ssh للـ root
**Edit the SSH config file:**
```bash
sudo vim /etc/ssh/sshd_config
```
**Find and modify these lines:**
```bash
# Change this line from:
PermitRootLogin no
# To:
PermitRootLogin yes
# Also ensure password authentication is enabled if needed:
PasswordAuthentication yes
```
**Restart the SSH service:**
```bash
sudo systemctl restart ssh
```


# دلوقتى تقدر تغير الكيرنال:
```bash
# Kernel hacking
Ubuntu@bb-kernel $ ./tools/rebuild.sh
# deploy to beaglebone
# this command need ssh root@ first before...
Ubuntu@beaglebone-debian-dev $ ./sync_kernel.sh
```

# BB-Kernel Configuration & Build Cheatsheet

## Overview

The bb-kernel repository provides scripts to rebuild ARM kernels (especially BeagleBone/AM335x) with custom configurations and patches.

## Quick Setup

### 1. Clone Repository

```bash
git clone https://github.com/RobertCNelson/bb-kernel.git
cd bb-kernel
git checkout am33x-v5.10  # or desired branch
```

### 2. Initial Build
الخطوه دى بتمثر مرحله البناء العاديه والتقليديه جدا

```bash
./build_kernel.sh  # Downloads toolchain, kernel source, applies patches
```

## Configuration Methods
الخطوه دى مهمه علشان اخد نفس الـ config اللى already شغال على البورده وانقله على الـ host عندى وابنى كيرنال حديثه بنفس الـ defconfig
### Method 1: Copy from Running System

#### Extract Current Config

```bash
# On target system
zcat /proc/config.gz > current_config
# Copy to build host
```

#### Apply to BB-Kernel

```bash
# In bb-kernel directory
cd KERNEL
cp /path/to/current_config .config
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- olddefconfig
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- savedefconfig
cp defconfig ../patches/defconfig
```

### Method 2: Interactive Configuration

```bash
cd KERNEL
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- menuconfig
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- savedefconfig
cp defconfig ../patches/defconfig
```

### Method 3: Direct defconfig Edit

```bash
# Edit patches/defconfig directly
vim patches/defconfig
```

## Common Configuration Fixes

### Disable GCC Plugins (Common Issue)

```bash
# Clean conflicting entries
sed -i '/CONFIG_GCC_PLUGIN/d' patches/defconfig
sed -i '/CONFIG_STACKPROTECTOR_PER_TASK/d' patches/defconfig

# Add disabled versions
echo "# CONFIG_GCC_PLUGINS is not set" >> patches/defconfig
echo "# CONFIG_GCC_PLUGIN_ARM_SSP_PER_TASK is not set" >> patches/defconfig
echo "# CONFIG_STACKPROTECTOR_PER_TASK is not set" >> patches/defconfig
```

### Update Config for New Kernel Version

```bash
cd KERNEL
cp /path/to/old_config .config
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- olddefconfig  # Updates config
# OR
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- oldconfig     # Interactive updates
```

## Build Commands

### Full Build

```bash
./build_kernel.sh           # Initial build with patches
```

### Rebuild After Changes

```bash
./tools/rebuild.sh          # Quick rebuild after config changes
```

### Build Debian Package

```bash
./build_deb.sh             # Creates .deb packages
```

### Clean Build

```bash
rm -rf KERNEL              # Remove kernel source
./build_kernel.sh          # Fresh build
```

## File Structure

```
bb-kernel/
├── build_kernel.sh        # Main build script
├── build_deb.sh          # Debian package builder
├── tools/rebuild.sh      # Quick rebuild script
├── patches/
│   ├── defconfig         # Main kernel configuration
│   └── [various patches] # Kernel patches
├── KERNEL/               # Kernel source (created during build)
└── deploy/               # Build outputs
```

## Configuration Verification

### Check Current Config

```bash
# In KERNEL directory
grep "CONFIG_OPTION" .config

# Check defconfig
grep "CONFIG_OPTION" ../patches/defconfig
```

### Compare Configs

```bash
cd KERNEL
diff .config.old .config                    # See changes
scripts/diffconfig .config.old .config      # Kernel-specific diff tool
```

### Verify Applied Config

```bash
# After build, check final config
zcat /boot/config-$(uname -r) | grep CONFIG_OPTION
```

## Troubleshooting

### GCC Plugin Errors

```bash
# Error: undefined symbol in arm_ssp_per_task_plugin.so
# Solution: Disable GCC plugins (see above section)
```

### Config Not Applied

```bash
# Ensure defconfig is saved correctly
cd KERNEL
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- savedefconfig
cp defconfig ../patches/defconfig

# Clean rebuild
cd ..
rm -rf KERNEL
./build_kernel.sh
```

### Toolchain Issues

```bash
# Remove and redownload toolchain
rm -rf dl/gcc-*
./build_kernel.sh
```

## Quick Reference Commands

```bash
# Navigation
cd KERNEL                                    # Enter kernel source
cd ..                                        # Back to bb-kernel root

# Configuration
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- menuconfig    # Interactive config
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- olddefconfig  # Update config
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- savedefconfig # Save minimal config

# Building
./build_kernel.sh                           # Full build
./tools/rebuild.sh                          # Quick rebuild
./build_deb.sh                             # Build packages

# Cleaning
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- clean        # Clean build artifacts
rm -rf KERNEL                               # Remove kernel source
```

## Configuration Examples

### Enable Module

```bash
# In patches/defconfig, change:
# CONFIG_MODULE_NAME is not set
# to:
CONFIG_MODULE_NAME=m
```

### Enable Built-in

```bash
CONFIG_MODULE_NAME=y
```

### Disable Feature

```bash
# CONFIG_FEATURE_NAME is not set
```

## Cross-Compilation Variables

```bash
ARCH=arm                                    # Target architecture
CROSS_COMPILE=arm-linux-gnueabi-           # Toolchain prefix
LOCALVERSION=-bone79                       # Version suffix
```

## Build Output Locations

```bash
deploy/                                     # Main output directory
├── *.zImage                               # Kernel image
├── *.dtb                                  # Device tree blobs  
├── *-modules.tar.gz                       # Kernel modules
├── *-firmware.tar.gz                     # Firmware files
└── config-*                              # Final kernel config
```

## Tips

- Always run `savedefconfig` after config changes to minimize defconfig size
- Use `olddefconfig` when upgrading kernel versions
- Test configuration changes incrementally
- Keep backup of working defconfig files
- Use `diffconfig` to see what actually changed between configs

# الخطوه الجايه apt update
غيرت الكيرنال ونقلت كل الداتا بتاعتى دلوقتى على الـ target, الخطوه الجايه apt update

