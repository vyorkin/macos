# Install Homebrew packages from Brewfile
install:
    brew bundle

# Apply macOS system defaults
defaults *args='':
    bash setup.sh {{args}}

# Update Homebrew and upgrade all packages
update:
    brew update && brew upgrade && brew cleanup

# Full bootstrap: install packages and apply defaults
bootstrap *args='':
    bash bootstrap.sh {{args}}
