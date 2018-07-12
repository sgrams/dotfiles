""" dotfiles repo
""" [vim] .vimrc
"""
""" created: 20161019
""" last update: 20180712
""" Stanislaw Juliusz Grams <sjg@fmdx.pl>

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

colorscheme hemisu
set background=dark

syn on

set laststatus=2

call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'erickzanardo/vim-xclip'
Plug 'townk/vim-autoclose'
call plug#end()
