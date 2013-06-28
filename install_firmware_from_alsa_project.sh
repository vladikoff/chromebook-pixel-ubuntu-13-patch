#!/bin/bash

# let's not make a mess in your FS
cd /tmp
wget ftp://ftp.alsa-project.org/pub/firmware/alsa-firmware-1.0.27.tar.bz2

# extract just the files we need
tar xfv alsa-firmware-1.0.27.tar.bz2 --strip=2 alsa-firmware-1.0.27/ca0132/ctefx.bin alsa-firmware-1.0.27/ca0132/ctspeq.bin

# install them
sudo cp ctefx.bin ctspeq.bin /lib/firmware
