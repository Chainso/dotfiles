return {
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },

  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
    end
  },

  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end
  },

  -- Detect tab spacing
  "tpope/vim-sleuth",

  -- Better substitution
  "tpope/vim-abolish",

  -- Highlight under cursor
  {
    "RRethy/vim-illuminate",
    config = function()
      -- default configuration
      require("illuminate").configure({
        -- providers: provider used to get references in the buffer, ordered by priority
        providers = {
          "lsp",
          "treesitter",
          "regex",
        },
        -- delay: delay in milliseconds
        delay = 100,
        -- filetype_overrides: filetype specific overrides.
        -- The keys are strings to represent the filetype while the values are tables that
        -- supports the same keys passed to .configure except for filetypes_denylist and filetypes_allowlist
        filetype_overrides = {},
        -- filetypes_denylist: filetypes to not illuminate, this overrides filetypes_allowlist
        filetypes_denylist = {
          "dirvish",
          "fugitive",
        },
        -- filetypes_allowlist: filetypes to illuminate, this is overriden by filetypes_denylist
        filetypes_allowlist = {},
        -- modes_denylist: modes to not illuminate, this overrides modes_allowlist
        -- See `:help mode()` for possible values
        modes_denylist = {},
        -- modes_allowlist: modes to illuminate, this is overriden by modes_denylist
        -- See `:help mode()` for possible values
        modes_allowlist = {},
        -- providers_regex_syntax_denylist: syntax to not illuminate, this overrides providers_regex_syntax_allowlist
        -- Only applies to the "regex" provider
        -- Use :echom synIDattr(synIDtrans(synID(line("."), col("."), 1)), "name")
        providers_regex_syntax_denylist = {},
        -- providers_regex_syntax_allowlist: syntax to illuminate, this is overriden by providers_regex_syntax_denylist
        -- Only applies to the "regex" provider
        -- Use :echom synIDattr(synIDtrans(synID(line("."), col("."), 1)), "name")
        providers_regex_syntax_allowlist = {},
        -- under_cursor: whether or not to illuminate under the cursor
        under_cursor = true,
        -- large_file_cutoff: number of lines at which to use large_file_config
        -- The `under_cursor` option is disabled when this cutoff is hit
        large_file_cutoff = nil,
        -- large_file_config: config to use for large files (based on large_file_cutoff).
        -- Supports the same keys passed to .configure
        -- If nil, vim-illuminate will be disabled for large files.
        large_file_overrides = nil,
        -- min_count_to_highlight: minimum number of matches required to perform highlighting
        min_count_to_highlight = 1,
      })
    end
  },

  {
    "smjonas/inc-rename.nvim",
    config = function()
      require("inc_rename").setup()
    end
  },

  "jremmen/vim-ripgrep",

  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          auto_trigger = true,
          keymap = {
            accept = "<M-Enter>",
          }
        },
        panel = { enabled = false },
        filetypes = {
          dapui_watches = false,
          dapui_stacks = false,
          dapui_breakpoints = false,
          dapui_scopes = false,
          dapui_console = false,
          dapui_repl = false,
          markdown = true,
          yaml = true,
        },
      })
    end,
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "codecompanion", "Avante" },
    config = function()
      require("render-markdown").setup({
        completions = {
          lsp = {
            enabled = true,
          },
          blink = {
            enabled = true,
          }
        }
      })
    end
  },

  -- {
  --   "yetone/avante.nvim",
  --   event = "VeryLazy",
  --   lazy = false,
  --   version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
  --   -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  --   build = "make",
  --   -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  --   dependencies = {
  --     "stevearc/dressing.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "MunifTanjim/nui.nvim",
  --     --- The below dependencies are optional,
  --     "echasnovski/mini.pick",         -- for file_selector provider mini.pick
  --     "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
  --     "hrsh7th/nvim-cmp",              -- autocompletion for avante commands and mentions
  --     "ibhagwan/fzf-lua",              -- for file_selector provider fzf
  --     "nvim-tree/nvim-web-devicons",   -- or echasnovski/mini.icons
  --     "zbirenbaum/copilot.lua",        -- for providers='copilot'
  --     {
  --       -- support for image pasting
  --       "HakonHarnes/img-clip.nvim",
  --       event = "VeryLazy",
  --       opts = {
  --         -- recommended settings
  --         default = {
  --           embed_image_as_base64 = false,
  --           prompt_for_file_name = false,
  --           drag_and_drop = {
  --             insert_mode = true,
  --           },
  --           -- required for Windows users
  --           use_absolute_path = true,
  --         },
  --       },
  --     },
  --     {
  --       -- Make sure to set this up properly if you have lazy=true
  --       'MeanderingProgrammer/render-markdown.nvim',
  --       opts = {
  --         file_types = { "markdown", "Avante" },
  --       },
  --       ft = { "markdown", "Avante" },
  --     },
  --   },
  --   config = function()
  --     require('avante').setup({
  --     })
  --   end,
  -- },

  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "ravitemer/mcphub.nvim",
      "ravitemer/codecompanion-history.nvim",
      -- "Davidyz/VectorCode",
      "echasnovski/mini.diff"
    },
    config = function()
      require("codecompanion").setup({
        extensions = {
          history = {
            enabled = true,
            opts = {
              -- Keymap to open history from chat buffer (default: gh)
              keymap = "gh",
              -- Automatically generate titles for new chats
              auto_generate_title = true,
              ---On exiting and entering neovim, loads the last chat on opening chat
              continue_last_chat = false,
              ---When chat is cleared with `gx` delete the chat from history
              delete_on_clearing_chat = false,
              -- Picker interface ("telescope", "snacks" or "default")
              picker = "telescope",
              ---Enable detailed logging for history extension
              enable_logging = false,
              ---Directory path to save the chats
              dir_to_save = vim.fn.stdpath("data") .. "/codecompanion-history",
            }
          },
          mcphub = {
            callback = "mcphub.extensions.codecompanion",
            opts = {
              make_vars = true,
              make_slash_commands = true,
              show_result_in_chat = true,
            }
          }
        },
        display = {
          diff = {
            provider = "mini_diff",
          },
          chat = {
            show_settings = true,
            show_token_count = true,
          }
        },

        strategies = {
          chat = {
            keymaps = {
              close = {
                modes = {
                  n = "<C-o>",
                  i = "<C-o>",
                },
              },
            },
            tools = {
              -- vectorcode = {
              --   description = "Run VectorCode to retrieve the project context.",
              --   callback = require("vectorcode.integrations").codecompanion.chat.make_tool(),
              -- },
            },
            slash_commands = {
              -- add the vectorcode command here.
              -- codebase = require("vectorcode.integrations").codecompanion.chat.make_slash_command(),
              file = {
                callback = "strategies.chat.slash_commands.file",
                description = "Insert a file",
                opts = {
                  contains_code = true,
                  max_lines = 100000,
                  provider = "fzf_lua" -- default|telescope|mini_pick|fzf_lua|snacks
                },
              }
              ---
            },
          },
        },

        adapters = {
          copilot = function()
            return require("codecompanion.adapters").extend("copilot", {
              schema = {
                model = {
                  default = "claude-3.7-sonnet"
                }
              }
            })
          end,
        }
      })
    end
  },

  {
    "ravitemer/mcphub.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim", -- Required for Job and HTTP requests

    },
    -- cmd = "MCPHub", -- lazily start the hub when `MCPHub` is called
    build = "npm install -g mcp-hub@latest", -- Installs required mcp-hub npm module
    config = function()
      require("mcphub").setup({
        -- Required options
        port = 3000,                                                            -- Port for MCP Hub server
        config = vim.fn.expand(vim.fn.stdpath("config") .. "/mcpservers.json"), -- Absolute path to config filejava.

        -- Optional options
        on_ready = function(hub)
          -- Called when hub is ready
        end,
        on_error = function(err)
          -- Called on errors
        end,
        log = {
          level = vim.log.levels.WARN,
          to_file = false,
          file_path = nil,
          prefix = "MCPHub"
        },
      })
    end
  },

  -- {
  --   "Davidyz/VectorCode",
  --   version = "0.5.4",  -- optional, depending on whether you're on nightly or release
  --   dependencies = { "nvim-lua/plenary.nvim" },
  --   cmd = "VectorCode", -- if you're lazy-loading VectorCode
  --   config = function()
  --     require("vectorcode").setup({
  --       -- async_backend = "lsp",
  --     })
  --   end
  -- },

  "lambdalisue/suda.vim",

  "chrisbra/csv.vim",

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  }
}
