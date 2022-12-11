# Regolith Linux (v2.2)

Regolith is a Linux distribution based on Ubuntu which directly embeds i3


- Download Regolith Linux 2.2 from https://regolith-desktop.com/
- Install OS from iso file
- Then, pick regolith-look named "lascaille"
- Install compositor: `sudo apt install regolith-compositor-picom-glx`
- Remove useless items in bar:

```bash
sudo apt remove i3xrocks-app-launcher i3xrocks-battery i3xrocks-info i3xrocks-next-workspace
```

- Copy `.config/regolith2/Xresources` file available in this repo
- Copy `.config/alacritty/alacritty.yml` file available in this repo

### Packages

- Ping: `iputils-ping`
- Terminal alacritty: https://github.com/alacritty/alacritty
- git
- curl
- fish with oh-my-fish and `pure` theme
- Google Chrome
- Flameshot
- ulauncher
  - Better file browser
  - Clipboard (with CopyQ)
  - Calculate Anything
  - Google Chrome Bookmarks
- Python venv with fish extension (`pip install virtualfish`)


### Misc

- Disable auto-suspend when running in VMWare as it crashes...

