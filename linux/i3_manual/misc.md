# Miscellaneous

## Set resolution

- Get the current display settings: `xrandr`
 - Write a `~/.xprofile` file containing:

`xrandr  --output <nam of the screen> --mode <resolution> --rate <rate>`

## Git

`sudo apt install git`

Set the git configuration by copying the `.gitconfig` file in the home directory.

## Fish (with Oh-my-fish)

#### Install fish

```bash
$ sudo apt install fish

# To switch to fish shell
$ fish

# To set fish as the default shell
$ chsh -s /usr/bin/fish
```

#### Install oh-my-fish

```bash
# Download the files and install oh-my-fish
$ curl -L https://get.oh-my.fish | fish

# Download and install the theme
$ omf install pure
$ omf theme pure
```

#### Configuration

 - Modify the fish config file in `~/.config/fish/config.fish`
 - Copy the functions files in `~/.config/fish/functions`

**Important**: Intellij softwares (IDEA, CLion, ...) have their own fish config file in
`<software folder>/plugins/terminal/fish`. You need to add `omf.fish` loading inside:
```bash
[...]
if test -f ~/.config/fish/conf.d/omf.fish
  . ~/.config/fish/conf.d/omf.fish
end
[...]
```

## Python (2.7 + 3.x + pip)

```bash
$ sudo apt install python python-pip python3-pip

# Add virtual environment bindings with fish
$ pip install virtualfish
$ pip3 install virtualfish
```

## Wireshark

`sudo apt install wireshark`

**Important**: Log in and log out to enable the new "wireshark" group for current user, to run wireshark without sudo.

## Other

- shutter (screenshot)
- qalculate! (calculator)
