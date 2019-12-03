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
set encoding=utf-8
set mouse=nv " toggle mouse ON by default
syn on

set laststatus=2

map <F7> gg=G<C-o><C-o>
nmap <F9> :set invnumber<CR>

" VimPlugs
call plug#begin('~/.vim/plugged')
Plug 'dannyob/quickfixstatus'
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
Plug 'tpope/vim-fugitive'
Plug 'mellowcandle/vim-bitwise'
Plug 'vim-scripts/grep.vim'
Plug 'kien/ctrlp.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'vim-scripts/IndentHL--Summers'
Plug 'luochen1990/rainbow'
Plug 'sickill/vim-pasta'
Plug 'TaDaa/vimade'
Plug 'flazz/vim-colorschemes'
Plug 'gregsexton/gitv'
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

if executable('rg')
  let g:ctrlp_user_command = 'rg --files %s'
  let g:ctrlp_use_caching = 0
  let g:ctrlp_working_path_mode = 'ra'
  let g:ctrlp_switch_buffer = 'et'
endif

"Tagbar
nmap <F8> :TagbarToggle<CR>

let g:AutoClosePreserveDotReg = 0

" BetterWhitespace
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:better_whitespace_ctermcolor='red'

" Rainbow Parentheses
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Vimade
let g:vimade = {}
let g:vimade.fadelevel = 0.7
let g:vimade.enablesigns = 1

" Colorscheme
colorscheme apprentice

" Ctags + Ctrlp
nnoremap <leader>. :CtrlPTag<cr>
