return {
  {
    "williamboman/mason.nvim",
    version = "^1.0.0",
    config = function()
      require("mason").setup({
        registries = {
          'github:nvim-java/mason-registry',
          'github:mason-org/mason-registry',
        },
      })
    end
  },

  {
    "folke/neoconf.nvim",
  },

  {
    "kiyoon/jupynium.nvim",
    -- build = "pip3 install --user .",
    build = "uv pip install . --python=$HOME/.virtualenvs/jupynium/bin/python",
    -- build = "conda run --no-capture-output -n jupynium pip install .",
  },

  {
    "nvim-java/nvim-java",
    dependencies = {
      "rcarriga/nvim-notify",
      "stevearc/overseer.nvim",
    },
    config = function()
      -- Java JDTLS JVM args for more performance
      vim.env["JDTLS_JVM_ARGS"] =
      "-XX:+UseParallelGC -XX:GCTimeRatio=4 -XX:AdaptiveSizePolicyWeight=90 -Dsun.zip.disableMemoryMapping=true -Xmx4G -Xms100m"
      require('java').setup({
        auto_install = false,
      })

      local overseer = require("overseer")

      -- Create task to debug a gradle project
      overseer.register_template({
        name = "Gradle Debug",
        builder = function(params)
          -- This must return an overseer.TaskDefinition
          return {
            cmd = { "./gradlew" },
            args = { "run", "--debug-jvm" },
            name = "Gradle Debug",
            components = {
              {
                "custom.redirect_output",
                bufnr = require("dapui").elements.console.buffer(),
              }
            }
          }
        end,
        -- Optional fields
        desc = "Starts debugging for a Gradle project",
        -- Tags can be used in overseer.run_template()
        tags = { overseer.TAG.RUN },
      })
    end
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "nvim-java/nvim-java",
      "folke/neoconf.nvim",
      "rcarriga/nvim-notify"
    }
  },

  -- Rust
  {
    "mrcjkb/rustaceanvim",
    version = '^5', -- Until we can move to nvim 0.11 vim.lsp.config
    lazy = false
  },

  -- Golang
  {
    "ray-x/go.nvim",
    config = function()
      require('go').setup()
    end
  },
  "ray-x/guihua.lua", -- recommanded if need floating window support

  -- Flutter
  {
    "akinsho/flutter-tools.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    config = function()
      require("flutter-tools").setup({
        debugger = {
          enabled = false,
        }
      })
    end
  },

  -- Scala
  -- {
  --   "scalameta/nvim-metals",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --   },
  --   ft = { "scala", "sbt", "java" },
  --   opts = function()
  --     local metals_config = require("metals").bare_config()
  --     metals_config.on_attach = function(client, bufnr)
  --       -- your on_attach function
  --     end
  --
  --     return metals_config
  --   end,
  --   config = function(self, metals_config)
  --     local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
  --     vim.api.nvim_create_autocmd("FileType", {
  --       pattern = self.ft,
  --       callback = function()
  --         require("metals").initialize_or_attach(metals_config)
  --       end,
  --       group = nvim_metals_group,
  --     })
  --   end
  -- },

  -- LuaLS config for neovim
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        "lazy.nvim",
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },

  -- JSON/YAML schemas
  "b0o/schemastore.nvim",

  {
    "williamboman/mason-lspconfig.nvim",
    version = "^1.0.0",
    dependencies = {
      { "williamboman/mason.nvim", version = "^1.0.0" },
      "neovim/nvim-lspconfig",
      "folke/neoconf.nvim",
    },
    config = function()
      require("neoconf").setup({
        -- override any of the default settings here
      })

      local lspconfig = require("lspconfig")
      local blink = require("blink.cmp")

      local mason_lspconfig = require("mason-lspconfig")
      mason_lspconfig.setup({
        ensure_installed = {
          "jsonls",
          "yamlls",
          "bashls",
          "marksman",
          "vimls"
        },
        handlers = {
          function(server_name)
            lspconfig[server_name].setup({
              capabilities = blink.get_lsp_capabilities(capabilities),
            })
          end,
          jsonls = function()
            lspconfig.jsonls.setup {
              capabilities = blink.get_lsp_capabilities(capabilities),
              settings = {
                json = {
                  schemas = require('schemastore').json.schemas(),
                  validate = { enable = true },
                },
              },
            }
          end,
          yamlls = function()
            lspconfig.yamlls.setup {
              capabilities = blink.get_lsp_capabilities(capabilities),
              settings = {
                yaml = {
                  schemaStore = {
                    -- You must disable built-in schemaStore support if you want to use
                    -- this plugin and its advanced options like `ignore`.
                    enable = false,
                    -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
                    url = "",
                  },
                  schemas = require('schemastore').yaml.schemas(),
                },
              },
            }
          end,
          rust_analyzer = function()
          end
        }
      })
    end
  },

  {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-telescope/telescope.nvim",
      "mfussenegger/nvim-dap-python"
    },
    opts = {
      auto_refresh = true
    },
    event = "VeryLazy", -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
    keys = {
      -- Keymap to open VenvSelector to pick a venv.
      { "<leader>vs", "<cmd>VenvSelect<cr>" },
      -- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
      { "<leader>vc", "<cmd>VenvSelectCached<cr>" },
    }
  },

  {
    "nvimdev/lspsaga.nvim",
    branch = "main",
    event = "LspAttach",
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      { "nvim-treesitter/nvim-treesitter" }
    },
    config = function()
      require("lspsaga").setup({})
    end,
  },

  {
    'saghen/blink.cmp',
    version = "*",
    -- optional: provides snippets for the snippet source
    dependencies = {
      'rafamadriz/friendly-snippets',
      'Kaiser-Yang/blink-cmp-git',
      "onsails/lspkind.nvim"
    },
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = {
        ['<Tab>'] = { 'select_and_accept', 'fallback' },
        ['<C-j>'] = { 'select_next', 'fallback' },
        ['<C-k>'] = { 'select_prev', 'fallback' },
      },
      signature = {
        enabled = true,
      },
      completion = {
        list = {
          selection = {
            preselect = false,
            auto_insert = true,
          }
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 0,
        },
        menu = {
          auto_show = true,
          draw = {
            columns = {
              {
                "kind_icon",
              },
              {
                "label",
                "label_description",
                gap = 1,
              },
              {
                "source_name",
              }
            },
            components = {
              kind_icon = {
                text = function(ctx)
                  local icon = ctx.kind_icon
                  if vim.tbl_contains({ "Path" }, ctx.source_name) then
                    local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
                    if dev_icon then
                      icon = dev_icon
                    end
                  else
                    icon = require("lspkind").symbolic(ctx.kind, {
                      mode = "symbol",
                    })
                  end

                  return icon .. ctx.icon_gap
                end,

                -- Optionally, use the highlight groups from nvim-web-devicons
                -- You can also add the same function for `kind.highlight` if you want to
                -- keep the highlight groups in sync with the icons.
                highlight = function(ctx)
                  local hl = ctx.kind_hl
                  if vim.tbl_contains({ "Path" }, ctx.source_name) then
                    local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
                    if dev_icon then
                      hl = dev_hl
                    end
                  end
                  return hl
                end,
              },
              label = {
                text = function(ctx)
                  return require("colorful-menu").blink_components_text(ctx)
                end,
                highlight = function(ctx)
                  return require("colorful-menu").blink_components_highlight(ctx)
                end,
              },
            }
          }
        },
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer', 'git', 'lazydev', 'jupynium' },
        providers = {
          git = {
            module = 'blink-cmp-git',
            name = 'Git',
            opts = {
              -- options for the blink-cmp-git
            },
          },
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            -- make lazydev completions top priority (see `:h blink.cmp`)
            score_offset = 100,
          },
          jupynium = {
            name = "Jupynium",
            module = "jupynium.blink_cmp",
            -- Consider higher priority than LSP
            score_offset = 100,
          }
        }
      },
      cmdline = {
        keymap = {
          preset = "inherit"
        },
        completion = {
          list = {
            selection = {
              preselect = false,
              auto_insert = true,
            }
          },
          menu = {
            auto_show = true
          }
        }
      }
    },
    opts_extend = {
      "sources.default"
    }
  },

  {
    "xzbdmw/colorful-menu.nvim",
    config = function()
      -- You don't need to set these options.
      require("colorful-menu").setup({})
    end,
  },

  {
    "onsails/lspkind.nvim",
    config = function()
      -- setup() is also available as an alias
      require('lspkind').init({})
    end
  }

  -- {
  --   "ray-x/lsp_signature.nvim",
  --   config = function()
  --     require("lsp_signature").setup({
  --       bind = true, -- This is mandatory, otherwise border config won't get registered.
  --       handler_opts = {
  --         border = "rounded"
  --       }
  --     })
  --   end
  -- },
}
