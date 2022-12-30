set encoding=utf-8

set path+=''
set autochdir

set modelines=0

set autoread
" http://stackoverflow.com/questions/2490227/how-does-vims-autoread-work#20418591
au FocusGained,BufEnter * :silent! !

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent

set hidden
set nobackup
set noswapfile

set number
set visualbell
set showmode showcmd
"set laststatus=2 statusline=%F
set showmatch
set hlsearch incsearch ignorecase smartcase

set lazyredraw

set colorcolumn=80,120

nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

