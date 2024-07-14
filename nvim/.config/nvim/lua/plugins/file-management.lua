return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- optional, for file icons
    },
    config = function()
      require("nvim-tree").setup({
        actions = {
          open_file = {
            resize_window = false
          }
        },
        view = {
          preserve_window_proportions = true,
          width = "20%",
          side = "left"
        },
        sync_root_with_cwd = true,
        respect_buf_cwd = true,
        update_focused_file = {
          enable = true,
          update_root = true
        },
      })
    end
  },

  {
    "ahmedkhalf/project.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("project_nvim").setup {}
      require("telescope").load_extension("projects")
    end
  },

  {
    "rmagatti/auto-session",
    dependencies = {
      'nvim-telescope/telescope.nvim', -- Only needed if you want to use sesssion lens
    },
    config = function()
      require('auto-session').setup({
        auto_session_suppress_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
        auto_session_use_git_branch = true,
      })
    end,
  },

  {
    "rmagatti/session-lens",
    requires = { 'rmagatti/auto-session', 'nvim-telescope/telescope.nvim' },
    config = function()
      require('session-lens').setup({ --[[your custom config--]] })
    end
  },
}
