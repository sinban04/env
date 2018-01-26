#!/bin/bash


if [ "${os_type}" = "Linux" ];
then
  echo Install vim and dependencies with apt ...
  sudo apt-get install curl exuberant-ctags cscope
elif [ "${os_type}" = "Darwin" ];
then
  echo Install vim and dependencies with Homebrew ...
  brew install curl ctags cscope
fi

cp vimrc ~/.vimrc

mkdir -p ~/.vim ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

cd ~/.vim/bundle
git clone https://github.com/majutsushi/tagbar

os_type=$(uname)

echo This system is ${os_type}


if [ "${os_type}" = "Linux" ];
then
  echo If you want to change ls color, add to bashrc the following
  echo LS_COLORS="di=00;36:fi=00;37"
elif [ "${os_type}" = "Darwin" ];
then
  cp ./bash_profile ~/.bash_profile
  cp ./bashrc_mac ~/.bashrc

fi

