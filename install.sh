#!/bin/bash

set -euo pipefail

ORIGINAL_COLOR="\033[1;0m"
GREEN="\033[0;32m"
GRAY="\033[2m"
RED="\033[31m"

title() {
  echo -e "\n${GREEN}${1}...${ORIGINAL_COLOR}\n"
}

# ------------------------------------------------------------------------------

title "Creating backup & creating symlinks to new dotfiles"

cd ~/.dotfiles/files
for file in *; do
  [ "$file" = "~" ] && continue
  echo -ne "~/.$file ${GRAY}"

  if [ -s ~/.$file ]; then
    if ! diff -q ~/.$file ~/.dotfiles/files/$file &>/dev/null; then
      mv ~/.$file ~/.$file.bkp
      ln -s ~/.dotfiles/files/$file ~/.$file
      echo -ne "has been moved to ~/.$file.bkp and a new symlink has been created ${GREEN}✓${ORIGINAL_COLOR}\n"
    else
      echo -ne "is identical ${RED}✕${ORIGINAL_COLOR}"
    fi
  else # File doesn't exist, let's create it:
    ln -s ~/.dotfiles/files/$file ~/.$file
    echo -ne "symlink has been created ${GREEN}✓${ORIGINAL_COLOR}"
  fi

  echo -e "${ORIGINAL_COLOR}"
done

# ------------------------------------------------------------------------------

title "Installing ZSH plugins"

ZSH_PLUGINS=(
  "https://github.com/zsh-users/zsh-syntax-highlighting.git plugins/zsh-syntax-highlighting"
  "https://github.com/zsh-users/zsh-autosuggestions.git plugins/zsh-autosuggestions"
  "https://github.com/romkatv/powerlevel10k.git themes/powerlevel10k"
)

for plugin in "${ZSH_PLUGINS[@]}"; do
  repo="${plugin% *}"
  dest="${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/${plugin#* }"
  [ -d "$dest" ] || git clone "$repo" "$dest"
done

# ------------------------------------------------------------------------------

title "Setting up macOS configs"

if [[ "$OSTYPE" == "darwin"* ]]; then ~/.dotfiles/other_files/macOS; fi

# ------------------------------------------------------------------------------

title "Installing Homebrew packages and applications"

if [[ "$OSTYPE" == "darwin"* ]]; then brew bundle --file=~/.dotfiles/other_files/Brewfile; fi

# ------------------------------------------------------------------------------

echo -e "\n${GREEN}Done!${ORIGINAL_COLOR}\n"
