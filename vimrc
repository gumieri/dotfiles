" Use Vim settings
set nocompatible

" Allow backspace in insert mode
set backspace=indent,eol,start

" silence
set visualbell

" Code editor configurations
syntax enable
colorscheme monokai
set number
set history=1000
set laststatus=2

" Indentation
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" Load Plugins
set runtimepath^=~/.vim/bundle/ctrlp.vim " ctrlP

python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
