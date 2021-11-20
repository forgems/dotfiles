set encoding=utf-8
set nocompatible              " be iMproved, required
filetype off                  " required

" " The following are examples of different formats supported.
" " Keep Plug commands between vundle#begin/end.
" " plugin on GitHub repo
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Plug 'ap/vim-buftabline'
Plug 'tpope/vim-fugitive'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'roxma/nvim-yarp'
" Plug 'Shougo/deoplete.nvim'
" Plug 'deoplete-plugins/deoplete-jedi'
Plug 'fatih/vim-go'
Plug 'alfredodeza/khuno.vim'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'leafgarland/typescript-vim'
Plug 'rust-lang/rust.vim'
Plug 'posva/vim-vue'
Plug 'fisadev/vim-isort'
Plug 'marcelbeumer/spacedust.vim'
Plug 'mcchrish/nnn.vim'
Plug 'vim-scripts/gnupg.vim'
Plug 'ruanyl/vim-gh-line'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'plan9-for-vimspace/acme-colors'

" themes
Plug 'joshdick/onedark.vim'
Plug 'Heorhiy/VisualStudioDark.vim'
Plug 'hzchirs/vim-material'
Plug 'dracula/vim.git'
Plug 'KabbAmine/yowish.vim'
Plug 'rakr/vim-one'
Plug 'rakr/vim-colors-rakr'
Plug 'jacoborus/tender.vim'
Plug 'morhetz/gruvbox'
Plug 'crusoexia/vim-monokai'
Plug 'arcticicestudio/nord-vim'
Plug 'ayu-theme/ayu-vim'
" Plug 'jasonccox/vim-wayland-clipboard'
call plug#end()

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
set wildmode=longest,list
set wildmenu
set wrap
set completeopt=menuone,preview
syntax on

au BufRead,BufNewFile * set noet
autocmd BufRead,BufNewFile,BufEnter *.py,*.pyw,*.yml,*.yaml set et
autocmd BufRead,BufNewFile,BufEnter *.html vmap gB d<ESC>i{% blocktrans %}<ESC>pa{% endblocktrans %}<ESC>
let python_highligh_all=1
"colorscheme wombat256
"let g:rehash256=1
set background=dark
"colorscheme dracula
"colorscheme gruvbox
let ayucolor="mirage"
colorscheme ayu

"highlight NonText ctermfg=238
highlight SpecialKey ctermfg=238
highlight BadWhitespace ctermbg=red guibg=red guibg=#ff8888
highlight TrailingWhitespace ctermbg=red guibg=red
highlight SpellBad guibg=#aa0000
" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile,BufEnter *.js,*.css,*.py,*.pyw,*.yaml,*.yml match BadWhitespace /^\t\+/
au BufRead,BufNewFile,BufEnter * match BadWhitespace //
au BufRead,BufNewFile,BufEnter *.c,*.h set noet ts=8 sw=8
au BufRead,BufNewFile,BufEnter *.html,*.css,*.js set et ts=2 sw=2
"set autochdir
"set colorcolumn=80
" Make trailing whitespace be flagged as bad.
match TrailingWhitespace /\s\+$/
au Syntax * syn match TrailingWhitespace /\s\+$\| \+\ze\t/
au BufRead,BufNew,BufEnter * match TrailingWhitespace /\s\+$\| \+\ze\t/
au ColorScheme * highlight default TrailingWhitespace ctermbg=red guibg=red
au ColorScheme * highlight default BadWhitespace ctermbg=red guibg=red
set hidden

let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck', 'misspell', 'vetshadow', 'gotype', 'megacheck', 'goconst', 'ineffassign', 'staticcheck', 'gocyclo', 'gosec']
let g:go_list_type = "quickfix"
let g:go_auto_type_info = 1
let g:go_auto_sameids = 1
let g:go_def_mode='gopls'
set rtp+=~/.fzf
set nobackup
set noswapfile
set nowritebackup
set clipboard=unnamedplus
set relativenumber

command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --ignore-case '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)

match ErrorMsg '\s\+$'
set mouse=nv
set ttymouse=sgr
set ttyfast

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
" vim hardcodes background color erase even if the terminfo file does
" not contain bce (not to mention that libvte based terminals
" incorrectly contain bce in their terminfo files). This causes
" incorrect background rendering when using a color theme with a
" background color.
let &t_ut=''

if (has('termguicolors'))
  set termguicolors
endif
let g:go_fmt_command = "goimports"
let g:fzf_layout = { 'up': '~30%' }
let g:go_fmt_command = "goimports"

" KEYBINDINGS
map <Down> gj
map <Up> gk
" nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>a :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
nnoremap <leader>b <plug>(fzf-complete-file)
nnoremap <leader>bq :bp <BAR> bd #<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>h :bprevious<CR>
nnoremap <leader>l :bnext<CR>
nnoremap <leader>r :Rg <C-R><C-W><CR>
nnoremap <leader>t :enew<CR>
nnoremap <leader>x <ESC>:Khuno show<CR>
nnoremap <leader>c :GoCallers<CR>
nnoremap <leader>i :GoImplements<CR>
nnoremap <s-tab> :bp<cr>
nnoremap <tab> :bn<cr>
vnoremap < <gv
vnoremap > >gv

" go
au FileType go setl tabstop=4
au FileType go setl shiftwidth=4
au FileType go setl textwidth=1000
au FileType go setl number
au FileType go setl nolist
au FileType go nmap <Leader>i <Plug>(go-info)
" ts
au FileType ts,tsx setl tabstop=2
au FileType ts,tsx setl shiftwidth=2
au FileType ts,tsx setl et
au FileType ts,tsx setl textwidth=1000
au FileType ts,tsx setl number
au FileType ts,tsx setl nolist

" yaml
au FileType yaml set indentkeys-=<:>
au FileType yaml set tabstop=2
au FileType yaml set shiftwidth=2
au FileType yaml set expandtab
au FileType yaml set number
au FileType yaml set list

au FileType proto set indentkeys-=<:>
au FileType proto set tabstop=4
au FileType proto set shiftwidth=4
au FileType proto set expandtab
au FileType proto set number
au FileType proto set list

set nu
nmap <F5> <ESC>:set nu! rnu!<CR>
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
highlight Comment cterm=italic
let g:go_def_mode='gopls'
let g:go_doc_popup_window=1
let g:go_auto_type_info=1
let g:go_info_mode='gopls'
let g:go_auto_sameids=0
let g:go_term_enabled=1
let g:go_highlight_string_spellcheck=1
" let g:deoplete#enable_at_startup = 1
" call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })

function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

map <F10> call Synstack()

function! ToggleAyu()
	let g:ayucolor= g:ayucolor == "mirage" ? "light" : "mirage" | colorscheme ayu
endfunc

nn <F12> :call ToggleAyu()<CR>
iab iferr <ESC>:GoIfErr<CR>

