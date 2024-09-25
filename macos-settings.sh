# list of settings for macos

# always show path bar in finder
defaults write com.apple.finder ShowPathbar -bool true
# always show status bar in finder
defaults write com.apple.finder ShowStatusBar -bool true

# avoid creating .DS_Store files
# 1. on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
# 2.on usb volumes
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# screenshots
defaults write com.apple.screencapture location ~/Pictures/ScreenShots && \
killall SystemUIServer

defaults write com.apple.screencapture type -string "png"
