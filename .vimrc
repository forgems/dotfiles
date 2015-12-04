set nocp
set t_Co=256
filetype on
filetype indent on
filetype plugin on
syntax on
if has("gui_running")
    set guioptions=aegimrLt
    let &guicursor = &guicursor . ",a:blinkon0"
    set guifont=Monaco:h12
    set guifont=Droid\ Sans\ Mono\ Slashed\ 10
"    set nomacatsui
    set antialias
endif 
set guioptions=aegimrLt
set ai
set expandtab
set tabstop=4
set shiftwidth=4
set bs=2
set cursorline
set ruler
set incsearch
set wrap
set lbr
set textwidth=0
map <Up> gk
map <Down> gj
map <F3> :NERDTreeToggle<CR>
imap <F3> <ESC>:NERDTreeToggle<CR>
map <F4> :NERDTreeFind<CR>
imap <F4> <ESC>:NERDTreeFind<CR>
filetype plugin on
nmap <C-S-tab> :tabprevious<cr>
nmap <C-tab> :tabnext<cr>
map <C-S-tab> :tabprevious<cr>
map <C-tab> :tabnext<cr>
imap <C-S-tab> <ESC>:tabprevious<cr>i
imap <C-tab> <ESC>:tabnext<cr>i
imap <M-S-Left> <ESC>:tabprevious<cr>i
imap <M-S-Right> <ESC>:tabnext<cr>i
nmap <M-S-Left> :tabprevious<cr>i
nmap <M-S-Right> :tabnext<cr>i
imap <D-S-Left> <ESC>:tabprevious<cr>i
imap <D-S-Right> <ESC>:tabnext<cr>i
nmap <D-S-Left> :tabprevious<cr>i
nmap <D-S-Right> :tabnext<cr>i
nmap <M-t> :tabnew<cr>
imap <M-t> <ESC>:tabnew<cr>
set diffopt =filler,vertical,context:4
iab hdr #!/usr/bin/env python<CR># -*- coding: utf-8 -*-
set smarttab
set wildmode=full
set wildmenu
set showmatch matchtime=3
set cmdheight=2
set statusline=[%l,%c\ %P%M]\ %f\ %r%h%w
set listchars=tab:.\ 
" set listchars=tab:▸\ ,eol:¬
set list
au BufRead,BufNewFile * set noet
autocmd BufRead,BufNewFile,BufEnter *.py,*.pyw set et
autocmd BufRead,BufNewFile,BufEnter *.html vmap gB d<ESC>i{% blocktrans %}<ESC>pa{% endblocktrans %}<ESC>
let python_highligh_all=1
map <D-1> 1gt
map <D-2> 2gt
map <D-3> 3gt
map <D-4> 4gt
map <D-5> 5gt
map <D-6> 6gt
map <D-7> 7gt
map <D-1> 1gt
map <D-1> 1gt
"colorscheme wombat256
colorscheme molokai_dark
highlight NonText ctermfg=238
highlight SpecialKey ctermfg=238
highlight BadWhitespace ctermbg=red guibg=red
" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h set textwidth=120
"set autochdir
execute pathogen#infect()
