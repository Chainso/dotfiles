local codelldb_path = "/usr/bin/codelldb"
local liblldb_path = "/usr/lib/liblldb.so"

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local rt = require("rust-tools")
local rt_dap = require("rust-tools.dap")

rt.setup({
  capabilities = capabilities,
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-Space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end
  },
  dap = rt_dap.get_codelldb_adapter(
    codelldb_path,
    liblldb_path
  )
})
