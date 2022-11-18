local data_path = vim.fn.stdpath("data")
local packer_path = data_path .. "/site/pack/packer"

local install_path = packer_path .. "/start/packer.nvim"

-- Bootstrap Packer
local bootstrap_packer = function()
  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.system({
      "git", "clone", "--depth", "1",
      "https://github.com/wbthomason/packer.nvim",
      install_path
    })

    -- Only required if you have packer configured as `opt`
    vim.cmd("packadd packer.nvim")

    return true
  end

  return false
end

local bootstrapped_packer = bootstrap_packer()

local packer = require("packer")

local packer_startup = packer.startup {
  function(use)
    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    -- Load plugins
    require("plugins")(use)
    --
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if bootstrapped_packer then
      packer.sync()
    end
  end
}

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugin-manager.lua source <afile> | PackerSync
  augroup end
]])

return packer_startup

