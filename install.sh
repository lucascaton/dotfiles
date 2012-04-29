#! /bin/bash
echo 'Installing...'

echo 'Backup your dotfiles...'
if [[ -s ~/.bash_profile ]] ; then mv ~/.bash_profile ~/.bash_profile.bkp ; fi
if [[ -s ~/.gitconfig ]] ; then mv ~/.bash_profile ~/.gitconfig.bkp ; fi

echo 'Create symlinks to new dotfiles...'
ln -s ~/.dotfiles/bash_profile ~/.bash_profile
ln -s ~/.dotfiles/gitconfig ~/.gitconfig
