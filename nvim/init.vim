if $XDG_CONFIG_HOME == ""
  let $XDG_CONFIG_HOME = $HOME . '/.config'
endif

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
set viminfo+=n$XDG_CONFIG_HOME/nvim/info

" Advanced buffering/temporary files for the opened projects
set directory=$XDG_CONFIG_HOME/nvim/swap " storage all the .swp files
set hidden                               " enable switch files and keep the swap

set undodir=$XDG_CONFIG_HOME/nvim/undo   " storage undo files
set undofile                             " enable persistent undo

source $XDG_CONFIG_HOME/nvim/indentation.vim

source $XDG_CONFIG_HOME/nvim/shortcuts.vim

source $XDG_CONFIG_HOME/nvim/packages.vim

source $XDG_CONFIG_HOME/nvim/editor.vim
