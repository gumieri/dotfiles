" Use Vim settings
set nocompatible

" Allow backspace in insert mode
set backspace=indent,eol,start

" enable 256 colors (before colorscheme)
set t_Co=256

" silence
set visualbell

" Plugin Manager Pathogen
set runtimepath^=~/.vim/bundle/vim-pathogen
execute pathogen#infect()

" Code editor configurations
syntax enable
colorscheme preto
set number
set history=1000
set laststatus=2
set scrolloff=10
set cursorline

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
let g:airline_theme = 'serene' " other good themes for preto: jay, simple

" <Ctrl-l> redraws the screen and removes any search highlighting
nnoremap <silent> <C-l> :nohl<CR><C-l>

" bind ^s to save
nnoremap <silent> <C-S> :write<CR>
