#!/bin/bash

set -eo pipefail

if [[ ! -d "$HOME/.vim/bundle/neobundle.vim" ]]; then
  git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
fi

# required for deoplete.nvim
pip3 install -U msgpack

if [[ ! -h "$HOME/.vimrc" ]]; then
  ln -s ~/.vim/vimrc ~/.vimrc
fi
if [[ ! -h "$HOME/.gvimrc" ]]; then
  ln -s ~/.vim/gvimrc ~/.gvimrc
fi

vim +NeoBundleInstall +qall
vim +UpdateRemotePlugins +qall
