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
  },

  {
    "rcarriga/nvim-notify",
    dependencies = {"nvim-telescope/telescope.nvim"},
    config = function()
      -- Snippet to use notify for regular prints
      -- https://www.reddit.com/r/neovim/comments/xv3v68/tip_nvimnotify_can_be_used_to_display_print/ 
      -- Overriding vim.notify with fancy notify if fancy notify exists
      local notify = require("notify")
      vim.notify = notify
      print = function(...)
        local print_safe_args = {}
        local _ = { ... }
        for i = 1, #_ do
          table.insert(print_safe_args, tostring(_[i]))
        end
        notify(table.concat(print_safe_args, ' '), "info")
      end
      notify.setup()
    end
  }
}

