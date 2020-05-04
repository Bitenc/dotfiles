#!/bin/bash

### set bash links to home folder
rm ~/.bashrc
ln -s ~/dotfiles/bash/.bashrc ~/.bashrc

rm ~/.bash_aliases
ln -s ~/dotfiles/bash/.bash_aliases ~/.bash_aliases

rm ~/.bash_prompt
ln -s ~/dotfiles/bash/.bash_prompt ~/.bash_prompt

rm ~/.bash_logout
ln -s ~/dotfiles/bash/.bash_logout ~/.bash_logout

### set vimrc link to home folder
rm ~/.vimrc
ln -s ~/dotfiles/vim/.vimrc ~/.vimrc

### set gitconfig link to home folder
rm ~/.gitconfig
ln -s ~/dotfiles/git/.gitconfig ~/.gitconfig
