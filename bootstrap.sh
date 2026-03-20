#!/bin/bash
set -euo pipefail

if ! command -v brew &>/dev/null; then
  echo "Homebrew not found. Installing..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "==> Installing Homebrew packages..."
brew bundle

echo "==> Applying macOS defaults..."
bash setup.sh "$@"

echo "==> Bootstrap complete!"
