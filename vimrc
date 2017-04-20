" Use Vim settings
set nocompatible " must be first line

" Allow backspace in insert mode
set backspace=indent,eol,start

" enable 256 colors (before colorscheme)
set t_Co=256

" silence
set visualbell

" performance
set lazyredraw
set ttyfast

" Change viminfo location to ~./vim
set viminfo+=n$HOME/.vim/info

" Advanced buffering/temporary files for the opened projects
set directory=$HOME/.vim/swap " storage all the .swp files
set hidden                    " enable switch files and keep the swap

set undodir=$HOME/.vim/undo   " storage undo files
set undofile                  " enable persistent undo

source $HOME/.vim/indentation.vim

source $HOME/.vim/shortcuts.vim

source $HOME/.vim/packages.vim

source $HOME/.vim/editor.vim
