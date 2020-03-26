" not compatible vi
set nocompatible

" enabled syntax highlight
if has("syntax")
  syntax on
endif

" jump to the last position when reopen file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" load indentation rules and plugins according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" change cursor shape in different modes
let &t_SI="\<Esc>]50;CursorShape=1\x7"
let &t_SR="\<Esc>]50;CursorShape=2\x7"
let &t_EI="\<Esc>]50;CursorShape=0\x7"
" fix cursor toggle delay problem when exit insert mode
set ttimeout
set ttimeoutlen=1

" uncomment to display space, tab and lf symbol
" set list
" set listchars=tab:>-,trail:~,extends:>,precedes:<,space:.

set ttyfast

" toggle cursorline in different mod
:autocmd InsertEnter,InsertLeave * set cul!

" basic
set autoread
set encoding=utf-8
set mouse=a
set scrolloff=5
set sidescrolloff=5
set wrap
set wildmenu
set showcmd

" indent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smartindent

" line number
set number
set relativenumber

" search
set showmatch
set hlsearch
set incsearch
set ignorecase
set smartcase

" other
" set textwidth=80
" set colorcolumn=80

" key mapping 
nmap <CR> o<Esc>k
nmap <space> O<Esc>j

" load plugin
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'

Plug 'yggdroot/indentline'

call plug#end()

" indentline plugin config section
let g:indentLine_color_term=241
let g:indentLine_enabled=1
let g:indentLine_leadingSpaceEnabled=1
let g:indentLine_leadingSpaceChar='·'
