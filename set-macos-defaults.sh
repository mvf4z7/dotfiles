#!/bin/sh

# NOTE: You will need to go to system settings and give
# iTerm full disk access for these settings to work.
#   1. Open settings
#   2. Search for "Full Disk Access"
#   3. Grant access to iTerm

# Ask for permissions
sudo -v

# Disable press-and-hold for keys in favor of key repeat
defaults write -g ApplePressAndHoldEnabled -bool false

# Open Finders in list view
defaults write com.apple.Finder FXPreferredViewStyle -string "Nlsv"

# Show the ~/Library folder
if xattr ~/Library | grep -q 'com.apple.FinderInfo'; then
  xattr -d com.apple.FinderInfo ~/Library
fi
chflags nohidden ~/Library


# Set fast key repeat with short initial delay
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

######### Safari #########
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
defaults write com.apple.Safari.SandboxBroker ShowDevelopMenu -bool true

# Privacy: don’t send search queries to Apple
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true

######### Dock #########
defaults write com.apple.dock orientation -string left; 
defaults write com.apple.dock autohide -bool true; 
killall Dock

######### iterm #########
defaults write com.googlecode.iterm2 PromptOnQuit -bool false
defaults write com.googlecode.iterm2 ClickToSelectCommand -bool false

# Don't store GPG pin in keychain
defaults write org.gpgtools.common UseKeychain -bool false

######### Activity Monitor #########

# Show the main window when launching Activity Monitor
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true
# Visualize CPU usage in the Activity Monitor Dock icon
defaults write com.apple.ActivityMonitor IconType -int 5
# Show all processes in Activity Monitor
defaults write com.apple.ActivityMonitor ShowCategory -int 0
# Set sort direction to descending
defaults write com.apple.ActivityMonitor SortDirection -int 0
# Show Data in the Disk graph (instead of IO)
defaults write com.apple.ActivityMonitor DiskGraphType -int 1
# Show Data in the Network graph (instead of packets)
defaults write com.apple.ActivityMonitor NetworkGraphType -int 1

