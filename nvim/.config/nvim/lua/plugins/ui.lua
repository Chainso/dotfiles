local setup = function(use)
  use {
    "nvim-lualine/lualine.nvim",
    requires = { "nvim-tree/nvim-web-devicons", opt = true },
    config = function()
      require("lualine").setup {
        options = {
          theme = "dracula-nvim"
        }
      }
    end
  }

  use {
    "akinsho/bufferline.nvim",
    tag = "v3.*",
    requires = {"nvim-tree/nvim-web-devicons"},
    config = function()
      require("bufferline").setup()
    end
  }
end

return setup

