# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a personal dotfiles repository using Dotbot for automated installation and management. It manages configuration files for bash, NeoVim (LazyVim), git, SSH, alacritty, lazygit, and other development tools.

## Installation

```bash
./install
```

The `install` script:
1. Updates the dotbot git submodule
2. Executes dotbot with `install.conf.yaml` configuration
3. Creates symlinks from home directory to config files
4. Installs system packages via apt
5. Installs development tools (Rust, UV, NeoVim, LazyGit, Docker, etc.)
6. Sets up password-store, SSH keys, and GPG configuration

## Architecture

### Dotbot Configuration (`install.conf.yaml`)

The main configuration file defines:
- **Link targets**: Symlinks configuration files from `config/` to `~/.config/` or `~/`
- **Shell commands**: Sequential installation steps for packages and tools
- **Clean**: Removes broken symlinks from home directory

Key installation steps:
1. System packages (git, ripgrep, fd-find, curl, etc.)
2. Dev packages (clang, cmake, golang, nodejs, python3-dev, etc.)
3. Rust toolchain via rustup
4. UV for Python package management
5. NeoVim (latest AppImage in `~/.local/bin/nvim.appimage`)
6. LazyGit (installed to `~/.local/bin/`)
7. FZF (cloned to `~/dev/src/github/fzf`)
8. Docker (via official Docker APT repository)
9. Password-store with browserpass integration
10. GPG key setup for encryption/signing
11. SSH key extraction from password-store

### Bash Configuration (`config/bash/`)

Bash configuration uses a modular loading system:
- `bashrc` loads all numbered files from `~/.config/bash/`
- Files are loaded in numerical order (10.* → 11.* → 20.* → etc.)

Key files:
- `10.exports`: Environment variables and PATH configuration
- `11.aliases`: Command aliases
- `11.prompt`: Powerline-shell prompt configuration
- `20.functions`: Custom shell functions (URL encoding, timestamp conversion, network utilities)
- `30.*`: Completion and direnv setup
- `50.*`: Tool-specific integrations (fzf, git, go, rust, nvm, ruby, virtualenv)
- `60.android`: Android development environment
- `90.*`: Project-specific configurations (navitia, prophesee)
- `99.bind`: Key bindings

Important PATH configuration:
- `~/.local/bin` is first in PATH (for nvim.appimage, lazygit, etc.)
- Rust installation is prioritized early in PATH
- Custom tools in `~/node_modules/.bin`

### NeoVim Configuration (`config/nvim/`)

Uses LazyVim as the base configuration:
- Entry point: `init.lua` → `require("config.lazy")`
- Plugin management via lazy.nvim
- Custom configuration in `lua/config/`
- Plugin overrides in `lua/plugins/`
- Lock file: `lazy-lock.json`

To update NeoVim:
```bash
curl -L https://github.com/neovim/neovim/releases/latest/download/nvim.appimage -o ~/.local/bin/nvim.appimage
chmod u+x ~/.local/bin/nvim.appimage
```

### Git Configuration (`config/git/`)

- `gitconfig`: Main git configuration
- `gitignore`: Global gitignore patterns

### SSH Configuration (`config/ssh/`)

- `config`: SSH client configuration
- SSH keys are extracted from password-store during installation
- Keys stored in `~/.ssh/nonifier/` and `~/.ssh/prophesee/`

### Password Store Integration

The repository integrates with `pass` (password-store):
- Repository cloned from private GitHub during installation
- GPG key imported from `~/.gnupg/woam@nonifier.com.priv`
- SSH keys extracted via `pass ssh/id_rsa.priv`, etc.
- Helper scripts in `config/ssh-add-pass/` for SSH agent integration

## Common Tasks

### Re-run full installation
```bash
./install
```

### Update a specific configuration
After editing files in `config/`, symlinks are automatically updated (they point to the repo).

### Add new bash configuration
Create a file in `config/bash/` with appropriate numeric prefix (e.g., `50.newtool.sh`). It will be auto-loaded by bashrc.

### Update NeoVim plugins
```bash
nvim
# Then run :Lazy sync
```

### Update LazyGit
Delete `~/.local/bin/lazygit` and re-run the installation step from `install.conf.yaml`.

## Security Considerations

- GPG keys must be manually placed in `~/.gnupg/woam@nonifier.com.priv`
- Password-store repository requires authentication to clone
- SSH keys are extracted from password-store (not stored in this repo)
- Repository does NOT contain secrets directly
