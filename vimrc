" start off with clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'ShowTrailingWhitespace'
Bundle 'altercation/vim-colors-solarized'
Bundle 'myusuf3/numbers.vim'

Bundle 'bling/vim-airline'
let g:airline#extensions#tabline#enabled = 1

Bundle 'scrooloose/nerdtree'

" rainbow parentheses
Bundle 'kien/rainbow_parentheses.vim'

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


" clojure
Bundle 'guns/vim-clojure-static'
Bundle 'tpope/vim-classpath'
Bundle 'paredit.vim'

" go
Plugin 'fatih/vim-go'

filetype plugin indent on

syntax enable
"set background=dark
"colorscheme solarized

set incsearch
set ignorecase
set smartcase
set hlsearch

set smarttab
set shiftwidth=4
set tabstop=4
set expandtab

set autoindent
set smartindent

set visualbell
set ruler
set showcmd
set nowrap

map j gj
map k gk

inoremap jk <ESC>


