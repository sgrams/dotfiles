" ~/.vimrc
" © Stanisław Grams <sjg@fmdx.pl>
"
" created:      2016-10-19
" last update:  2020-03-03

""
"" general
""
filetype plugin on
filetype indent on

colorscheme torte

set ai
set si
set ar
set ts=2
set sw=2
set tw=500
set wm=0
set laststatus=2
set nobk
set noic
set nohls
set nocp
set wrap
set modeline
set expandtab
set invnumber
syn on

" user-defined mapping
map <F7> gg=G<C-o><C-o>
:nmap <F9> :set invnumber<CR>

""
"" vimplug
""
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'townk/vim-autoclose'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'scrooloose/nerdtree'
Plug 'craigemery/vim-autotag'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-endwise'
Plug 'valloric/youcompleteme'
Plug 'majutsushi/tagbar'
Plug 'ntpeters/vim-better-whitespace'
Plug 'nvie/vim-togglemouse'
Plug 'gregsexton/gitv'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/syntastic'
call plug#end()

" nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ag & ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" tagbar
nmap <F8> :TagbarToggle<CR>
let g:AutoClosePreserveDotReg = 0

" betterwhitespace
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:better_whitespace_ctermcolor='red'

" ycm
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/youcompleteme/.ycm_extra_conf.py'

" pathogen
execute pathogen#infect()

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

" mouse
set mouse=a

" mutt
au BufRead /tmp/mutt-* set tw=72 " 72 cols width for mails with mutt
