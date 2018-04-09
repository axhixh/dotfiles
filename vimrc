" see https://github.com/junegunn/vim-plugin

call plug#begin('~/.vim/bundle')

Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'

Plug 'Lokaltog/vim-easymotion'
Plug 'vim-scripts/ShowTrailingWhitespace'
Plug 'myusuf3/numbers.vim'

Plug 'bling/vim-airline'
let g:airline#extensions#tabline#enabled = 1

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle'}
Plug 'ctrlpvim/ctrlp.vim'

" rainbow parentheses
Plug 'kien/rainbow_parentheses.vim'

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


" go
Plug 'fatih/vim-go'
let g:go_highlight_fields = 1
let g:go_metalinter_neabled = ['vet', 'golint', 'errcheck']
" Plug 'Valloric/YouCompleteMe'
Plug 'nsf/gocode', {'rtp':'vim', 'do': '~/.vim/bundle/gocode/vim/symlink.sh'}
Plug 'majutsushi/tagbar'

Plug 'ajmwagar/vim-deus'
call plug#end()

" ocaml
let g:opamshare = substitute(system('opam config var share'), '\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
execute "set rtp+=" . g:opamshare . "/ocp-indent/vim"


set background=dark
colorscheme deus

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

set autowrite

set visualbell
set ruler
set wildmenu
set laststatus=2
set showcmd
set nowrap
set backupskip=/tmp/*,/private/tmp/*
set backspace=indent,eol,start

map j gj
map k gk

inoremap jk <ESC>

