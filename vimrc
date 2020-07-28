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


Plug 'ajmwagar/vim-deus'

" ocaml
let g:opamshare = substitute(system('opam config var share'), '\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
execute "set rtp+=" . g:opamshare . "/ocp-indent/vim"

" ruby
Plug 'vim-ruby/vim-ruby'

" fsharp
Plug 'junegunn/fzf'
Plug 'autozimu/LanguageClient-neovim', {
  \ 'branch': 'next',
  \ 'do': 'bash install.sh',
  \}
Plug 'ionide/Ionide-vim', {
  \ 'do': 'make fsautocomplete',
  \}

" rust
Plug 'rust-lang/rust.vim'

call plug#end()

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
set clipboard=unnamed

map j gj
map k gk

inoremap jk <ESC>

" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
