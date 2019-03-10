#!/bin/bash
KERNEL_SRC=l4t-sources-31-1-0
apt-add-repository universe
apt-get update
apt-get install pkg-config -y
cd /usr/src
wget -O ${KERNEL_SRC}.tar.bz2 https://developer.nvidia.com/embedded/dlc/$KERNEL_SRC  

tar -xf ${KERNEL_SRC}.tar.bz2
tar -xvf public_sources/kernel_src.tbz2
# Space is tight; get rid of the compressed kernel source
rm -r public_sources
cd kernel/kernel-4.9
#add -tegra option for build
sudo sed -i '/^EXTRAVERSION/ c EXTRAVERSION = -tegra' Makefile
# Go get the default config file; this becomes the new system configuration
zcat /proc/config.gz > .config

