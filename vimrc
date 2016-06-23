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

" Plugin Manager Pathogen
set runtimepath^=$HOME/.vim/bundle/vim-pathogen
execute pathogen#infect()

" Code editor configurations
syntax enable
colorscheme preto " there's also: badwolf

set number       " show number of the line
set history=100  " increase the history commands
set laststatus=2 " always show status line
set scrolloff=10 " number of lines always above or below the cursor
set cursorline   " highlight the line where is the cursor
set showmatch    " highlight the sibling block mark: (), [], {}
set incsearch		 " live search

" Advanced buffering/temporary files for the opened projects
set directory=$HOME/.vim/swap " storage all the .swp files
set hidden                    " enable switch files and keep the swap

set undodir=$HOME/.vim/undo   " storage undo files
set undofile                  " enable persistent undo

" Indentation
filetype indent plugin on

set autoindent    " copy the indentation from previous line
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
