require('plugins')

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- Custom Settings
vim.o.undofile   = true -- enable persistent undo
vim.o.lazyredraw = true -- do not redraw everything everytime
vim.o.visualbell = true -- silence please
vim.o.expandtab  = true -- force use of spaces as tab
vim.o.tabstop    = 2    -- number of spaces for indentation
vim.o.shiftwidth = 2    -- used with tabstop and >> << == commands
vim.o.mouse      = 'a'  -- enable mouse actions
vim.o.number     = true -- show number of the line
vim.o.scrolloff  = 10   -- number of lines always above or below the cursor
vim.o.cursorline = true -- highlight the line where is the cursor
vim.o.showmatch  = true -- highlight the sibling block mark: (), [], {}

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

-- <Ctrl-p> with fzf/sk
vim.api.nvim_set_keymap('n', '<c-P>', [[<Cmd>lua require('telescope.builtin').find_files()<CR>]],
  { noremap = true, silent = true })
