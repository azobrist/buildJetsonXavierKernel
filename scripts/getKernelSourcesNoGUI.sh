#!/bin/bash
apt-add-repository universe
apt-get update
apt-get install pkg-config -y
cd /usr/src
wget -N https://developer.nvidia.com/embedded/dlc/l4t-sources-31-0-1  


sudo tar -xvf public_sources.tbz2 public_release/kernel_src.tbz2
tar -xvf public_release/kernel_src.tbz2
# Space is tight; get rid of the compressed kernel source
rm -r public_release
cd kernel/kernel-4.9
# Go get the default config file; this becomes the new system configuration
zcat /proc/config.gz > .config

