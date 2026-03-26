# Lucas Caton's dotfiles

A selection of my dot-files that work on both **macOS** and **Linux**.

You may find some of them useful, but mostly they are here for me.

## Overview

This is designed to provide a reproducible, portable development environment that can be set up on
any new machine with a single command. It manages shell configuration, git settings, editor configs,
Homebrew packages, and custom CLI utilities.

## Editor settings

Settings and snippets for my editors of choice:

- [VS Code](https://github.com/lucascaton/dotfiles/tree/main/other_files/vscode)
- [Vim](https://github.com/lucascaton/vimfiles)

## Repo structure

| Directory      | Description                                                                                                                                                                |
| :------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `bin/`         | Custom CLI scripts added to `$PATH`                                                                                                                                        |
| `files/`       | Dotfiles symlinked to `~/.<name>`. Key files: `zshrc` (shell config with aliases), `gitconfig`, `p10k.zsh`, `tool-versions` ([asdf](https://asdf-vm.com/) version manager) |
| `other_files/` | macOS defaults script, Brewfile, iTerm2 themes, VS Code snippets, highlight theme                                                                                          |

## How to install

1. Install [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh)
1. Clone this repo: `git clone https://github.com/lucascaton/dotfiles.git ~/.dotfiles`
1. Run `~/.dotfiles/install.sh`

The installer will:

- Symlink each file in `files/` to `~/.<filename>` (backs up existing files as `~/.<filename>.bkp`)
- Install ZSH plugins
- Run macOS defaults configuration (interactive, with confirmation prompt)
- Install Homebrew packages from `other_files/Brewfile`

## Considerations

- The macOS defaults script (`other_files/macos`) is idempotent: it checks current values, shows a
  summary, and asks for confirmation before applying changes
- Additional personal (private) configs are sourced from `~/projects/.personal_configs/` if the
  directory exists

## License

[MIT](https://opensource.org/licenses/MIT) - Copyright (c) Lucas Caton
