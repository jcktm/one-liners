#!/bin/bash

if [ -e .homedir ]
then
  echo .homedir found, exiting.
  exit
fi

sudo apt-get install -y curl zsh wget git silversearcher-ag
sudo chsh -s /bin/zsh "$USER"

backup=.backup.$RANDOM
mkdir $backup
[ -e .homedir-backup ] && mv .homedir-backup $backup
mv $backup .homedir-backup

backup() { [ -e $1 ] && mv $1 .homedir-backup ; }

backup .vim
backup .vimrc
backup .zshrc
backup .homedir

git clone https://github.com/jcktm/one-liners .homedir

if ! [ -e .fzf ]
then
  git clone https://github.com/junegunn/fzf .fzf
fi

git clone https://github.com/VundleVim/Vundle.vim.git .vim/bundle/Vundle.vim

ln -s .homedir/.vimrc .vimrc
ln -s .homedir/.zshrc .zshrc
vim +VundleInstall +qall

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
