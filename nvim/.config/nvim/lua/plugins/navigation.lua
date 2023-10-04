return {
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      local trouble = require("trouble.providers.telescope")

      local telescope_mappings = {
        ["<CR>"] = require("telescope.actions").select_default + require("telescope.actions").center,
        ["<C-x>"] = require("telescope.actions").select_horizontal + require("telescope.actions").center,
        ["<C-v>"] = require("telescope.actions").select_vertical + require("telescope.actions").center,
        ["<C-t>"] = trouble.open_with_trouble
      };

      require("telescope").setup({
        file_ignore_patterns = {
          ".git"
        },
        defaults = {
          wrap_results = true,
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
            i = telescope_mappings,
            n = telescope_mappings
          }
        },
        pickers = {
          find_files = {
            hidden = true
          }
        }
      })
    end
  },

  {
    "nvim-telescope/telescope-fzf-native.nvim",
    dependencies = {"nvim-telescope/telescope.nvim"},
    build = "make",
    config = function()
      require("telescope").load_extension("fzf")
    end
  },

  {
    "ThePrimeagen/harpoon",
    dependencies = {"nvim-telescope/telescope.nvim"},
    config = function()
      require("harpoon").setup {
        global_settings = {
          mark_branch = true
        }
      }

      require("telescope").load_extension("harpoon")
    end
  },

  {
    "junegunn/fzf",
    build = ":call fzf#install()"
  },

  {
    "ggandor/leap.nvim",
    config = function()
      require("leap").add_default_mappings()
    end
  },

  {
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  },

  "kevinhwang91/nvim-bqf"
}

