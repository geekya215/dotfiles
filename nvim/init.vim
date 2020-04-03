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
" set softtabstop=4
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
let mapleader=" "
noremap ; :
imap jk <Esc>
noremap J 5j
noremap K 5k

noremap S :w<CR>
noremap R :source ~/.config/nvim/init.vim<CR>
noremap Q :q<CR>
noremap <C-q> :qa<CR>

noremap <leader>( i()<Esc>i
noremap <leader>) i()
noremap <leader>{ i{}<Esc>i
noremap <leader>} i{}
noremap <leader>[ i[]<Esc>i
noremap <leader>] i[]
noremap <leader>< i<><Esc>i
noremap <leader>> i<>
noremap <leader>' i''<Esc>i
noremap <leader>" i""<Esc>i
noremap <leader>` i``<Esc>i

noremap <leader>s :vs<CR>
noremap <leader>h <C-w>h
noremap <leader>l <C-w>l
map <leader><left> :vertical resize-5<CR>
map <leader><right> :vertical resize+5<CR>

noremap <leader>n :tabe<CR>
noremap <leader>j :-tabnext<CR>
noremap <leader>k :+tabnext<CR>
noremap <leader>mj :-tabmove<CR>
noremap <leader>mk :+tabmove<CR>

" load plugin
call plug#begin('~/.vim/plugged')

Plug 'mhinz/vim-startify'

Plug 'vim-airline/vim-airline'

Plug 'yggdroot/indentline'

Plug 'tpope/vim-surround' 

Plug 'preservim/nerdtree'

Plug 'connorholyday/vim-snazzy'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'ryanoasis/vim-devicons'

Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'airblade/vim-gitgutter'

Plug 'mg979/vim-xtabline'

call plug#end()

" indentline plugin config section
let g:indentLine_color_term=255
let g:indentLine_enabled=1
let g:indentLine_leadingSpaceEnabled=1
let g:indentLine_leadingSpaceChar='·'

" color snazzy config section
let g:lightline = { 'colorscheme': 'snazzy' }
let g:SnazzyTransparent = 0
colorscheme snazzy

" nerdtree config section
let g:NERDTreeShowHidden=1
noremap <silent> <C-n> :NERDTreeToggle<CR>

" nerdtree git config
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" vim-devicons config section
let g:airline_powerline_fonts = 0

" coc config
let g:coc_global_extensions = ['coc-html', 'coc-json', 'coc-css', 'coc-tsserver', 'coc-emmet', 'coc-highlight', 'coc-snippets', 'coc-pairs', 'coc-lists']
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
