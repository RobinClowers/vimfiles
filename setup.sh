#!/bin/bash

set -eo pipefail

if [[ -d "$HOME/.vim/bundle/neobundle.vim" ]]; then
  git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
fi

vim +NeoBundleInstall +qall

if [[ ! -h "$HOME/.vimrc" ]]; then
  ln -s ~/.vim/vimrc ~/.vimrc
fi
if [[ ! -h "$HOME/.gvimrc" ]]; then
  ln -s ~/.vim/gvimrc ~/.gvimrc
fi
