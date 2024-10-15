#!/bin/sh

sudo apt install -y zsh
sudo chsh -s $(which zsh) $(whoami)
