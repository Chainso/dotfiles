return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- optional, for file icons
    },
    config = function()
      require("nvim-tree").setup({
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
    config = function()
      require("project_nvim").setup {}
      require("telescope").load_extension("projects")
    end
  }
}

