#!/bin/sh

if command -v "alacritty" >/dev/null; then
  continue
fi

sudo apt install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3

alacritty_install_dir="./alacritty_install"
mkdir -p $alacritty_install_dir

git clone https://github.com/alacritty/alacritty.git $alacritty_install_dir
cd $alacritty_install_dir
cargo build --release

infocmp alacritty

if [ $? -ne 0 ]; then
  sudo tic -xe alacritty,alacritty-direct extra/alacritty.info
fi

sudo cp target/release/alacritty /usr/local/bin # or anywhere else in $PATH
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg

cd -
rm -rf $alacritty_install_dir
