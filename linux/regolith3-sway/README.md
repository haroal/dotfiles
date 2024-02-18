# Regolith Linux (v3)

Regolith is a Linux distribution based on Ubuntu which directly embeds sway (i3wm alternative in Wayland).

1. Install fresh Ubuntu 22.04 version
    1. Configure disk encryption
    2. Minimal installation
2. Install Joplin and sync notes via the Dropbox account
3. Install Regolith Linux 2 from [official website](https://regolith-desktop.com) (with `lascaille` look)
   `sudo apt install regolith-desktop regolith-session-sway regolith-look-lascaille`
4. Run `install.sh` script (or do it manually)
5. Follow steps indicated at the end of the `install.sh` script
6. Reboot

## IDE

### PyCharm

1. Download from official website and follow instructions to install it.
2. Update the `.sh` script to add `XMODIFIERS=''` at the very beginning.
  Indeed, there is a bug with dead keys (US intl keyboard)
  [see this discussion](https://youtrack.jetbrains.com/issue/IDEA-59679/Cannot-type-dead-keys-in-Linux) 

### Neovim (based on LazyVim)

1. Install `neovim` from sources (on GitHub)
2. Install `tmux` from sources (on GitHub)
3. Install `lazygit` from sources (on GitHub)
4. Install `lazydocker` from sources (on GitHub)
5. Install `difft` by downloading the binary from GitHub official repository
6. Copy `.config/nvim` folder from this repository
7. Install GitHub CLI (for octo.nvim plugin)
