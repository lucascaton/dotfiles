#! /bin/bash
echo -ne '\nInitializing...\n\n'

files=(bash_profile gitconfig irbrc psqlrc rvmrc)

echo -ne '=> Backup your dotfiles'
for ((i = 0; i < ${#files[@]}; i++)) do
  echo -ne '.'; sleep 0.1
  if [[ -s ~/.${files[$i]} ]]; then mv ~/.${files[$i]} ~/.${files[$i]}.bkp; fi
done; echo -ne '\n'

echo -ne '=> Create symlinks to new dotfiles'
for ((i = 0; i < ${#files[@]}; i++)) do
  echo -ne '.'; sleep 0.1
  ln -s ~/.dotfiles/${files[$i]} ~/.${files[$i]}
done; echo -ne '\n'

echo -ne '\nDone :-)\n\n'
