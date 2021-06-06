#!/bin/bash

stow .dotfiles

touch ~/.localaliases

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
python .vim/plugged/YouCompleteMe/install.py
