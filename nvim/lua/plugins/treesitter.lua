return {
  "nvim-treesitter/nvim-treesitter",
  branch = 'master',
  lazy = false,
  build = ":TSUpdate",
  dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
    config = function() require("config.treesitter") end,
}
