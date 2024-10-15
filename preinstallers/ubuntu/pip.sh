#!/bin/sh

# ensure pip is installed
if ! command -v "pip3" >/dev/null; then
    sudo apt update
    sudo apt install -y python3-pip
fi

