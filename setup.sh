#!/bin/bash
set -euo pipefail

DRY_RUN=false
if [[ "${1:-}" == "--dry-run" ]]; then
  DRY_RUN=true
  echo "==> Dry run mode — no changes will be applied."
fi

run() {
  if $DRY_RUN; then
    echo "[dry-run] $*"
  else
    "$@"
  fi
}

echo "This will apply macOS system defaults."
if ! $DRY_RUN; then
  read -rp "Continue? [y/N] " confirm
  if [[ "$confirm" != [yY] ]]; then
    echo "Aborted."
    exit 0
  fi
fi

echo "==> Keyboard"
# Disable press-and-hold for keys in favor of key repeat
run defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
# Set a fast keyboard repeat rate
run defaults write NSGlobalDomain KeyRepeat -int 1
run defaults write NSGlobalDomain InitialKeyRepeat -int 12

echo "==> Dock"
# Automatically hide and show the Dock
run defaults write com.apple.dock autohide -bool true

echo "==> Finder"
# Show hidden files
run defaults write com.apple.finder AppleShowAllFiles -bool true
# Show path bar
run defaults write com.apple.finder ShowPathbar -bool true
# Use list view by default
run defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
# Show all file extensions
run defaults write NSGlobalDomain AppleShowAllExtensions -bool true

echo "==> Screenshots"
# Save screenshots to ~/Screenshots
mkdir -p "$HOME/Screenshots"
run defaults write com.apple.screencapture location -string "$HOME/Screenshots"
# Save screenshots in PNG format
run defaults write com.apple.screencapture type -string "png"

echo "==> Trackpad"
# Enable tap to click
run defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
run defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

echo "==> TextEdit"
# Use plain text mode by default
run defaults write com.apple.TextEdit RichText -int 0

echo "==> Applying changes..."
if ! $DRY_RUN; then
  killall Finder Dock SystemUIServer 2>/dev/null || true
  echo "Done. Some changes may require a logout/restart."
else
  echo "[dry-run] Would restart Finder, Dock, SystemUIServer."
fi
