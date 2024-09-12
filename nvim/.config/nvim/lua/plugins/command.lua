return {
  -- Command menu 
  {
    "gelguy/wilder.nvim",
    config = function()
      require("wilder").setup({
        modes = {":", "/", "?"}
      })
    end
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },

  -- Git integration
  "tpope/vim-fugitive"
}

