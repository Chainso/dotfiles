return {
  -- Terminal
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup {
        size = function(term)
          if term.direction == "horizontal" then
            return 15
          elseif term.direction == "vertical" then
            return vim.o.columns * 0.5
          end
        end,
        open_mapping = [[<C-\>]],
        direction = "vertical"
      }
    end
  },

  "mhinz/neovim-remote"
}

