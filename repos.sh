#!/bin/bash

pushd ~
git clone git@github.com:bothra90/vim.git
ln -s ~/vim/vim ~/.vim
ln -s ~/vim/vimrc ~/.vimrc

curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
cd .vim/bundle

#For text completion
git submodule add git://github.com/Valloric/YouCompleteMe.git

#better support for the '.' operation
git submodule add git://github.com/tpope/vim-repeat.git

#fast support to surround thigns with ",',<>,(),etc.
git submodule add git://github.com/tpope/vim-surround.git

#git plugin
git submodule add git://github.com/tpope/vim-fugitive.git

#easily deal with comments
git submodule add git://github.com/scrooloose/nerdcommenter.git

#browser file system in left pane (similar to IDEs)
git submodule add git://github.com/scrooloose/nerdtree.git

#open files by fuzzy search
git submodule add git://github.com/kien/ctrlp.vim.git

#open files by file system explorer; Also provides better buffer management using <leader>lj
git submodule add git://github.com/sjbach/lusty.git

#color subsequent brackets [{()}]
git submodule add git://github.com/kien/rainbow_parentheses.vim.git

#visualize vim undo tree
git submodule add git://github.com/sjl/gundo.vim.git

#show relative number / absolution number depending on mode
git submodule add git://github.com/jeffkreeftmeijer/vim-numbertoggle.git

#better movement in vim normal mode
git submodule add git://github.com/Lokaltog/vim-easymotion.git

#generate tag bar to show functions and variables
git submodule add git://github.com/majutsushi/tagbar.git

#better contextual paste
git submodule add git://github.com/sickill/vim-pasta.git

#get scratch buffer
git submodule add git://github.com/mtth/scratch.vim.git

#tmux support
git submodule add git://github.com/benmills/vimux.git

#snippets support
git submodule add git://github.com/tomtom/tlib_vim
git submodule add git://github.com/MarcWeber/vim-addon-mw-utils.git
git submodule add git://github.com/garbas/vim-snipmate.git
git submodule add git://github.com/honza/vim-snippets.git

#cscope support
git submodule add git://github.com/vim-scripts/cscope.vim

#better status line
git submodule add git://github.com/bling/vim-airline
