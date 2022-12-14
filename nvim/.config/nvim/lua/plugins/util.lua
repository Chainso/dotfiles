local setup = function(use)
  -- Useful functions
  use "nvim-lua/plenary.nvim"

  -- Markdown
  use {
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  }

  -- Improve startup
  use 'lewis6991/impatient.nvim'
end

return setup

