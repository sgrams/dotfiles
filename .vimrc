" ~/.vimrc
" Stanisław Grams <sjg@fmdx.pl>
" created:      2016-10-19
" last update:  2020-04-29

""
"" general
""
filetype plugin on
filetype indent on

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
set encoding=utf-8
set mouse=nv " toggle mouse ON by default
syn on

" user-defined mapping
map <F7> gg=G<C-o><C-o>
nmap <F9> :set invnumber<CR>

""
"" vimplug
""
call plug#begin('~/.vim/plugged')
"" mouse support
Plug 'nvie/vim-togglemouse'

"" file handling
Plug 'scrooloose/nerdtree'
Plug 'mileszs/ack.vim'
Plug 'ctrlpvim/ctrlp.vim'

"" syntax checkers and helpers
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-endwise'
Plug 'townk/vim-autoclose'
Plug 'majutsushi/tagbar'

"" code formatting
Plug 'ntpeters/vim-better-whitespace'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'thaerkh/vim-workspace'

"" git
Plug 'gregsexton/gitv'
Plug 'tpope/vim-fugitive'

"" themes
Plug 'flazz/vim-colorschemes'
Plug 'romainl/flattened'

"" uefi
Plug 'sgrams/vim-efiguid'
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

" colorscheme
colorscheme flattown
