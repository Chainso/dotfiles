#!/bin/bash

mkdir ~/.nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

~/.nvm/nvm.sh install node
