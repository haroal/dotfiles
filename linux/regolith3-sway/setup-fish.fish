#!/usr/bin/env fish

echo "Installing oh-my-fish..."
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
omf update

echo "Setting fish theme to \"pure\"..."
omf install pure
omf theme pure

echo "Updating PATH env variable..."
fish_add_path -p $HOME/.cargo/bin
fish_add_path -p $HOME/.local/bin

echo "Installing Python virtualenv..."
pip install virtualfish
vf install

echo "Installing nvm integration..."
omf install nvm
