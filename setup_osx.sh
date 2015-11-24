#!/bin/bash
# OSX Tweaks

brew cask install skype
brew cask install slack
brew cask install alfred
brew cask install iterm2
brew cask install hub
brew cask install dropbox
brew cask install google-chrome
brew cask install mou
brew cask install spectacle
brew cask install gimp

# Fix home and end keys
mkdir $HOME/Library/KeyBindings
cp $HOME/dotfiles/resources/DefaultKeyBinding.dict ~/Library/KeyBindings

# Show hidden files
defaults write com.apple.Finder AppleShowAllFiles ON

# Remove dock delay time
defaults write com.apple.Dock autohide-delay -float 0 && killall Dock

defaults write -g AppleKeyboardUIMode 3
defaults write -g com.apple.keyboard.fnState -boolean YES
defaults write -g NSNavPanelExpandedStateForSaveMode -boolean YES

defaults write -g com.apple.mouse.scaling -float 2.1

# Prevent launchpad from reappearing
defaults write com.apple.dock checked-for-launchpad true

# Remove all the pinned icons
defaults write com.apple.dock persistent-apps '()'


# Show Hidden Files
defaults write com.apple.finder AppleShowAllFiles true
# Enable Quick Look text selection
defaults write com.apple.finder QLEnableTextSelection true
killall Finder

# Use mouse wheel (scroll gesture) to zoom':
defaults write com.apple.universalaccess closeViewScrollWheelToggle true

# 'Disable the downloaded app quarantine':
defaults write com.apple.LaunchServices LSQuarantine false

# Do not create .DS_Store on network shares':
defaults write com.apple.desktopservices DSDontWriteNetworkStores true

defaults write ~/Library/Preferences/.GlobalPreferences.plist com.apple.swipescrolldirection -boolean NO




# finder: show file extensions
defaults write com.apple.finder AppleShowAllExtensions -boolean true

# osx: disable dashboard
defaults write com.apple.dashboard mcx-disabled -boolean true

# Setup pictures":
mkdir -p ~/Pictures/Screenshots && defaults write com.apple.screencapture location ~/Pictures/Screenshots/ && killall SystemUIServer

  
# Mail: adjust polling time
defaults write com.apple.mail PollTime 1

# Skype: DisableAllVisualNotifications
defaults write com.skype.skype DisableAllVisualNotifications -boolean true

# Safari: enable dev mode
defaults write com.apple.Safari IncludeDevelopMenu -boolean true

# XCode: turn on line numbers
defaults write com.apple.dt.Xcode DVTTextShowLineNumbers YES

# XCode: set to the midnight theme
defaults write com.apple.dt.Xcode DVTFontAndColorCurrentTheme 'Midnight.dvtcolortheme'

# XCode: double-click opens in new tab":
defaults write com.apple.dt.Xcode IDEEditorCoordinatorTarget_DoubleClick 'SeparateTab'


# XCode: do not ask to stop running sim 1":
defaults write com.apple.dt.Xcode IDEEditorCoordinatorTarget_DoubleClick 1

# XCode: do not ask to stop running sim 2
defaults write com.apple.dt.Xcode IDESuppressStopExecutionWarningTarget 'IDESuppressStopExecutionWarningTargetValue_Stop'

# Mou: enable spellcheck while typing
defaults write com.mouapp.Mou spellCheckerKeyString 1

