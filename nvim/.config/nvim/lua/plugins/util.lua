return {
  -- Useful functions
  "nvim-lua/plenary.nvim",

  -- Markdown
  {
    "iamcco/markdown-preview.nvim",
    build = function() vim.fn["mkdp#util#install"]() end,
  }
}

