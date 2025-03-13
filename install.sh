#!/bin/bash

os_quoted=$(awk -F= '/^NAME/{print $2}' /etc/os-release)
os=$(echo "$os_quoted" | xargs)
installers_base_dir="./installers"

if [ "$os" = "Ubuntu" ]; then
  installers_arch_dir="ubuntu"
elif [ "$os" = "Arch Linux" ]; then
  installers_arch_dir="arch"
else
  echo "Unsupported OS $os for automated install, please install manually"
  exit 1
fi

# Preinstall necessary packages
./preinstall.sh "$installers_arch_dir"

if [ $? -ne 0 ]; then
  echo "Preinstall failed, exiting..."
  exit 1
fi

# First add all of the dotfiles so existing config files can be found during installations
make dotfiles

# Source the new zshrc file
source ~/.zshrc

installers_dir="$installers_base_dir/$installers_arch_dir"

to_install=(
  "alacritty"
  "autorandr"
  "awesome"
  "fzf"
  "neofetch"
  "nvim"
  "picom"
  "ripgrep"
  "rofi"
  "zsh"
  "fd"

  # Not explicitly config related but used
  "zoxide"
  "thefuck"
)

for installer in "${to_install[@]}"; do
  if [ ! -f "$installers_dir/$installer.sh" ]; then
    echo "Installer for $installer not found, please install manually"
    continue
  fi

  echo "Installing $installer..."
  sh "$installers_dir/$installer.sh"
done

