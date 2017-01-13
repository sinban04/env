#!/bin/bash

cd
mkdir .vim
cd .vim
mkdir bundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall  

