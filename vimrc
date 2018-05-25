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
let g:go_fmt_command = "goimports"
let g:go_metalinter_neabled = ['vet', 'golint', 'errcheck']
Plug 'nsf/gocode', {'rtp':'vim', 'do': '~/.vim/bundle/gocode/vim/symlink.sh'}
Plug 'majutsushi/tagbar'

" auto complete
function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py --go-completer
  endif
endfunction

Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }

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

