local bufnr = vim.api.nvim_get_current_buf()

-- vim.g.rustaceanvim = function()
--   local codelldb_path = "/usr/bin/codelldb"
--   local liblldb_path = "/usr/lib/liblldb.so"
--
--   local rustacea_cfg = require("rustaceanvim.config")
--   local capabilities = require("cmp_nvim_lsp").default_capabilities()
--
--   return {
--     capabilities = capabilities,
--     dap = {
--       adapter = rustacea_cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
--     }
--   }
-- end

vim.keymap.set(
  "n",
  "<leader>a",
  function()
    vim.cmd.RustLsp('codeAction') -- supports rust-analyzer's grouping
    -- or vim.lsp.buf.codeAction() if you don't want grouping.
  end,
  { silent = true, buffer = bufnr }
)
vim.keymap.set(
  "n",
  "K", -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
  function()
    vim.cmd.RustLsp({ 'hover', 'actions' })
  end,
  { silent = true, buffer = bufnr }
)
