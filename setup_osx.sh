#!/bin/bash
# OSX Tweaks

# Fix home and end keys
mkdir $HOME/Library/KeyBindings
cp $HOME/dotfiles/resources/DefaultKeyBindings.dict ~/Library/KeyBindings

# Show hidden files
defaults write com.apple.Finder AppleShowAllFiles ON

# Remove dock delay time
defaults write com.apple.Dock autohide-delay -float 0 && killall Dock

# Save screenshots into Pictures/Screenshots
mkdir ~/Pictures/Screenshots
defaults write com.apple.screencapture location ~/Pictures/Screenshots/
killall SystemUIServer
