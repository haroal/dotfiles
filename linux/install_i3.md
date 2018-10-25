# Install I3 window manager
*on Ubuntu 18.04, written in June, 2018*

My configuration is highly inspired from the [Grafikart dotfiles](https://github.com/Grafikart/dotfiles).

## I3

- Follow the [installation instruction](https://i3wm.org/docs/repositories.html) to install the latest i3 stable version.

## I3-gapps

To have gaps between windows and some other enhancements, install **i3-gapps** from the sources,
following the [instruction on the Github wiki](https://github.com/Airblader/i3/wiki/Compiling-&-Installing).

You'll need to have these dependencies installed:
```
sudo apt install libev libev-dev libsnl-dev pkg-config libstartup-notification0-dev libstartup-notification0 libxcb1-dev libxcb-xkb-dev libxcb-randr0-dev libxcb-xinerama0-dev libxcb-util-dev libxcb-cursor-dev libxcb-keysyms1-dev libxcb-icccm4-dev libxcb-xrm-dev libxkbcommon-dev libxkbcommon-x11-dev libyajl-dev libpcre2-dev libxml2-dev libcairo2-dev libreadline-dev libglib2.0-dev libgsl-dev libgtk-3-dev
```

## Softwares to install

 - **urxvt**: terminal (`sudo apt install rxvt-unicode`)
 - **rofi**: dmenu replacement to quickly run software (`sudo apt install rofi`)
 - **polybar**: status bar (`sudo apt install polybar` from getdeb or from [sources](https://github.com/jaagr/polybar) if not available)
 - **compton**: to manage transparency (`sudo apt install compton`)
 - **feh**: to display a wallpaper (`sudo apt install feh`)
 - **light**: to manage the screen brightness (`sudo apt install light`)
 - **mons**: to easily manage the multi-screen (clone the [Github repo](https://github.com/Ventto/mons) and install it
 following the instructions)
 - **dunst**: to have better notifications (`sudo apt install dunst`)
 - **blueman**: a Bluetooth manager (`sudo apt install blueman`)
 - **wicd**: a network manager (WiFi)(`sudo apt install wicd`)
 - **ranger**: a terminal file browser (`sudo apt install ranger`)

## Configurations

Config files are in the config folder.

 - Modify the i3 config in `~/.config/i3/config`
 - Modify the rofi config in `~/.config/rofi/config`
 - Modify the compton config in `~/.config/compton.conf`
 - Modify the polybar config in `~/.config/polybar/config`
 - Modify the dunst config in `~/.config/dunst/dunstrc`
 - Confgure the colors theme in `~/.Xresources`
 - Copy ranger config files in `~/.config/ranger/`
 - Copy `~/.Xdefaults` to enable urxvt extensions (ie. matcher to make links clickable)
 
