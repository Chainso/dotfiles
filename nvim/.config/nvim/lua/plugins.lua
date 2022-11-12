-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

local packer_startup = require("packer").startup(function(use)
  -- Packer can manage itself
  use "wbthomason/packer.nvim"
  use "nvim-lua/plenary.nvim"

  -- Color schemes
  use "Mofiqul/dracula.nvim"
  use "folke/tokyonight.nvim"

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
    run = "make" ,
    config = function()
      require("telescope").load_extension("fzf")
    end
  }

  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
  })

  use {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
    end
  }

  use {
    "nvim-tree/nvim-tree.lua",
    requires = {
      "nvim-tree/nvim-web-devicons", -- optional, for file icons
    },
    config = function()
      require("nvim-tree").setup()
    end
  }

  -- install without yarn or npm
  use({
      "iamcco/markdown-preview.nvim",
      run = function() vim.fn["mkdp#util#install"]() end,
  })

  -- Post-install/update hook with neovim command
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        auto_install = true,
        highlight = {
          enable = true
        },
        indent = {
          enable = true
        }
      })

      -- vim.opt.foldmethod = "expr"
      -- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
    end
  }

  use {
    "nvim-lualine/lualine.nvim",
    requires = { "nvim-tree/nvim-web-devicons", opt = true }
  }

  use {
    "akinsho/bufferline.nvim",
    tag = "v3.*",
    requires = {"nvim-tree/nvim-web-devicons"},
    config = function()
      require("bufferline").setup()
    end
  }

  -- Git integration
  use "tpope/vim-fugitive"

  -- Command menu 
  use {
    "gelguy/wilder.nvim",
    config = function()
      require("wilder").setup({
        modes = {":", "/", "?"}
      })
    end
  }

  -- LSP
  use {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  }

  use {
    "neovim/nvim-lspconfig",
    requires = {
      "mfussenegger/nvim-jdtls"
    }
  }

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
          { name = "luasnip" }, -- For luasnip users.
        }, {
            { name = "buffer" },
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
        ["sumneko_lua"] = function()
          require"lspconfig".sumneko_lua.setup {
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

  -- Vim practice
  use "ThePrimeagen/vim-be-good"
end)

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

return packer_startup

