# macOS Setup

Personal macOS setup: Homebrew packages, system defaults, and bootstrap scripts.

## Quick Start

```bash
# Full setup (install packages + apply defaults)
just bootstrap

# Or run steps individually
just install     # Install Homebrew packages
just defaults    # Apply macOS system defaults
just update      # Update & upgrade Homebrew packages
```

### Dry Run

Preview system defaults changes without applying them:

```bash
just defaults --dry-run
```

## Gists

- [Hammerspoon config](https://gist.github.com/vyorkin/7fe8cc1a70c18a2a084d18dd41ae4d66)

## External Apps

- [Coq](https://github.com/rocq-prover/platform/blob/main/doc/README_macOS.md#installation-using-the-macos-dmg-package)

## Dotfiles

Dotfile configs (zsh, neovim, git, etc.) are managed separately — pull them into `$HOME` as needed.
