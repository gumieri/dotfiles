-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]
-- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged
-- vim._update_package_paths()

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  use 'ray-x/go.nvim'

  use 'morhetz/gruvbox'

  use 'dense-analysis/ale'

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'nvim-treesitter/nvim-treesitter-textobjects' }

  use { 'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  use { 'ibhagwan/fzf-lua',
    requires = {
      'vijaymarupudi/nvim-fzf',
      'kyazdani42/nvim-web-devicons' }
  }

  use { 'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons'
  }

  use { 'hrsh7th/nvim-cmp',
    requires = {
      'neovim/nvim-lspconfig',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip' }
  }
end)
