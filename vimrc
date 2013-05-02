" start off with clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'altercation/vim-colors-solarized'
Bundle 'myusuf3/numbers.vim'
Bundle 'vim-scripts/Rainbow-Parenthsis-Bundle'

filetype plugin indent on

syntax enable
set background=dark
colorscheme solarized

set incsearch
set ignorecase
set smartcase

set smarttab
set shiftwidth=4
set expandtab

set autoindent
set smartindent

set ruler
