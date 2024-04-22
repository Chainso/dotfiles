return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
    config = function()
      require("lualine").setup {
        options = {
          theme = "dracula-nvim"
        }
      }
    end
  },

  {
    "akinsho/bufferline.nvim",
    dependencies = {"nvim-tree/nvim-web-devicons"},
    config = function()
      require("bufferline").setup()
    end
  },

  "famiu/bufdelete.nvim",

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      require("ibl").setup {
        scope = {
          enabled = true,
          show_start = true,
          show_end = false,
        }
      }
    end
  },

  -- Better quickfix UI
  {
    "https://gitlab.com/yorickpeterse/nvim-pqf",
    config = function()
      require('pqf').setup()
    end
  },

  {
    "petertriho/nvim-scrollbar",
    config = function()
      require("scrollbar").setup()
    end
  }
}

