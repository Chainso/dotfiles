local setup = function(use)
  use {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  }

  use {
    "neovim/nvim-lspconfig",
    requires = {
      "mfussenegger/nvim-jdtls",
      "simrat39/rust-tools.nvim"
    }
  }

  -- Golang
  use {
    "ray-x/go.nvim",
    config = function()
      require('go').setup()
    end
  }
  use "ray-x/guihua.lua" -- recommanded if need floating window support

  use {
    "williamboman/mason-lspconfig.nvim",
    after = {
      "mason.nvim",
      "nvim-lspconfig"
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

      local mason_lspconfig = require("mason-lspconfig")
      mason_lspconfig.setup({})

      local lspconfig = require("lspconfig")

      mason_lspconfig.setup_handlers({
        function (server_name)
          lspconfig[server_name].setup({
            capabilities = capabilities,
            on_attach = function(client, bufnr)
              local caps = client.server_capabilities
              if caps.semanticTokensProvider and caps.semanticTokensProvider.full then
                local augroup = vim.api.nvim_create_augroup("SemanticTokens", {})
                vim.api.nvim_create_autocmd("TextChanged", {
                  group = augroup,
                  buffer = bufnr,
                  callback = function()
                    vim.lsp.buf.semantic_tokens_full()
                  end,
                })
                -- fire it first time on load as well
                vim.lsp.buf.semantic_tokens_full()
              end
            end
          })
        end,
        ["lua_ls"] = function()
          require"lspconfig".lua_ls.setup {
            capabilities = capabilities,
            on_attach = function(client, bufnr)
              local caps = client.server_capabilities
              if caps.semanticTokensProvider and caps.semanticTokensProvider.full then
                local augroup = vim.api.nvim_create_augroup("SemanticTokens", {})
                vim.api.nvim_create_autocmd("TextChanged", {
                  group = augroup,
                  buffer = bufnr,
                  callback = function()
                    vim.lsp.buf.semantic_tokens_full()
                  end,
                })
                -- fire it first time on load as well
                vim.lsp.buf.semantic_tokens_full()
              end
            end,
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
        -- Set up in ftplugin/java.lua
        ["jdtls"] = function()
          local data_path = vim.fn.stdpath("data")
          local java_debug_path = data_path .. "/site/pack/java-debug"
          local vscode_java_test_path = data_path .. "/site/pack/vscode-java-test"
          local cwd = vim.fn.getcwd()

          -- Java Debug
          if vim.fn.empty(vim.fn.glob(java_debug_path)) > 0 then
            vim.fn.system({
              "git", "clone",
              "https://github.com/microsoft/java-debug",
              java_debug_path
            })

            vim.api.nvim_set_current_dir(java_debug_path)

            vim.fn.system {
              "./mvnw", "clean", "install"
            }

            vim.api.nvim_set_current_dir(cwd)
          end

          -- VSCode Java Test
          if vim.fn.empty(vim.fn.glob(vscode_java_test_path)) > 0 then
            vim.fn.system {
              "git", "clone",
              "https://github.com/microsoft/vscode-java-test",
              vscode_java_test_path
            }

            vim.api.nvim_set_current_dir(vscode_java_test_path)

            vim.fn.system {
              "npm", "install"
            }

            vim.fn.system {
              "npm", "run", "build-plugin"
            }

            vim.api.nvim_set_current_dir(cwd)
          end
        end,
        ["rust_analyzer"] = function()
          local rt = require("rust-tools")

          rt.setup({
            server = {
              on_attach = function(_, bufnr)
                -- Hover actions
                vim.keymap.set("n", "<C-Space>", rt.hover_actions.hover_actions, { buffer = bufnr })
                -- Code action groups
                vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
              end
            }
          })
        end
      })
    end
  }

  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "petertriho/cmp-git"
  use "hrsh7th/nvim-cmp"

  use "L3MON4D3/LuaSnip"
  use "saadparwaiz1/cmp_luasnip"
  use "hrsh7th/cmp-nvim-lua"


  use {
    "theHamsta/nvim-semantic-tokens",
    config = function()
      require("nvim-semantic-tokens").setup {
        preset = "default",
        -- highlighters is a list of modules following the interface of nvim-semantic-tokens.table-highlighter or 
        -- function with the signature: highlight_token(ctx, token, highlight) where 
        --        ctx (as defined in :h lsp-handler)
        --        token  (as defined in :h vim.lsp.semantic_tokens.on_full())
        --        highlight (a helper function that you can call (also multiple times) with the determined highlight group(s) as the only parameter)
        highlighters = { require "nvim-semantic-tokens.table-highlighter"}
      }
    end
  }
end

return setup

