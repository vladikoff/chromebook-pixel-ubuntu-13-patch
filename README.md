# chromebook-pixel-ubuntu-13-patch

a series of patches and fixes to get touchpad, touchscreen and sound working in ubuntu 13.04 on the Chromebook Pixel.

## Driver Instructions

### Touchpad and Touchscreen
dpkg the deb files provided

```
sudo dpkg -i *.deb
sudo update-initramfs -u
sudo reboot
```

### Sound Fix

```
sudo chmod +x install_firmware_from_alsa_project.sh
sudo ./install_firmware_from_alsa_project.sh
sudo reboot
```

### Unity with a high DPI display
Unity does not support high DPI displays well. The following tweaks will help.
- Install unity-tweak
    sudo apt-get install unity-tweak-tool
- In Fonts, change Text Scaling Factor. I like 1.5
- In Cursor, select use large cursor for a normal size cursor (will not take effect until reboot)
- In Launcher, increase the Icon Size. I like 64. It's not possible to go higher.
- Most web browsers support a default zoom. In Google Chrome go into settings and search for zoom. 
- Window borders can be made larger by editing 
/usr/share/themes/Ambiance/metacity-1/metacity-theme-1.xml
and setting 

```
<distance name="left_width" value="1"/>
<distance name="right_width" value="1"/>
<distance name="bottom_height" value="1"/>
```

Change the 1 to a higher value like 2 or 3.


## Useful links

old instructions here: http://vger.kernel.org/~davem/chromebook_pixel_linux.txt still sometimes useful

good instructions here: http://www.reddit.com/r/chromeos/comments/1eqsjp/tutorial_how_to_install_any_linux_distro_on_the/

Google drive stash of useful files: https://docs.google.com/folder/d/0B-HqdeY6UX2FREEtR0t6dnFoSEE/edit

## Other

tested on Linux computer-Link 3.10.0-031000rc1-generic #201305130510 SMP Mon May 13 09:11:40 UTC 2013 x86_64 x86_64 x86_64 GNU/Linux
Ubuntu 13.04

## Installing from scratch 

### Quick pre-requisites:

```
A) You should (optionally) have a USB mouse you can plug into the
   Pixel for when you first boot into Linux as the touchpad and
   touchscreen won't work at the beginning.

   You can forego this bit and work from the VC console instead
   while performing the steps to get the touchpap/touchscreen
   operational but you'll need to get wireless up so you can
   install some packages over the network so keep that in mind.

B) You need to have a USB device (or Android phone, see below)
   to boot from, and a way to get a Debian ISO image onto it.

C) REALIZE that this will blow away Chrome OS from your drive.
   It's easy to restore the machine with Chroms OS again using
   one of the restore images found at:
      http://support.google.com/chromeos/bin/answer.py?hl=en&answer=1080595

With that out of the way, here is what you do:

1) Put your Pixel into developer mode, you should really do this
   as the first thing when you use the laptop for the first time.

   Hold down "ESC" and "Refresh" at the same time while powering
   on the machine.  BTW, those keys on the top row after ESC are
   just F1, F2, F3, etc.  The F3 one is the "Refresh" key I
   mentioned.

   Hit Ctrl-D then Enter.  It's going to take 5 minutes now
   as it's going to wipe the entire stateful (ie. user data)
   partition.

   From this point forward, every time you boot, it's going to say
   that Chrome OS can't be found or something similarly alarming like
   that, just ignore and hit Ctr-D or wait 30 seconds to boot into
   Chrome OS.  But that won't be relevant for long as we're going
   to wipe it off the machine below :-)

2) Boot into Chrome OS and configure it enough so that you can
   login.  Start a shell:

   a) Hit Ctrl-Alt-T, this brings up the chrosh window, from crosh
      you can do things like spawn a shell, use SSH, etc. type "help"
      if you're interested in more.
   b) Give it the "shell" command.
   c) Get root, "sudo bash"

3) Configure it so that we can boot into Linux images via SeaBIOS
   and boot from USB devices.

   crossystem dev_boot_usb=1 dev_boot_legacy=1

   and then power off the machine.
...
6) Plug the USB image in, and power on the Pixel.  When the boot
   screen appears hit Ctrl-L, SeaBIOS will come up and say "Hit ESC to
   choose boot device" so hit ESC and choose the USB device you
   plugged in.
   
```
