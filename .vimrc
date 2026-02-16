" ~/.vimrc
" Stan Grams <stanislawgrams@gmail.com>
" created:      2016-10-19
" last update:  2026-02-16

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
""Plug 'valloric/youcompleteme'
Plug 'tpope/vim-endwise'
Plug 'townk/vim-autoclose'
Plug 'majutsushi/tagbar'
Plug 'yggdroot/indentline'
Plug 'aphroteus/vim-uefi' " uefi support

"" ctags
Plug 'craigemery/vim-autotag'
Plug 'majutsushi/tagbar'
"Plug 'xolox/vim-easytags'
"Plug 'xolox/vim-misc'

"" code formatting
Plug 'ntpeters/vim-better-whitespace'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tpope/vim-commentary'
Plug 'godlygeek/tabular'
Plug 'rust-lang/rust.vim'
Plug 'powerman/vim-plugin-ansiesc'

"" git
Plug 'gregsexton/gitv'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

"" themes
Plug 'flazz/vim-colorschemes'
Plug 'romainl/flattened'
Plug 'NLKNguyen/papercolor-theme'

"" utils
Plug 'kburdett/vim-nuuid'

"" diffs
Plug 'AndrewRadev/linediff.vim'
Plug 'AndrewRadev/diffurcate.vim'

if has('nvim') || has('patch-8.0.902')
  Plug 'mhinz/vim-signify'
else
  Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
endif

call plug#end()

" vim-signify
" default updatetime 4000ms is not good for async update
set updatetime=100

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
let g:AutoClosePreserveDotReg=0

" betterwhitespace
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:better_whitespace_ctermcolor='red'

" ycm
"let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/youcompleteme/.ycm_extra_conf.py'
"let g:ycm_collect_identifiers_from_tags_files = 1

" mouse
set mouse=a

" mutt
au BufRead /tmp/mutt-* set tw=72 " 72 cols width for mails with mutt

" colorscheme
set background=dark
"colorscheme Tomorrow-Night-Bright
"colorscheme Dev_Delight
colorscheme Tomorrow-Night-Eighties

" ctags
nnoremap <leader>. :CtrlPTag<cr>
let g:autotagTagsFile="tags"
set tags=./.tags,.tags,./.TAGS,.TAGS,./tags,tags,./TAGS,TAGS
map <C-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" Tabularize
if exists (":Tabularize")
  " variable definition block alignment
  xnoremap <Leader>ar :Tabularize /^\s*\S\+\zs/l0c1l0<CR>
endif

" vim diff side by side
function Vimdiff()
    let lines = getline(0, '$')
    let la = []
    let lb = []
    for line in lines
        if line[0] == '-'
            call add(la, line[1:])
        elseif line[0] == '+'
            call add(lb, line[1:])
        else
            call add(la, line)
            call add(lb, line)
        endif
    endfor
    tabnew
    set bt=nofile
    vertical new
    set bt=nofile
    call append(0, la)
    diffthis
    exe "normal \<C-W>l"
    call append(0, lb)
    diffthis
endfunction
autocmd FileType diff nnoremap <silent> <leader>vd :call Vimdiff()<CR>

"" noremaps
nnoremap <leader>vd :call Vimdiff()<CR>
nnoremap <leader>du :%s/\r//g<CR>

nnoremap <leader>tc :tabnew<CR>
nnoremap <leader>td :tabclose<CR>
nnoremap <leader>tp :tabprevious<CR>
nnoremap <leader>tn :tabnext<CR>

"" commit quickfix list
function! CommitQF(...)
    " Get the commit hash if it was specified
    let commit = a:0 == 0 ? '' : a:1

    " Get the result of git show in a list
    let flist = system('git show --name-only ' . commit . ' | tail -n +7')
    let flist = split(flist, '\n')

    " Create the dictionnaries used to populate the quickfix list
    let list = []
    for f in flist
        let dic = {'filename': f, "lnum": 1}
        call add(list, dic)
    endfor

    " Populate the qf list
    call setqflist(list)
endfunction
