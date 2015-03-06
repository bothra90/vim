#!/bin/bash

pushd ~
git clone https://github.com/bothra90/vim.git
ln -s ~/vim/vim ~/.vim
ln -s ~/vim/vimrc ~/.vimrc
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
cd ~/.vim/bundle
git clone https://github.com/kien/rainbow_parentheses.vim.git
git clone https://github.com/kien/ctrlp.vim.git
git clone https://github.com/jeffkreeftmeijer/vim-numbertoggle.git
git clone https://github.com/tpope/vim-fugitive.git
git clone https://github.com/sjl/gundo.vim.git
git clone https://github.com/majutsushi/tagbar
git clone https://github.com/ervandew/supertab
git clone https://github.com/sjbach/lusty
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/tpope/vim-pathogen.git
git clone https://github.com/wincent/command-t.git
git clone https://github.com/scrooloose/nerdcommenter.git
git clone https://github.com/Lokaltog/vim-easymotion
git clone https://github.com/sickill/vim-pasta
git clone https://github.com/mtth/scratch.vim
git clone https://github.com/tpope/vim-repeat.git
git clone https://github.com/tpope/vim-surround
git clone https://github.com/benmills/vimux
