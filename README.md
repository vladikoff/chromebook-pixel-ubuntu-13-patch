# chromebook-pixel-ubuntu-13-patch

a series of patches and fixes to get touchpad, touchscreen and sound working in ubuntu 13.04 on the Chromebook Pixel.

## Instructions

### Touchpad and Touchscreen
dpkg the deb files provided

sudo dpkg -i *.deb
sudo update-initramfs -u
sudo reboot

### Sound Fix

sudo chmod +x install_firmware_from_alsa_project.sh
sudo ./install_firmware_from_alsa_project.sh
sudo reboot

## Useful links

old instructions here: http://vger.kernel.org/~davem/chromebook_pixel_linux.txt still sometimes useful

good instructions here: http://www.reddit.com/r/chromeos/comments/1eqsjp/tutorial_how_to_install_any_linux_distro_on_the/

Google drive stash of useful files: https://docs.google.com/folder/d/0B-HqdeY6UX2FREEtR0t6dnFoSEE/edit

## Other

tested on Linux computer-Link 3.10.0-031000rc1-generic #201305130510 SMP Mon May 13 09:11:40 UTC 2013 x86_64 x86_64 x86_64 GNU/Linux
Ubuntu 13.04

