local setup = function(use)
  use {
    "nvim-telescope/telescope.nvim",
    config = function()
      local telescope_center_mappings = {
        ["<CR>"] = require("telescope.actions").select_default + require("telescope.actions").center,
        ["<C-x>"] = require("telescope.actions").select_horizontal + require("telescope.actions").center,
        ["<C-v>"] = require("telescope.actions").select_vertical + require("telescope.actions").center,
        ["<C-t>"] = require("telescope.actions").select_tab + require("telescope.actions").center
      };

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
          },
          mappings = {
            i = telescope_center_mappings,
            n = telescope_center_mappings
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

