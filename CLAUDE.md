# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal macOS setup repository containing Homebrew dependencies and system preferences configuration.

## Key Files

- **Brewfile** — Homebrew Bundle manifest (CLI tools, casks, fonts, taps)
- **setup.sh** — macOS `defaults write` commands for system preferences (keyboard repeat rate, dock auto-hide)
- **README.md** — Links to external configs (Hammerspoon gist, Coq installation)

## Commands

```bash
# Install all Homebrew dependencies
brew bundle

# Apply macOS system preferences
bash setup.sh
```

## Notes

- The Brewfile includes third-party taps (`homebrew-zathura/zathura`, `arimxyer/tap`, `gromgit/brewtils`, `sourcegraph/src-cli`)
- Some entries are commented out (emacs-builds, slither-analyzer) — these are intentionally disabled
- `google-chrome` appears twice in the Brewfile (duplicate cask entry)
