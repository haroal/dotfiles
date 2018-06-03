# Install Ubuntu 18.04
*from Ubuntu>14.04, written in June, 2018*

## Before

 - Download the image on the [Ubuntu download page](https://www.ubuntu.com/download/desktop).
 - Burn the image on a USB key (**min 2Gb**, which will be formatted). You can use the *Startup
 Disk Creator*.
 - Reboot on the USB key. On DELL, press F12 on boot and select "USB Device Storage".
 
## OS installation

Click on:

  1. Install Ubuntu
  2. Continue
  3. Connect to this network (select your Wifi) \
     Continue
  4. Check Minimal installation\
     Check "Download updates while installing Ubuntu" \
     Check "Install third-party software"
  5. Erase disk and install Ubuntu
     Install now
  6. Continue
  7. Enter name, computer's name and password.
  8. Wait for the installation to be done and the computer to reboot.
  
##### On DELL

On reboot, press F12 to boot on hardrive.

If you have a "Dell" landing page, with a "No bootable device has been found" message, go to the
BIOS setup and be sure that **Legacy boot** is checked and that the hard drive is the first device
launched.

## After installation

#### Install drivers (solving the "purple login screen bug")

Used to install the Nvidia drivers to solve graphical bugs.

In a terminal:

```bash
$ ubuntu-drivers devices
$ sudo ubuntu-drivers autoinstall
```

#### If crashes after suspend

It seems like upgrading the linux kernel to v4.16.12 or superior, solved the problem for me...
I recommend to use **ukuu** to install the new kernel and remove the old one after checking everything
is okay.

```bash
$ sudo add-apt-repository ppa:teejee2008/ppa

$ sudo apt update && sudo apt install ukuu

# To have a list of currently installed kernels
$ sudo ukuu --list

# To install the new kernel
$ sudo ukuu-install v4.16.23

# To remove the old one
$ sudo ukuu --remove <old kernel version as written in the list>
```

#### Add a user (using GNOME GUI)

 - Run "Settings"
 - Go to "Details" / "Users"
 - Click on "Unlock" on the top right corner and type you password
 - Click on "Add user"
 