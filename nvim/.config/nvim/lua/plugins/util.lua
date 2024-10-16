return {
  -- Useful functions
  "nvim-lua/plenary.nvim",

  -- Markdown
  {
    "iamcco/markdown-preview.nvim",
    build = function() vim.fn["mkdp#util#install"]() end,
  },

  {
    "amitds1997/remote-nvim.nvim",
    version = "*",                     -- Pin to GitHub releases
    dependencies = {
      "nvim-lua/plenary.nvim",         -- For standard functions
      "MunifTanjim/nui.nvim",          -- To build the plugin UI
      "nvim-telescope/telescope.nvim", -- For picking b/w different remote methods
    },
    config = function()
      require("remote-nvim").setup({
        client_callback = function(port, workspace_config)
          local cmd

          if vim.env.TERM == "xterm-kitty" then
            cmd = ("kitty -e nvim --server localhost:%s --remote-ui"):format(port)
          elseif vim.env.TERM == "alacritty" then
            cmd = ("alacritty -e nvim --server localhost:%s --remote-ui -t %s"):format(
              port,
              ("'Remote: %s'"):format(workspace_config.host)
            )
          else
            cmd = ("nvim --server localhost:%s --remote-ui"):format(port)
          end

          vim.fn.jobstart(cmd, {
            detach = true,
            on_exit = function(job_id, exit_code, event_type)
              -- This function will be called when the job exits
              print("Client", job_id, "exited with code", exit_code, "Event type:", event_type)
            end,
          })
        end
      })
    end
  }
}

