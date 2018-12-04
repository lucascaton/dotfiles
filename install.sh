#! /bin/bash

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
    echo -ne "symlink has been created ${GREEN}✓${ORIGINAL_COLOR}"
    ln -s ~/.dotfiles/files/$file ~/.$file
  fi

  echo -e "${ORIGINAL_COLOR}"
done

# ------------------------------------------------------------------------------

title "Setting up macOS configs"

if [[ "$OSTYPE" == "darwin"* ]]; then ~/.dotfiles/other_files/macOS; fi

# ------------------------------------------------------------------------------

title "Installing Homebrew packages"

if [[ "$OSTYPE" == "darwin"* ]]; then brew bundle --file=~/.dotfiles/other_files/Brewfile; fi

# ------------------------------------------------------------------------------

title "Installing Atom packages"

if [ -d ~/.atom ]; then
  apm install --packages-file ~/.dotfiles/other_files/atom/default/package.list;
  apm install --packages-file ~/.dotfiles/other_files/atom/course/package.list;
fi

# ------------------------------------------------------------------------------

echo -e "\n${GREEN}Done!${ORIGINAL_COLOR}\n"
