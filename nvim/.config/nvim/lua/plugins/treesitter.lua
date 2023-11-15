return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup {
        highlight = {
          enable = true
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn",
            node_incremental = "gni",
            scope_incremental = "gns",
            node_decremental = "gnd",
          },
        }
      }
    end
  }
  -- {
  --   "hiphish/rainbow-delimiters.nvim",
  --   build = ":TSUpdate"
  -- }
}

