call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'

Plug 'myusuf3/numbers.vim'

Plug 'bling/vim-airline'
let g:airline#extensions#tabline#enabled = 1

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1

Plug 'autozimu/LanguageClient-neovim', {
  \ 'branch': 'next',
  \ 'do': 'bash install.sh',
  \ }

set hidden
let g:LanguageClient_serverCommands = {
  \ 'ruby':['~/.rvm/gems/ruby-2.3.8/bin/solargraph', 'stdio'],
  \ }

Plug 'cloudhead/neovim-fuzzy'
nnoremap <C-p> :FuzzyOpen<CR>

Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle'}
Plug 'kien/rainbow_parentheses.vim'
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Plug 'ajmwagar/vim-deus'
Plug 'rakr/vim-one'

call plug#end()

" set background=dark
" colorscheme deus

colorscheme one
set background=light
let g:airline_theme='one'

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

map j gj
map k gk

inoremap jk <ESC>

