-- Improve startup time
vim.loader.enable()

-- Load config
require("config")
require("plugin-manager")
require("keybindings")

local function list_launch_configs()
  local dap = require('dap')

  for language, config in pairs(dap.configurations) do
    print("Language: " .. language)
    for i, conf in ipairs(config) do
      print("  " .. i .. ". " .. conf.name)
      for key, value in pairs(conf) do
        if key ~= "name" then
          print("    " .. key .. ": " .. tostring(value))
        end
      end
    end
  end
end

-- Make the function globally available
_G.list_launch_configs = list_launch_configs
