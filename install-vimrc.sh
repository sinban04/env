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

install_ctags ()
{
  echo -e "${COLOR_YELLOW} Install cscope! ${COLOR_NONE}"
  cd
  wget http://prdownloads.sourceforge.net/ctags/ctags-5.8.tar.gz
  tar zxvf ctags-5.8.tar.gz
  cd ctags-5.8
  ./configure
  make -j8
  sudo make install
}

install_cscope ()
{
  echo -e "${COLOR_YELLOW} Install cscope! ${COLOR_NONE}"
  cd
  git clone https://github.com/sinban04/cscope.git
  cd cscope
  ./configure
  autoreconf -f -i
  make -j8
  sudo make install
  sudo cp /usr/local/bin/cscope /usr/bin/cscope
}

os_type=$(uname)

# Install vim & git
sudo apt-get install vim git \
  && echo -e "${COLOR_GREEN} Installed git and vim ${COLOR_NONE}" \
  || { echo -e "${COLOR_RED} Installing git and vim failed.${COLOR_NONE}"; }


cp vimrc ~/.vimrc


if [ "${os_type}" = "Linux" ];
then
  echo -e "${COLOR_YELLOW} Install vim and dependencies with apt ...${COLOR_NONE}"
  sudo apt-get install curl exuberant-ctags cscope \
    && echo -e "${COLOR_GREEN}Installed well!${COLOR_NONE}" \
    || { echo -e "${COLOR_RED}No package found${COLOR_NONE}"; install_ctags; install_cscope;}

elif [ "${os_type}" = "Darwin" ];
then
  echo -e "${COLOR_YELLOW} Install vim and dependencies with Homebrew ...${COLOR_NONE}"
  brew install curl ctags cscope
fi



#mkdir -p ~/.vim ~/.vim/autoload ~/.vim/bundle && \
#curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
#
#cd ~/.vim/bundle
#git clone https://github.com/majutsushi/tagbar


echo -e "${COLOR_LIGHT_CYAN}This system is ${os_type}${COLOR_NONE}"


if [ "${os_type}" = "Linux" ];
then
  echo If you want to change ls color, add to bashrc the following
  echo LS_COLORS="di=00;36:fi=00;37"
elif [ "${os_type}" = "Darwin" ];
then
  cp ./bash_profile ~/.bash_profile
  cp ./bashrc_mac ~/.bashrc

fi

echo "export TERM=xterm-256color" >> ~/.bashrc

