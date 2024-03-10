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
}

