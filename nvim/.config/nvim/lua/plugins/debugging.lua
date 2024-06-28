return {
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {"mfussenegger/nvim-dap"},
    config = function()
      local dap, dapui = require("dap"), require("dapui")
      dapui.setup()

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
    end
  },

  {
    "mfussenegger/nvim-dap-python",
    config = function()
      require("dap-python").setup("python3")
    end
  },

  "nvim-neotest/nvim-nio",

  {
    "stevearc/overseer.nvim",
    dependencies = {"mfussenegger/nvim-dap"},
    opts = {},
    config = function()
      require("overseer").setup({
        strategy = "toggleterm"
      })
    end
  }
}

