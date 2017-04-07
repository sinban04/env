#!/bin/bash

sudo apt-get install curl exuberant-ctags cscope
cp vimrc ~/.vimrc

mkdir -p ~/.vim ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

cd ~/.vim/bundle
git clone https://github.com/majutsushi/tagbar


