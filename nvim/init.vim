augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end

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

set expandtab     " force use of spaces as tab
set autoindent    " copy the indentation from previous line
set smarttab      " allow use of tab with bellow settings
set tabstop=2     " number of spaces for indentation
set shiftwidth=2  " used with tabstop and >> << == commands

set hlsearch     " enable highlight search
set mouse=a      " enable mouse actions
set number       " show number of the line
set laststatus=2 " always show status line
set scrolloff=10 " number of lines always above or below the cursor
set cursorline   " highlight the line where is the cursor
set showmatch    " highlight the sibling block mark: (), [], {}
set completeopt=menu,menuone,noselect

colorscheme gruvbox

highlight Normal ctermbg=None

" JavaScript linter
let g:ale_fixers = {'javascript': ['prettier_standard']}
let g:ale_fix_on_save = 1

lua <<EOF
  require('plugins')

  require('setup-lsp')

  require('setup-fzf')

  require('setup-bufferline')

  require('lualine').setup {
    options = {theme = 'gruvbox'}
  }

  require('go').setup()
  vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)

  -- <Ctrl-l> redraws the screen and removes any search highlighting
  vim.api.nvim_set_keymap('n', '<C-l>', ':nohl<CR><C-l>',
    { noremap = true, silent = true })

  -- Tab & Shift-Tab go forward and backward in the opened buffers
  vim.api.nvim_set_keymap('n', '<Tab>', ':bn<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<S-Tab>', ':bp<CR>', { noremap = true, silent = true })

  -- <Ctrl-x> to close the current buffer
  vim.api.nvim_set_keymap('n', '<C-x>', ':bd<CR>',
    { noremap = true, silent = true })

  -- <Ctrl-s> to save
  vim.api.nvim_set_keymap('n', '<C-S>', ':write<CR>',
    { noremap = true, silent = true })

  -- <Ctrl-q> to quit
  vim.api.nvim_set_keymap('n', '<C-Q>', ':quit<CR>',
    { noremap = true, silent = true })

  -- <Ctrl-p> with fzf
  vim.api.nvim_set_keymap('n', '<c-P>', [[<Cmd>lua require('fzf-lua').files()<CR>]],
    { noremap = true, silent = true })

  vim.cmd([[colorscheme gruvbox]])
  vim.cmd([[highlight Normal ctermbg=None]])
EOF
