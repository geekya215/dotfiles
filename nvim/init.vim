" not compatible vi
set nocompatible

" enabled syntax highlight
if has("syntax")
  syntax on
endif

" jump to the last position when reopon file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" basic
set encoding=utf-8
set cursorline
set autoindent

" indent
set tabstop=2
set shiftwidth=2
set expandtab

" line number
set number
set relativenumber

" key mapping
let mapleader=" "
noremap ; :
noremap J 5j
noremap K 5k

noremap S :w<CR>
noremap Q :q<CR>
noremap R :source ~/.config/nvim/init.vim<CR>

noremap <leader>s :vs<CR>
noremap <leader>h <C-w>h
noremap <leader>l <C-w>l
map <leader><left> :vertical resize-5<CR>
map <leader><right> :vertical resize+5<CR>

noremap <leader>t :tabe<CR>
noremap <leader>j :-tabnext<CR>
noremap <leader>k :+tabnext<CR>

" compile and run cpp program
autocmd TermOpen term://* startinsert

noremap <F9> :call Compile()<CR>
noremap <F10> :call Run()<CR>

func! Compile()
  exec "w"
  exec "!g++ % -std=c++11 -O2 -o %<"
endfunc

func! Run()
  exec "vs"
  exec "terminal time ./%<"
endfunc

" Plug list
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'liuchengxu/space-vim-dark'
Plug 'mhinz/vim-startify'
Plug 'mg979/vim-xtabline'
Plug 'frazrepo/vim-rainbow'
Plug 'tpope/vim-surround'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'chemzqm/vim-jsx-improve'
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'
call plug#end()

" color scheme
color space-vim-dark
set termguicolors
hi LineNr ctermbg=NONE guibg=NONE
hi Comment guifg=#5C6370 ctermfg=59

let g:rainbow_active=1

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> <leader>d :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

inoremap <silent><expr> <c-space> coc#refresh()

command! -nargs=0 Prettier :CocCommand prettier.formatFile
nmap <leader>f :Prettier<CR>

" Open explorer
nmap <leader>e :CocCommand explorer<CR>
