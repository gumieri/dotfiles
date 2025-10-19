return {
 'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    { 'nvim-tree/nvim-web-devicons',              opt = true },
  },
  opts = {
    mappings = { i = { ['<esc>'] = require('telescope.actions').close } },
    pickers = {
      find_files = {
        find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
      },
    },
    extensions = {
      fzf = {
        fuzzy = true,                   -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true,    -- override the file sorter
        case_mode = 'smart_case',       -- or 'ignore_case' or 'respect_case' the default case_mode is 'smart_case'
      }
    },
  },
  config = function() require('telescope').load_extension('fzf') end,
}
