# Regolith Linux (v3)

Regolith is a Linux distribution based on Ubuntu which directly embeds sway (i3wm alternative in Wayland).

1. Install fresh Ubuntu 22.04 version
  1. Configure disk encryption
  2. Minimal installation
2. Install Joplin and sync notes via the Dropbox account
3. Install Regolith Linux 2 from https://regolith-desktop.com (with `lascaille` look)
   `sudo apt install regolith-desktop regolith-session-sway regolith-look-lascaille`
4. Run `install.sh` script (or do it manually)
5. Follow steps indicated at the end of the `install.sh` script
6. Reboot
7. Install IDE. If using Intellij, update the `.sh` script to add `XMODIFIERS=''` at the very beginning. Indeed, there is a bug with dead keys (US intl keyboard) => https://youtrack.jetbrains.com/issue/IDEA-59679/Cannot-type-dead-keys-in-Linux

