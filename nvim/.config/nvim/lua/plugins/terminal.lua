local setup = function(use)
  -- Terminal
  use {
    "akinsho/toggleterm.nvim",
    tag = "*",
    config = function()
      require("toggleterm").setup {
        open_mapping = [[<C-\>]]
      }
    end
  }

  use "mhinz/neovim-remote"
end

return setup

