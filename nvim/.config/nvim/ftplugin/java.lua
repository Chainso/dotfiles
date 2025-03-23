local dap = require("dap")

local function extend_dap_configurations()
  local new_configs = {}

  for _, config in ipairs(dap.configurations.java or {}) do
    table.insert(new_configs, config)
    if config.request == 'launch' and config.projectName and config.mainClass then
      table.insert(new_configs, vim.tbl_extend('force', {}, config, {
        request = 'attach',
        name = config.name .. " (Remote 5005)",
        hostName = "127.0.0.1",
        port = 5005,
        projectName = config.projectName,
        mainClass = config.mainClass,
        -- Prelaunch task using Overseer
        -- preLaunchTask = "Gradle Debug",
      }))
    end
  end

  dap.configurations.java = new_configs
end

-- Function to extend DAP configurations
local function reload_dap_configurations()
  require("java").dap.config_dap()
  extend_dap_configurations()
end

-- Create a user command to reload DAP configurations
vim.api.nvim_create_user_command('JavaReloadDap', reload_dap_configurations, {})

-- Initial extension of DAP configurations
extend_dap_configurations()
