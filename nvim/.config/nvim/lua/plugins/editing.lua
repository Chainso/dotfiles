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
    "nvimdev/lspsaga.nvim",
    branch = "main",
    event = "LspAttach",
    dependencies = {
        {"nvim-tree/nvim-web-devicons"},
        {"nvim-treesitter/nvim-treesitter"}
    },
    config = function()
      require("lspsaga").setup({
        symbol_in_winbar = {
          in_custom = true
        }
      })
    end,
  },

  {
    "ray-x/lsp_signature.nvim",
    config = function()
      require("lsp_signature").setup({
        bind = true, -- This is mandatory, otherwise border config won't get registered.
        handler_opts = {
          border = "rounded"
        }
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
    "github/copilot.vim",
    build = ":Copilot setup"
  },

  "lambdalisue/suda.vim",

  "sindrets/diffview.nvim",

  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require('gitsigns').setup()
    end
  },

  "chrisbra/csv.vim"
}

