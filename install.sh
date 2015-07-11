#! /bin/bash

NO_COLOR="\033[1;0m"
GREEN="\033[0;32m"
GRAY="\033[1;30m"

echo -ne "\n${GREEN}Initializing...\n\n"
echo -e "Creating backup & creating symlinks to new dotfiles..."

cd ~/.dotfiles/files
for file in *; do
  echo "~/.$file"
  if [ -s ~/.$file ]; then mv ~/.$file ~/.$file.bkp; fi
  ln -s ~/.dotfiles/files/$file ~/.$file
done

if [[ "$OSTYPE" == "darwin"* ]]; then
  ~/.dotfiles/files/os_x
fi

echo -e "${GRAY}"

echo -ne "${GREEN}Done! :-)${NO_COLOR}\n\n"
