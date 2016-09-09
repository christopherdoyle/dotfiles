""" NEOVIM CONFIGURATION
"
" ln -s ~/.vim $XDG_CONFIG_HOME/nvim
" ln -s ~/.vimrc $XDG_CONFIG_HOME/nvim/init.vim
"
"
"

set nocompatible 


"""""""""""""""""""""""""""""" plugins
" off before loading plugins
filetype off
" vim-plug
call plug#begin()
Plug 'sjl/badwolf'
Plug 'MaxSt/FlatColor'
Plug 'https://github.com/itchyny/lightline.vim'
Plug 'morhetz/gruvbox'
call plug#end()


"""""""""""""""""""""""""""""" general setup
syntax enable
filetype plugin on
set number
set termguicolors
set ruler
set visualbell


"""""""""""""""""""""""""""""" color settings
set t_Co=256
set background=dark
colorscheme flatcolor
" Requires powerline-patched fonts 
let g:lightline = {
  \ 'colorscheme': 'flatcolor',
  \ 'separator': { 'left': '', 'right': '' },
  \ 'subseparator': { 'left': '', 'right': '' }
  \ }


"""""""""""""""""""""""""""""" key bindings
let mapleader=" "
" source vimrc
map <leader>s :source ~/.vimrc<CR>
" switch between files
nnoremap <Leader><Leader> :e#<CR>    

nmap ; :
imap jk <Esc>

nnoremap j gj
nnoremap k gk


"""""""""""""""""""""""""""""" history & backup
set hidden
set history=100
" The double trailing slash will store files using full paths
" to avoid different files with the same name interacting.
set backupdir=~/.vim/backup//
set directory=~/.vim/swp//


"""""""""""""""""""""""""""""" indenting
filetype indent on
set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent


"""""""""""""""""""""""""""""" search & highlight
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
" cancel search with Escape
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>

set showmatch


