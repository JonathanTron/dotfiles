call pathogen#infect()

syntax on
filetype plugin indent on

set backspace=indent,eol,start

colorscheme solarized
set background=light


set incsearch
set hlsearch
map <silent> <C-N> :se invhlsearch<CR>
set ignorecase

set number

set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent

set nobackup
set nowritebackup

map <D-r> :SweetVimRspecRunFile<CR>
map <D-R> :SweetVimRspecRunFocused<CR>
map <M-D-r> :SweetVimRspecRunPrevious<CR>

set shell=/bin/sh
