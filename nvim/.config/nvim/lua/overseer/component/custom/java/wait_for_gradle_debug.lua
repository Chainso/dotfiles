local util = require("overseer.util")

---@type overseer.ComponentFileDefinition
local comp = {
  desc = "Redirects task output to a buffer",
  params = {
    bufnr = {
      desc = "The buffer to redirect output to",
      order = 1,
    },
  },
  constructor = function(params)
    return {
      on_output_lines = function(self, task, lines)
        -- Append lines to the specified buffer
        local bufnr = params.bufnr
        if bufnr and vim.api.nvim_buf_is_valid(bufnr) then
          -- Store the original modifiable state
          local original_modifiable = vim.api.nvim_buf_get_option(bufnr, 'modifiable')
          -- Set the buffer to modifiable
          vim.api.nvim_buf_set_option(bufnr, 'modifiable', true)
          -- Append the lines
          vim.api.nvim_buf_set_lines(bufnr, -1, -1, false, lines)
          -- Restore the original modifiable state
          vim.api.nvim_buf_set_option(bufnr, 'modifiable', original_modifiable)
        end
      end,
    }
  end,
}

return comp

