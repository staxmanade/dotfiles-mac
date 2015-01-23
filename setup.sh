#!/bin/bash

# Install oh-my-zsh
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

# Add local zshrc
touch ~/.zshrc_local

# Add local bin if it doesn't exist
mkdir ~/bin 2> /dev/null

brew install caskroom/cask/brew-cask
brew cask install node
npm install -g gulp tog skypeit

# Setup dotfile
source ./setup_links.sh
source ./setup_vim.sh
