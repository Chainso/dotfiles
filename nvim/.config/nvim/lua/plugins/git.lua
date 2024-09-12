return {
  -- Git integration
  "tpope/vim-fugitive",

  "sindrets/diffview.nvim",

  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require('gitsigns').setup()
    end
  },
}

