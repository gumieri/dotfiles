" Use Vim settings
set nocompatible

" Allow backspace in insert mode
set backspace=indent,eol,start

" silence
set visualbell

" Plugin Manager Pathogen
set runtimepath^=~/.vim/bundle/vim-pathogen
execute pathogen#infect()

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

" vim-airline configurations
let g:airline_powerline_fonts = 1
