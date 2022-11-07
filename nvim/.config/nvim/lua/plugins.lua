-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

local packer_startup = require("packer").startup(function(use)
  -- Packer can manage itself
  use "wbthomason/packer.nvim"

  use "nvim-lua/plenary.nvim" 

  use { "dracula/vim" } 

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
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }

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
