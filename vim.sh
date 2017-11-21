#!/bin/bash

sudo apt-get install curl exuberant-ctags cscope
cp vimrc ~/.vimrc

mkdir -p ~/.vim ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

cd ~/.vim/bundle
git clone https://github.com/majutsushi/tagbar

os_type=$(uname)

if [ os_type="Linux" ];
then
  echo LS_COLORS="di=00;36:fi=00;37"
elif [ os_type="Darwin" ];
then
  

fi

