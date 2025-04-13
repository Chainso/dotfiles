return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "folke/trouble.nvim"
    },
    config = function()
      local open_with_trouble = require("trouble.sources.telescope").open

      local telescope_mappings = {
        ["<CR>"] = require("telescope.actions").select_default + require("telescope.actions").center,
        ["<C-x>"] = require("telescope.actions").select_horizontal + require("telescope.actions").center,
        ["<C-v>"] = require("telescope.actions").select_vertical + require("telescope.actions").center,
        ["<C-t>"] = open_with_trouble
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
    dependencies = { "nvim-telescope/telescope.nvim" },
    build = "make",
    config = function()
      require("telescope").load_extension("fzf")
    end
  },

  {
    "nvim-telescope/telescope-live-grep-args.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("telescope").load_extension("live_grep_args")
    end
  },

  {
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-telescope/telescope.nvim" },
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
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- or if using mini.icons/mini.nvim
    -- dependencies = { "echasnovski/mini.icons" },
    opts = {
      files = {
        follow = true
      }
    }
  },

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
      { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
      { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    },
  },

  -- {
  --   "ggandor/leap.nvim",
  --   config = function()
  --     require("leap").add_default_mappings()
  --   end
  -- },

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

  {
    "ziontee113/syntax-tree-surfer",
    config = function()
      require("syntax-tree-surfer").setup {}
    end
  },

  "kevinhwang91/nvim-bqf",
}
