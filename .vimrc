set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"
" " The following are examples of different formats supported.
" " Keep Plugin commands between vundle#begin/end.
" " plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'Valloric/YouCompleteMe'
Plugin 'fatih/vim-go'
Plugin 'https://github.com/alfredodeza/khuno.vim'
Plugin 'http://github.com/jeetsukumaran/vim-buffergator'
Plugin 'https://github.com/junegunn/fzf.vim'
Plugin 'https://github.com/vim-airline/vim-airline'
Plugin 'https://github.com/leafgarland/typescript-vim.git'
Plugin 'https://github.com/rust-lang/rust.vim.git'
Plugin 'posva/vim-vue'
Plugin 'fisadev/vim-isort'
Plugin 'joshdick/onedark.vim'
Plugin 'https://github.com/Heorhiy/VisualStudioDark.vim'
Plugin 'https://github.com/hzchirs/vim-material'
Plugin 'https://github.com/dracula/vim.git'
Plugin 'KabbAmine/yowish.vim'

" " plugin from http://vim-scripts.org/vim/scripts.html
" " Plugin 'L9'
" " Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" " git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" " The sparkup vim script is in a subdirectory of this repo called vim.
" " Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" " Install L9 and avoid a Naming conflict if you've already installed a
" " different version somewhere else.
" " Plugin 'ascenator/L9', {'name': 'newL9'}
"
" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on


" set listchars=tab:▸\ ,eol:¬
filetype indent on
filetype on
filetype plugin on
iab pyhdr #!/usr/bin/env python<CR># -*- coding: utf-8 -*-<CR>
set autoindent
set bs=2
set cindent
set cmdheight=1
set cursorline
set diffopt =filler,vertical,context:4
set expandtab
set incsearch
set lbr
set listchars=tab:.\ 
set nocp
set nolist
set ruler
set shiftwidth=4
set showmatch matchtime=3
set smartcase "ignore case if search pattern is all lowercase,
set smarttab "insert tabs on the start of a line according to sw not ts
set statusline=[%l,%c\ %P%M]\ %f\ %r%h%w
set t_Co=256
set tabstop=4
set textwidth=0
set wildmenu
set wildmode=full
set wrap
syntax on

au BufRead,BufNewFile * set noet
autocmd BufRead,BufNewFile,BufEnter *.py,*.pyw,*.yml,*.yaml set et
autocmd BufRead,BufNewFile,BufEnter *.html vmap gB d<ESC>i{% blocktrans %}<ESC>pa{% endblocktrans %}<ESC>
let python_highligh_all=1
"colorscheme wombat256
"let g:rehash256=1
set background=dark
colorscheme dracula

highlight NonText ctermfg=238
highlight SpecialKey ctermfg=238
highlight BadWhitespace ctermbg=red guibg=red guibg=#880000
highlight TrailingWhitespace ctermbg=red guibg=red
highlight SpellBad guibg=#660000
" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile,BufEnter *.js,*.css,*.py,*.pyw,*.yaml,*.yml match BadWhitespace /^\t\+/
au BufRead,BufNewFile,BufEnter * match BadWhitespace //
au BufRead,BufNewFile,BufEnter *.c,*.h set noet ts=8 sw=8
au BufRead,BufNewFile,BufEnter *.html,*.css,*.js set et ts=2 sw=2
"set autochdir
set colorcolumn=80
" Make trailing whitespace be flagged as bad.
match TrailingWhitespace /\s\+$/
au Syntax * syn match TrailingWhitespace /\s\+$\| \+\ze\t/
au BufRead,BufNew,BufEnter * match TrailingWhitespace /\s\+$\| \+\ze\t/
au ColorScheme * highlight default TrailingWhitespace ctermbg=red guibg=red
au ColorScheme * highlight default BadWhitespace ctermbg=red guibg=red
set hidden

let g:sparkupNextMapping="<c-k>"
set rtp+=~/.fzf
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

match ErrorMsg '\s\+$'
set mouse=a
set ttymouse=sgr

" for tmux truecolor support
" apt install ncurses-term
if &term =~ '256color'
	" disable Background Color Erase (BCE) so that color schemes
	" render properly when inside 256-color tmux and GNU screen.
	" see also http://snk.tuxfamily.org/log/vim-256color-bce.html
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	set t_ut=
endif
let &t_8u = "\<Esc>[58;2;%lu;%lu;%lum"
let &t_Cs = "\e[4:3m"
let &t_Ce = "\e[4:0m"

if (has('termguicolors'))
  set termguicolors
endif

let g:fzf_layout = { 'up': '~30%' }

" KEYBINDINGS
imap <F3> <ESC>:NERDTreeToggle<CR>
imap <F4> <ESC>:NERDTreeFind<CR>
map <Down> gj
map <F3> :NERDTreeToggle<CR>
map <F4> :NERDTreeFind<CR>
map <Up> gk
nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>a :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
nnoremap <leader>b <plug>(fzf-complete-file)
nnoremap <leader>bq :bp <BAR> bd #<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>h :bprevious<CR>
nnoremap <leader>l :bnext<CR>
nnoremap <leader>r :Rg <cword><CR>
nnoremap <leader>t :enew<CR>
nnoremap <leader>x <ESC>:Khuno show<CR>
nnoremap <s-tab> :bp<cr>
nnoremap <tab> :bn<cr>
vnoremap < <gv
vnoremap > >gv
