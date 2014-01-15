#!/bin/bash

#Dotfile Linksetup

# Create a unix timestamp
date=$(date +%s)

# Create a unique directory to move the files into so script can be run multiple times
backupDirectory=.dotfiles_backup_$date
mkdir $HOME/$backupDirectory 2> /dev/null

#List of links to create
files=(vimrc emacs bash_profile bashrc gitconfig gitignore_global tmux.conf git-prompt.sh)

# For each link in files backup the existing one if there is one and then link to the new one
for linkName in ${files[@]}
do
       mv $HOME/.$linkName $HOME/$backupDirectory 2> errors.txt
       ln -s $HOME/dotfiles/$linkName $HOME/.$linkName
done

mv $HOME/.vim $HOME/$backupDirectory 2> errors.txt
ln -s $HOME/dotfiles/directories/vim $HOME/.vim
