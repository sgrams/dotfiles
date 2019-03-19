" (c) Stanisław J. Grams
" created:      19.10.2016
" last update:  18.03.2019

filetype plugin on
filetype indent on

set ai
set si
set ar
set ts=2
set sw=2
set tw=500
set wm=0
set nobk
set noic
set nohls
set nocp
set wrap
set modeline
set expandtab
set invnumber

colorscheme iceberg
syn on

set laststatus=2

map <F7> gg=G<C-o><C-o>
:nmap <F9> :set invnumber<CR>

" VimPlugs
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'erickzanardo/vim-xclip'
Plug 'townk/vim-autoclose'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'cocopon/iceberg.vim'
Plug 'scrooloose/nerdtree'
Plug 'craigemery/vim-autotag'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-endwise'
Plug 'valloric/youcompleteme'
Plug 'majutsushi/tagbar'
Plug 'ntpeters/vim-better-whitespace'
Plug 'nvie/vim-togglemouse'
call plug#end()

" NERDTree settings
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"ag + Ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

"Tagbar
nmap <F8> :TagbarToggle<CR>

let g:AutoClosePreserveDotReg = 0

"BetterWhitespace
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:better_whitespace_ctermcolor='red'
