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
set wildignore+=.DS_Store,*.o,*.obj,.git,tmp/*,log/*,*.gif,*.png,*.jpg,*.jpeg,*.svg,*.ico,*.bmp,public/assets/*

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

set list
set listchars=tab:‣\ ,eol:¬

" Highlight current line
set cursorline

" 2 line cmd height
set cmdheight=2

" Always show tab bar
set showtabline=2

" Run current file with rspec
nmap <leader>r :w<CR>:!clear<CR>:!rspec -fd %:p<CR>

" Run current focused spec with rspec
nmap <leader>R :w<CR>:!clear<CR>:exe "!rspec -fd %:p:" . line(".")<CR>

" Close current buffer but not the splited window
nmap <leader>d :b#<bar>bd#<CR>

" Auto flush Command-T
nmap <leader>t :CommandTFlush<CR>:CommandT<CR>

" Run current file with spinach
nmap <leader>s :w<CR>:!clear<CR>:!spinach %:p<CR>

" Run current focused spec with spinach
nmap <leader>S :w<CR>:!clear<CR>:exe "!spinach %:p:" . line(".")<CR>

" Ruby syntax checking
nmap <leader>v :w<CR>:echomsg split(system("ruby -Wc " . expand("%")), "\n")[0]<CR>

" Strip trailing spaces
nmap <silent> <F4> :let l=line(".")<Bar>:let c=col(".")<Bar>let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<Bar>:call cursor(l, c)<CR>

" move the current line up or down
nmap <C-j> :m+<CR>
nmap <C-k> :m-2<CR>

" tab navigation like firefox
:nmap <C-S-tab> :tabprevious<CR>
:nmap <C-tab> :tabnext<CR>
:map <C-S-tab> :tabprevious<CR>
:map <C-tab> :tabnext<CR>
:imap <C-S-tab> <Esc>:tabprevious<CR>i
:imap <C-tab> <Esc>:tabnext<CR>i
:nmap <C-t> :tabnew<CR>
:imap <C-t> <Esc>:tabnew<CR>

" do not hard wrap at textwidth
set fo=cq

" Some abbreviations
ab std $stdout.puts

" Use sh so .profile is read (loading rvm correctly)
set shell=/bin/sh

" Reload .vimrc when edited
au! BufWritePost .vimrc source %
