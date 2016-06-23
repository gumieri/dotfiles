" Use Vim settings
set nocompatible " must be first line

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
set number                    " show number of the line
set history=1000              " increase the history commands
set laststatus=2              " for multiple windows (2 = always)
set scrolloff=10              " number of lines always above or below the cursor
set cursorline                " highlight the line where is the cursor
set directory=$HOME/.vim/swap " storage all the .swp files
set undodir=$HOME/.vim/undo   " storage undo files
set undofile                  " enable persistent undo

" Indentation
set autoindent    " copy the indentation from previous line
set smartindent   " it will try to indent based on C lang
set smarttab      " allow use of tab with bellow settings
set tabstop=2     " number of spaces for indentation
set shiftwidth=2  " used with tabstop and >> << == commands

" vim-airline configurations
let g:airline_powerline_fonts = 1
let g:airline_theme = 'serene' " other good themes with preto: jay, simple

" <Ctrl-l> redraws the screen and removes any search highlighting
nnoremap <silent> <C-l> :nohl<CR><C-l>

" bind ^s to save
nnoremap <silent> <C-S> :write<CR>
