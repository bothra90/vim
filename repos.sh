#!/bin/bash

pushd ~

sudo rm -R vim
sudo rm -R .vim
sudo rm .vimrc

git clone git@github.com:bothra90/vim
ln -s ~/vim/vim ~/.vim
ln -s ~/vim/vimrc ~/.vimrc

curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

cd ~/vim
mkdir vim/bundle

#For text completion
git submodule add git://github.com/Valloric/YouCompleteMe vim/bundle/YouCompleteMe

#better support for the '.' operation
git submodule add git://github.com/tpope/vim-repeat vim/bundle/vim-repeat

#fast support to surround thigns with ",',<>,(),etc.
git submodule add git://github.com/tpope/vim-surround vim/bundle/vim-surround

#git plugin
git submodule add git://github.com/tpope/vim-fugitive vim/bundle/vim-fugitive

#easily deal with comments
git submodule add git://github.com/scrooloose/nerdcommenter vim/bundle/nerdcommenter

#browser file system in left pane (similar to IDEs)
git submodule add git://github.com/scrooloose/nerdtree vim/bundle/nerdtree

#open files by fuzzy search
git submodule add git://github.com/kien/ctrlp.vim vim/bundle/ctrlp.vim

#open files by file system explorer; Also provides better buffer management using <leader>lj
git submodule add git://github.com/sjbach/lusty vim/bundle/lusty

#color subsequent brackets [{()}]
git submodule add git://github.com/kien/rainbow_parentheses.vim vim/bundle/rainbow_parentheses.vim

#visualize vim undo tree
git submodule add git://github.com/sjl/gundo.vim vim/bundle/gundo.vim

#show relative number / absolution number depending on mode
git submodule add git://github.com/jeffkreeftmeijer/vim-numbertoggle vim/bundle/vim-numbertoggle

#better movement in vim normal mode
git submodule add git://github.com/Lokaltog/vim-easymotion vim/bundle/vim-easymotion

#generate tag bar to show functions and variables
git submodule add git://github.com/majutsushi/tagbar vim/bundle/tagbar

#better contextual paste
git submodule add git://github.com/sickill/vim-pasta vim/bundle/vim-pasta

#get scratch buffer
git submodule add git://github.com/mtth/scratch.vim vim/bundle/scratch.vim

#tmux support
git submodule add git://github.com/benmills/vimux vim/bundle/vimux

#snippets support
git submodule add git://github.com/tomtom/tlib_vim vim/bundle/tlib_vim
git submodule add git://github.com/MarcWeber/vim-addon-mw-utils vim/bundle/vim-addon-mw-utils
git submodule add git://github.com/garbas/vim-snipmate vim/bundle/vim-snipmate
git submodule add git://github.com/honza/vim-snippets vim/bundle/vim-snippets

#cscope support
git submodule add git://github.com/vim-scripts/cscope.vim vim/bundle/cscope.vim

#better status line
git submodule add git://github.com/bling/vim-airline vim/bundle/vim-airline
