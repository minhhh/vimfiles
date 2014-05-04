#!/bin/sh

git clone https://github.com/dougireton/vimfiles.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
cd ~/.vim
git submodule init
git submodule update --recursive
vim +BundleInstall +qall
