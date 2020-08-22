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

" basic
set autoread
set encoding=utf-8
set mouse=a
set scrolloff=5
set sidescrolloff=5
set wrap
set wildmenu
set cursorline

" indent
set tabstop=4
set shiftwidth=4
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

" key mapping
let mapleader=" "
noremap ; :
noremap J 5j
noremap K 5k

noremap S :w<CR>
noremap Q :q<CR>
noremap <C-q> :qa<CR>
noremap R :source ~/.config/nvim/init.vim<CR>

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

call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'mhinz/vim-startify'

Plug 'vim-airline/vim-airline'

Plug 'mg979/vim-xtabline'

Plug 'yggdroot/indentline'

Plug 'liuchengxu/space-vim-dark'

Plug 'leafgarland/typescript-vim'

Plug 'peitalin/vim-jsx-typescript'

Plug 'frazrepo/vim-rainbow'

Plug 'jiangmiao/auto-pairs'

Plug 'mattn/emmet-vim'

Plug 'tpope/vim-surround'

Plug 'preservim/nerdtree'

Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'airblade/vim-gitgutter'

Plug 'editorconfig/editorconfig-vim'

Plug 'ryanoasis/vim-devicons'

call plug#end()

" color scheme
color space-vim-dark
set termguicolors
hi LineNr ctermbg=NONE guibg=NONE
hi Comment guifg=#5C6370 ctermfg=59

noremap <C-n> :NERDTreeToggle<CR>

let g:rainbow_active = 1

" Make <tab> used for trigger completion, completion confirm, 
" snippet expand and jump like VSCode.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

command! -nargs=0 Prettier :CocCommand prettier.formatFile
nmap <leader>f :Prettier<CR>

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
