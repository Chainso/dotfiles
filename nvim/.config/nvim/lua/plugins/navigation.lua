local setup = function(use)
  use {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("telescope").setup({
        file_ignore_patterns = {
          ".git"
        },
        defaults = {
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--hidden"
          }
        },
        pickers = {
          find_files = {
            hidden = true
          }
        }
      })
    end
  }

  use {
    "nvim-telescope/telescope-fzf-native.nvim",
    requires = {"nvim-telescope/telescope.nvim"},
    run = "make",
    config = function()
      require("telescope").load_extension("fzf")
    end
  }

  use {
    "ThePrimeagen/harpoon",
    requires = {"nvim-telescope/telescope.nvim"},
    config = function()
      require("harpoon").setup {
        mark_branch = true
      }

      require("telescope").load_extension("harpoon")
    end
  }

  use {
    "ggandor/leap.nvim",
    config = function()
      require('leap').add_default_mappings()
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

