#!/usr/bin/env bash

# Taken from https://github.com/hashrocket/dotmatrix

mkdir -p ~/.vim/bundle
cd ~/.vim/bundle

get_bundle() {
    (
      if [ -d "$2" ]; then
        echo "Updating $1's $2"
        cd "$2"
        git pull --rebase
      else
        git clone "git://github.com/$1/$2.git"
      fi
    )
}

get_bundle kchmck vim-coffee-script
#get_bundle leshill vim-json
get_bundle mileszs ack.vim
get_bundle pangloss vim-javascript
get_bundle tpope vim-cucumber
get_bundle tpope vim-endwise
get_bundle tpope vim-fugitive
get_bundle tpope vim-git
get_bundle tpope vim-haml
get_bundle tpope vim-markdown
get_bundle tpope vim-pathogen
get_bundle tpope vim-rails
get_bundle tpope vim-surround
get_bundle vim-ruby vim-ruby
get_bundle duskhacker sweet-rspec-vim
get_bundle altercation vim-colors-solarized
get_bundle vim-scripts Rename
get_bundle tomtom tcomment_vim
get_bundle Lokaltog vim-powerline
get_bundle nathanaelkane vim-indent-guides
get_bundle skalnik vim-vroom
get_bundle ervandew supertab
get_bundle scrooloose syntastic
get_bundle kien ctrlp.vim
get_bundle gregsexton gitv
get_bundle scrooloose nerdtree
get_bundle godlygeek tabular
get_bundle airblade vim-gitgutter

vim -c 'call pathogen#helptags()|q'
