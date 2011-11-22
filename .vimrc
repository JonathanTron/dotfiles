call pathogen#infect()

syntax on
filetype plugin indent on

set backspace=indent,eol,start

colorscheme solarized
set background=light

set wildignore+=*.o,*.obj,.git,tmp/*,log/*

set clipboard=unnamed

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

map <leader>r :w<CR> :!rspec %:p<CR>
map <leader>R :w<CR> :exe "!rspec %:p:" . line(".")<CR>

set shell=/bin/sh

