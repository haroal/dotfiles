#!/usr/bin/env bash

# Move to current script directory to ensure relative paths are correct
cd "$(dirname "$0")"

echo "Adding Docker APT repositories..."
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
	"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" |
	sudo tee /etc/apt/sources.list.d/docker.list >/dev/null

echo "Adding fish APT repositories..."
sudo apt-add-repository ppa:fish-shell/release-3

echo "Updating APT..."
sudo apt update

echo "Removing useless packages..."
sudo apt remove regolith-wm-networkmanager regolith-wm-next-workspace xdg-desktop-portal-gnome nano

echo "Installing utils..."
sudo apt install \
	curl \
	clang \
	copyq \
	fd-find \
	fish \
	flameshot \
	gcc \
	git \
	htop \
	net-tools \
	python3 \
	python3-pip \
	python3-venv \
	ranger \
	ripgrep \
	slurp \
	tmux \
	vlc

echo "Creating directories..."
mkdir -vp ~/.local/bin
mkdir -vp ~/.config/alacritty
mkdir -vp ~/.config/regolith3/sway
mkdir -vp ~/.config/regolith3/i3status-rust

echo "Copying files..."
cp -rv ./Pictures/* ~/Pictures/
cp -rv ./Documents/* ~/Documents/
cp -rv ./.local/bin/* ~/local/bin/
cp -rv ./.config/alacritty/* ~/.config/alacritty/
cp -rv ./.config/regolith3/sway/* ~/.config/regolith3/sway/
cp -v ./.config/regolith3/Xresources ~/.config/regolith3/Xresources
cp -v ./etc/environment.d/* /etc/environment.d/

echo "Setting permissions on executable files..."
chmod -v +x ~/Documents/Scripts/*.sh
chmod -v +x ~/.local/bin/*

echo "Configure ilia width and height..."
gsettings set org.regolith-linux.ilia window-width 1000
gsettings set org.regolith-linux.ilia window-height 800

echo "Making fish the default shell..."
sudo chsh -s $(which fish)

echo "Installing rust..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
export PATH=$HOME/.cargo/bin:$PATH
rustup override set stable
rustup update stable

echo "Installing alacritty..."
mkdir -vp ~/Documents/Softwares
cd ~/Documents/Softwares
git clone https://github.com/alacritty/alacritty.git
cd alacritty
sudo apt install apt install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev scdoc gzip
cargo build --release
sudo tic -xe alacritty,alacritty-direct extra/alacritty.info
sudo cp target/release/alacritty /usr/local/bin # or anywhere else in $PATH
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database
sudo mkdir -p /usr/local/share/man/man1
sudo mkdir -p /usr/local/share/man/man5
scdoc <extra/man/alacritty.1.scd | gzip -c | sudo tee /usr/local/share/man/man1/alacritty.1.gz >/dev/null
scdoc <extra/man/alacritty-msg.1.scd | gzip -c | sudo tee /usr/local/share/man/man1/alacritty-msg.1.gz >/dev/null
scdoc <extra/man/alacritty.5.scd | gzip -c | sudo tee /usr/local/share/man/man5/alacritty.5.gz >/dev/null
scdoc <extra/man/alacritty-bindings.5.scd | gzip -c | sudo tee /usr/local/share/man/man5/alacritty-bindings.5.gz >/dev/null
mkdir -vp ~/.config/fish/completions
cp extra/completions/alacritty.fish ~/.config/fish/completions/alacritty.fish

echo "Making alacritty the default terminal..."
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/local/bin/alacritty 2
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/bin/gnome-terminal.wrapper 1

echo "Installing Docker and docker-compose..."
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo groupadd docker
sudo usermod -aG docker $USER

export PATH=$HOME/.local/bin:$PATH

echo "Installing nvm..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

echo "------------------------- DONE -------------------------"
echo "Remaining things to do:"
echo " - setup SSH keys / GPG keys"
echo " - configure git"
echo " - configure copyq to limit history to 20 entries"
echo " - run setup-fish.sh"
