#!/bin/bash


# Bash COLORS

COLOR_NONE='\033[0m'
COLOR_BLACK='\033[0;30m'
COLOR_RED='\033[0;31m'
COLOR_GREEN='\033[0;32m'
COLOR_BROWN='\033[0;33m'
COLOR_BLUE='\033[0;34m'
COLOR_PURPLE='\033[0;35m'
COLOR_CYAN='\033[0;36m'
COLOR_LIGHT_GRAY='\033[0;37m'
COLOR_DARK_GRAY='\033[1;30m'
COLOR_LIGHT_RED='\033[1;31m'
COLOR_LIGHT_GREEN='\033[1;32m'
COLOR_YELLOW='\033[1;33m'
COLOR_LIGHT_BLUE='\033[1;34m'
COLOR_LIGHT_PURPLE='\033[1;35m'
COLOR_LIGHT_CYAN='\033[1;36m'
COLOR_WHITE='\033[1;37m'

install_tagbar() {
  git clone https://github.com/majutsushi/tagbar ~/.vim/bundle/tagbar
  echo "map <C-O> :Tagbar<CR>" >> ~/.vimrc 
}

install_multiple_cursors() {
  git clone https://github.com/terryma/vim-multiple-cursors.git ~/.vim/bundle/nerdtree
}

install_light_line() {
  git clone https://github.com/itchyny/lightline.vim.git ~/.vim/bundle/nerdtree
}

install_nerd_tree() {
  git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
  echo "map <C-E> :NERDTreeToggle<CR>" >> ~/.vimrc 
}

install_all() {
  install_tagbar
  install_multiple_cursors
  install_nerd_tree
  install_light_line
}

echo -e "${COLOR_YELLOW} Install pathogen vim package ${COLOR_NONE}"

mkdir -p ~/.vim ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

echo """ Use Pathogen plugins" >> ~/.vimrc
echo "execute pathogen#infect()" >> ~/.vimrc
echo "syntax on" >> ~/.vimrc
echo "filetype plugin indent on" >> ~/.vimrc



if [ "$1" = "all" ] || [ "$1" = "All" ] ; then
  echo -e "${COLOR_GREEN} Install all plugins ... ${COLOR_NONE}"
  install_all

elif [ "$1" = "nerdtree" ] || [ "$1" = "nerd-tree" ] || [ "$1" = "nerd_tree" ] ; then
  echo -e "${COLOR_GREEN} Install nerdtree ... ${COLOR_NONE}"
  install_nerd_tree

elif [ "$1" = "tagbar" ] || [ "$1" = "Tagbar" ] ; then
  echo -e "${COLOR_GREEN} Install tagbar ... ${COLOR_NONE}"
  install_tagbar

elif [ "$1" = "multiple-cursors" ] || [ "$1" = "multiple_cursors" ] ; then
  echo -e "${COLOR_GREEN} Install multiple-cursors ... ${COLOR_NONE}"
  install_multiple_cursors

elif [ "$1" = "light-line" ] || [ "$1" = "light_line" ] || [ "$1" = "lightline" ]; then
  echo -e "${COLOR_GREEN} Install light_line ... ${COLOR_NONE}"
  install_light_line

else
  echo -e ""
  echo -e ""
  echo -e "${COLOR_LIGHT_GREEN}      How to use vim-plugin.sh ${COLOR_NONE}"
  echo -e "     Usage: ${COLOR_CYAN}./vim-plugin.sh ${COLOR_LIGHT_RED} [options]"
  echo -e "   [options] : all(All), tagbar(Tagbar), multiple-cursors(multiple_cursors) ${COLOR_NONE}"
  echo -e ""
  echo -e ""
fi

