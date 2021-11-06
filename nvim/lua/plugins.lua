-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]
-- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged
-- vim._update_package_paths()

return require('packer').startup(function()
  use "nathom/filetype.nvim"

  use 'wbthomason/packer.nvim'

  use 'ray-x/go.nvim'

  use { 'sainnhe/gruvbox-material',
    config = function()
      vim.g.gruvbox_material_palette = 'original'
      vim.g.gruvbox_material_transparent_background = 1
      vim.cmd([[colorscheme gruvbox-material]])
    end
  }

  use { 'dense-analysis/ale',
    config = function()
      vim.g.ale_fixers = { javascript = {'standard'}}
      vim.g.ale_fix_on_save = 1
    end
  }

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  use 'nvim-treesitter/nvim-treesitter-textobjects'

  use { 'nvim-lualine/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons', opt = true
    },
    config = function()
      require('lualine').setup { options = {theme = 'gruvbox'} }
    end
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
      { 'kyazdani42/nvim-web-devicons', opt = true },
    },
    config = function()
      local actions = require('telescope.actions')

      require('telescope').setup {
        defaults = {
          mappings = {
            i = {
              ["<esc>"] = actions.close
            },
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                             -- the default case_mode is "smart_case"
          }
        }
      }

      require('telescope').load_extension('fzf')
    end
  }

  use { 'hrsh7th/nvim-cmp',
    requires = {
      'neovim/nvim-lspconfig',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip'
    },
    config = function() require('setup-lsp') end
  }

  use { 'phaazon/hop.nvim',
    branch = 'v1',
    config = function() require('hop').setup() end
  }
end)
