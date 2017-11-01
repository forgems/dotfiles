execute pathogen#infect()
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
set smarttab

set cindent
set autoindent
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
nmap <tab> :bn<cr>
nmap <s-tab> :bp<cr>
set diffopt =filler,vertical,context:4
iab pyhdr #!/usr/bin/env python<CR># -*- coding: utf-8 -*-<CR>
set wildmode=full
set wildmenu
set showmatch matchtime=3
set cmdheight=1
set statusline=[%l,%c\ %P%M]\ %f\ %r%h%w
set listchars=tab:.\ 
" set listchars=tab:▸\ ,eol:¬
set nolist
au BufRead,BufNewFile * set noet
autocmd BufRead,BufNewFile,BufEnter *.py,*.pyw,*.yml set et
autocmd BufWritePost *.py call Flake8()
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
"let g:rehash256=1
colorscheme molokai_dark
highlight NonText ctermfg=238
highlight SpecialKey ctermfg=238
highlight BadWhitespace ctermbg=red guibg=red
highlight TrailingWhitespace ctermbg=red guibg=red
" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile,BufEnter *.js,*.css,*.py,*.pyw match BadWhitespace /^\t\+/
au BufRead,BufNewFile,BufEnter * match BadWhitespace //
au BufRead,BufNewFile,BufEnter *.c,*.h set noet ts=8 sw=8
au BufRead,BufNewFile,BufEnter *.css,*.js set et ts=2 sw=2
"set autochdir
set colorcolumn=80
" Make trailing whitespace be flagged as bad.
match TrailingWhitespace /\s\+$/
au Syntax * syn match TrailingWhitespace /\s\+$\| \+\ze\t/
au BufRead,BufNew,BufEnter * match TrailingWhitespace /\s\+$\| \+\ze\t/
au ColorScheme * highlight default TrailingWhitespace ctermbg=red guibg=red
set hidden

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>
let g:sparkupNextMapping="<c-k>"
set rtp+=~/.fzf
vnoremap < <gv
vnoremap > >gv
set nobackup
set noswapfile
set nowritebackup
set clipboard=unnamed

command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --ignore-case '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)

nnoremap <C-p>a :Rg
