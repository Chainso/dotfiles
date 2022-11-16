local setup = function(use)
  -- Command menu 
  use {
    "gelguy/wilder.nvim",
    config = function()
      require("wilder").setup({
        modes = {":", "/", "?"}
      })
    end
  }

  -- Git integration
  use "tpope/vim-fugitive"
end

return setup

