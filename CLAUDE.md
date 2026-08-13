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

- The Brewfile includes third-party taps (`homebrew-zathura/zathura`, `arimxyer/tap`, `armgabrielyan/tap`, `gromgit/brewtils`, `sourcegraph/src-cli`), all marked `trusted: true` so `brew bundle install` doesn't stall on Homebrew's tap-trust gate
- Some entries are commented out (emacs-builds, slither-analyzer) — these are intentionally disabled
- The Brewfile is kept in sync with `brew bundle dump` (formulae/casks/mas only — VS Code extensions and go/cargo/npm packages are intentionally excluded, as this repo doesn't track those)
