call pathogen#infect()

" Use Vim settings, rather then Vi settings (much better!).
" " This must be first, because it changes other options as a side effect.
set nocompatible

" Set powerline theme to solarized
let g:Powerline_theme = 'solarized'

" Defaults to utf-8
set encoding=utf-8

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

set foldmethod=manual

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

" Uncomment to display number in gutter relatively to carret position
"set relativenumber

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

" Alert do not generate sound
set visualbell

" Locally we can send lots of chars at once
set ttyfast

" Visually display the 80th column
set colorcolumn=80

" do not hard wrap at textwidth
set fo=cq

" Taken from Mislav's vimfiles
" https://github.com/mislav/vimfiles/blob/master/vimrc
if has("statusline") && !&cp
  set laststatus=2  " always show the status bar

  " Start the status line
  set statusline=%f\ %m\ %r

  " Add fugitive
  set statusline+=%{fugitive#statusline()}

  " Finish the statusline
  set statusline+=Line:%l/%L[%p%%]
  set statusline+=Col:%v
  set statusline+=Buf:#%n
  set statusline+=[%b][0x%B]
endif

" Limit CommandT to 20 files
let g:CommandTMaxHeight=20

" Run current file with rspec
nmap <leader>r :w<CR>:!clear<CR>:!rspec -fd %:p<CR>

" Run current focused spec with rspec
nmap <leader>R :w<CR>:!clear<CR>:exe "!rspec -fd " . expand("%:p") . ":" . line(".")<CR>

" Close current buffer but not the splited window
nmap <leader>d :b#<bar>bd#<CR>

" Auto flush Command-T
nmap <leader>t :CommandTFlush<CR>:CommandT<CR>

" Run current file with spinach
nmap <leader>s :w<CR>:!clear<CR>:!spinach %:p<CR>

" Run current focused spec with spinach
nmap <leader>S :w<CR>:!clear<CR>:exe "!spinach " . expand("%:p") . ":" . line(".")<CR>

" Ruby syntax checking
nmap <leader>v :w<CR>:echomsg split(system("ruby -Wc " . expand("%")), "\n")[0]<CR>

" Strip trailing spaces
nmap <silent> <F4> :let l=line(".")<Bar>:let c=col(".")<Bar>let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<Bar>:call cursor(l, c)<CR>

" move the current line up or down
nmap <C-j> :m+<CR>
nmap <C-k> :m-2<CR>

" Remap the tab key to do autocompletion or indentation depending on the
" context (from http://www.vim.org/tips/tip.php?tip_id=102)
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

" Taken from Gary Bernhardt
" https://github.com/garybernhardt/dotfiles/master/.vimrc
function! PromoteToLet()
  :normal! dd
  " :exec '?^\s*it\>'
  :normal! P
  :.s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
  :normal ==
  " :normal! <<
  " :normal! ilet(:
  " :normal! f 2cl) {
  " :normal! A }
endfunction
:command! PromoteToLet :call PromoteToLet()
:map <leader>p :PromoteToLet<cr>

noremap <Del> "_dl
vmap <F3> :s/\[:\([^\]]*\)\]/["\1"]/<cr>

" Some abbreviations
ab std $stdout.puts

" Use sh so .profile is read (loading rvm correctly)
set shell=/bin/sh

" Reload .vimrc when edited
au! BufWritePost .vimrc source %

" Read .vimrc.local if present
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
