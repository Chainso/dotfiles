return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup {
        auto_install = true,
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
  },

  -- {
  --   "hiphish/rainbow-delimiters.nvim",
  --   build = ":TSUpdate"
  -- }
}

