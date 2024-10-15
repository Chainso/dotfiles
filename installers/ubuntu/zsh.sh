#!/bin/sh

sudo apt install -y zsh
sudo chsh -s $(which zsh) $(whoami)

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
