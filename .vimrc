call pathogen#infect()

" Use Vim settings, rather then Vi settings (much better!).
" " This must be first, because it changes other options as a side effect.
set nocompatible

" Allow backgrounding buffers without writing them, and remember marks/undo
" for backgrounded buffers
set hidden

" Remember more commands and search history
set history=1000

" Make tab completion for files/buffers act like bash
set wildmenu

" Make searches case-sensitive only if they contain upper-case characters
set ignorecase
set smartcase

" Keep more context when scrolling off the end of a buffer
set scrolloff=3

" Store temporary files in a central spot
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

if has("vms")
  set nobackup    " do not keep a backup file, use versions instead
else
  set backup    " keep a backup file
endif

" show the cursor position all the time
set ruler   

" display incomplete commands
set showcmd   

" Syntax highlighting
syntax on
filetype plugin indent on

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Use solarized colors
set background=light
colorscheme solarized

hi NonText ctermbg=9
hi Normal ctermbg=9
hi CursorLine ctermbg=7*

" Ignore common dumb files and directories
set wildignore+=*.o,*.obj,.git,tmp/*,log/*

" Use system clipboard
set clipboard=unnamed

" Use incremental searching
set incsearch
" Highlight search match 
set hlsearch

" Toggle search highlight on/off
map <silent> <leader>n :se invhlsearch<CR>h 

" Display line number in gutter
set number

" Use ruby common indentation 2 spaces
set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent

" Highlight current line
set cursorline

" 2 line cmd height
set cmdheight=2

" Always show tab bar
set showtabline=2

" Run current file with rspec
map <leader>r :w<CR> :!rspec %:p<CR>
" Run current focused spec with rspec
map <leader>R :w<CR> :exe "!rspec %:p:" . line(".")<CR>

" Use sh so .profile is read (loading rvm correctly)
set shell=/bin/sh

" Reload .vimrc when edited
au! BufWritePost .vimrc source %
