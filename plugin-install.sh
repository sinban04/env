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
  echo " \" tagbar configuration" >> ~/.vimrc
  echo "map <C-O> :Tagbar<CR>" >> ~/.vimrc 
}

install_multiple_cursors() {
  git clone https://github.com/terryma/vim-multiple-cursors.git ~/.vim/bundle/vim-multiple-cursors
}

install_you_complete_me() {
  sudo apt-get install build-essential cmake python3-dev \
    && echo "start install you_complete_me" \
    || { echo -e "${COLOR_RED} You need to install 'build-essential', 'cmake', 'python3-dev' before install you_complete_me ${COLOR_NONE}" ; }
  git clone --recursive https://github.com/Valloric/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe
  cd ~/.vim/bundle/YouCompleteMe
  python3 install.py --clang-completer

  echo " \"You Complete Me configuration" >> ~/.vimrc
  echo "set encoding=utf-8" >> ~/.vimrc
  echo "highlight YcmErrorLine ctermbg=LightBlue ctermfg=DarkGray cterm=bold guibg=#3f0000" >> ~/.vimrc
  echo "let g:ycm_error_symbol = '!!'" >> ~/.vimrc
  echo "let g:ycm_warning_symbol = '>>'" >> ~/.vimrc
  echo "let g:ycm_max_num_candidates = 1" >> ~/.vimrc
  echo "map <C-F> :YcmCompleter FixIt<CR>" >> ~/.vimrc
  echo "map <C-V> :YcmCompleter GoTo<CR>" >> ~/.vimrc

}

install_fugitive() {
  git clone https://github.com/tpope/vim-fugitive.git ~/.vim/bundle
}

install_light_line() {
  git clone https://github.com/itchyny/lightline.vim.git ~/.vim/bundle/lightline.vim
  
  echo " \" lightline configuration" >> ~/.vimrc
  echo "let g:lightline = {" >> ~/.vimrc
  echo "      \ 'colorscheme': 'solarized'," >> ~/.vimrc
  echo "      \ 'active': {" >> ~/.vimrc
  echo "      \ 'left' : [ [ 'mode', 'paste' ], [ 'readonly', 'absolutepath', 'modified' ] ]," >> ~/.vimrc
  echo "      \ }" >> ~/.vimrc
  echo "      \ }" >> ~/.vimrc

}

install_auto_pairs(){
  git clone https://github.com/jiangmiao/auto-pairs.git ~/.vim/bundle/auto-pairs
}

install_nerd_tree() {
  git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree

  echo " \" nerdtree configuration" >> ~/.vimrc
  echo "map <C-E> :NERDTreeToggle<CR>" >> ~/.vimrc 
}

install_light() {
  install_tagbar
  install_fugitive
  install_light_line
  install_multiple_cursors
}

install_all() {
  install_tagbar
  install_fugitive
  install_auto_pairs
  install_multiple_cursors
  install_nerd_tree
  install_light_line
  install_you_complete_me
}


##### Main Start
echo -e "${COLOR_YELLOW} Install pathogen vim package ${COLOR_NONE}"

if [ -e ~/.vim/autoload/pathogen.vim ]; then
  echo -e "${COLOR_RED} Already pathogen installed. ${COLOR_NONE}"
else
  mkdir -p ~/.vim ~/.vim/autoload ~/.vim/bundle && \
  curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

  echo " \" Use Pathogen plugins" >> ~/.vimrc
  echo "execute pathogen#infect()" >> ~/.vimrc
  echo "syntax on" >> ~/.vimrc
  echo "filetype plugin indent on" >> ~/.vimrc
fi


if [ "$1" = "all" ] || [ "$1" = "All" ] ; then
  echo -e "${COLOR_GREEN} Install all plugins ... ${COLOR_NONE}"
  install_all

elif [ "$1" = "light" ] || [ "$1" = "lightweight" ] || [ "$1" = "light-version" ] ; then
  echo -e "${COLOR_GREEN} Install light plugins ... ${COLOR_NONE}"
  install_light

elif [ "$1" = "nerdtree" ] || [ "$1" = "nerd-tree" ] || [ "$1" = "nerd_tree" ] ; then
  echo -e "${COLOR_GREEN} Install nerd tree ... ${COLOR_NONE}"
  install_nerd_tree

elif [ "$1" = "fugitive" ] || [ "$1" = "vim-fugitive" ] ; then
  echo -e "${COLOR_GREEN} Install fugitive ... ${COLOR_NONE}"
  install_fugitive

elif [ "$1" = "tagbar" ] || [ "$1" = "Tagbar" ] ; then
  echo -e "${COLOR_GREEN} Install tagbar ... ${COLOR_NONE}"
  install_tagbar

elif [ "$1" = "autopairs" ] || [ "$1" = "auto-pairs" ] || [ "$1" = "auto_pairs" ] ; then
  echo -e "${COLOR_GREEN} Install auto pairs ... ${COLOR_NONE}"
  install_auto_pairs


elif [ "$1" = "multiple-cursors" ] || [ "$1" = "multiple_cursors" ] ; then
  echo -e "${COLOR_GREEN} Install multiple-cursors ... ${COLOR_NONE}"
  install_multiple_cursors

elif [ "$1" = "light-line" ] || [ "$1" = "light_line" ] || [ "$1" = "lightline" ]; then
  echo -e "${COLOR_GREEN} Install light_line ... ${COLOR_NONE}"
  install_light_line

elif [ "$1" = "you-complete-me" ] || [ "$1" = "you_complete_me" ] || [ "$1" = "youcompleteme" ]; then
  echo -e "${COLOR_GREEN} Install you-complete-me ... ${COLOR_NONE}"
  install_you_complete_me

else
  echo -e ""
  echo -e ""
  echo -e "${COLOR_LIGHT_GREEN}      How to use vim-plugin.sh ${COLOR_NONE}"
  echo -e "     Usage: ${COLOR_CYAN}./plugin-install.sh [options]${COLOR_NONE}"
  echo -e "   [options] : "
  echo -e "           <Install Set> "
  echo -e "${COLOR_LIGHT_RED}        all(All), light(lightweight, light-version), ${COLOR_NONE}"
  echo -e "           <Install Module> "
  echo -e "${COLOR_LIGHT_RED}       tagbar(Tagbar), multiple-cursors(multiple_cursors)"
  echo -e "       lightline(light-line), fugitive(vim-fugitive)"
  echo -e "       autopairs(auto-pairs, auto_pairs), you-complete-me(you_complete_me)"
  echo -e "${COLOR_NONE}"
  echo -e ""
fi


