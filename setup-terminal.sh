#!/bin/bash

if [ -f ~/.zshrc ]
then
  echo .zshrc exists, exiting.
  exit
fi

sudo apt-get install -y curl zsh wget
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo 'PROMPT="%{$fg[blue]%}$USER%{$reset_color%}@%{$fg[blue]%}%M %{$fg_bold[red]%}➜ %{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%}%{$reset_color%}"' >> ~/.zshrc

wget https://raw.githubusercontent.com/jcktm/one-liners/master/.vimrc
