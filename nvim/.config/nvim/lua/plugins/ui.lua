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

  use "famiu/bufdelete.nvim"

  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup {
        show_current_context = true,
        show_current_context_start = true
      }
    end
  }

  -- Better quickfix UI
  use {
    "https://gitlab.com/yorickpeterse/nvim-pqf",
    config = function()
      require('pqf').setup()
    end
  }

  use {
    "petertriho/nvim-scrollbar",
    config = function()
      require("scrollbar").setup()
    end
  }
end

return setup

