#!/bin/bash

ln -s $(pwd)/zshrc.d/ ~/.zshrc.d
ln -s $(pwd)/zshrc ~/.zshrc
mkdir -p /home/netbear/.cache/zsh

ln -s $(pwd)/.config/nvim ~/.config/nvim

#ln -s $(pwd)/vimrc ~/.vimrc
#ln -s $(pwd)/vimrc.d ~/.vimrc.d

