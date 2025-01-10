return {
  {
    "williamboman/mason.nvim",
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
    config = function()
      require("neoconf").setup({
        -- override any of the default settings here
      })
    end
  },

  {
    "nvim-java/nvim-java",
    dependencies = {
      "rcarriga/nvim-notify"
    },
    config = function()
      require('java').setup()
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
  {
    "scalameta/nvim-metals",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    ft = { "scala", "sbt", "java" },
    opts = function()
      local metals_config = require("metals").bare_config()
      metals_config.on_attach = function(client, bufnr)
        -- your on_attach function
      end

      return metals_config
    end,
    config = function(self, metals_config)
      local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
      vim.api.nvim_create_autocmd("FileType", {
        pattern = self.ft,
        callback = function()
          require("metals").initialize_or_attach(metals_config)
        end,
        group = nvim_metals_group,
      })
    end
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
      "folke/neoconf.nvim",
    },
    config = function()
      local cmp = require("cmp")

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        window = {
          -- completion = cmp.config.window.bordered(),
          -- documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-j>"] = cmp.mapping.select_next_item(),
          ["<C-k>"] = cmp.mapping.select_prev_item(),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<TAB>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "nvim_lua" },
          { name = "luasnip" }, -- For luasnip users.
          { name = "buffer" }
        })
      })

      -- Set configuration for specific filetype.
      cmp.setup.filetype("gitcommit", {
        sources = cmp.config.sources({
          { name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
        }, {
          { name = "buffer" },
        })
      })

      -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won"t work anymore).
      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" }
        }
      })

      -- Use cmdline & path source for ":" (if you enabled `native_menu`, this won"t work anymore).
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" }
        }, {
          { name = "cmdline" }
        })
      })

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      require("neoconf").setup({
        -- override any of the default settings here
      })

      local mason_lspconfig = require("mason-lspconfig")
      mason_lspconfig.setup({})

      local lspconfig = require("lspconfig")

      mason_lspconfig.setup_handlers({
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = capabilities,
            -- TODO: find out if needed after semantic tokens is merged upstream with neovim
            -- on_attach = function(client, bufnr)
            --   local caps = client.server_capabilities
            --   if caps.semanticTokensProvider and caps.semanticTokensProvider.full then
            --     local augroup = vim.api.nvim_create_augroup("SemanticTokens", {})
            --     vim.api.nvim_create_autocmd("TextChanged", {
            --       group = augroup,
            --       buffer = bufnr,
            --       callback = function()
            --         vim.lsp.buf.semantic_tokens_full()
            --       end,
            --     })
            --     -- fire it first time on load as well
            --     vim.lsp.buf.semantic_tokens_full()
            --   end
            -- end
          })
        end,
        ["lua_ls"] = function()
          require("lspconfig").lua_ls.setup {
            capabilities = capabilities,
            -- TODO: find out if needed after semantic tokens is merged upstream with neovim
            -- on_attach = function(client, bufnr)
            --   local caps = client.server_capabilities
            --   if caps.semanticTokensProvider and caps.semanticTokensProvider.full then
            --     local augroup = vim.api.nvim_create_augroup("SemanticTokens", {})
            --     vim.api.nvim_create_autocmd("TextChanged", {
            --       group = augroup,
            --       buffer = bufnr,
            --       callback = function()
            --         vim.lsp.buf.semantic_tokens_full()
            --       end,
            --     })
            --     -- fire it first time on load as well
            --     vim.lsp.buf.semantic_tokens_full()
            --   end
            -- end,
            settings = {
              Lua = {
                runtime = {
                  version = "LuaJIT",
                },
                diagnostics = {
                  globals = {
                    "vim"
                  }
                },
                workspace = {
                  library = vim.api.nvim_get_runtime_file("", true)
                },
                telemetry = {
                  enable = false
                }
              }
            }
          }
        end,
        -- Disable rust analyzer since we are using rustaceanvim
        ["rust_analyzer"] = function()
        end
      })
    end
  },

  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "petertriho/cmp-git",
  "hrsh7th/nvim-cmp",

  {
    "L3MON4D3/LuaSnip",
    -- install jsregexp (optional!).
    build = "make install_jsregexp"
  },

  "saadparwaiz1/cmp_luasnip",
  "hrsh7th/cmp-nvim-lua",

  "folke/neodev.nvim",

  {
    "linux-cultist/venv-selector.nvim",
    branch = "regexp",
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
